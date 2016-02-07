unit l3RegEx;
{* Поиск по регулярным выражениям. Описание смотри в конце модуля. }

// $Id: l3RegEx.pas,v 1.39 2015/05/25 12:33:24 fireton Exp $

// $Log: l3RegEx.pas,v $
// Revision 1.39  2015/05/25 12:33:24  fireton
// - откатываем распределение отдельных строк в тегах (ломается арифметика указателей)
//
// Revision 1.38  2015/05/15 12:15:23  fireton
// - иногда буфер меняется после поиска и тогда в тегах будет мусор, исправлено
//
// Revision 1.37  2014/02/18 12:16:31  fireton
// - дополнительная сигнатура метода SearchInString для удобства
//
// Revision 1.36  2013/10/29 11:34:49  fireton
// - оптимизации
//
// Revision 1.35  2013/04/12 15:02:04  lulin
// - расставляем const.
//
// Revision 1.34  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.33  2012/03/26 10:35:53  fireton
// - оптимизация поиска последовательности (K 349128671)
//
// Revision 1.32  2012/03/23 10:48:35  fireton
// - bug fix: некорректно искались последовательности (K 349127365)
//
// Revision 1.31  2012/03/23 04:15:09  fireton
// - ленивая квантификация
//
// Revision 1.30  2012/03/19 03:21:39  fireton
// - убрал ненужную зависимость
//
// Revision 1.29  2012/03/16 08:38:11  fireton
// - убрал отладочный код
//
// Revision 1.28  2012/03/16 08:35:32  fireton
// - рефакторинг регулярных выражений (оптимизация по скорости)
//
// Revision 1.27  2011/12/27 09:58:38  fireton
// - слева нельзя было ограничить разделители слов (К 324568559)
//
// Revision 1.26  2011/12/26 10:37:56  fireton
// - возможность игнорировать переносы строк (К 323063706)
//
// Revision 1.25  2011/06/23 07:34:17  fireton
// - если подпаттерн не совпал, то надо откатить все добавленные теги, а то они размножатся
//
// Revision 1.24  2011/05/18 12:09:16  lulin
// {RequestLink:266409354}.
//
// Revision 1.23  2009/12/24 14:47:59  fireton
// - bugfix: в TagParts не попадала кодировка текста
//
// Revision 1.22  2009/10/27 12:41:51  lulin
// - добавляем const.
//
// Revision 1.21  2009/09/25 10:32:34  voba
// - opt добавление в TagParts без копирования строк
//
// Revision 1.20  2009/08/27 16:16:09  fireton
// - неразрывные пробелы и табуляция - тоже пробелы
//
// Revision 1.19  2009/07/14 11:59:19  fireton
// - bugfix: некорректно определялся конец текста в буфере
//
// Revision 1.18  2009/06/23 14:30:58  fireton
// - отформатировал хелп по регекспам
//
// Revision 1.17  2009/06/01 11:19:24  fireton
// - конец буфера не считался концом строки
//
// Revision 1.16  2009/04/22 09:57:22  lulin
// [$145097239]. Переносим функцию в правильное место.
//
// Revision 1.15  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//
// Revision 1.14  2007/11/29 11:48:24  fireton
// - bug fix: ошибки при поиске регулярных выражений
//
// Revision 1.13  2007/09/06 16:01:00  lulin
// - cleanup.
//
// Revision 1.12  2007/08/21 12:43:33  lulin
// - избавляемся от предупреждений компилятора.
//
// Revision 1.11  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.10  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.9  2007/02/16 16:05:31  voba
// - Шурин bugfix
//
// Revision 1.8  2007/02/08 15:01:38  lulin
// - функции работы с форматкой выделены в модуль работы со строками.
//
// Revision 1.7  2007/02/08 13:55:48  lulin
// - bug fix: падали с Assert при проверке информации о пользователе (CQ OIT5-24388).
//
// Revision 1.6  2007/02/08 13:18:38  lulin
// - вставлено предусловие.
//
// Revision 1.5  2006/04/24 12:58:47  lulin
// - выпиливаем из списков общую функциональность.
//
// Revision 1.4  2006/04/03 08:49:00  voba
// - bug fix
//
// Revision 1.3  2005/11/21 09:37:38  voba
// - add  comment
//
// Revision 1.2  2005/10/11 13:45:16  fireton
// - change: EvtRegExError --> El3RegExError
//
// Revision 1.1  2005/10/11 12:49:50  lulin
// - модуль регулярных выражений переехал в правильную библиотеку.
//
// Revision 1.23  2005/09/07 14:16:22  fireton
// - константы разделителей слов перенесены в l3Chars
//
// Revision 1.22  2005/07/26 15:20:35  lulin
// - задел на ускорение контекстного поиска в F1.
//
// Revision 1.20  2005/03/22 10:50:02  fireton
// - bug fix: неразрываемый пробел не был в списке разделителей слов
//
// Revision 1.19  2005/01/31 13:00:51  voba
// - add '/c' - any char
//
// Revision 1.18  2004/11/25 12:17:51  fireton
// - bug fix: конец строки не расценивался как конец слова
//
// Revision 1.17  2004/10/26 15:10:05  demon
// - fix: в операции MakePattern был AV при aPattern = ''
//
// Revision 1.16  2004/10/19 14:26:23  am
// bugfix: когда прикручивали CodePage к MakePattern - сделали ошибку, шаблон в результате мог перекодироваться несколько раз
//
// Revision 1.15  2004/10/14 14:20:00  am
// change: завёл раздельные множества разделителей (для ANSI и OEM), ряд функций поэтому принимает доп. параметр - CodePage
//
// Revision 1.14  2004/09/21 12:56:01  lulin
// - Release заменил на Cleanup.
//
// Revision 1.13  2004/07/06 12:41:33  fireton
// - add: поиск начала и конца слова в регулярных выражениях
//
// Revision 1.12  2004/07/06 11:42:19  fireton
// - немножко форматирования
//
// Revision 1.11  2004/07/02 10:55:30  fireton
// - форматирование кода
//
// Revision 1.10  2004/06/01 15:44:37  law
// - удалены конструкторы Tl3VList.MakeString, MakeStringSorted - пользуйтесь Tl3StringList.
//
// Revision 1.9  2004/05/17 14:39:32  fireton
// - add: TvtRegularSearch теперь выделяет и запоминает теги
//
// Revision 1.8  2004/03/25 15:04:22  law
// - cleanup: убран мусор, переименованы названия.
// - new: добавлена документация.
//

{$I l3Define.inc }
{$I STDEFINE.INC}

interface

uses
  Windows,
  SysUtils,

  l3Interfaces,
  l3Base,
  l3ProtoObject,

  l3Chars,
  l3String,
  l3StringList,
  l3StringPtr
  ;

