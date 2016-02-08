unit vtVerInf;

{*******************************************************}
{                                                       }
{         Delphi VCL Extensions (RX)                    }
{                                                       }
{         Copyright (c) 1995, 1996 AO ROSNO             }
{                                                       }
{*******************************************************}

{ Working with VERSIONINFO resourse type }
{ $Id: vtVerInf.pas,v 1.1 2015/08/26 13:07:52 lulin Exp $ }

// $Log: vtVerInf.pas,v $
// Revision 1.1  2015/08/26 13:07:52  lulin
// {RequestLink:606128535}
//
// Revision 1.16  2014/10/15 10:59:22  lukyanets
// Отучаем ddAppCOnfig от dd
//
// Revision 1.15  2011/07/28 08:23:39  narry
// Поправить TVersionInfo, чтобы не было AV (276533845)
//
// Revision 1.14  2011/05/19 12:22:35  lulin
// {RequestLink:266409354}.
//
// Revision 1.13  2010/03/26 17:34:51  lulin
// {RequestLink:199591594}.
// - тесты.
//
// Revision 1.12  2007/02/27 09:54:58  lulin
// - cleanup.
//
// Revision 1.11  2007/02/08 12:33:59  lulin
// - используем константу.
//
// Revision 1.10  2004/10/06 17:15:13  lulin
// - борьба за кошерность.
//
// Revision 1.9  2004/05/12 11:44:08  law
// - new behavior: уменьшаем вероятность появления Unicode-строк в редакторе.
//
// Revision 1.8  2004/04/14 14:49:56  law
// - new const: CP_CentralEuropeWin.
//
// Revision 1.7  2003/12/05 16:54:49  voba
// - add procedure CompareLongVersions
//
// Revision 1.6  2003/04/19 11:24:49  law
// - new file: vtDefine.inc.
//
// Revision 1.5  2000/12/15 15:36:29  law
// - вставлены директивы Log.
//

//{$I RX.INC}

//{$IFDEF RX_D3}
//  {$WEAKPACKAGEUNIT}
//{$ENDIF}

{$I l3Define.inc }
//{$I vtDefine.inc }

interface

uses
  Windows,

  l3Base,
  l3ProtoObject
  ;

type
  TVersionLanguage = (vlArabic, vlBulgarian, vlCatalan, vlTraditionalChinese,
    vlCzech, vlDanish, vlGerman, vlGreek, vlUSEnglish, vlCastilianSpanish,
    vlFinnish, vlFrench, vlHebrew, vlHungarian, vlIcelandic, vlItalian,
    vlJapanese, vlKorean, vlDutch, vlNorwegianBokmel, vlPolish,
    vlBrazilianPortuguese, vlRhaetoRomanic, vlRomanian, vlRussian,
    vlCroatoSerbian, vlSlovak, vlAlbanian, vlSwedish, vlThai, vlTurkish,
    vlUrdu, vlBahasa, vlSimplifiedChinese, vlSwissGerman, vlUKEnglish,
    vlMexicanSpanish, vlBelgianFrench, vlSwissItalian, vlBelgianDutch,
    vlNorwegianNynorsk, vlPortuguese, vlSerboCroatian, vlCanadianFrench,
    vlSwissFrench, vlUnknown);

  TVersionCharSet = (vcsASCII, vcsJapan, vcsKorea, vcsTaiwan, vcsUnicode,
    vcsEasternEuropean, vcsCyrillic, vcsMultilingual, vcsGreek, vcsTurkish,
    vcsHebrew, vcsArabic, vcsUnknown);

  TLongVersion = record
    case Integer of
    0: (All: array[1..4] of Word);
    1: (MS, LS: LongInt);
  end;//TLongVersion

