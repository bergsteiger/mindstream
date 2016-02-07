unit l3UnicodeBMSearch;

// Модуль для поиска методом Бойера-Мура в юникодных строках

{ $Id: l3UnicodeBMSearch.pas,v 1.16 2015/05/12 12:54:08 dinishev Exp $}

// $Log: l3UnicodeBMSearch.pas,v $
// Revision 1.16  2015/05/12 12:54:08  dinishev
// {Requestlink:598132585}
//
// Revision 1.15  2015/05/12 12:53:26  dinishev
// {Requestlink:598132585}
//
// Revision 1.14  2013/04/12 15:02:04  lulin
// - расставляем const.
//
// Revision 1.13  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.12  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.11  2012/11/01 07:45:09  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.10  2011/05/18 12:09:17  lulin
// {RequestLink:266409354}.
//
// Revision 1.9  2008/03/20 09:48:41  lulin
// - cleanup.
//
// Revision 1.8  2008/02/12 12:53:22  lulin
// - избавляемся от излишнего метода на базовом классе.
//
// Revision 1.7  2008/02/07 14:44:45  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.6  2008/01/31 20:38:13  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.5  2008/01/28 15:00:16  lulin
// - используем "кошерный" список.
//
// Revision 1.4  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.    
//
// Revision 1.3  2006/01/12 11:08:09  fireton
// - разрешаем искать служебные символы (переносы строк, табуляции и т.п.)
//
// Revision 1.2  2005/09/26 06:27:47  lulin
// - перетаскиваем обработку мыши в общие модули.
//
// Revision 1.1  2005/09/16 13:33:27  fireton
// - первый коммит
//

interface

uses
 Classes,

 l3Base,
 l3ProtoObject,
 l3LongintList
 ;

type
  TUCSearchFlags = set of (
    sfCaseSensitive,         // match letter case
    sfIgnoreNonSpacing,      // ignore non-spacing characters in search
    sfSpaceCompress,         // handle several consecutive white spaces as one white space
                             // (this applies to the pattern as well as the search text)
    sfWholeWordOnly);        // match only text at end/start and/or surrounded by white spaces


  // a generic search class defininition used for tuned Boyer-Moore and Unicode regular expression searches
  TSearchEngine = class(Tl3ProtoObject)
  private
    FResults: Tl3LongintList;      // 2 entries for each result (start and stop position)
  protected
    function GetCount: Integer; virtual;
  public
    constructor Create{(AOwner: TObject); override};
    procedure Cleanup; override;

    procedure AddResult(Start, Stop: Cardinal); virtual;
    procedure Clear; virtual;
    procedure ClearResults; virtual;
    procedure DeleteResult(Index: Cardinal); virtual;
    procedure FindPrepare(const Pattern: WideString; Options: TUCSearchFlags); overload; virtual; abstract;
    procedure FindPrepare(const Pattern: PWideChar; PatternLength: Cardinal; Options: TUCSearchFlags); overload; virtual; abstract;
    function FindFirst(const Text: WideString; var Start, Stop: Cardinal): Boolean; overload; virtual; abstract;
    function FindFirst(const Text: PWideChar; TextLen: Cardinal; var Start, Stop: Cardinal): Boolean; overload; virtual; abstract;
    function FindAll(const Text: WideString): Boolean; overload; virtual; abstract;
    function FindAll(const Text: PWideChar; TextLen: Cardinal): Boolean; overload; virtual; abstract;
    procedure GetResult(Index: Cardinal; var Start, Stop: Integer); virtual;

    property Count: Integer read GetCount;
  end;

  PUTBMChar = ^TUTBMChar;
  TUTBMChar = record
    LoCase,
    UpCase,
    TitleCase: Cardinal;
  end;

  PUTBMSkip = ^TUTBMSkip;
  TUTBMSkip = record
    BMChar: PUTBMChar;
    SkipValues: Integer;
  end;

  TUTBMSearch = class(TSearchEngine)
  private
    FFlags: TUCSearchFlags;
    FPattern: PUTBMChar;
    FPatternUsed,
    FPatternSize,
    FPatternLength: Cardinal;
    FSkipValues: PUTBMSkip;
    FSkipsUsed: Integer;
    FMD4: Cardinal;
  protected
    procedure ClearPattern;
    procedure Compile(Pattern: PWideChar; PatternLength: Integer; Flags: TUCSearchFlags);
    function Find(Text: PWideChar; TextLen: Cardinal; var MatchStart, MatchEnd: Cardinal): Boolean;
    function GetSkipValue(TextStart, TextEnd: PWideChar): Cardinal;
    function Match(Text, Start, Stop: PWideChar; var MatchStart, MatchEnd: Cardinal): Boolean;
  public
    constructor Create{(AOwner: TObject); override};
    procedure Cleanup; override;

    procedure Clear; override;
    procedure FindPrepare(const Pattern: WideString; Options: TUCSearchFlags); override;
    procedure FindPrepare(const Pattern: PWideChar; PatternLength: Cardinal; Options: TUCSearchFlags); override;
    function FindFirst(const Text: WideString; var Start, Stop: Cardinal): Boolean; override;
    function FindFirst(const Text: PWideChar; TextLen: Cardinal; var Start, Stop: Cardinal): Boolean; override;
    function FindAll(const Text: WideString): Boolean; override;
    function FindAll(const Text: PWideChar; TextLen: Cardinal): Boolean; override;
  end;