type
  El3RegExError = class(Exception);       {RegEx errors}

  Tl3MatchPosition = packed record
    StartPos : Cardinal;
    EndPos   : Cardinal;
    Length   : Cardinal;
    LineNum  : Cardinal;
  end;//Tl3MatchPosition

  Tl3OutputOption = (ooUnselected, ooModified, ooCountOnly);
  Tl3OutputOptions = set of Tl3OutputOption;

  Tl3Tokens = (tknNil, tknLitChar, tknCharClass, tknNegCharClass,
               tknClosure, tknLazyClosure, tknMaybeOne, tknAnyChar, tknBegOfLine,
               tknEndOfLine, tknGroup, tknBegTag, tknEndTag, tknDitto,
               tknBegOfWord, tknEndOfWord);

  TSetOfChar = set of AnsiChar;

  Pl3PatRecord = ^Tl3PatRecord;
  Tl3PatRecord = packed record
    Token         : Tl3Tokens;
    PossibleChars : TSetOfChar;
    NestedPattern : Pl3PatRecord;
    NextPattern   : Pl3PatRecord;
    NextOK        : Boolean;
  end;//Tl3PatRecord

  Tl3NodeHeap = class(Tl3ProtoObject)
  private
    f_FreeList : Pl3PatRecord;
  protected
    procedure nhClearHeap;
    function nhDeepCloneNode(aNode : Pl3PatRecord) : Pl3PatRecord;
    procedure Cleanup; override;

  public
    constructor Create;
    function AllocNode : Pl3PatRecord;
    procedure FreeNode(aNode : Pl3PatRecord);

    function CloneNode(aNode : Pl3PatRecord) : Pl3PatRecord;
  end;//Tl3NodeHeap

  Tl3RegularSearch = class(Tl3ProtoObject)
   private
    FTagStart: Integer;
    f_IgnoreCRLF: Boolean;
   protected
    fIgnoreCase: Boolean;
    fSearchPattern : AnsiString;
    fPatternCompiled : Boolean;
    fPatternCompiledOEM : Boolean;
    fMatchPatPtr      : Pl3PatRecord;
    fMatchPatPtrOEM   : Pl3PatRecord;
    f_CurWordDelimSet : TSetOfChar;
    FNodes            : Tl3NodeHeap;
    FTagParts         : Tl3StringList;

   protected
    procedure SetSearchPattern(const aPattern : AnsiString);

    procedure DisposePatRecord(var Data : Pl3PatRecord);

    function  MakePattern(const aPattern      : AnsiString;
                                aStart        : Integer;
                                aDelim        : AnsiChar;
                            var theTagOn      : Boolean;
                            var thePatList    : Pl3PatRecord;
                                aCodePage     : Longint = CP_ANSI) : Integer;


    function FindMatch(const Buf        : PAnsiChar;
                             BufOffSet  : Integer;
                             BufLen     : Integer;
                             PatPtr     : Pl3PatRecord;
                         var REPosition : Tl3MatchPosition;
                             aCodePage  : Longint = CP_ANSI) : Boolean;

    function MatchOnePatternElement(Const Buf       : PAnsiChar;
                                          BufLen    : Integer;
                                    var   I         : Integer;
                                    var   TagOn     : Boolean;
                                    var   TagNum    : Integer;
                                          PatPtr    : Pl3PatRecord;
                                          aCodePage : Longint = CP_ANSI) : Boolean;


    function SearchMatchPattern(const aBuf    : PAnsiChar;
                                      aBufLen : Integer;
                                      aBufOffSet : Integer;
                                  var theTagOn  : Boolean;
                                  var theTagNum : Integer;
                                      aPatPtr : Pl3PatRecord;
                                      aCodePage : Longint = CP_ANSI) : Integer;

    function CompilePattern(aCodePage: Longint = CP_ANSI) : Pl3PatRecord;
   public
    constructor Create{(anOwner: TObject = nil); override};
    procedure  Cleanup; override;

    function SearchInString(const aSearchInStr : Tl3WString;
                              var REPosition   : Tl3MatchPosition) : Boolean;
      overload;
    function SearchInString(const aSearchInStr : Tl3WString): Boolean;
      overload;
    function SearchInString(const aString: AnsiString): Boolean;
      overload;
    function SearchInString(const aString    : AnsiString;
                              var REPosition : Tl3MatchPosition): Boolean;
      overload;
    function SearchInString(const aSearchInStr : PANSIChar;
                                  aBufOffSet   : Integer;
                                  aBufLen      : Integer;
                              var REPosition   : Tl3MatchPosition;
                                  aCodePage    : Longint = CP_ANSI) : Boolean;
      overload;

    property IgnoreCase : Boolean
      read FIgnoreCase
      write FIgnoreCase;
    property IgnoreCRLF: Boolean read f_IgnoreCRLF write f_IgnoreCRLF;
    property SearchPattern : AnsiString
      read fSearchPattern
      write SetSearchPattern;
    property TagParts: Tl3StringList read FTagParts;
  end;//Tl3RegularSearch

const
  vtFullANSISet      : TSetOfChar =[Low(AnsiChar)..High(AnsiChar)];
  vtWordDelimANSISet : TSetOfChar = cc_WordDelimANSISet;
  vtWordDelimOEMSet  : TSetOfChar = cc_WordDelimOEMSet;
  vtDecDigitSet      : TSetOfChar = ['0','1','2','3','4','5','6','7','8','9'];
  vtHexDigitSet      : TSetOfChar = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
  vtCharANSISet      = cc_ANSILetter;
  vtCharOEMSet       = cc_OEMLetter;
  vtSpacesANSISet    : TSetOfChar = [cc_HardSpace, cc_SoftSpace, cc_Tab];
  vtSpacesOEMSet     : TSetOfChar = [cc_HardSpace, cc_OEMSoftSpace, cc_Tab];

function ConvertStrToRegular(const S : AnsiString) : AnsiString;

function l3CheckStrByPattern(const aPattern : AnsiString;
                             const aString  : Tl3WString) : Boolean;
 {* Функция-helper. Сравнивает строку с образцов.
    Следует учитывать, что поисковая машина пересоздаётся при КАЖДОМ вызове. }