{ TVersionInfo }

  TVersionInfo = class(Tl3ProtoObject)
  private
    FFileName: String;
    FValid: Boolean;
    FSize: DWORD;
    FBuffer: PChar;
    FHandle: DWORD;
    procedure ReadVersionInfo;
    function GetFileName: string;
    procedure SetFileName(const Value: string);
    function GetTranslation: Pointer;
    function GetFixedFileInfo: PVSFixedFileInfo;
    function GetFileLongVersion: TLongVersion;
    function GetProductLongVersion: TLongVersion;
    function GetTranslationString: string;
    function GetComments: string;
    function GetCompanyName: string;
    function GetFileDescription: string;
    function GetFileVersion: string;
    function GetVersionNum: Longint;
    function GetInternalName: string;
    function GetLegalCopyright: string;
    function GetLegalTrademarks: string;
    function GetOriginalFilename: string;
    function GetProductVersion: string;
    function GetProductName: string;
    function GetSpecialBuild: string;
    function GetPrivateBuild: string;
    function GetVersionLanguage: TVersionLanguage;
    function GetVersionCharSet: TVersionCharSet;
    function GetVerFileDate: TDateTime;
  protected  
    procedure Cleanup;
      override;
      {-}
  public
    constructor Create(const AFileName: String = '');
      reintroduce;
    function GetVerValue(const VerName: string): string;
    property FileName: string read GetFileName write SetFileName;
    property Valid: Boolean read FValid;
    property FixedFileInfo: PVSFixedFileInfo read GetFixedFileInfo;
    property FileLongVersion: TLongVersion read GetFileLongVersion;
    property ProductLongVersion: TLongVersion read GetProductLongVersion;
    property Translation: Pointer read GetTranslation;
    property VersionLanguage: TVersionLanguage read GetVersionLanguage;
    property VersionCharSet: TVersionCharSet read GetVersionCharSet;
    property VersionNum: Longint read GetVersionNum;
    property Comments: string read GetComments;
    property CompanyName: string read GetCompanyName;
    property FileDescription: string read GetFileDescription;
    property FileVersion: string read GetFileVersion;
    property InternalName: string read GetInternalName;
    property LegalCopyright: string read GetLegalCopyright;
    property LegalTrademarks: string read GetLegalTrademarks;
    property OriginalFilename: string read GetOriginalFilename;
    property ProductVersion: string read GetProductVersion;
    property ProductName: string read GetProductName;
    property SpecialBuild: string read GetSpecialBuild;
    property PrivateBuild: string read GetPrivateBuild;
    property Values[const Name: string]: string read GetVerValue;
    property VerFileDate: TDateTime read GetVerFileDate;
  end;//TVersionInfo

function LongVersionToString(const Version: TLongVersion): string;
function StringToLongVersion(const Str: string): TLongVersion;
function CompareLongVersions(const Version1: TLongVersion; const Version2: TLongVersion): Integer;
{ Installation utility routine }

function OkToWriteModule(const ModuleName: string; NewVer: Longint): Boolean;

function vtGetProgramVersion: ShortString;

implementation

uses
  SysUtils,
  
  Forms,

  l3Chars
  ;

const
  LanguageValues: array[TVersionLanguage] of Word = ($0401, $0402, $0403,
    $0404, $0405, $0406, $0407, $0408, $0409, $040A, $040B, $040C, $040D,
    $040E, $040F, $0410, $0411, $0412, $0413, $0414, $0415, $0416, $0417,
    $0418, 
    LCID_RUSSIAN, 
    $041A, $041B, $041C, $041D, $041E, $041F, $0420, $0421,
    $0804, $0807, $0809, $080A, $080C, $0810, $0813, $0814, $0816, $081A,
    $0C0C, $100C, $0000);

const
  CharacterSetValues: array[TVersionCharSet] of Integer = (0, 932, 949, 950,
    1200, 1250, CP_RussianWin, CP_WesternWin, 1253, 1254, 1255, 1256, -1);

{ TVersionInfo }