implementation
uses
 SysUtils, SyncObjs;

const
 ReplacementCharacter: Cardinal = $0000FFFD;
 MaximumUCS2: Cardinal = $0000FFFF;
 MaximumUTF16: Cardinal = $0010FFFF;
 MaximumCardinal: Cardinal = $7FFFFFFF;

 SurrogateHighStart: Cardinal = $D800;
 SurrogateHighEnd: Cardinal = $DBFF;
 SurrogateLowStart: Cardinal = $DC00;
 SurrogateLowEnd: Cardinal = $DFFF;

const
 // Values that can appear in the Mask1 parameter of the IsProperty function.
 UC_MN = $00000001; // Mark, Non-Spacing
 UC_MC = $00000002; // Mark, Spacing Combining
 UC_ME = $00000004; // Mark, Enclosing
 UC_ND = $00000008; // Number, Decimal Digit
 UC_NL = $00000010; // Number, Letter
 UC_NO = $00000020; // Number, Other
 UC_ZS = $00000040; // Separator, Space
 UC_ZL = $00000080; // Separator, Line
 UC_ZP = $00000100; // Separator, Paragraph
 UC_CC = $00000200; // Other, Control
 UC_CF = $00000400; // Other, Format
 UC_OS = $00000800; // Other, Surrogate
 UC_CO = $00001000; // Other, private use
 UC_CN = $00002000; // Other, not assigned
 UC_LU = $00004000; // Letter, Uppercase
 UC_LL = $00008000; // Letter, Lowercase
 UC_LT = $00010000; // Letter, Titlecase
 UC_LM = $00020000; // Letter, Modifier
 UC_LO = $00040000; // Letter, Other
 UC_PC = $00080000; // Punctuation, Connector
 UC_PD = $00100000; // Punctuation, Dash
 UC_PS = $00200000; // Punctuation, Open
 UC_PE = $00400000; // Punctuation, Close
 UC_PO = $00800000; // Punctuation, Other
 UC_SM = $01000000; // Symbol, Math
 UC_SC = $02000000; // Symbol, Currency
 UC_SK = $04000000; // Symbol, Modifier
 UC_SO = $08000000; // Symbol, Other
 UC_L  = $10000000; // Left-To-Right
 UC_R  = $20000000; // Right-To-Left
 UC_EN = $40000000; // European Number
 UC_ES = $80000000; // European Number Separator

 // Values that can appear in the Mask2 parameter of the IsProperty function
 UC_ET = $00000001; // European Number Terminator
 UC_AN = $00000002; // Arabic Number
 UC_CS = $00000004; // Common Number Separator
 UC_B  = $00000008; // Block Separator
 UC_S  = $00000010; // Segment (unit) Separator (this includes tab and vertical tab)
 UC_WS = $00000020; // Whitespace
 UC_ON = $00000040; // Other Neutrals

 // Implementation specific character properties.
 UC_CM = $00000080; // Composite
 UC_NB = $00000100; // Non-Breaking
 UC_SY = $00000200; // Symmetric
 UC_HD = $00000400; // Hex Digit
 UC_QM = $00000800; // Quote Mark
 UC_MR = $00001000; // Mirroring
 UC_SS = $00002000; // Space, other

 UC_CP = $00004000; // Defined

 // Added for UnicodeData-2.1.3.
 UC_PI = $00008000; // Punctuation, Initial
 UC_PF = $00010000; // Punctuation, Final

 // byte order marks for strings
 // Unicode text files should contain $FFFE as first character to identify such a file clearly. Depending on the system
 // where the file was created on this appears either in big endian or little endian style.
 BOM_LSB_FIRST = WideChar($FEFF); // this is how the BOM appears on x86 systems when written by a x86 system
 BOM_MSB_FIRST = WideChar($FFFE);

 // can't use identifier "Null" here as this is already in a special Variant identifier
 WideNull = WideChar(#0);
 Tabulator = WideChar(#9);
 Space = WideChar(#32);

 // logical line breaks
 LF = WideChar($A);
 LineFeed = WideChar($A);
 VerticalTab = WideChar($B);
 FormFeed = WideChar($C);
 CR = WideChar($D);
 CarriageReturn = WideChar($D);
 CRLF: WideString = #$D#$A;
 LineSeparator = WideChar($2028);
 ParagraphSeparator = WideChar($2029);


var
  // As the global data can be accessed by several threads it should be guarded
  // while the data is loaded.
  LoadInProgress: TCriticalSection = nil;

type
 TWordArray = array of Word;
 TCardinalArray = array of Cardinal;

 TUHeader = record
  BOM: WideChar;
  Count: Word;
  case Boolean of
   True:
    (Bytes: Cardinal);
   False:
    (Len: array[0..1] of Word);
 end;

var
 PropertyOffsets: TWordArray;
 PropertyRanges: TCardinalArray;

{$R l3Unicode.res}

function SwapCardinal(C: Cardinal): Cardinal; 
// swaps all bytes in C from MSB to LSB order
// EAX contains both parameter as well as result
asm
 BSWAP EAX
end;

var
 CaseMapSize: Cardinal;
 CaseLengths: array[0..1] of Word;
 CaseMap: TCardinalArray;

procedure LoadUnicodeCaseData;
var
  Stream: TResourceStream;
  I: Cardinal;
  Header: TUHeader;
begin
  // make sure no other code is currently modifying the global data area
  if LoadInProgress = nil then LoadInProgress := TCriticalSection.Create;
  LoadInProgress.Enter;

  if CaseMap = nil then
  begin
    Stream := TResourceStream.Create(HInstance, 'CASE', 'UNICODE');
    Stream.Read(Header, SizeOf(Header));

    if Header.BOM = BOM_MSB_FIRST then
    begin
      Header.Count := Swap(Header.Count);
      Header.Len[0] := Swap(Header.Len[0]);
      Header.Len[1] := Swap(Header.Len[1]);
    end;

    // Set the node count and lengths of the upper and lower case mapping tables.
    CaseMapSize := Header.Count * 3;
    CaseLengths[0] := Header.Len[0] * 3;
    CaseLengths[1] := Header.Len[1] * 3;

    SetLength(CaseMap, CaseMapSize);

    // Load the case mapping table.
    Stream.Read(CaseMap[0], CaseMapSize * SizeOf(Cardinal));

    // Do an endian swap if necessary.
    if Header.BOM = BOM_MSB_FIRST then
      for I := 0 to CaseMapSize -1 do CaseMap[I] := SwapCardinal(CaseMap[I]);
    Stream.Free;
  end;
  LoadInProgress.Leave;
end;

function CaseLookup(Code: Cardinal; L, R, Field: Integer): Cardinal;
var
  M: Integer;
begin
  // load case mapping data if not already done
  if CaseMap = nil then
   LoadUnicodeCaseData;

  // Do the binary search.
  while L <= R do
  begin
    // Determine a "mid" point and adjust to make sure the mid point is at
    // the beginning of a case mapping triple.
    M := (L + R) shr 1;
    Dec(M, M mod 3);
    if Code > CaseMap[M] then L := M + 3
                         else
      if Code < CaseMap[M] then R := M - 3
                           else
        if Code = CaseMap[M] then
        begin
          Result := CaseMap[M + Field];
          Exit;
        end;
  end;

  Result := Code;
end;

procedure LoadUnicodeTypeData;
// loads the character property data (as saved by the Unicode database extractor into the ctype.dat file)
var
  I, Size: Integer;
  Header: TUHeader;
  Stream: TResourceStream;

begin
  // make sure no other code is currently modifying the global data area
  if LoadInProgress = nil then
   LoadInProgress := TCriticalSection.Create;
  LoadInProgress.Enter;

  // Data already loaded?
  if PropertyOffsets = nil then
  begin
    Stream := TResourceStream.Create(HInstance, 'TYPE', 'UNICODE');
    Stream.Read(Header, SizeOf(Header));

    if Header.BOM = BOM_MSB_FIRST then
    begin
      Header.Count := Swap(Header.Count);
      Header.Bytes := SwapCardinal(Header.Bytes);
    end;

    // Calculate the offset into the storage for the ranges.  The offsets
    // array is on a 4-byte boundary and one larger than the value provided in
    // the header count field. This means the offset to the ranges must be
    // calculated after aligning the count to a 4-byte boundary.
    Size := (Header.Count + 1) * SizeOf(Word);
    if (Size and 3) <> 0 then Inc(Size, 4 - (Size and 3));

    // fill offsets array
    SetLength(PropertyOffsets, Size div SizeOf(Word));
    Stream.Read(PropertyOffsets[0], Size);

    // Do an endian swap if necessary.  Don't forget there is an extra node on the end with the final index.
    if Header.BOM = BOM_MSB_FIRST then
    begin
      for I := 0 to Header.Count do
          PropertyOffsets[I] := Swap(PropertyOffsets[I]);
    end;

    // Load the ranges.  The number of elements is in the last array position of the offsets.
    SetLength(PropertyRanges, PropertyOffsets[Header.Count]);
    Stream.Read(PropertyRanges[0], PropertyOffsets[Header.Count] * SizeOf(Cardinal));

    // Do an endian swap if necessary.
    if Header.BOM = BOM_MSB_FIRST then
    begin
      for I := 0 to PropertyOffsets[Header.Count] - 1 do
        PropertyRanges[I] := SwapCardinal(PropertyRanges[I]);
    end;
    Stream.Free;
  end;
  LoadInProgress.Leave;
end;


function PropertyLookup(Code, N: Cardinal): Boolean;
var
  L, R, M: Integer;
begin
  // load property data if not already done
  if PropertyOffsets = nil then
   LoadUnicodeTypeData;
  
  Result := False;
  // There is an extra node on the end of the offsets to allow this routine
  // to work right.  If the index is 0xffff, then there are no nodes for the property.
  L := PropertyOffsets[N];
  if L <> $FFFF then
  begin
    // Locate the next offset that is not 0xffff.  The sentinel at the end of
    // the array is the max index value.
    M := 1;
    while ((Integer(N) + M) < High(PropertyOffsets)) and (PropertyOffsets[Integer(N) + M] = $FFFF) do Inc(M);

    R := PropertyOffsets[Integer(N) + M] - 1;

    while L <= R do
    begin
      // Determine a "mid" point and adjust to make sure the mid point is at
      // the beginning of a range pair.
      M := (L + R) shr 1;
      Dec(M, M and 1);
      if Code > PropertyRanges[M + 1] then L := M + 2
                                      else
        if Code < PropertyRanges[M] then R := M - 2
                                    else
          if (Code >= PropertyRanges[M]) and (Code <= PropertyRanges[M + 1]) then
          begin
            Result := True;
            Break;
          end;
    end;
  end;
end;


function IsProperty(Code, Mask1, Mask2: Cardinal): Boolean;

var
  I: Cardinal;
  Mask: Cardinal;

begin
  Result := False;
  if Mask1 <> 0 then
  begin
    Mask := 1;
    for I := 0 to 31 do
    begin
      if ((Mask1 and Mask) <> 0) and PropertyLookup(Code, I) then
      begin
        Result := True;
        Exit;
      end;
      Mask := Mask shl 1;
    end;
  end;

  if Mask2 <> 0 then
  begin
    I := 32;
    Mask := 1;
    while I < Cardinal(High(PropertyOffsets)) do
    begin
      if ((Mask2 and Mask) <> 0) and PropertyLookup(Code, I) then
      begin
        Result := True;
        Exit;
      end;
      Inc(I);
      Mask := Mask shl 1;
    end;
  end;
end;

// Is the character a white space character (same as UnicodeIsSpace plus tabulator, new line etc.)?
function UnicodeIsWhiteSpace(C: Cardinal): Boolean;
begin
 Result := IsProperty(C, UC_ZS or UC_SS, UC_WS or UC_S);
end;

function UnicodeIsNonSpacing(C: Cardinal): Boolean;
begin
 Result := IsProperty(C, UC_MN, 0);
end;

function UnicodeIsControl(C: Cardinal): Boolean;
begin
 Result := IsProperty(C, UC_CC or UC_CF, 0);
end;

function UnicodeIsUpper(C: Cardinal): Boolean;
begin
 Result := IsProperty(C, UC_LU, 0);
end;

function UnicodeIsLower(C: Cardinal): Boolean;
begin
 Result := IsProperty(C, UC_LL, 0);
end;

function UnicodeIsTitle(C: Cardinal): Boolean;
begin
 Result := IsProperty(C, UC_LT, 0);
end;


function UnicodeToUpper(Code: Cardinal): Cardinal;
var
  Field,
  L, R: Integer;
begin
  // load case mapping data if not already done
  if CaseMap = nil then
   LoadUnicodeCaseData;

  if UnicodeIsUpper(Code) then Result := Code
                          else
  begin
    if UnicodeIsLower(Code) then
    begin
      Field := 2;
      L := CaseLengths[0];
      R := (L + CaseLengths[1]) - 3;
    end
    else
    begin
      Field := 1;
      L := CaseLengths[0] + CaseLengths[1];
      R := CaseMapSize - 3;
    end;
    Result := CaseLookup(Code, L, R, Field);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function UnicodeToLower(Code: Cardinal): Cardinal;

var
  Field,
  L, R: Integer;
  
begin
  // load case mapping data if not already done
  if CaseMap = nil then LoadUnicodeCaseData;

  if UnicodeIsLower(Code) then Result := Code
                          else
  begin
    if UnicodeIsUpper(Code) then
    begin
      Field := 1;
      L := 0;
      R := CaseLengths[0] - 3;
    end
    else
    begin
      Field := 2;
      L := CaseLengths[0] + CaseLengths[1];
      R := CaseMapSize - 3;
    end;
    Result := CaseLookup(Code, L, R, Field);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function UnicodeToTitle(Code: Cardinal): Cardinal;

var
  Field,
  L, R: Integer;

begin
  // load case mapping data if not already done
  if CaseMap = nil then LoadUnicodeCaseData;

  if UnicodeIsTitle(Code) then Result := Code
                          else
  begin
    // The offset will always be the same for converting to title case.
    Field := 2;

    if UnicodeIsUpper(Code) then
    begin
      L := 0;
      R := CaseLengths[0] - 3;
    end
    else
    begin
      L := CaseLengths[0];
      R := (L + CaseLengths[1]) - 3;
    end;
    Result := CaseLookup(Code, L, R, Field);
  end;
end;

//----------------- TSearchEngine --------------------------------------------------------------------------------------

constructor TSearchEngine.Create{(AOwner: TObject)};

begin
  inherited Create{(AOwner)};
  FResults := Tl3LongintList.Create;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TSearchEngine.Cleanup;
begin
  Clear;
  FreeAndNil(FResults);
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TSearchEngine.AddResult(Start, Stop: Cardinal);
begin
  FResults.Add(Start);
  FResults.Add(Stop);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TSearchEngine.Clear;

begin
  ClearResults;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TSearchEngine.ClearResults;

begin
  FResults.Clear;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TSearchEngine.DeleteResult(Index: Cardinal);

// explicitly deletes a search result

begin
  with FResults do
  begin
    // start index
    Delete(2 * Index);
    // stop index
    Delete(2 * Index);
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TSearchEngine.GetCount: Integer;

// returns the number of matches found

begin
  Result := FResults.Count div 2;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TSearchEngine.GetResult(Index: Cardinal; var Start, Stop: Integer);

// returns the start position of a match (end position can be determined by adding the length
// of the pattern to the start position)

begin
  Start := Cardinal(FResults[2 * Index]);
  Stop := Cardinal(FResults[2 * Index + 1]);
end;

//----------------- TUTBMSearch ----------------------------------------------------------------------------------------

constructor TUTBMSearch.Create{(AOwner: TObject)};

begin
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TUTBMSearch.Cleanup;
begin
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TUTBMSearch.Clear;

begin
  ClearPattern;
  inherited;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TUTBMSearch.ClearPattern;

begin
  FreeMem(FPattern);
  FPattern := nil;
  FFlags := [];
  FPatternUsed := 0;
  FPatternSize := 0;
  FPatternLength := 0;
  FreeMem(FSkipValues);
  FSkipValues := nil;
  FSkipsUsed := 0;
  FMD4 := 0;
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TUTBMSearch.Compile(Pattern: PWideChar; PatternLength: Integer; Flags: TUCSearchFlags);

var
  HaveSpace: Boolean;
  I, J, K,
  SLen: Integer;
  Cp: PUTBMChar;
  Sp: PUTBMSkip;
  C1, C2,
  Sentinel: Cardinal;

begin
  if Assigned(Pattern) and (Pattern^ <> #0) and (PatternLength > 0) then
  begin
    // do some initialization
    FFlags := Flags;
    // extra skip flag
    FMD4 := 1;

    Sentinel := 0;

    // allocate more storage if necessary
    FPattern := AllocMem(SizeOf(TUTBMChar) * PatternLength);
    FSkipValues := AllocMem(SizeOf(TUTBMSkip) * PatternLength);
    FPatternSize := PatternLength;

    // Preprocess the pattern to remove controls (if specified) and determine case.
    Cp := FPattern;
    I := 0;
    HaveSpace := False;
    while I < PatternLength do
    begin
      C1 := Word(Pattern[I]);
      if (I + 1) < PatternLength then C2 := Word(Pattern[I + 1])
                                 else C2 := $FFFFFFFF;
      if (SurrogateHighStart <= C1) and (C1 <= SurrogateHighEnd) and
         (SurrogateLowStart <= C2) and (C2 <= SurrogateLowEnd) then C1 := $10000 + (((C1 and $03FF) shl 10) or (C2 and $03FF));

      // Make sure the HaveSpace flag is turned off if the character is not an appropriate one.
      if not UnicodeIsWhiteSpace(C1) then HaveSpace := False;

      // If non-spacing characters should be ignored, do it here.
      if (sfIgnoreNonSpacing in Flags) and UnicodeIsNonSpacing(C1) then
      begin
        Inc(I);
        Continue;
      end;

      // check if spaces and controls need to be compressed
      if sfSpaceCompress in Flags then
      begin
        if UnicodeIsWhiteSpace(C1) then
        begin
          if not HaveSpace then
          begin
            // Add a space and set the flag.
            Cp.UpCase := $20;
            Cp.LoCase := $20;
            Cp.TitleCase := $20;
            Inc(Cp);

            // increase the real pattern length
            Inc(FPatternLength);
            Sentinel := $20;
            HaveSpace := True;
          end;
          Inc(I);
          Continue;
        end;

        // ignore all control characters
        {
        if UnicodeIsControl(C1) then
        begin
          Inc(I);
          Continue;
        end;
        }
      end;

      // add the character
      if not (sfCaseSensitive in Flags) then
      begin
        Cp.UpCase := UnicodeToUpper(C1);
        Cp.LoCase := UnicodeToLower(C1);
        Cp.TitleCase := UnicodeToTitle(C1);
      end
      else
      begin
        Cp.UpCase := C1;
        Cp.LoCase := C1;
        Cp.TitleCase := C1;
      end;

      Sentinel := Cp.UpCase;

      // _move to the next character
      Inc(Cp);

      // increase the real pattern length appropriately
      if C1 >= $10000 then Inc(FPatternLength, 2)
                      else Inc(FPatternLength, 1);

      // increment the loop index for UTF-16 characters
      if C1 > $10000 then Inc(I, 2)
                     else Inc(I);
    end;

    // set the number of characters actually used
    FPatternUsed := (PAnsiChar(Cp) - PAnsiChar(FPattern)) div SizeOf(TUTBMChar);

    // Go through and construct the skip array and determine the actual length
    // of the pattern in UCS2 terms.
    SLen := FPatternLength - 1;
    Cp := FPattern;
    K := 0;
    for I := 0 to FPatternUsed - 1 do
    begin
      // locate the character in the FSkipValues array
      Sp := FSkipValues;
      J := 0;
      while (J < FSkipsUsed) and (Sp.BMChar.UpCase <> Cp.UpCase) do
      begin
        Inc(J);
        Inc(Sp);
      end;

      // If the character is not found, set the new FSkipValues element and
      // increase the number of FSkipValues elements.
      if J = FSkipsUsed then
      begin
        Sp.BMChar := Cp;
        Inc(FSkipsUsed);
      end;

      // Set the updated FSkipValues value.  If the character is UTF-16 and is
      // not the last one in the pattern, add one to its FSkipValues value.
      Sp.SkipValues := SLen - K;
      if (Cp.UpCase >= $10000) and ((K + 2) < SLen) then Inc(Sp.SkipValues);

      // set the new extra FSkipValues for the sentinel character
      if ((Cp.UpCase >= $10000) and
          ((K + 2) <= SLen) or ((K + 1) <= SLen) and
          (Cp.UpCase = Sentinel)) then FMD4 := SLen - K;

      // increase the actual index
      if Cp.UpCase >= $10000 then Inc(K, 2)
                             else Inc(K, 1);
      Inc(Cp);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.Find(Text: PWideChar; TextLen: Cardinal;  var MatchStart, MatchEnd: Cardinal): Boolean;
// this is the main matching routine using a tuned Boyer-Moore algorithm
var
  K: Cardinal;
  Start,
  Stop: PWideChar;
begin
  Result := False;
  if Assigned(FPattern) and
     (FPatternUsed > 0) and
     Assigned(Text) and
     (TextLen > 0) and
     (TextLen >= FPatternLength) then
  begin
    Start := Text + FPatternLength - 1;
    Stop := Text + TextLen;

    // adjust the start point if it points to a low surrogate
    if (SurrogateLowStart <= Cardinal(Start^)) and
       (Cardinal(Start^) <= SurrogateLowEnd) and
       (SurrogateHighStart <= Cardinal((Start - 1)^)) and
       (Cardinal((Start - 1)^) <= SurrogateHighEnd) then Dec(Start);

    while Start < Stop do
    begin
      repeat
        K := GetSkipValue(Start, Stop);
        if K = 0 then Break;
        Inc(Start, K);
        if (Start < Stop) and
           (SurrogateLowStart <= Cardinal(Start^)) and
           (Cardinal(Start^) <= SurrogateLowEnd) and
           (SurrogateHighStart <= Cardinal((Start - 1)^)) and
           (Cardinal((Start - 1)^) <= SurrogateHighEnd) then Dec(Start);
      until False;

      if (Start < Stop) and Match(Text, Start, Stop, MatchStart, MatchEnd) then
      begin
        Result := True;
        Break;
      end;
      Inc(Start, FMD4);
      if (Start < Stop) and
         (SurrogateLowStart <= Cardinal(Start^)) and
         (Cardinal(Start^) <= SurrogateLowEnd) and
         (SurrogateHighStart <= Cardinal((Start - 1)^)) and
         (Cardinal((Start - 1)^) <= SurrogateHighEnd) then Dec(Start);
    end;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.FindAll(const Text: PWideChar; TextLen: Cardinal): Boolean;

// Looks for all occurences of the pattern passed to FindPrepare and creates an internal list of their positions.

var
  Start, Stop: Cardinal;
  Run: PWideChar;
  RunLen: Cardinal;

begin
  ClearResults;
  Run := Text;
  RunLen := TextLen;
  // repeat to find all occurences of the pattern
  while Find(Run, RunLen, Start, Stop) do
  begin
    // store this result (consider text pointer movement)...
    AddResult(Start + Run - Text, Stop + Run - Text);
    // ... and advance text position and length
    Inc(Run, Stop);
    Dec(RunLen, Stop);
  end;
  Result := Count > 0;
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.FindAll(const Text: WideString): Boolean;

begin
  Result := FindAll(PWideChar(Text), Length(Text));
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.FindFirst(const Text: PWideChar; TextLen: Cardinal; var Start, Stop: Cardinal): Boolean;

// Same as the WideString version of this method.

begin
  ClearResults;
  Result := Find(Text, TextLen, Start, Stop);
  if Result then AddResult(Start, Stop);
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.FindFirst(const Text: WideString; var Start, Stop: Cardinal): Boolean;

// Looks for the first occurence of the pattern passed to FindPrepare in Text and returns True if one could be
// found (in which case Start and Stop are set to the according indices) otherwise False.
// This function is in particular of interest if only one occurence needs to be found.

begin
  ClearResults;
  Result := Find(PWideChar(Text), Length(Text), Start, Stop);
  if Result then AddResult(Start, Stop);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TUTBMSearch.FindPrepare(const Pattern: PWideChar; PatternLength: Cardinal; Options: TUCSearchFlags);

// prepare following search by compiling the given pattern into an internal structure

begin
  Compile(Pattern, PatternLength, Options);
end;

//----------------------------------------------------------------------------------------------------------------------

procedure TUTBMSearch.FindPrepare(const Pattern: WideString; Options: TUCSearchFlags);

begin
  FindPrepare(PWideChar(Pattern), Length(Pattern), Options);
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.GetSkipValue(TextStart, TextEnd: PWideChar): Cardinal;

// looks up the SkipValues value for a character

var
 I: Integer;
 C1, C2: Cardinal;
 Sp: PUTBMSkip;

begin
  Result := 0;
  if Cardinal(TextStart) < Cardinal(TextEnd) then
  begin
    C1 := Word(TextStart^);
    if (TextStart + 1) < TextEnd then C2 := Word((TextStart + 1)^)
                                 else C2 := $FFFFFFFF;
    if (SurrogateHighStart <= C1) and
       (C1 <= SurrogateHighEnd) and
       (SurrogateLowStart <= C2) and
       (C2 <= $DDDD) then C1 := $10000 + (((C1 and $03FF) shl 10) or (C2 and $03FF));

    Sp := FSkipValues;
    for I := 0 to FSkipsUsed - 1 do
    begin
      if not (WordBool(C1 xor Sp.BMChar.UpCase) and
             // ^ -  было Boolean(C1 xor Sp.BMChar.UpCase). http://mdp.garant.ru/pages/viewpage.action?pageId=598132585 
              WordBool(C1 xor Sp.BMChar.LoCase) and
              WordBool(C1 xor Sp.BMChar.TitleCase)) then
      begin
        if (TextEnd - TextStart) < Sp.SkipValues then Result := TextEnd - TextStart
                                                 else Result := Sp.SkipValues;
        Exit;
      end;
      Inc(Sp);
    end;
    Result := FPatternLength;
  end;
end;

//----------------------------------------------------------------------------------------------------------------------

function TUTBMSearch.Match(Text, Start, Stop: PWideChar; var MatchStart, MatchEnd: Cardinal): Boolean;

// Checks once whether the text at position Start (which points to the end of the current text part to be matched)
// matches.
// Note: If whole words only are allowed then the left and right border tests are done here too. The keypoint for the
//       right border is that the next character after the search string is either the text end or a space character.
//       For the left side this is similar, but there is nothing like a string start marker (like the string end marker #0).
//
//       It seems not obvious, but we still can use the passed Text pointer to do the left check. Although this pointer
//       might not point to the real string start (e.g. in TUTBMSearch.FindAll Text is incremented as needed) it is
//       still a valid check mark. The reason is that Text either points to the real string start or a previous match
//       (happend already, keep in mind the search options do not change in the FindAll loop) and the character just
//       before Text is a space character.
//       This fact implies, though, that strings passed to Find (or FindFirst, FindAll in TUTBMSearch) always really
//       start at the given address. Although this might not be the case in some circumstances (e.g. if you pass only
//       the selection from an editor) it is still assumed that a pattern matching from the first position on (from the
//       search string start) also matches when whole words only are allowed.

var
  CheckSpace: Boolean;
  C1, C2: Cardinal;
  Count: Integer;
  Cp: PUTBMChar;

begin
  // be pessimistic
  Result := False;

  // set the potential match endpoint first
  MatchEnd := (Start - Text) + 1;

  C1 := Word(Start^);
  if (Start + 1) < Stop then C2 := Word((Start + 1)^)
                        else C2 := $FFFFFFFF;
  if (SurrogateHighStart <= C1) and
     (C1 <= SurrogateHighEnd) and
     (SurrogateLowStart <= C2) and
     (C2 <= SurrogateLowEnd) then
  begin
    C1 := $10000 + (((C1 and $03FF) shl 10) or (C2 and $03FF));
    // Adjust the match end point to occur after the UTF-16 character.
    Inc(MatchEnd);
  end;

  // check special cases
  if FPatternUsed = 1 then
  begin
    MatchStart := Start - Text;
    Result := True;
    Exit;
  end;

  // Early out if entire words need to be matched and the next character 
  // in the search string is neither the string end nor a space character.
  if (sfWholeWordOnly in FFlags) and
     not ((Start + 1)^ = WideNull) and
     not UnicodeIsWhiteSpace(Word((Start + 1)^)) then Exit;

  // compare backward
  Cp := FPattern;
  Inc(Cp, FPatternUsed - 1);

  Count := FPatternLength;
  while (Start >= Text) and (Count > 0) do
  begin
    // ignore non-spacing characters if indicated
    if sfIgnoreNonSpacing in FFlags then
    begin
      while (Start > Text) and UnicodeIsNonSpacing(C1) do
      begin
        Dec(Start);
        C2 := Word(Start^);
        if (Start - 1) > Text then C1 := Word((Start - 1)^)
                              else C1 := $FFFFFFFF;
        if (SurrogateLowStart <= C2) and (C2 <= SurrogateLowEnd) and
           (SurrogateHighStart <= C1) and (C1 <= SurrogateHighEnd) then
        begin
          C1 := $10000 + (((C1 and $03FF) shl 10) or (C2 and $03FF));
          Dec(Start);
        end
        else C1 := C2;
      end;
    end;

    // handle space compression if indicated
    if sfSpaceCompress in FFlags then
    begin
      CheckSpace := False;
      while (Start > Text) and
            (UnicodeIsWhiteSpace(C1) or UnicodeIsControl(C1)) do
      begin
        CheckSpace := UnicodeIsWhiteSpace(C1);
        Dec(Start);
        C2 := Word(Start^);
        if (Start - 1) > Text then C1 := Word((Start - 1)^)
                              else C1 := $FFFFFFFF;
        if (SurrogateLowStart <= C2) and (C2 <= SurrogateLowEnd) and
           (SurrogateHighStart <= C1) and (C1 <= SurrogateHighEnd) then
        begin
          C1 := $10000 + (((C1 and $03FF) shl 10) or (C2 and $03FF));
          Dec(Start);
        end
        else C1 := C2;
      end;
      // Handle things if space compression was indicated and one or
      // more member characters were found.
      if CheckSpace then
      begin
        if Cp.UpCase <> $20 then Exit;
        Dec(Cp);
        Dec(Count);
        // If Count is 0 at this place then the space character(s) was the first
        // in the pattern and we need to correct the start position.
        if Count = 0 then Inc(Start);
      end;
    end;

    // handle the normal comparison cases
    if (Count > 0) and
       (WordBool(C1 xor Cp.UpCase) and
        WordBool(C1 xor Cp.LoCase) and
        WordBool(C1 xor Cp.TitleCase)) then Exit;

    if C1 >= $10000 then Dec(Count, 2)
                    else Dec(Count, 1);
    if Count > 0 then
    begin
      Dec(Cp);
      // get the next preceding character
      if Start > Text then
      begin
        Dec(Start);
        C2 := Word(Start^);
        if (Start - 1) > Text then C1 := Word((Start - 1)^)
                              else C1 := $FFFFFFFF;
        if (SurrogateLowStart <= C2) and (C2 <= SurrogateLowEnd) and
           (SurrogateHighStart <= C1) and (C1 <= SurrogateHighEnd) then
        begin
          C1 := $10000 + (((C1 and $03FF) shl 10) or (C2 and $03FF));
          Dec(Start);
        end
        else C1 := C2;
      end;
    end;
  end;

  // So far the string matched. Now check its left border for a space character if
  // whole word only are allowed.
  if not (sfWholeWordOnly in FFlags) or
     (Start <= Text) or
     UnicodeIsWhiteSpace(Word((Start - 1)^)) then
  begin
    // set the match start position
    MatchStart := Start - Text;
    Result := True;
  end;
end;


initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3UnicodeBMSearch.pas initialization enter'); {$EndIf}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3UnicodeBMSearch.pas initialization leave'); {$EndIf}
finalization
 if Assigned(LoadInProgress) then
  FreeAndNil(LoadInProgress);
end.