const
  ch_EndStr        = #0;
  ch_Dash          = '-';
  ch_Esc           = '\';
  ch_Any           = '.';  {was '?'}
  ch_ClosurePlus   = '+';
  ch_MaybeOne      = '?';  {was '!'}
  ch_Bol           = '^';
  ch_Eol           = '$';
  ch_Ccl           = '[';
  ch_Negate        = '^';
  ch_CclEnd        = ']';
  ch_BTag          = '{';
  ch_ETag          = '}';
  ch_BGroup        = '(';
  ch_EGroup        = ')';
  ch_Alter         = '|';  {was #}
  ch_Space         = 's';
  ch_Newline       = 'n';
  ch_Tab           = 't';
  ch_BackSpace     = 'b';
  ch_Return        = 'r';
  ch_Feed          = 'l';
  ch_Hex           = 'h';
  ch_Dec           = 'd';
  ch_WordDelim     = '_';
  ch_Char          = 'c';
  ch_BWord         = '>';
  ch_EWord         = '<';
  ch_Word          = 'w';  {was w}
  ch_Closure       = '*';
  ch_Lazy          = '?';

implementation

uses
  m2XLTLib
  ;

ResourceString
  stscUnknownError              ='Unknown error creating a pattern token';
  stscExpandingClass            ='Problem in expanding character class';
  stscAlternationFollowsClosure ='Alternation cannot immediately follow a closure marker';
  stscUnbalancedParens          ='Unbalanced nesting parentheses';
  stscFollowingClosure          ='Closure cannot immediately follow BegOfLine, EndOfLine or another closure';
  stscPatternError              ='Error detected near end of pattern';
  stscUnbalancedTag             ='Unbalanced tag marker';
  stscNoPatterns                ='No Match, Replace, or SelAvoid Patterns defined';
  stscPatternTooLarge           ='Pattern exceeds MaxPatLen';
  stscStreamsNil                ='Input and/or output stream is not assigned';
  stscInTextStreamError         ='Error creating internal input text stream';
  stscOutTextStreamError        ='Error creating internal output text stream';
  stscClosureMaybeEmpty         ='A * or + operand could be empty';
  stscOutFileDelete             ='Error deleting old previous file';
  stscInFileNotFound            ='Input file not found';
  stscREInFileError             ='Error creating internal text stream';
  stscOutFileCreate             ='Error creating output file';
  stscTooBigQuantifySequence    ='Quantify lengths array is exceded!';

const
 vtSpecSymbSet : TSetOfChar = [ch_Dash, ch_Esc, ch_Any, ch_Closure, ch_ClosurePlus, ch_MaybeOne,
                               ch_Bol, ch_Eol, ch_Ccl, ch_Negate, ch_CclEnd, ch_BTag, ch_ETag,
                               ch_BGroup, ch_EGroup, ch_Alter, ch_BWord, ch_EWord];

type
 TQuantifierPointRec = record
  rLength: Integer;
  rCount : Integer;
 end;

function ConvertStrToRegular(const S : AnsiString) : AnsiString;
var
 lLen : integer;
 I,J  : integer;
begin
 lLen := Length(S);
 J := 0;
 SetLength(Result, 2*lLen);
 For I:=1 to lLen do
 begin
  If S[I] in vtSpecSymbSet then
  begin
   Result[I+J] := ch_Esc;
   Inc(J);
  end;
  Result[I+J] := S[I];
 end;
 SetLength(Result, lLen + J);
end;

procedure AppendChar(C : AnsiChar; var S : TSetOfChar);
 {-append a character C onto AnsiString S}
begin
  S := S + [C];
end;

procedure AppendCharSet(C : TSetOfChar; var S : TSetOfChar);
 {-append a character set C onto AnsiString S}
begin
  S := S + C;
end;

function IsAlphaNum(C : AnsiChar) : Boolean;
begin
  Result := IsCharAlphaNumericA(C);
end;

function _IsOEM(aCodePage : Longint): Boolean;
  {-}
begin
 Result := (aCodePage = CP_OEM) OR (aCodePage = CP_OEMLite) OR (aCodePage = CP_RussianDos);
end;

function _IsANSI(aCodePage : Longint): Boolean;
  {-}
begin
 //Result := (aCodePage = CP_ANSI) OR (aCodePage = CP_RussianWin);
 Result := not _IsOEM(aCodePage) and (aCodePage <> cp_Unicode)
end;

function vtWordDelimSet(aCodePage : Longint) : TSetOfChar;
begin
 if _IsANSI(aCodePage) then
  Result := vtWordDelimANSISet
 else
 if _IsOEM(aCodePage) then
  Result := vtWordDelimOEMSet
 else
 begin
  Result := [];
  Assert(false);
 end;//_IsOEM(aCodePage)
end;

function vtSpacesSet(aCodePage : Longint) : TSetOfChar;
begin
 if _IsANSI(aCodePage) then
  Result := vtSpacesANSISet
 else
 if _IsOEM(aCodePage) then
  Result := vtSpacesOEMSet
 else
 begin
  Result := [];
  Assert(false);
 end;//_IsOEM(aCodePage)
end;

function vtCharSet(aCodePage : Longint) : TSetOfChar;
begin
 if _IsANSI(aCodePage) then
  Result := vtCharANSISet
 else
 if _IsOEM(aCodePage) then
  Result := vtCharOEMSet
 else
 begin
  Result := [];
  Assert(false);
 end;//_IsOEM(aCodePage)
end;

procedure ExpandDash(Delim       : AnsiChar;
                     const Pattern : AnsiString;
                     var I       : Integer;
                     var S       : TSetOfChar;
                       aCodePage : Longint);
{-_expand the innards of the character class, including dashes}
{stop when endc is found}
{return a AnsiString S with the expansion}
var
  C,
  CLeft,
  CNext  : AnsiChar;
  K      : Integer;

begin
  while (Pattern[I] <> Delim) and (Pattern[I] <> ch_EndStr) do begin
    C := Pattern[I];
    if (C = ch_Esc) then begin
      if (Pattern[Succ(I)] <> ch_EndStr) then begin
        Inc(I);
        C := Pattern[I];
        case C of
          ch_Space      : AppendCharSet(vtSpacesSet(aCodePage), S);
          ch_Tab        : AppendChar(#9,  S);
          ch_BackSpace  : AppendChar(#8,  S);
          ch_Return     : AppendChar(#13, S);
          ch_Feed       : AppendChar(#10, S);
          ch_WordDelim  : AppendCharSet(vtWordDelimSet(aCodePage), S);
          ch_Word       : AppendCharSet(vtFullANSISet - vtWordDelimSet(aCodePage), S);
          ch_Hex        : AppendCharSet(vtHexDigitSet, S);
          ch_Dec        : AppendCharSet(vtDecDigitSet, S);
          ch_Char       : AppendCharSet(vtCharSet(aCodePage), S);
        else
          AppendChar(C, S);
        end;
      end else
        {escape must be the character}
        AppendChar(ch_Esc, S);
    end else if (C <> ch_Dash) then
      {literal character}
      AppendChar(C, S)
    else if ((S = []) or (Pattern[Succ(I)] = Delim)) then
      {literal dash at begin or end of class}
      AppendChar(ch_Dash, S)
    else begin
      {dash in middle of class}
      CLeft := Pattern[Pred(I)];
      CNext := Pattern[Succ(I)];
      if IsAlphaNum(CLeft) and IsAlphaNum(CNext) and (CLeft <= CNext) then begin
        {legal dash to be expanded}
        for K := (Ord(CLeft)+1) to Ord(CNext) do
          AppendChar(AnsiChar(K), S);
        {_move over the end of dash character}
        Inc(I);
      end else
        {dash must be a literal}
        AppendChar(ch_Dash, S);
    end;
    Inc(I);
  end;
end;


function GetCharacterClass(const Pattern : AnsiString;
                           var I         : Integer;
                           var S         : TSetOfChar;
                           var AToken    : Tl3Tokens;
                               aCodePage : Longint) : Boolean;
{-_expand a character class starting at position I of Pattern into a AnsiString S}
{return a token type (tknCharClass or tknNegCharClass)}
{return I pointing at the end of class character}
{return true if successful}

begin
{skip over start of class character}
  Inc(I);
  if (Pattern[I] = ch_Negate) then begin
    AToken := tknNegCharClass;
    Inc(I);
  end else
    AToken := tknCharClass;
  {_expand the character class}
  S := [];
  ExpandDash(ch_CclEnd, Pattern, I, S, aCodePage);
  Result := (Pattern[I] = ch_CclEnd);
end;





{******************************************************************************}
{                           Tl3NodeHeap Implementation                         }
{******************************************************************************}

constructor Tl3NodeHeap.Create;
begin
 inherited Create;
 l3System.GetLocalMem(f_FreeList, SizeOf(Tl3PatRecord));
 l3FillChar(f_FreeList^, sizeof(Tl3PatRecord), 0);
end;

function Tl3NodeHeap.AllocNode : Pl3PatRecord;
begin
 if (f_FreeList^.NextPattern = nil) then
  l3System.GetLocalMem(Result, SizeOf(Tl3PatRecord))
 else
 begin
  Result := f_FreeList^.NextPattern;
  f_FreeList^.NextPattern := Result^.NextPattern;
 end;
 l3FillChar(Result^, sizeof(Tl3PatRecord), 0);
end;

procedure Tl3NodeHeap.Cleanup;
begin
 nhClearHeap;
 l3System.FreeLocalMem(f_FreeList);
 inherited;
end;


function Tl3NodeHeap.CloneNode(aNode : Pl3PatRecord) : Pl3PatRecord;
begin
  {allocate a new node}
  Result := AllocNode;

  {copy fields}
  Result^.Token         := aNode^.Token;
  Result^.PossibleChars := aNode^.PossibleChars;

  Result^.NextOK        := aNode^.NextOK;

  {deep clone the nested node}
  if (aNode^.NestedPattern <> nil) then
    Result^.NestedPattern := nhDeepCloneNode(aNode^.NestedPattern);
end;


procedure Tl3NodeHeap.FreeNode(aNode : Pl3PatRecord);
begin
 if (aNode <> nil) then
 begin
  aNode^.NextPattern := f_FreeList^.NextPattern;
  f_FreeList^.NextPattern := aNode;
 end;
end;


procedure Tl3NodeHeap.nhClearHeap;
var
 l_Walker,
 l_Temp    : Pl3PatRecord;
begin
 l_Walker := f_FreeList^.NextPattern;
 f_FreeList^.NextPattern := nil;
 while (l_Walker <> nil) do
 begin
  l_Temp := l_Walker;
  l_Walker := l_Walker^.NextPattern;
  l3System.FreeLocalMem(l_Temp);
 end;
end;

function Tl3NodeHeap.nhDeepCloneNode(aNode : Pl3PatRecord) : Pl3PatRecord;
begin
  {allocate a new node}
  Result := AllocNode;

  {copy fields}
  Result^.Token         := aNode^.Token;
  Result^.PossibleChars := aNode^.PossibleChars;
  Result^.NextOK        := aNode^.NextOK;

  {recursively deepclone the next and nested nodes}
  if (aNode^.NextPattern <> nil) then
    Result^.NextPattern := nhDeepCloneNode(aNode^.NextPattern);
  if (aNode^.NestedPattern <> nil) then
    Result^.NestedPattern := nhDeepCloneNode(aNode^.NestedPattern);
end;

{Tl3RegularSearch}

constructor Tl3RegularSearch.Create{(anOwner: TObject = nil)};
 begin
  Inherited Create{(anOwner)};
  FNodes    := Tl3NodeHeap.Create;
  FTagParts := Tl3StringList.Make;
 end;

procedure Tl3RegularSearch.Cleanup;
 begin
  Inherited;
  DisposePatRecord(FMatchPatPtr);
  DisposePatRecord(FMatchPatPtrOEM);
  l3Free(FNodes);
  l3Free(FTagParts);
 end;

procedure Tl3RegularSearch.SetSearchPattern(const aPattern : AnsiString);
 begin
  fSearchPattern := aPattern;
  fPatternCompiled := False;
  fPatternCompiledOEM := False;
 end;

function Tl3RegularSearch.CompilePattern(aCodePage: Longint = CP_ANSI) : Pl3PatRecord;

 function GetPattern(const aPattern : AnsiString;
                       var thePatList : Pl3PatRecord) : Boolean;
  var
   l_TagOn          : Boolean;
   l_Pattern       : AnsiString;
  begin
   l_TagOn := False;
   if _IsANSI(aCodePage) then
    l_Pattern := aPattern
   else
   if _IsOEM(aCodePage) then
    l_Pattern := l3ChangeCodePage(aPattern, CP_ANSI, CP_OEM)
   else
    Assert(False);
   Result := (MakePattern(l_Pattern, 1, ch_EndStr, l_TagOn, thePatList, aCodePage) > 0);
   if l_TagOn then
   begin
    Result := False;
    raise El3RegExError.Create(stscUnbalancedTag);
   end;
  end;

 begin
  if _IsANSI(aCodePage) then
  begin
   If not fPatternCompiled then
   begin
    DisposePatRecord(FMatchPatPtr);
    f_CurWordDelimSet := vtWordDelimSet(aCodePage);
    GetPattern(fSearchPattern, FMatchPatPtr);
    fPatternCompiled := True;
   end;
   Result := FMatchPatPtr;
  end
  else {CP_OEM}
  if _IsOEM(aCodePage) then
  begin
   If not fPatternCompiledOEM then
   begin
    DisposePatRecord(FMatchPatPtrOEM);
    f_CurWordDelimSet := vtWordDelimSet(aCodePage);
    GetPattern(fSearchPattern, FMatchPatPtrOEM);
    fPatternCompiledOEM := True;
   end;
   Result := FMatchPatPtrOEM;
  end
  else
  begin
   Assert(false);
   Result := nil;
  end;//_IsOEM(aCodePage)
 end;

function Tl3RegularSearch.SearchInString(const aSearchInStr : Tl3WString): Boolean;
var
 l_MP: Tl3MatchPosition;
begin
 Result := SearchInString(aSearchInStr, l_MP);
end;

function Tl3RegularSearch.SearchInString(const aSearchInStr : Tl3WString;
                                           var REPosition   : Tl3MatchPosition) : Boolean;
  //overload;
begin
 if (aSearchInStr.SCodePage = CP_Unicode) then
  Result := SearchInString(l3PCharLen(l3Str(aSearchInStr)), REPosition)
 else
  Result := SearchInString(aSearchInStr.S,
                           0,
                           aSearchInStr.SLen,
                           REPosition,
                           aSearchInStr.SCodePage);
end;

function Tl3RegularSearch.SearchInString(const aSearchInStr : PAnsiChar;
                                               aBufOffSet   : Integer;
                                               aBufLen      : Integer;
                                           var REPosition   : Tl3MatchPosition;
                                               aCodePage    : Longint = CP_ANSI) : Boolean;
begin
 Assert(_IsANSI(aCodePage) OR _IsOEM(aCodePage));
 Result := FindMatch(aSearchInStr, aBufOffSet, aBufLen, CompilePattern(aCodePage), REPosition, aCodePage);
end;

function Tl3RegularSearch.SearchInString(const aString    : AnsiString;
                                           var REPosition : Tl3MatchPosition): Boolean;
begin
 Result := SearchInString(PAnsiChar(aString), 0, Length(aString), REPosition);
end;

function Tl3RegularSearch.SearchInString(const aString: AnsiString): Boolean;
var
 l_RP: Tl3MatchPosition;
begin
 Result := SearchInString(aString, l_RP);
end;

function Tl3RegularSearch.MakePattern(const aPattern      : AnsiString;
                                            aStart        : Integer;
                                            aDelim        : AnsiChar;
                                        var theTagOn      : Boolean;
                                        var thePatList    : Pl3PatRecord;
                                            aCodePage     : Longint) : Integer;

function CleanUpCase(S : ShortString) : ShortString;
{-convert AnsiString to uppercase and remove duplicates}
var
  I  : Integer;
  //K  : Cardinal;
  C  : AnsiChar;
begin
  Result := '';
  S := AnsiUpperCase(S);
  for I := 1 to Length(S) do
  begin
    C := S[I];
    if not l3_ssTestChar(Result, C) then
      Result := Result + C;
  end;
end;

procedure AddTokenToPattern(var PatRec : Pl3PatRecord;
                                LastPatRec : Pl3PatRecord;
                                Token : Tl3Tokens;
                                S : TSetOfChar = []);

{-add a token record to the pattern list}
{-S contains a literal character or an expanded character class}

 procedure AddAlphaInAnotherReg(var aCS : TSetOfChar);
 var
  I, C : AnsiChar;
 begin//AddAlphaInAnotherReg
  for I := #0 to #255 do
   if (I in aCS) then
   begin
    C := I;
    if _IsANSI(aCodePage) then
     m2XLTConvertBuff(@C, 1, Cm2XLTAnsi2Swap)
    else
    if _IsOEM(aCodePage) then
     m2XLTConvertBuff(@C, 1, Cm2XLTOem2Swap)
    else
     Assert(false);
    aCS := aCS + [C];
   end;//I in aCS
 end;//AddAlphaInAnotherReg

begin
  If Token = tknLitChar then Token := tknCharClass;

  PatRec := FNodes.AllocNode;
  PatRec^.Token := Token;        {save token type}
  PatRec^.NextOK := False;       {default to non-alternation}

  If Token in [tknCharClass, tknNegCharClass] then
  begin
   PatRec^.PossibleChars := S;
   if FIgnoreCase then AddAlphaInAnotherReg(PatRec^.PossibleChars);
  end
  else
   PatRec^.PossibleChars := [];

  LastPatRec^.NextPattern := PatRec;  {hook up the previous token}

  (*
  case Token of
    tknNil, tknAnyChar, tknBegOfLine, tknEndOfLine, tknGroup, tknBegTag, tknEndTag :
      begin
        PatRec^.PossibleChars := [];
      end;
    tknLitChar :
      begin
        if IgnoreCase then
        begin
         PatRec^.OneChar := AnsiUpperCase(S[1])[1];


        end
        else
        begin
         PatRec^.OneChar := S[1];
         PatRec^.StrPtr := nil;
        end;
      end;
    tknCharClass, tknNegCharClass :
      begin
        PatRec^.OneChar := Null;
        if FIgnoreCase then
          S := CleanUpCase(S);
        New(PatRec^.StrPtr);
        PatRec^.StrPtr^ := S;
      end;
  else
    Raise El3RegExError.Create(stscUnknownError);
  end;
 *)
end;

var
  I                : Integer;
  l_NextLastPatRec,
  l_LastPatRec,
  l_TempPatRec,
  l_PatRec         : Pl3PatRecord;
  l_Done           : Boolean;
  l_Char          : AnsiChar;
  l_CS             : TSetOfChar;
  l_Token          : Tl3Tokens;
  l_GroupStartPos,
  l_GroupEndPos    : integer;

begin
  if aPattern = '' then
  begin
   Result := 0;
   Raise El3RegExError.Create(stscPatternError);
  end;

  thePatList := FNodes.AllocNode;
  thePatList^.Token  := tknNil;    {put a nil token at the beginning} // потом мы его грохнем
  thePatList^.NextOK := False;
  l_LastPatRec := thePatList;
  l_NextLastPatRec := nil;

  I := aStart;                 {start point of pattern AnsiString}
  l_Done := False;
  while not(l_Done) and (aPattern[I] <> aDelim) and (aPattern[I] <> ch_EndStr) do
  begin
   l_Char := aPattern[I];
   if (l_Char = ch_Any) then
    AddTokenToPattern(l_PatRec, l_LastPatRec, tknAnyChar{, AChar})
   else if (l_Char = ch_Bol) then
    AddTokenToPattern(l_PatRec, l_LastPatRec, tknBegOfLine{, ''})
   else if (l_Char = ch_Eol) then
    AddTokenToPattern(l_PatRec, l_LastPatRec, tknEndOfLine{, ''})
   else if (l_Char = ch_BWord) then
    AddTokenToPattern(l_PatRec, l_LastPatRec, tknBegOfWord{, ''})
   else if (l_Char = ch_EWord) then
    AddTokenToPattern(l_PatRec, l_LastPatRec, tknEndOfWord{, ''})
   else if (l_Char = ch_Ccl) then
   begin
    l_Done := (GetCharacterClass(aPattern, I, l_CS, l_Token, aCodePage) = False);

    if l_Done then
     raise El3RegExError.Create(stscExpandingClass);

    AddTokenToPattern(l_PatRec, l_LastPatRec, l_Token, l_CS);
   end
   else
    if (l_Char = ch_Alter) then
    begin
     if (l_NextLastPatRec = nil) or
        (not (l_NextLastPatRec^.Token in [tknClosure, tknLazyClosure, tknMaybeOne])) then
     begin
         {flag the current token as non-critical, i.e., "next is OK"}
         l_LastPatRec^.NextOK := True;
     end
     else
     begin
      {alternation immediately after a closure is probably not desired}
      {e.g., [a-z]*|[0-9] would internally produce ([a-z]|[0-9])*}
      l_Done := True;
      raise El3RegExError.Create(stscAlternationFollowsClosure);
     end;
    end
    else
     if (l_Char = ch_BGroup) then
      begin
       l_GroupStartPos := I+1;
       AddTokenToPattern(l_PatRec, l_LastPatRec, tknGroup{, ''});
       {recursive branch off the list}
       I := MakePattern(aPattern, Succ(I), ch_EGroup, theTagOn, l_TempPatRec, aCodePage);
       if (I > 0) then
       begin
        l_GroupEndPos := I-1;
        if (aPattern[Succ(I)] <> ch_EndStr) then
        begin
         if (aPattern[Succ(I)] in [ch_Closure, ch_ClosurePlus]) then
         begin
          if ((((l_GroupEndPos - l_GroupStartPos) = 1) or
              (((l_GroupEndPos - l_GroupStartPos) = 2) and
                (aPattern[l_GroupStartPos] = ch_Esc))) and
               (aPattern[l_GroupEndPos] in [ch_Closure, ch_MaybeOne])) then
          begin
           l_Done := True;
           raise El3RegExError(stscClosureMaybeEmpty);
          end
          else
           l_PatRec^.NestedPattern := l_TempPatRec;
         end
         else
          l_PatRec^.NestedPattern := l_TempPatRec;
        end
        else
         l_PatRec^.NestedPattern := l_TempPatRec;
       end
       else
       begin
        {didn't find egroup}
        l_Done := True;
        raise El3RegExError.Create(stscUnbalancedParens);
       end;
      end
      else
       if ((l_Char = ch_BTag) and (not(theTagOn))) then
       begin
        AddTokenToPattern(l_PatRec, l_LastPatRec, tknBegTag{, ''});
        theTagOn := True;
       end
       else
        if ((l_Char = ch_ETag) and (theTagOn)) then
        begin
         AddTokenToPattern(l_PatRec, l_LastPatRec, tknEndTag{,  ''});
         theTagOn := False;
        end
        else
         if (((l_Char = ch_Closure) or (l_Char = ch_ClosurePlus) or
              (l_Char = ch_MaybeOne)) and (I > aStart)) then
         begin
          if ((l_LastPatRec^.Token in [tknBegOfLine, tknEndOfLine, tknMaybeOne, tknClosure, tknLazyClosure]) or
           (l_NextLastPatRec^.Token in [tknClosure, tknLazyClosure])) then
          begin
           {error, can't have closure after any of these}
           l_Done := True;
           raise El3RegExError.Create(stscFollowingClosure);
          end
          else
          begin
           if (l_Char = ch_ClosurePlus) then
           begin
            {insert an extra copy of the last token before the closure}
            l_TempPatRec := FNodes.CloneNode(l_LastPatRec);
            l_NextLastPatRec^.NextPattern := l_TempPatRec;
            l_TempPatRec^.NextPattern := l_LastPatRec;
            l_NextLastPatRec := l_TempPatRec;
           end;
           {insert the closure between next to last and last token}
           l_TempPatRec := FNodes.AllocNode;
           l_NextLastPatRec^.NextPattern := l_TempPatRec;
           if (l_Char = ch_MaybeOne) then
            l_TempPatRec^.Token := tknMaybeOne
           else
           begin
            if (aPattern[Succ(I)] = ch_Lazy) then
            begin
             Inc(I);
             l_TempPatRec^.Token := tknLazyClosure;
            end
            else
             l_TempPatRec^.Token := tknClosure;
           end;

           //TempPatRec^.OneChar := Null;

           l_TempPatRec^.NextPattern := l_LastPatRec;
           l_TempPatRec^.NextOK := False;
           {set j and lastj back into sequence}
           l_PatRec := l_LastPatRec;
           l_LastPatRec := l_TempPatRec;
          end;
     end
     else
     begin
      if (l_Char = ch_Esc) then
      begin
       {skip over escape character}
       Inc(I);
       l_Char := aPattern[I];
       case l_Char of
         ch_Space     : AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, vtSpacesSet(aCodePage));
         ch_Newline   :
           begin
             AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [#13]);
             l_LastPatRec  := l_PatRec;
             AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [#10]);
           end;
         ch_Tab       : AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [#9]);
         ch_BackSpace : AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [#8]);
         ch_Return    : AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [#13]);
         ch_Feed      : AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [#10]);

         ch_WordDelim : AddTokenToPattern(l_PatRec, l_LastPatRec, tknCharClass, f_CurWordDelimSet);
         ch_Word      : AddTokenToPattern(l_PatRec, l_LastPatRec, tknNegCharClass, f_CurWordDelimSet);
         ch_Hex       : AddTokenToPattern(l_PatRec, l_LastPatRec, tknCharClass, vtHexDigitSet);
         ch_Dec       : AddTokenToPattern(l_PatRec, l_LastPatRec, tknCharClass, vtDecDigitSet);
         ch_Char      : AddTokenToPattern(l_PatRec, l_LastPatRec, tknCharClass, vtCharSet(aCodePage));
       else
         AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [l_Char]);
       end;
      end
      else
       AddTokenToPattern(l_PatRec, l_LastPatRec, tknLitChar, [l_Char]);
     end;
     l_NextLastPatRec := l_LastPatRec;
     l_LastPatRec  := l_PatRec;
     if not(l_Done) then
      Inc(I);
  end; {of looking through pattern AnsiString}

  if ((l_Done) or (aPattern[I] <> aDelim)) then
  begin
   Result := 0;
   raise El3RegExError.Create(stscPatternError);
  end
  else
  begin
   Result := I;
   // избавимся от ненужного tknNil в начале каждого паттерна
   l_TempPatRec := thePatList.NextPattern;
   thePatList.NextPattern := nil;
   FNodes.FreeNode(thePatList);
   thePatList := l_TempPatRec;
  end;
end;

procedure Tl3RegularSearch.DisposePatRecord(var Data : Pl3PatRecord);
var
  Walker, Temp : Pl3PatRecord;
begin
  if (Data <> nil) then begin
    Walker := Data;
    while (Walker <> nil) do begin
      Temp := Walker;

      {if (Assigned(Walker^.StrPtr)) then
        Dispose(Walker^.StrPtr);}

      if (Assigned(Walker^.NestedPattern)) then
        DisposePatRecord(Walker^.NestedPattern);

      Walker := Walker^.NextPattern;
      FNodes.FreeNode(Temp);
    end;
    Data := nil;
  end;
end;

function Tl3RegularSearch.MatchOnePatternElement(Const Buf       : PAnsiChar;
                                                       BufLen    : Integer;
                                                 var   I         : Integer;
                                                 var   TagOn     : Boolean;
                                                 var   TagNum    : Integer;
                                                       PatPtr    : Pl3PatRecord;
                                                       aCodePage : Longint) : Boolean;
{-match one pattern element at pattern pointed to by PatPtr, Buf[I]}
var
  Advance  : -1..255;
  AToken   : Tl3Tokens;
  PatPos   : Integer;
  C        : AnsiChar;
  lStr     : Tl3StringPtr;
begin
  Advance := -1;
  AToken := PatPtr^.Token;

  if (I < BufLen) or ((I = BufLen) and (AToken = tknGroup) or (AToken = tknNil)) then
  begin
   C := Buf[I];
   if f_IgnoreCRLF and (C in [#13, #10]) then
    C := #32;

   case AToken of
    tknNil:
     Advance := 0;

    tknLitChar:
     if (C in PatPtr^.PossibleChars) then
      Advance := 1;

    tknCharClass:
     if (C in PatPtr^.PossibleChars) then
      Advance := 1;

    tknNegCharClass:
     begin
      if (not (C in [#13, #10])) then
      begin
       if not (C in PatPtr^.PossibleChars) then
        Advance := 1;
      end;
     end;

    tknAnyChar:
     if not (C in [#13, #10]) then
      Advance := 1;

    tknBegOfLine:
     if (I = 0) then
      Advance := 0;

    tknEndOfLine:
     if ((C = #13) and (Buf[Succ(I)] = #10)) or (C = #0) or (I = BufLen) then
      Advance := 0;

    tknGroup:
     begin
      {we treat a group as a "character", but allow advance of multiple chars}
      {recursive call to SearchMatchPattern}
      PatPos := SearchMatchPattern(Buf, BufLen, I, TagOn, TagNum, PatPtr^.NestedPattern, aCodePage);
      if (PatPos >= I) then
      begin
       I := PatPos;
       Advance := 0;
      end;
     end;

    tknBegTag:
     begin
      Advance := 0;
      if not(TagOn) then
      begin
       FTagStart := I+1;
       TagNum := Succ(TagNum);
       TagOn := True;
      end;
     end;

    tknEndTag:
     begin
      lStr := Tl3StringPtr.Create(l3PCharLen(Buf + FTagStart - 1, I - FTagStart + 1, aCodePage));
      try
       TagParts.Add(lStr);
      finally
       l3Free(lStr);
      end;
      Advance := 0;
      TagOn := False;
     end;

    tknBegOfWord:
     if //(not (C in lWordDelimSet)) and  --- K 324568559
        ((I=0) or (Buf[Pred(I)] in f_CurWordDelimSet) or (Buf[Pred(I)] in [#13,#10])) then
       Advance := 0;

    tknEndOfWord:
     if (C in f_CurWordDelimSet) or (C in [#0,#13,#10]) or (I = BufLen) then
      Advance := 0;
   end; // case ATocken of
  end
  else
  begin
    {at end of line}
    {end tag marks match}
    if (AToken = tknEndTag) then
    begin
     lStr := Tl3StringPtr.Create(l3PCharLen(Buf+FTagStart - 1, I - FTagStart + 1));
     try
      TagParts.Add(lStr);
     finally
      l3Free(lStr);
     end;

     TagOn := False;
     Advance := 0
    end
    else
     if ((AToken = tknEndOfLine) or (AToken = tknEndOfWord)) and (I = BufLen) then
      // Если буфер кончился, то это ВСЕГДА конец строки (или слова)
      Advance := 0;
     {
     begin
      try
       C := Buf[I];
       if (C = #0) then Advance := 0;
      except
       Advance := 0;
      end;
     end
     }
  end;

  if (Advance >= 0) then begin
    {ignore tag words here, since they are not used}
    Result := True;
    Inc(I, Advance);
  end else
    Result := False;
end;


function Tl3RegularSearch.SearchMatchPattern(const aBuf    : PAnsiChar;
                                                   aBufLen : Integer;
                                                   aBufOffSet : Integer;
                                               var theTagOn  : Boolean;
                                               var theTagNum : Integer;
                                                   aPatPtr : Pl3PatRecord;
                                                   aCodePage : Longint) : Integer;
{-look for match of pattern list starting at PatPtr with Buf[offset...]}
{-return the last position that matched}
const
 cMaxQuantify = 1000;

var
 I        : Integer;
 K        : Integer;
 l_PatRec : Pl3PatRecord;
 l_Done   : Boolean;
 l_Token  : Tl3Tokens;
 l_OldTagOn   : Boolean;
 l_OldTagNum  : Integer;
 l_OldTagCount: Integer;
 l_OldTagStart: Integer;
 l_QPList : array [1..cMaxQuantify] of TQuantifierPointRec;
 l_CurQIdx: Integer;
 l_LastPos: Integer;
 l_Len : Integer;

begin
 l_OldTagOn := theTagOn;
 l_OldTagNum := theTagNum;
 l_OldTagStart := FTagStart;
 l_OldTagCount := TagParts.Count;
 try
  l_Done := False;
  l_PatRec    := aPatPtr;
  while (not l_Done) and (l_PatRec <> nil) do
  begin
   l_Token := l_PatRec^.Token;
   if (l_Token in [tknClosure, tknLazyClosure]) then
   begin
    {a closure}
    l_PatRec := l_PatRec^.NextPattern; {step past the closure in the pattern list}
    I := aBufOffSet;                   {leave the current line position unchanged}
    if l_Token = tknLazyClosure then
    begin
     { Ленивая квантификация. Пытаемся найти следующий элемент, двигаясь вперёд по одному шагу.}
     l_Done := False;
     K := -1;
     while (not l_Done) and (I < aBufLen) do
     begin
      if l_PatRec^.NextPattern <> nil then
       K := SearchMatchPattern(aBuf, aBufLen, I, theTagOn, theTagNum, l_PatRec^.NextPattern, aCodePage)
      else
       K := I; 
      if (K > -1) then
       l_Done := True
      else
       if not MatchOnePatternElement(aBuf, aBufLen, I, theTagOn, theTagNum, l_PatRec, aCodePage) then
        l_Done := True;
     end;
    end
    else  // if l_Token = tknLazyClosure then
    begin
     // Жадная квантификация
     {match as many as possible}

     // ВНИМАНИЕ! В текущей реализации жадная квантификация в конце группы сожрёт всё, и за пределами группы уже
     // ничего не будет найдено, откат из-за пределов группы невозможен!
     // Пример: регексп a.+b найдёт строку axxxb,  а регексп (a.+)b - НЕТ. Квантификатор сожрёт "b" и не откатится
     // обратно. Это ошибка, но, пока не мешает, принято решение считать её фичей.

     if l_PatRec^.NextPattern = nil then
     begin
      // если это последний элемент в паттерне, то последующие проверять необязательно, а значит,
      // не нужно запоминать точки возврата и тому подобные вещи
      repeat
       K := I;
      until not MatchOnePatternElement(aBuf, aBufLen, I, theTagOn, theTagNum, l_PatRec, aCodePage);
     end
     else // if l_PatRec^.NextPattern = nil *)
     begin
      l_CurQIdx := 0;
      while (not l_Done) and (I < aBufLen) do  {V}
      begin
       l_LastPos := I;
       if MatchOnePatternElement(aBuf, aBufLen, I, theTagOn, theTagNum, l_PatRec, aCodePage) then
       begin
        // запоминаем длину, на которую потом возможно придётся откатываться
        l_Len := I - l_LastPos;
        if (l_CurQIdx = 0) or (l_Len <> l_QPList[l_CurQIdx].rLength) then
        begin
         Inc(l_CurQIdx);
         if l_CurQIdx > cMaxQuantify then
          raise El3RegExError.Create(stscTooBigQuantifySequence);
         l_QPList[l_CurQIdx].rLength := l_Len;
         l_QPList[l_CurQIdx].rCount := 1;
        end
        else
         Inc(l_QPList[l_CurQIdx].rCount);
       end
       else
        l_Done := True;
      end;
      {I points to the location that caused a non-match}
      {match rest of pattern against rest of input}
      {shrink closure by one after each failure}
      l_Done := False;
      K := -1;
      while (not l_Done) and (I >= aBufOffSet) do
      begin
        K := SearchMatchPattern(aBuf, aBufLen, I, theTagOn, theTagNum, l_PatRec^.NextPattern, aCodePage);
        if (K > -1) then
          l_Done := True
        else
        begin
         if l_CurQIdx > 0 then
         begin
          // откатываемся на ранее запомненную длину
          I := I - l_QPList[l_CurQIdx].rLength;
          Dec(l_QPList[l_CurQIdx].rCount);
          if l_QPList[l_CurQIdx].rCount = 0 then
           Dec(l_CurQIdx);
         end
         else
          l_Done := True;
        end;
      end;
     end; // if l_PatRec^.NextPattern <> nil
    end;
    aBufOffSet := K;   {if k=-1 then failure else success}
    l_Done := True;
   end
   else
    if (l_Token = tknMaybeOne) then
    begin
     {a 0 or 1 closure}
     l_PatRec := l_PatRec^.NextPattern;   {step past the closure marker}
     {match or no match is ok, but advance lin cursor if matched}
     MatchOnePatternElement(aBuf, aBufLen, aBufOffSet, theTagOn, theTagNum, l_PatRec, aCodePage);
     {advance to the next pattern token}
     l_PatRec := l_PatRec^.NextPattern;
    end
    else
     if not(MatchOnePatternElement(aBuf, aBufLen, aBufOffSet,
                                          theTagOn, theTagNum, l_PatRec, aCodePage)) then
     begin
      if l_PatRec^.NextOK then
      begin
       {we get another chance because of alternation}
       l_PatRec := l_PatRec^.NextPattern;
      end
      else
      begin
       aBufOffSet := -1;
       l_Done := True;
      end;
     end
     else
     begin
      {skip over alternates if we matched already}
      while (l_PatRec^.NextOK) and (l_PatRec^.NextPattern <> nil) do
       l_PatRec := l_PatRec^.NextPattern;
      {_move to the next non-alternate}
      l_PatRec := l_PatRec^.NextPattern;
     end;
  end; // while (not l_Done) and (l_PatRec <> nil) do
  Result := aBufOffSet;
 finally
  if Result < 0 then
  begin
   theTagOn := l_OldTagOn;
   theTagNum := l_OldTagNum;
   FTagStart := l_OldTagStart;
   while TagParts.Count > l_OldTagCount do
    TagParts.DeleteLast;
  end;
 end;
end;


function Tl3RegularSearch.FindMatch(const Buf        :  PAnsiChar;
                                          BufOffSet  : Integer;
                                          BufLen     : Integer;
                                          PatPtr     : Pl3PatRecord;
                                      var REPosition : Tl3MatchPosition;
                                          aCodePage  : Longint) : Boolean;
var
  I,
  LPos,
  TagNum : Integer;
  TagOn  : Boolean;

begin
  LPos   := -1;
  I      := BufOffSet;
  Result := False;
  REPosition.Length := 0;
  while (I < BufLen) and (LPos = -1) do
  begin
   TagNum := 0;
   TagOn := False;
   FTagParts.Clear;
   LPos := SearchMatchPattern(Buf, BufLen, I, TagOn, TagNum, PatPtr, aCodePage);
   Result := (LPos > -1);
   if (Result) then
   begin
    REPosition.StartPos := I;
    RePosition.EndPos   := LPos;
    RePosition.Length   := REPosition.EndPos - REPosition.StartPos;
   end;
   // вне зависимости от результата поиска, если первый токен паттерна - начало строки, выходим -
   // незачем проверять начало строки каждый раз на всей остальной строке, если в первый раз ничего не нашлось
   if PatPtr.Token = tknBegOfLine then
    Break;
   Inc(I);
  end;
end;

function l3CheckStrByPattern(const aPattern : AnsiString;
                             const aString  : Tl3WString) : Boolean;
var
 lSearchMashine : Tl3RegularSearch;
 lPosition      : Tl3MatchPosition;
begin
 lSearchMashine := Tl3RegularSearch.Create;
 try
  l3FillChar(lPosition, SizeOf(lPosition), 0);
  lSearchMashine.IgnoreCase := True;
  lSearchMashine.SearchPattern := aPattern;
  Result := lSearchMashine.SearchInString(aString, lPosition);
 finally
  l3Free(lSearchMashine);
 end;//try..finally
end;

(*
A Match expression operates on a single line of text at one time. No 
match can span multiple lines of text. 

The Select and Match expressions combine in a logical AND fashion. Text 
must match BOTH expressions to be considered for output. 

Select/Avoid and Match regular expressions are composed of the 
following: 

Period ('.') Matches any single character except newline. A newline 
(internally) is really two characters in a specific order -- <carriage 
return> followed by <linefeed>. To match a newline, you must always 
explicitly specify a newline. 

Caret (^) Matches at the beginning of a line only. A ^ occurring
ANYWHERE in the match expression (except within a character class) is 
interpreted in this manner. This allows meaningful use of ^ in 
combination with grouping or alternation (see below). 

Dollar sign ($) Matches at the end of a line only. As with ^ the $ 
character retains its special meaning anywhere within the expression 
(except in a character class). 

Backslash (\) Followed by a single character matches that character. For 
example, '\*' matches an asterisk, '\\' matches a backslash, '\$' 
matches a dollar sign, etc. 

The following sequences have special meaning 

\s space (ASCII #32)
\t tab (ASCII #9)
\b backspace (ASCII #8)
\r return (ASCII #13)
\l linefeed (ASCII #10)
\n newline (#13 followed by #10)
\p pipe character |
\_ word delimiter. Matches any of \t\s!"&()*+,-./:;<=>?@[\]^`{|}~
\w not word delimiter
\h hex character. Matches any of 0123456789ABCDEF
\d dec character. Matches any of 0123456789
\c letter character

Case is ALWAYS significant when using the special characters. Thus \s 
matches a space while \S matches a capital letter S. 

The special characters above should be used to produce instances of 
blanks and tabs. 

A single character not otherwise endowed with special meaning matches 
that character. Thus z matches a single instance of the letter z. 

A AnsiString enclosed in brackets [] specifies a character class. Any single
character in the AnsiString is matched. For example, [abc] matches an a, b,
or c. Ranges of ASCII letters and numbers can be abbreviated as, for 
example, [a-z0-9]. If the first symbol following the [ is a caret (^) 
then a negative character class is specified. In this case, the AnsiString
matches all characters EXCEPT those enclosed in the brackets. For 
example, [^a-z] matches everything except lower case characters (and 
newlines). 

The special characters defined above may be used inside of character 
classes with the exception of \n, \w and \h, which are shorthand for 
their own character classes. If the characters - or ] are to be used 
literally inside of a character class, they should be preceded by the 
escape character \. Note that *?+(){}!^$#& are not special characters 
when found inside a character class. 

The Select/Avoid expression supports the additional function of 
"avoiding" text. Only text that does NOT match the expression is 
considered for output or modification. See the Avoid property in the 
Reference Section. 

Seeking Closure 

A regular expression followed by * matches zero or more matches of the 
regular expression. This is referred to as a closure. Thus ba*b matches 
the AnsiString bb (no instances of a), bab (one instance), or baaaaaab
(several instances). 

A regular expression followed by a + matches one or more matches of the 
regular expression. This is another type of closure. In this case ba+b 
will not match bb, but it will match bab, or baaaaaab. 

A regular expression followed by a ? matches zero or one matches of the 
regular expression. This is another closure. Here, ba?b will match bb or 
bab, but not baaaaaab.

A +? and *? are lazy closures (matches as less elements as possible). For
instance, a.+?b matches aiib in aiibooob AnsiString while a.+b will match the
whole AnsiString.

Concatenated Expressions 

Two regular expressions concatenated match a match of the first followed 
by a match of the second. Thus (abc)(def) matches the AnsiString abcdef.

Alternation 

Two regular expressions separated by | match either a match of the first 
or a match of the second. This is referred to as alternation. Any number 
of regular expressions can be strung together in this way. Alternation 
matches are tested in order from left to right, and the first match 
obtained is used. Then the remaining alternate expressions are skipped 
over. 

Grouping Expressions 

A regular expression enclosed in parentheses () matches a match of the 
regular expression. Parentheses are used to provide grouping, and may be 
nested to arbitrary depth. Open and close parentheses must be balanced.
For example, the following two expressions are not equivalent, and the 
second probably expresses what was intended: 

PROCEDURE|FUNCTION 

(PROCEDURE)|(FUNCTION) 

The first expression is equivalent to 

PROCEDUR(E|F)UNCTION 

The second expression matches either of the two well-known words. 

Tagged Matches 

A regular expression enclosed in curly braces {} forms a tagged match 
word. Whatever was matched within the braces may be referred to by a 
Replace expression in a manner to be described. Tagged match words may 
not be nested. Open and close braces must be balanced. A maximum of nine 
tagged match words can be referenced by the Replace expression. Note 
that the use of curly braces in Select/Avoid expressions is meaningless. 
However, these expressions share an expression interpreter with the 
Match expressions, so no exception is raised. For example, consider the 
expression 

b{a*}b. 

If the AnsiString being tested is 'bab', then the tagged match word contains
a single 'a'. If the AnsiString being tested is 'baaaaaab', then the tagged
match word contains 'aaaaaa'. If the AnsiString tested is 'bb', then the
tagged match word is empty. 

Order of Precedence 

Regular expressions are interpreted from left to right. The order of 
precedence of operators at the same parenthesis level is [], then *+!, 
then |, and then concatenation. 

Tag braces are interpreted strictly from left to right and do not 
control precedence in any way. The first tagged match word found is 
given a tag of 1, the second a tag of 2, and so on up to a maximum tag 
of 9. The tag number that each word receives is based on when it is
encountered in the line. If tags are skipped over as a result of 
alternation, then any remaining tags in a line receive shifted tag 
numbers. For example, consider the expression: 

(FUNCTION)|({PROCEDURE})\s+{[^\s(]+} 

If a line contains the word PROCEDURE then the word following PROCEDURE 
has a tag number of 2. If a line contains the word FUNCTION, then the 
word following FUNCTION has a tag number of 1. It is up to the user to 
take advantage of this behavior. Generally, it is good practice to 
surround an entire set of alternates with tag markers: 

{(FUNCTION)|(PROCEDURE)}\s+{[^\s(]+} 

Replace regular expressions are constructed the same way as Match 
regular expressions, but the number of operators is reduced. The 
replacement process occurs in the following manner: 

Any text of the input line that does not match the Match expression is 
sent to the output unchanged. The Match expression finds a AnsiString of
text that starts at the leftmost position in the input line that 
matches, and continues to the rightmost position that matches. The 
AnsiString of matched text is operated upon by the Replace expression and
output. The Match expression is then tried again on the input line, 
starting at the first position beyond the previous match AnsiString. This
recurs until the end of line is found. 

Replace expressions are composed of the following: 

No spaces The regular expression may NOT contain any blank space. The 
special characters below should be used to produce instances of blanks, 
tabs and the null expression. Null replace If a null Replace expression 
is desired, the special symbol \z is used to indicate a null expression. 
Null Replace expressions are used to delete text strings from a file. 
Single character A single character not otherwise endowed with special 
meaning is sent to the output. 

Backslash (\) Followed by a single character matches that character. For 
example, '\*' matches an asterisk, '\\' matches a backslash, '\$' 
matches a dollar sign, etc. A '\' followed by a single character sends 
that character to the output. In this way a '\&' writes an ampersand and 
'\\' writes a backslash.

The following sequences have special meaning 

\s space (ASCII #32) 
\t tab (ASCII #9) 
\b backspace (ASCII #8) 
\r return (ASCII #13)
\l linefeed (ASCII #10) 
\n newline (#13 followed by #10) 
\z null expression 

Unless a newline combination is explicitly matched in the Match 
expression, it is not necessary to explicitly specify newlines in the 
Replace expression. Each newline of the input text line is written out 
in the unmatched category of output using the specified line terminator. 

Another special case occurs when '\' is followed by a single digit in 
the range of 1 through 9. In this case the tagged match word found by 
the Match expression is sent to the output. If a tagged match word for 
that tag number was not defined, or if the tagged match word doesnt 
match anything, then nothing is output. The tagged match words cab be 
output in any order and can be repeated any number of times. 

An ampersand ('&') appearing in the Replace expression causes all text
matched by the match expression to be sent to the output. The ampersand 
can appear in the Replace expression as many times as desired. Example 
1. 

LineNumbers = true MatchPattern = 'procedure' {without the quotes if 
using EXREGEX} 

IgnoreCase = true 

This finds all lines containing the word 'procedure', 'PROCEDURE', 
'Procedure', etc. in the chosen file. The line numbers of the input file 
are included in the output file. Only those lines that contain 
'procedure' are sent to the output file. 

Example 2. 

IgnoreCase = true LineNumbers = true 

MatchPattern = '(procedure)|(function)' 

Does the same as Example 1 but also includes lines containing the word 
'function'. The matching is not case-sensitive. Were IgnoreCase = false,
then the search would not have found "PROCEDURE', 'Function', etc. Only 
those lines that contain 'procedure' or 'function' (case regardless) are 
sent to the output file. 

Example 3. 

IgnoreCase = false MatchPattern = 'Procedure' 

ReplacePattern = 'procedure' 

This finds all instances of 'Procedure' and changes them to 'procedure'. 
Any instance of 'procedure' in the input file is not modified. Only 
those lines containing 'Procedure' are sent to the output file. 

Example 4. 

It's time to get a bit more ambitious but also more productive. 

IgnoreCase = true 

MatchPattern = '^{.+[^\s]}\s*'

ReplacePattern = '\1' 

This strips trailing blanks from each line of the input file and sends 
the "cleansed" line to the output file. 

The Match expression can be explained as follows: 

1. Anchor at the beginning of the line: ^ 2. Start a tag word: { 3. 
Match one or more instances of any character: .+ 4. Match one instance 
of any character but a space: [^\s] 5. End the tag word: } 6. Match any 
and all trailing spaces: \s* 

The Replace expression then outputs the tagged word, which contains the 
entire line up to the last non-blank character. 

Empty lines and lines consisting entirely of blanks are output 
unchanged. Leading blanks are output as in the input file. A more 
complex expression could be used to remove blanks from all-blank lines 
as well. 

Example 5. 

IgnoreCase = false 

MatchPattern = '.' (single period) 

OutputOptions = [ooCountOnly] 

This counts the number of non-empty lines in the input file. The match 
command of a single period matches any line containing at least one 
character besides the internal <CR/LF> pair. No output file is created. 

Example 6. 

Let's go back to something a little more complex and useful. 

IgnoreCase = true; 

MatchPattern = '\w*{['$#A-Z0-9]+}\w*' 

ReplacePattern = '\1\n\' 

This strips word delimiters from the input file and puts one word per 
line into the output file. 

The Match expression can be explained as follows: 

Find zero or more instances of any word delimiter: \w* 

1. Start a tag word: { 2. Match one or more instances of any character 
that might reasonably form part of a capitalized word ['$#A-Z0-9]+ 3. 
End the tag word: } 4. Find zero or more instances of any word 
delimiter: \w* 

The Replace expression then writes the tagged word and adds a newline to 
put each word on a separate line. 

This combination creates empty lines mixed in with the lines containing 
a single word. The blank lines can be removed with the expressions of 
Example 4. 


*)

end.