constructor TVersionInfo.Create(const aFileName: String = '');
begin
  inherited Create;
  if (AFileName = '') then
   fFileName := Application.ExeName
  else
   fFileName := aFileName;
  ReadVersionInfo;
end;

procedure TVersionInfo.Cleanup;
begin
  l3System.FreeLocalMem(FBuffer);
  inherited;
end;

procedure TVersionInfo.ReadVersionInfo;
begin
  FValid := False;
  FSize := GetFileVersionInfoSize(PChar(FFileName), FHandle);
  if FSize > 0 then
    try
      l3System.GetLocalMem(FBuffer, FSize);
      FValid := GetFileVersionInfo(PChar(FFileName), FHandle, FSize, FBuffer);
    except
      FValid := False;
      raise;
    end;
end;

function TVersionInfo.GetFileName: string;
begin
  Result := FFileName;
end;

procedure TVersionInfo.SetFileName(const Value: string);
begin
  l3System.FreeLocalMem(FBuffer);
  FFileName := Value;
  ReadVersionInfo;
end;

function TVersionInfo.GetTranslation: Pointer;
var
  Len: UINT;
begin
  Result := nil;
  if Valid then VerQueryValue(FBuffer, '\VarFileInfo\Translation', Result, Len)
  else Result := nil;
end;

function TVersionInfo.GetTranslationString: string;
var
  P: Pointer;
begin
  Result := '';
  P := GetTranslation;
  if P <> nil then
    Result := IntToHex(MakeLong(HiWord(Longint(P^)), LoWord(Longint(P^))), 8);
end;

function TVersionInfo.GetVersionLanguage: TVersionLanguage;
var
  P: Pointer;
begin
  P := GetTranslation;
  for Result := vlArabic to vlUnknown do
    if LoWord(Longint(P^)) = LanguageValues[Result] then Break;
end;

function TVersionInfo.GetVersionCharSet: TVersionCharSet;
var
  P: Pointer;
begin
  P := GetTranslation;
  for Result := vcsASCII to vcsUnknown do
    if HiWord(Longint(P^)) = CharacterSetValues[Result] then Break;
end;

function TVersionInfo.GetFixedFileInfo: PVSFixedFileInfo;
var
  Len: UINT;
begin
  Result := nil;
  if Valid then VerQueryValue(FBuffer, '\', Pointer(Result), Len)
  else Result := nil;
end;

function TVersionInfo.GetProductLongVersion: TLongVersion;
begin
 if (FixedFileInfo = nil) then
  l3FillChar(Result, SizeOf(Result), 0)
 else
 begin
  Result.MS := FixedFileInfo^.dwProductVersionMS;
  Result.LS := FixedFileInfo^.dwProductVersionLS;
 end;//FixedFileInfo = nil
end;

function TVersionInfo.GetFileLongVersion: TLongVersion;
begin
 if (FixedFileInfo = nil) then
  l3FillChar(Result, SizeOf(Result), 0)
 else
 begin
  Result.MS := FixedFileInfo^.dwFileVersionMS;
  Result.LS := FixedFileInfo^.dwFileVersionLS;
 end;
end;

function TVersionInfo.GetVersionNum: Longint;
begin
  if Valid then Result := FixedFileInfo^.dwFileVersionMS
  else Result := 0;
end;

function TVersionInfo.GetVerValue(const VerName: string): string;
var
  szName: array[0..255] of Char;
  Value: Pointer;
  Len: UINT;
begin
  Result := '';
  if Valid then begin
    StrPCopy(szName, '\StringFileInfo\' + GetTranslationString + '\' + VerName);
    if VerQueryValue(FBuffer, szName, Value, Len) then
      Result := StrPas(PChar(Value));
  end;
end;

function TVersionInfo.GetComments: string;
begin
  Result := GetVerValue('Comments');
end;

function TVersionInfo.GetCompanyName: string;
begin
  Result := GetVerValue('CompanyName');
end;

function TVersionInfo.GetFileDescription: string;
begin
  Result := GetVerValue('FileDescription');
end;

function TVersionInfo.GetFileVersion: string;
begin
  Result := GetVerValue('FileVersion');
  if (Result = '') and Valid then
    Result := LongVersionToString(FileLongVersion);
end;

function TVersionInfo.GetInternalName: string;
begin
  Result := GetVerValue('InternalName');
end;

function TVersionInfo.GetLegalCopyright: string;
begin
  Result := GetVerValue('LegalCopyright');
end;

function TVersionInfo.GetLegalTrademarks: string;
begin
  Result := GetVerValue('LegalTrademarks');
end;

function TVersionInfo.GetOriginalFilename: string;
begin
  Result := GetVerValue('OriginalFilename');
end;

function TVersionInfo.GetProductVersion: string;
begin
  Result := GetVerValue('ProductVersion');
  if (Result = '') and Valid then
    Result := LongVersionToString(ProductLongVersion);
end;

function TVersionInfo.GetProductName: string;
begin
  Result := GetVerValue('ProductName');
end;

function TVersionInfo.GetSpecialBuild: string;
begin
  Result := GetVerValue('SpecialBuild');
end;

function TVersionInfo.GetPrivateBuild: string;
begin
  Result := GetVerValue('PrivateBuild');
end;

function TVersionInfo.GetVerFileDate: TDateTime;
 var
  Age: Longint;
 begin
  Age := FileAge(FileName);
  if Age = -1
   then Result := -1//NullDate
   else Result := FileDateToDateTime(Age);

  {if FileExists(FileName) then
    Result := FileDateTime(FileName)
  else Result := NullDate;}
 end;

{ Long version string routines }

function LongVersionToString(const Version: TLongVersion): string;
begin
  with Version do
    Result := Format('%d.%d.%d.%d', [All[2], All[1], All[4], All[3]]);
end;

function StringToLongVersion(const Str: string): TLongVersion;
var
  Sep: Integer;
  Tmp, Fragment: string;
  I: Byte;
begin
  Tmp := Str;
  for I := 1 to 4 do begin
    Sep := Pos('.', Tmp);
    if Sep = 0 then Sep := Pos(',', Tmp);
    if Sep = 0 then Fragment := Tmp
    else begin
      Fragment := Copy(Tmp, 1, Sep - 1);
      Tmp := Copy(Tmp, Sep + 1, MaxInt);
    end;
    if Fragment = '' then Result.All[I] := 0
    else Result.All[I] := StrToInt(Fragment);
  end;
  I := Result.All[1];
  Result.All[1] := Result.All[2];
  Result.All[2] := I;
  I := Result.All[3];
  Result.All[3] := Result.All[4];
  Result.All[4] := I;
end;

function CompareLongVersions(const Version1: TLongVersion; const Version2: TLongVersion): Integer;
begin
 Result := Version1.MS - Version2.MS;
 if Result = 0 then
  Result := Version1.LS - Version2.LS;
end;

{ Installation utility routines }

function OkToWriteModule(const ModuleName: string; NewVer: Longint): Boolean;
{ Return True if it's ok to overwrite ModuleName with NewVer }
begin
  {Assume we should overwrite}
  OkToWriteModule := True;
  with TVersionInfo.Create(ModuleName) do begin
    try
      if Valid then {Should we overwrite?}
        OkToWriteModule := NewVer > VersionNum;
    finally
      Free;
    end;
  end;
end;

function vtGetProgramVersion: ShortString;
var
  VI: TVersionInfo;
begin
 try
  VI := TVersionInfo.Create(ParamStr(0));
  try
   Result:= Format('%s Версия %s от %s.',
         [VI.FileDescription,
         LongVersionToString(VI.ProductLongVersion),
         DateToStr(VI.VerFileDate)]);
  finally
    vi.Free;
  end;
 except
   Result:= 'Версия программы недоступна';
 end;
end;

end.