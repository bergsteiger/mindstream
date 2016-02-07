unit l3Parser;
{* Разборщик потока на токены (слова, числа, строки etc). }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Parser -                  }
{ Начат: 05.10.1999 18:22             }
{ $Id: l3Parser.pas,v 1.74 2015/07/10 11:46:23 lulin Exp $ }

// $Log: l3Parser.pas,v $
// Revision 1.74  2015/07/10 11:46:23  lulin
// http://mdp.garant.ru/pages/viewpage.action?pageId=599348394&focusedCommentId=603402088#comment-603402088
//
// Revision 1.73  2015/05/27 08:40:59  lulin
// - правильнее считаем номера строк.
//
// Revision 1.72  2015/01/30 09:51:08  dinishev
// {Requestlink:522781827}
//
// Revision 1.71  2015/01/29 13:36:48  dinishev
// {Requestlink:522781827}
//
// Revision 1.70  2014/12/18 14:05:19  lulin
// {RequestLink:569230238}
//
// Revision 1.69  2014/02/17 16:26:02  lulin
// - избавляемся от ошибок молодости.
//
// Revision 1.68  2014/02/13 10:12:59  lulin
// - рефакторим безликие списки.
//
// Revision 1.67  2014/02/07 17:57:14  lulin
// - рефакторинг парсера.
//
// Revision 1.66  2014/02/04 15:01:06  lulin
// - рефакторинг парсера.
//
// Revision 1.65  2014/02/04 09:12:44  lulin
// - рефакторинг парсера.
//
// Revision 1.64  2014/01/15 17:29:35  lulin
// - рефакторинг закрывающих скобок.
//
// Revision 1.63  2013/12/17 16:52:45  lulin
// - стараемся избегать исключений при чтении.
//
// Revision 1.62  2013/06/14 13:48:33  fireton
// - ещё один вариант Make
//
// Revision 1.61  2013/06/06 11:03:32  dinishev
// Фактичски правки для {Requestlink:459284359}
//
// Revision 1.60  2013/04/08 09:28:15  lulin
// - портируем.
//
// Revision 1.59  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.58  2012/06/04 11:30:50  lulin
// {RequestLink:318373921}
//
// Revision 1.57  2012/02/28 10:14:05  dinishev
// Bug fix: не проходили тесты.
//
// Revision 1.56  2012/02/24 18:57:22  lulin
// - перебираем детей.
//
// Revision 1.55  2012/02/24 07:40:21  lulin
// - кешируем парсер.
//
// Revision 1.54  2012/02/20 16:14:26  lulin
// - более правильная сигнатура метода.
//
// Revision 1.53  2012/02/20 16:05:45  lulin
// - перегенерация.
//
// Revision 1.52  2012/02/19 16:08:00  lulin
// - эксперименты с эмуляцией синтаксиса шаблонов.
//
// Revision 1.51  2012/02/17 19:24:07  lulin
// - перегенерация.
//
// Revision 1.50  2012/02/15 12:04:07  lulin
// - перегенерация.
//
// Revision 1.49  2012/01/20 15:12:03  lulin
// {RequestLink:269058906}
//
// Revision 1.48  2012/01/20 14:51:38  lulin
// {RequestLink:269058906}
//
// Revision 1.47  2011/10/07 07:51:55  narry
// Поддержа неизвестных ключевых слов
//
// Revision 1.46  2011/10/06 11:23:54  narry
// Виртуальный метод для обработки StartKeywordChar
//
// Revision 1.45  2011/10/05 15:13:04  lulin
// - откатываем изменения Гарри.
//
// Revision 1.44  2011/10/04 12:21:20  narry
// Рефакторинг чтения HTML
//
// Revision 1.43  2011/09/19 10:12:47  lulin
// - делаем Filer'ам возможность быть не компонентами и кешируемыми.
//
// Revision 1.42  2011/05/11 17:28:58  lulin
// {RequestLink:236719181}.
// №5.
//
// Revision 1.41  2011/05/10 17:14:15  lulin
// {RequestLink:236719181}.
// №24.
//
// Revision 1.40  2011/05/10 15:35:36  lulin
// - наследуем парсер от более простого объекта.
//
// Revision 1.39  2011/05/10 14:16:12  lulin
// {RequestLink:236719181}.
// №28.
//
// Revision 1.38  2011/05/06 15:49:38  lulin
// - делаем "предложения".
//
// Revision 1.37  2011/04/26 18:23:24  lulin
// - добавляем определение слова, условный оператор и целочисленный цикл.
//
// Revision 1.36  2010/06/18 11:41:11  lulin
// {RequestLink:219119831}.
// - правим ошибку.
// - добавляем тест.
// - давим вывод в лог.
// - вставляем проверку на корректность длины результирующей строки.
//
// Revision 1.35  2008/02/20 17:23:09  lulin
// - упрощаем строки.
//
// Revision 1.34  2007/11/19 15:26:36  narry
// - одинокий - при включенном CheckInt вызывал invalid pointer operation
//
// Revision 1.33  2007/11/02 10:48:13  narry
// - одинокий $ при включенном CheckHex вызывал отрицательное смещение по потоку
//
// Revision 1.32  2007/08/28 19:39:22  lulin
// - не достаем парсер из свойства по нескольку раз.
//
// Revision 1.31  2007/07/30 09:15:08  mmorozov
// - bugfix: не устанавливали число при разборе шестнадцатиричного значения;
//
// Revision 1.30  2005/05/11 09:19:52  fireton
// - профайлинг и оптимизация по скорости
//
// Revision 1.29  2004/09/02 15:11:37  law
// - new behavior: символ #10 трактуем как конец строки - если он не входит в WhiteSpace, т.к. иначе не читалась таблица стилей в Немезисе, строки которой были разделены только символом #10.
//
// Revision 1.28  2004/05/14 13:42:36  law
// - new method: _Tl3CustomParser.MakeKeyWords.
//
// Revision 1.27  2004/05/14 13:29:38  law
// - new method: Tl3KeyWords.AddKeyWords.
//
// Revision 1.26  2004/05/14 13:14:12  law
// - new constructor: _Tl3CustomParser.Make.
//
// Revision 1.25  2004/05/14 13:00:29  law
// - new prop: _Tl3CustomParser._Options.
//
// Revision 1.24  2004/04/26 14:28:24  law
// - new behavior: Tl3Filer теперь при чтении посимвольно учитывает кодировку.
// - bug fix: в свойство TevMemo.Buffer теперь нормально присваиваются строки с кодировкой Unicode.
//
// Revision 1.23  2004/03/31 17:31:09  law
// - new behavior: парсер теперь умеет читать unicode-строки (как в Delphi).
//
// Revision 1.22  2002/12/24 13:02:03  law
// - change: объединил Int64_Seek с основной веткой.
//
// Revision 1.21.4.1  2002/12/23 15:51:28  law
// - bug fix: не работали с хранилищем > 2Гб.
//
// Revision 1.21  2002/02/14 10:27:43  law
// - bug fix: зацикливание разборщика при #13#13 в конце файла.
//
// Revision 1.20  2001/10/23 10:30:07  law
// - new behavior: метод _Assign теперь присваивает два Parser'а.
//
// Revision 1.19  2001/09/12 17:17:37  law
// - new behavior: при смене Filer'а изменяется номер текущей строки.
//
// Revision 1.18  2001/09/11 17:46:36  law
// - some new features.
//
// Revision 1.17  2001/09/11 10:13:43  law
// - new behavior: добавлена работа с содержимым комментариев и метод _WaitTT.
//
// Revision 1.16  2001/08/30 16:34:38  law
// - new version: портировал на Delphi 6.
//
// Revision 1.15  2001/07/24 12:30:24  law
// - comments: xHelpGen.
//
// Revision 1.14  2001/03/27 14:22:36  law
// - к Tl3CustomFiler добавлен метод Identifier.
//
// Revision 1.13  2001/03/27 13:59:43  law
// - bug fix: неправильно выливалась таблица шрифтов.
//
// Revision 1.12  2001/01/09 12:21:43  law
// - замена: _Str2Log -> _Msg2Log.
//
// Revision 1.11  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Classes,
  
  l3Types,
  l3Base,
  l3KeyWrd,
  l3Filer,
  l3Chars,
  l3StringList,
  l3ProtoPersistent,
  l3Interfaces,
  l3ParserInterfaces
  ;

type
  Tl3TokenType = (
                  l3_ttBOF,        {- начало файла}
                  l3_ttEOF,        {- конец файла}
                  l3_ttEOL,        {- конец строки}
                  l3_ttSingleChar, {- единичный (управляющий) символ}
                  l3_ttSymbol,     {- идентификатор}
                  l3_ttKeyWord,    {- ключевое слово}
                  l3_ttString,     {- строка (в кавычках)}
                  l3_ttInteger,    {- целое число}
                  l3_ttFloat,      {- вещественное число}
                  l3_ttComment,    {- комментарий}
                  l3_ttDoubleQuotedString // - строка в двойных кавычках
                 );
   {* - тип токена.
       |<br>
       |<ul>
       | <li><b>l3_ttBOF</b> - начало файла.</li>
       | <li><b>l3_ttEOF</b> - конец файла.</li>
       | <li><b>l3_ttEOL</b> - конец строки.</li>
       | <li><b>l3_ttSingleChar</b> - единичный (управляющий) символ.</li>
       | <li><b>l3_ttSymbol</b> - идентификатор.</li>
       | <li><b>l3_ttKeyWord</b> - ключевое слово.</li>
       | <li><b>l3_ttString</b> - строка (в кавычках).</li>
       | <li><b>l3_ttInteger</b> - целое число.</li>
       | <li><b>l3_ttFloat</b> - вещественное число.</li>
       |</ul>
   }
  Tl3NumericTokenType = l3_ttInteger .. l3_ttFloat;
    {* - типы токенов для чисел. }

  Tl3ParserOption = (l3_poCheckKeyWords, l3_poCheckFloat, l3_poCheckInt,
                     l3_poCheckHex, l3_poCheckComment, l3_poCheckStringBracket,
                     l3_poAddDigits2WordChars, l3_poNullAsEOF);
    {-}
  Tl3ParserOptions = set of Tl3ParserOption;
    {-}

const
  l3_DefaultParserOptions = [l3_poCheckKeyWords, l3_poCheckFloat,
                             l3_poCheckInt, l3_poCheckHex, l3_poCheckStringBracket,
                             l3_poAddDigits2WordChars];
    {-}
  l3_DefaultParserWordChars = ['A'..'Z', 'a'..'z', cc_Underline];
    {-}
  l3_DefaultParserWhiteSpace = [cc_Null .. cc_HardSpace];
    {-}
type                                                            
  Tl3CustomParser = class(Tl3ProtoPersistent)
   {* Разборщик потока на токены (слова, числа, строки etc). }
    private
    // property fields
      f_Filer          : Tl3CustomFiler;
      f_SourceLine     : Long;
      f_NumericToken   : record
        Case Tl3NumericTokenType of
         l3_ttInteger: (Int: Long);
         l3_ttFloat: (Float: Extended);
      end;//f_NumericToken
      f_LineComment    : Tl3CommentString;
      f_OpenComment    : Tl3CommentString;
      f_CloseComment   : Tl3CommentString;
      f_WhiteSpace     : TCharSet;
      f_WordChars      : TCharSet;
      f_KeyWords       : Il3KeywordFinder;
      f_KeyWord        : Tl3PrimString;
      f_CheckKeyWords  : Bool;
      f_CheckFloat     : Bool;
      f_CheckInt       : Bool;
      f_CheckHex       : Bool;
      f_CheckComment   : Bool;
      f_CheckStringBracket : Bool;
      f_NullAsEOF      : Bool;
      f_AddDigits2WordChars : Bool;
      f_Replacements : Tl3StringList;
      f_ReplacementsParser : Tl3CustomParser;
    protected
      f_TokenType: Tl3TokenType;
    {property methods}
      function  pm_GetTokenChar: Ansichar;
        {-}
      procedure pm_SetOpenComment(const Value: Tl3CommentString);
        {-}
      procedure pm_SetCloseComment(const Value: Tl3CommentString);
        {-}
      //function  pm_GetFiler: Tl3CustomFiler;
      procedure pm_SetFiler(Value: Tl3CustomFiler);
        {-}
      function  pm_GetKeyWord: Tl3PrimString;
      procedure pm_SetKeyWord(Value: Tl3PrimString);
        {-}
      procedure pm_SetCheckKeyWords(Value: Bool);
        {-}
      function  pm_GetTokenType: Tl3TokenType;
        {-}
      //function  pm_GetOptions: Tl3ParserOptions;
      procedure pm_SetOptions(aValue: Tl3ParserOptions);
        {-}
    private
    // stored specifiers
      function  FilerStored: Bool;
        {-}
    protected
    // internal methods
      function  SkipBlanks(NTF: Tl3NextTokenFlags; aCommentState : Tl3CommentState = l3_csNone): Bool;
        {-}
      procedure Cleanup;
        override;
        {-}
      procedure Release;
        override;
        {-}
      procedure CheckKeyWord; virtual;
      function CheckSingleChar(aChar: Ansichar; aString: Tl3String; aNTF: Tl3NextTokenFlags): Tl3TokenType;
          virtual;
        {-}
      function IsCommentBracket(anOpen: Boolean): Boolean; virtual;
        {* - чтение комментария из нескольких символов. }
      function CheckOherComment(aChar: AnsiChar; anOpen: Boolean): Boolean; virtual;
        {-}
    public
    {public methods}
      constructor Create{(anOwner: TObject = nil)};
        //override;
        {-}
      constructor Make(aStream         : TStream;
                       anOptions       : Tl3ParserOptions = l3_DefaultParserOptions;
                       aWordChars      : TCharSet = l3_DefaultParserWordChars;
                       aWhiteSpace     : TCharSet = l3_DefaultParserWhiteSpace);
        overload;
        {-}
      constructor Make(aString         : Tl3CustomString;
                       anOptions       : Tl3ParserOptions = l3_DefaultParserOptions;
                       aWordChars      : TCharSet = l3_DefaultParserWordChars;
                       aWhiteSpace     : TCharSet = l3_DefaultParserWhiteSpace);
        overload;
        {-}
      constructor Make(aString         : Tl3WString;
                       anOptions       : Tl3ParserOptions = l3_DefaultParserOptions;
                       aWordChars      : TCharSet = l3_DefaultParserWordChars;
                       aWhiteSpace     : TCharSet = l3_DefaultParserWhiteSpace);
        overload;
        {-}
(*      function  MakeKeyWords: Tl3KeyWords;
        {-}*)
      procedure SkipLineComment;  
      procedure Assign(P: TPersistent);
        override;
        {-}
      function CheckFiler: Tl3CustomFiler;
        {* - проверяем создан ли файлер и, если нужно, создаем. }
      procedure CheckTokenPrim(T: Tl3TokenType; aC: Ansichar);
        {* - проверить тип токена. Может поднимать исключительную ситуацию. }
      procedure CheckToken(T: Tl3TokenType);
        {* - проверить тип токена. Может поднимать исключительную ситуацию. }
      procedure CheckTokenChar(T: Ansichar);
        {* - проверить является ли текущий токен символом. Может поднимать исключительную ситуацию. }
      procedure CheckTokenSymbol(const anS: AnsiString);
        {* - проверить является ли текущий токен идентификатором. Может поднимать исключительную ситуацию. }
      procedure CheckTokenKeyWord(aID: Long);
        {* - проверить является ли текущий токен ключевым словом. Может поднимать исключительную ситуацию. }
      procedure Error(const Message: AnsiString; NeedException : Bool = true);
        {-}
      function  MakeErrorStr(const Message: AnsiString): AnsiString;
        {-}
      function NextTokenPrim(NTF: Tl3NextTokenFlags): Tl3TokenType; virtual;
        {* - сместиться на следующий токен с учетом флага. }
      function  NextToken: Tl3TokenType;
        {* - сместиться на следующий токен. }
      function  NextTokenSp: Tl3TokenType;
        {* - сместиться на следующий токен не разбирая строки в кавычках. }
      function  NextTokenChar: Ansichar;
        {* - получить следующий токен как вещественное число. }
      function  TokenFloat: Extended;
        {* - получить токен как вещественное число. }
      function  TokenInt: Long;
        {* - получить токен как целое число. }
      function  TokenString: AnsiString;
        {* - получить токен как строку. }
      function  TokenLongString: Tl3String;
        {* - получить токен как строку. }
      function  TokenSymbolIs(const anS: AnsiString): Bool;
        {* - является ли токен данным идентификатором? }
      function  TokenKeyWordIs(aID: Long): Bool;
        {* - является ли токен данным ключевым словом? }
(*      procedure Msg2Log(const Msg: AnsiString);
        {-}*)
      procedure Str2Log(const Msg: AnsiString);
        {-}
(*      function  WaitTT(aTokenType: Tl3TokenType): Bool;
        {-}*)
(*      function  WaitKeyword(aKeyWord: Long): Bool;
        {-}*)
    public
    // public properties
      SkipSoftEnter : Boolean;
      SkipHardEnter : Boolean;
      property SourceLine: Long
        read f_SourceLine;
        {* - номер текущейстроки. }
      property TokenType: Tl3TokenType
        read pm_GetTokenType;
        {* - тип текущего токена. }
      property TokenChar: Ansichar
        read pm_GetTokenChar;
        {* - текущий символ. }
      property LineComment: Tl3CommentString
        read f_LineComment
        write f_LineComment;
        {* - разделитель для строковогго комментария. }
      property OpenComment: Tl3CommentString
        read f_OpenComment
        write pm_SetOpenComment;
        {* - открывающаяся скобка комментария. }
      property CloseComment: Tl3CommentString
        read f_CloseComment
        write pm_SetCloseComment;
        {* - закрывающаяся скобка комментария. }
      property WhiteSpace: TCharSet
        read f_WhiteSpace
        write f_WhiteSpace;
        {* - множество символов, которые воспринимаются как пробелы. }
      property WordChars: TCharSet
        read f_WordChars
        write f_WordChars;
        {* - множество символов, которые могут входить в состав идентификатора. }
      property Filer: Tl3CustomFiler
        read f_Filer{pm_GetFiler}
        write pm_SetFiler
        stored FilerStored;
        {* - анализируемый поток. }
      property KeyWords: Il3KeywordFinder
        read f_KeyWords
        write f_KeyWords;
        {* - таблица ключевых слов. }
      property KeyWord: Tl3PrimString
        read pm_GetKeyWord
        write pm_SetKeyWord;
        {* - текущее ключевое слово. }
      property CheckKeyWords: Bool
        read f_CheckKeyWords
        write pm_SetCheckKeyWords
        default true;
        {* - анализировать ли ключевые слова? }
      property CheckFloat: Bool
        read f_CheckFloat
        write f_CheckFloat
        default true;
        {* - анализировать ли вещественные числа? }
      property CheckInt: Bool
        read f_CheckInt
        write f_CheckInt
        default true;
        {* - анализировать ли целые числа? }
      property CheckHex: Bool
        read f_CheckHex
        write f_CheckHex
        default true;
        {* - анализировать ли шестнадцатиричные числа? }
      property CheckComment: Bool
        read f_CheckComment
        write f_CheckComment
        default false;
        {* - анализировать ли комментарии? }
      property CheckStringBracket: Bool
        read f_CheckStringBracket
        write f_CheckStringBracket
        default true;
        { - }
      property AddDigits2WordChars: Bool
        read f_AddDigits2WordChars
        write f_AddDigits2WordChars
        default true;
        {* - учитывать ли цифры в идентификаторах? }
      property NullAsEOF: Bool
        read f_NullAsEOF
        write f_NullAsEOF
        default false;
        {* - воспринимать ли #0 как конец файла? }
      property Options: Tl3ParserOptions
        //read pm_GetOptions
        write pm_SetOptions;
        {-}    
  end;{Tl3CustomParser}
  Rl3CustomParser = class of Tl3CustomParser;
  Tl3Parser = class(Tl3CustomParser);

const
  l3NextTokenAllFlags : Tl3NextTokenFlags = [Low(Tl3NextTokenFlag) .. High(Tl3NextTokenFlag)];

var
 g_DisableParserLog : Integer = 0;  

implementation

uses
  {$IfDef Delphi6}
  RTLConsts,
  {$Else  Delphi6}
  Consts,
  {$EndIf Delphi6}
  SysUtils,

  l3String,
  l3Memory
  ;

// start class Tl3CustomParser

constructor Tl3CustomParser.Create{(anOwner: TObject = nil)};
  {override;}
  {-}
begin
 inherited Create;
 LineComment := '//';
 OpenComment := '/*';
 CloseComment := '*/';
 WhiteSpace := l3_DefaultParserWhiteSpace;
 WordChars := l3_DefaultParserWordChars;
 CheckFloat := true;
 CheckInt := true;
 CheckHex := true;
 AddDigits2WordChars := true;
 f_TokenType := l3_ttBOF;
 f_SourceLine := 1;
 CheckKeyWords := true;
 CheckStringBracket := true;
 SkipSoftEnter := false;
 SkipHardEnter := false;
end;

constructor Tl3CustomParser.Make(aStream     : TStream;
                                 anOptions   : Tl3ParserOptions = l3_DefaultParserOptions;
                                 aWordChars  : TCharSet = l3_DefaultParserWordChars;
                                 aWhiteSpace : TCharSet = l3_DefaultParserWhiteSpace);
  {-}
begin
 Create;
 CheckFiler.Stream := aStream;
 Options := anOptions;
 WordChars := aWordChars;
 WhiteSpace := aWhiteSpace;
end;

constructor Tl3CustomParser.Make(aString     : Tl3CustomString;
                                 anOptions   : Tl3ParserOptions = l3_DefaultParserOptions;
                                 aWordChars  : TCharSet = l3_DefaultParserWordChars;
                                 aWhiteSpace : TCharSet = l3_DefaultParserWhiteSpace);
  //overload;
  {-}
var
 l_Stream : Tl3StringStream;
begin
 l_Stream := Tl3StringStream.Create(aString);
 try
  Make(l_Stream, anOptions, aWordChars, aWhiteSpace);
 finally
  l3Free(l_Stream);
 end;//try..finally
end;

constructor Tl3CustomParser.Make(aString     : Tl3WString;
                                 anOptions   : Tl3ParserOptions = l3_DefaultParserOptions;
                                 aWordChars  : TCharSet = l3_DefaultParserWordChars;
                                 aWhiteSpace : TCharSet = l3_DefaultParserWhiteSpace);
  //overload;
  {-}
var
 l_Stream : Tl3StringStream;
begin
 l_Stream := Tl3StringStream.Create(aString);
 try
  Make(l_Stream, anOptions, aWordChars, aWhiteSpace);
 finally
  l3Free(l_Stream);
 end;//try..finally
end;

procedure Tl3CustomParser.Assign(P: TPersistent);
  //override;
  {-}
begin
 if (P Is Tl3CustomParser) then
 begin
  Filer          := Tl3CustomParser(P).Filer;
  f_SourceLine   := Tl3CustomParser(P).SourceLine;
  f_TokenType    := Tl3CustomParser(P). TokenType;
  f_NumericToken := Tl3CustomParser(P).f_NumericToken;
  LineComment    := Tl3CustomParser(P).LineComment;
  OpenComment    := Tl3CustomParser(P).OpenComment;
  CloseComment   := Tl3CustomParser(P).CloseComment;
  WhiteSpace     := Tl3CustomParser(P).WhiteSpace;
  WordChars      := Tl3CustomParser(P).WordChars;
  KeyWords       := Tl3CustomParser(P).KeyWords;
  KeyWord        := Tl3CustomParser(P).KeyWord;
  CheckKeyWords  := Tl3CustomParser(P).CheckKeyWords;
  CheckFloat     := Tl3CustomParser(P).CheckFloat;
  CheckInt       := Tl3CustomParser(P).CheckInt;
  CheckHex       := Tl3CustomParser(P).CheckHex;
  CheckComment   := Tl3CustomParser(P).CheckComment;
  CheckStringBracket := Tl3CustomParser(P).CheckStringBracket;
  SkipSoftEnter   := Tl3CustomParser(P).SkipSoftEnter;
  SkipHardEnter := Tl3CustomParser(P).SkipHardEnter;
  NullAsEOF      := Tl3CustomParser(P).NullAsEOF;
  AddDigits2WordChars := Tl3CustomParser(P).AddDigits2WordChars;
 end//P Is Tl3CustomParser
 else
  inherited;
end;

procedure Tl3CustomParser.CheckTokenPrim(T: Tl3TokenType; aC: Ansichar);
  {-}
begin
 if (TokenType <> T) then
  case T of
   l3_ttEOL:
    Error('End of line expected');
   l3_ttSingleChar:
    Error(Format(SCharExpected, [aC]));
   l3_ttSymbol:
    Error(SIdentifierExpected);
   l3_ttString:
    Error(SStringExpected);
   l3_ttInteger, l3_ttFloat:
    Error(SNumberExpected);
  end;//case T
end;

procedure Tl3CustomParser.CheckToken(T: Tl3TokenType);
begin
 CheckTokenPrim(T, cc_Null);
end;

procedure Tl3CustomParser.CheckTokenChar(T: Ansichar);
  {-}
begin
 CheckTokenPrim(l3_ttSingleChar, T);
end;

procedure Tl3CustomParser.CheckTokenSymbol(const anS: AnsiString);
begin
 if not TokenSymbolIs(anS) then
  Error(Format(SSymbolExpected, [anS]));
end;

procedure Tl3CustomParser.CheckTokenKeyWord(aID: Long);
  {-}
begin
 if not TokenKeyWordIs(aID) then
  Error(Format('Keyword #%d expected.', [aID]));
end;

function Tl3CustomParser.MakeErrorStr(const Message: AnsiString): AnsiString;
begin
 Result := Format(SParseError + ' [%s].', [Message,
                                           f_SourceLine,
                                           Filer.Identifier]);
end;

procedure Tl3CustomParser.Error(const Message: AnsiString; NeedException : Bool = true);
var
 E : EParserError;
begin
 if NeedException then
 begin
  E := EParserError.Create(MakeErrorStr(Message));
  Str2Log(E.Message);
  raise E;
 end//NeedException
 else
  Str2Log(MakeErrorStr(Message));
end;

function Tl3CustomParser.pm_GetTokenType: Tl3TokenType;
  {-}
begin
 if (f_ReplacementsParser = nil) then
  Result := f_TokenType
 else
  Result := f_ReplacementsParser.TokenType; 
end;

function Tl3CustomParser.NextTokenPrim(NTF: Tl3NextTokenFlags): Tl3TokenType;
  {-}
var
 l_C : AnsiChar;
 {$IfDef XE}
 l_PrevSep : Char;
 {$EndIf XE}
 l_S : Tl3String;
 l_Res : Tl3TokenType absolute Result;

var
 I : Integer;

 procedure lp_SetTokenInt;
 begin//lp_SetTokenInt
  if CheckFloat then
  begin
   while not Filer.EOF do
   begin
    l_C := Filer.GetC.rAC;
    if (l_C in cc_Digits + [cc_Dot, 'e', 'E', cc_Plus, cc_Minus]) then
    begin
     l_S.Append(l_C, 1, Filer.CodePage);
     Inc(I);
     Result := l3_ttFloat;
    end//(l_C in cc_Digits + [cc_Dot, 'e', 'E', cc_Plus, cc_Minus])
    else
    begin
     Filer.UngetC;
     break;
    end;//(l_C in cc_Digits + [cc_Dot, 'e', 'E', cc_Plus, cc_Minus])
   end;//while true
  end;//CheckFloat
  try
   if (Result = l3_ttInteger) then
    f_NumericToken.Int := StrToInt(l_S.AsString)
   else
   begin
    {$IfDef XE}
    l_PrevSep := FormatSettings.DecimalSeparator;
    try
     FormatSettings.DecimalSeparator := cc_Dot;
     f_NumericToken.Float := StrToFloat(l_S.AsString);
    finally
     FormatSettings.DecimalSeparator := l_PrevSep;
    end;//try..finally
    {$Else}
    l_C := DecimalSeparator;
    try
     DecimalSeparator := cc_Dot;
     f_NumericToken.Float := StrToFloat(l_S.AsString);
    finally
     DecimalSeparator := l_C;
    end;//try..finally
    {$EndIf}
   end;//Result = l3_ttInteger
  except
   on EConvertError do
   begin
    Filer.Seek(-I, soCurrent);
    l_S.Clear;
    l_C := Filer.GetC.rAC;
    Result:= CheckSingleChar(l_C, l_S, NTF);
   end;//on EConvertError
  end;//try..except
 end;//lp_SetTokenInt

 procedure DoReplacement;
 var
  l_C : Ansichar;
  l_Replacement : Tl3String;
 begin//DoReplacement
  l_C := Filer.GetC.rAC;
  if (l_C = '(') then
  begin
   l_Replacement := Tl3String.Create;
   try
    while not Filer.EOF do
    begin
     l_C := Filer.GetC.rAC;
     Case l_C of
      ')':
      begin
       l_C := Filer.GetC.rAC;
       if (l_C = '}') then
        break
       else
       begin
        l_Replacement.Append(')', 1, Filer.CodePage);
        l_Replacement.Append(l_C, 1, Filer.CodePage);
       end;//l_C = '}'
      end;//'}'
      else
       l_Replacement.Append(l_C, 1, Filer.CodePage);
     end;//Case l_C
    end;//while not Filer.EOF
    if not l_Replacement.Empty then
    begin
     if (f_Replacements = nil) then
     begin
      f_Replacements := Tl3StringList.Create;
      Assert(not f_Replacements.Sorted);
     end;//f_Replacements = nil
     f_Replacements.Add(l_Replacement);
    end;//not l_Replacement
   finally
    FreeAndNil(l_Replacement);
   end;//try..finally
  end//l_C = '{'
  else
   Filer.UngetC;
 end;//DoReplacement

 function DoReplacements: Boolean;
 var
  l_S : Tl3StringStream;
 begin//DoReplacements
  Result := false;
  if (f_ReplacementsParser <> nil) then
  begin
   l_Res := f_ReplacementsParser.NextTokenPrim(NTF);
   if (l_Res = l3_ttEOF) then
   begin
    f_ReplacementsParser.CheckFiler.Stream := nil;
    f_ReplacementsParser.CheckFiler.Indicator := nil;
    FreeAndNil(f_ReplacementsParser);
    if f_Replacements.Empty then
    begin
     Result := true;
     l_Res := f_TokenType;
     Exit;
    end;//f_Replacements.Empty
   end//l_Res = l3_ttEOF
   else
   begin
    Result := true;
    Exit;
   end;//Result = l3_ttEOF
  end;//f_ReplacementsParser <> nil
  if not f_Replacements.Empty then
  begin
   Assert(f_ReplacementsParser = nil);
   f_ReplacementsParser := Rl3CustomParser(ClassType).Create;
   f_ReplacementsParser.WordChars := Self.WordChars;
   f_ReplacementsParser.WhiteSpace := Self.WhiteSpace;
   f_ReplacementsParser.Keywords := Self.Keywords;
   f_ReplacementsParser.SkipHardEnter := Self.SkipHardEnter;
   f_ReplacementsParser.SkipSoftEnter := Self.SkipSoftEnter;
   f_ReplacementsParser.AddDigits2WordChars := Self.AddDigits2WordChars;
   f_ReplacementsParser.CheckKeyWords := Self.CheckKeyWords;
   f_ReplacementsParser.CheckStringBracket := Self.CheckStringBracket;
   l_S := Tl3StringStream.Create(f_Replacements.First As Tl3CustomString);
   try
    f_Replacements.Delete(0);
    f_ReplacementsParser.CheckFiler.Indicator.NeedProgressProc := false;
    f_ReplacementsParser.CheckFiler.Stream := l_S;
   finally
    FreeAndNil(l_S);
   end;//try..finally
   l_Res := f_ReplacementsParser.NextTokenPrim(NTF);
   Assert(l_Res <> l3_ttEOF);
   Result := true;
  end;//not f_Replacements.Empty
 end;//DoReplacements

var
 l_NeedTryNumber : Boolean; 
begin
 if DoReplacements then
  Exit;
 KeyWord := nil;
 if (Filer.Pos = 0) then
  f_SourceLine := 1;
 l_S := Filer.CheckLine;
 l_S.Clear;
 f_TokenType := l3_ttEOF;
 Result := l3_ttEOF;
 if SkipBlanks(NTF) then
 begin
  if (f_TokenType = l3_ttComment) then
   Result := f_TokenType
  else
  if not Filer.EOF then
  begin
   l_C := Filer.GetC.rAC;
   if (l_C = cc_Null) AND NullAsEOF then
   begin
    ;
   end//(l_C = cc_Null) AND NullAsEOF
   else
    case l_C of
     cc_SoftEnter:
      Result := l3_ttEOL;
     cc_HardEnter:
     begin
      Result := l3_ttEOL;
      with Filer do
       if not EOF AND (GetC.rAC <> cc_SoftEnter) then
        UngetC;
     end;//cc_HardEnter
     cc_DoubleQuote:
     begin
      if not (l3_ntfCheckDoubleQuotedString in NTF) then
       Result:= CheckSingleChar(l_C, l_S, NTF)
      else
      begin
       l_C := Filer.GetC.rAC;
       while not Filer.EOF do
       begin
        Case l_C of
         cc_Null, cc_SoftEnter, cc_HardEnter:
          Error(SInvalidString);
         '{':
          DoReplacement;
         cc_DoubleQuote:
          break;
         else
          l_S.Append(l_C, 1, Filer.CodePage);
        end;//Case l_C
        l_C := Filer.GetC.rAC;
       end;//while not Filer.EOF
       l_S.TrimAll;
       l_S.LPad(cc_DoubleQuote, Filer.CodePage);
       l_S.Append(cc_DoubleQuote, 1, Filer.CodePage);
       Result := l3_ttDoubleQuotedString;
       f_TokenType := Result;
       if CheckKeyWords then
       begin
        CheckKeyWord;
        Result := f_TokenType;
       end;//CheckKeyWords
       if not f_Replacements.Empty then
       begin
        Result := NextTokenPrim(NTF);
        Exit;
       end;//not f_Replacements.Empty
      end;//not (l3_ntfCheckDoubleQuotedString in NTF)
     end;//cc_DoubleQuote
     cc_Number, cc_SingleQuote:
     begin
      if not (l3_ntfCheckString in NTF) then
       Result:= CheckSingleChar(l_C, l_S, NTF)
      else
      begin
       while not Filer.EOF do
       begin
        case l_C of
         cc_Number:
         begin
          I := 0;
          while not Filer.EOF do
          begin
           l_C := Filer.GetC.rAC;
           if (l_C in cc_Digits) then
            I := I * 10 + (Ord(l_C) - Ord('0'))
           else
           begin
            Filer.UngetC;
            break;
           end;//l_C in cc_Digits
          end;//while true
          if (I > $80) AND (I <> Ord(cc_SoftSpace)) then
          //if (I > Integer(High(AnsiChar))) then
          begin
           l_S.CodePage := CP_Unicode;
           l_S.Append(l3PCharLen(@I, 1, CP_Unicode));
          end//I > Integer(High(AnsiChar))
          else
           l_S.Append(AnsiChar(I), 1, Filer.CodePage);
         end;//cc_Number
         cc_SingleQuote:
         begin
          while not Filer.EOF do
          begin
           l_C := Filer.GetC.rAC;
           case l_C of
            cc_SoftEnter:
             if not SkipSoftEnter then
              Error(SInvalidString)
             else
              continue;
            cc_HardEnter:
             if not SkipHardEnter then
              Error(SInvalidString)
             else
             begin
              if (Filer.GetC.rAC <> cc_SoftEnter) then
               Filer.UngetC;
              Inc(f_SourceLine);
              continue;
             end;//not SkipHardEnter
            cc_Null:
             Error(SInvalidString);
            '<' :
            begin
             if CheckStringBracket then
             begin
              I := 0;
              while not Filer.EOF do
              begin
               l_C := Filer.GetC.rAC;
               if (l_C in cc_Digits) then
                I := I * 10 + (Ord(l_C) - Ord('0'))
               else
               begin
                if (l_C = '>') then
                 break
                else
                 Error(SInvalidString);
               end;//l_C in cc_Digits
              end;//while true
              l_S.Append(AnsiChar(I), 1, Filer.CodePage);
             end//CheckStringBracket
             else
              l_S.Append(l_C, 1, Filer.CodePage);
            end;//'<'
            cc_SingleQuote:
            begin
             if Filer.EOF then
              break;
             l_C := Filer.GetC.rAC;
             if (l_C = cc_SingleQuote) then
              l_S.Append(l_C, 1, Filer.CodePage)
             else
             begin
              Filer.UngetC;
              break;
             end;//l_C = cc_SingleQuote
            end;//cc_SingleQuote
            else
             l_S.Append(l_C, 1, Filer.CodePage);
           end;//case l_C
          end;//while true
         end;//cc_SingleQuote
         else
         begin
          Filer.UngetC;
          break;
         end;//cc_SingleQuote
        end;//case l_C
        if Filer.EOF then
         break;
        l_C := Filer.GetC.rAC;
       end;//while true
       Result := l3_ttString;
      end;//not (l3_ntfCheckString in NTF)
     end;//cc_Number
     cc_DollarSign:
     begin
      if CheckHex then
      begin
       l_S.Append(l_C, 1, Filer.CodePage);
       while not Filer.EOF do
       begin
        l_C := Filer.GetC.rAC;
        if (l_C in cc_HexDigits) then
         l_S.Append(l_C, 1, Filer.CodePage)
        else
        begin
         Filer.UngetC;
         break;
        end;//l_C in cc_HexDigits
       end;//while true
       if (l_S.Len > 1) then
       begin
        Result := l3_ttInteger;
        lp_SetTokenInt;
       end//l_S.Len > 1
       else
       { Скорее всего в случае неправильного шестнадцатиричного числа нужно возвращать строку, а не символ }
        Result := l3_ttSingleChar;
      end//CheckHex
      else
       Result:= CheckSingleChar(l_C, l_S, NTF);
     end;//cc_DollarSign
     cc_Minus, '0'..'9':
     begin
      if CheckInt then
      begin
       l_NeedTryNumber := true;
       l_S.Append(l_C, 1, Filer.CodePage);
       I := 1;
       while not Filer.EOF do
       begin
        l_C := Filer.GetC.rAC;
        if (l_C in cc_Digits) then
        begin
         l_S.Append(l_C, 1, Filer.CodePage);
         Inc(I);
        end//l_C in cc_Digits
        else
        begin
         if (l_C in WordChars) then
         begin
          Result := CheckSingleChar(l_C, l_S, NTF);
          l_NeedTryNumber := false;
         end//l_C in WordChars
         else
          Filer.UngetC;
         break;
        end;//l_C in cc_Digits
       end;//while true
       if l_NeedTryNumber then
       begin
        if (l_S.AsString <> '-') then
        begin
         Result := l3_ttInteger;
         lp_SetTokenInt;
        end//l_S.AsString <> '-'
        else
        { Скорее всего в случае неправильного шестнадцатиричного числа нужно возвращать строку, а не символ }
        begin
         //Assert(false, 'А теперь мы можем сюда попасть после исправления http://mdp.garant.ru:8080/pages/viewpage.action?pageId=269058906');
         // - можем - для одинокого минуса
         Result := l3_ttSingleChar;
         if (cc_Minus in WordChars) then
         begin
          if (l_C <> cc_Minus) then
          begin
           //Filer.UngetC;
           l_C := cc_Minus;
          end;//l_C <> cc_Minus
          l_S.Clear;
          Result := CheckSingleChar(l_C, l_S, NTF);
         end;//cc_Minus in WordChars
        end;//l_S.AsString <> '-'
       end//l_NeedTryNumber
      end//CheckInt
      else
       Result:= CheckSingleChar(l_C, l_S, NTF);
     end;//cc_Minus..
     else
      Result:= CheckSingleChar(l_C, l_S, NTF);
    end;//case l_C
  end;//not Filer.EOF
 end;//SkipBlanks(NTF)
 f_TokenType := Result;
end;

function Tl3CustomParser.NextToken: Tl3TokenType;
  {-}
begin
 Result := NextTokenPrim(l3NextTokenAllFlags);
end;

function Tl3CustomParser.NextTokenSp: Tl3TokenType;
  {-}
begin
 Result := NextTokenPrim(l3NextTokenAllFlags -
                         [l3_ntfCheckString, l3_ntfCheckDoubleQuotedString]);
end;

function Tl3CustomParser.NextTokenChar: Ansichar;
  {-}
begin
 Assert(f_ReplacementsParser = nil);
 if (NextToken = l3_ttSingleChar) then
  Result := Filer.CheckLine(false).AsChar
 else
  Result := cc_Null;
end;

function Tl3CustomParser.pm_GetTokenChar: Ansichar;
  {-}
begin
 if (TokenType = l3_ttSingleChar) then
  Result := Filer.CheckLine(false).AsChar
 else
  Result := cc_Null;
end;

procedure Tl3CustomParser.pm_SetOpenComment(const Value: Tl3CommentString);
  {-}
begin
 if (f_OpenComment <> Value) then
 begin
  f_OpenComment := Value;
  if (Value = EmptyStr) then
   f_CloseComment := EmptyStr;
 end;//f_OpenComment <> Value
end;

procedure Tl3CustomParser.pm_SetCloseComment(const Value: Tl3CommentString);
  {-}
begin
 if (f_CloseComment <> Value) then
 begin
  f_CloseComment := Value;
  if (Value = EmptyStr) then
   f_OpenComment := EmptyStr;
 end;//f_CloseComment <> Value
end;

function Tl3CustomParser.CheckFiler: Tl3CustomFiler;
var
 l_Filer : Tl3CustomFiler;
begin
 if (f_Filer = nil) then
 begin
  l_Filer := Tl3CustomFiler.Create;
  try
   Filer := l_Filer;
  finally
   l3Free(l_Filer);
  end;//try..finally
 end;//f_Filer = nil
 Result := f_Filer;
end;

(*function Tl3CustomParser.pm_GetFiler: Tl3CustomFiler;
  {-}
var
 l_Filer : Tl3CustomFiler;
begin
 if (f_Filer = nil) then
 begin
  l_Filer := Tl3CustomFiler.Create;
  try
   Filer := l_Filer;
  finally
   l3Free(l_Filer);
  end;//try..finally
 end;//f_Filer = nil
 Result := f_Filer;
end;*)

function Tl3CustomParser.FilerStored: Bool;
  {-}
begin
 {$IfDef l3FilerIsComponent}
 Result := (f_Filer <> nil) AND (f_Filer.Owner <> nil);
 {$Else  l3FilerIsComponent}
 Result := false;
 {$EndIf l3FilerIsComponent}
end;

procedure Tl3CustomParser.pm_SetFiler(Value: Tl3CustomFiler);
  {-}
begin
 Value.SetRefTo(f_Filer);
end;

function Tl3CustomParser.pm_GetKeyWord: Tl3PrimString;
  {-}
begin
 if (f_ReplacementsParser = nil) then
  Result := f_KeyWord
 else
  Result := f_ReplacementsParser.KeyWord;
end;

procedure Tl3CustomParser.pm_SetKeyWord(Value: Tl3PrimString);
  {-}
begin
 Value.SetRefTo(f_KeyWord);
end;

procedure Tl3CustomParser.pm_SetCheckKeyWords(Value: Bool);
  {-}
begin
 if (f_CheckKeyWords <> Value) then
 begin
  f_CheckKeyWords := Value;
  if Value AND (KeyWord = nil) then
   CheckKeyWord;
 end;//f_CheckKeyWords <> Value
end;

(*function Tl3CustomParser.pm_GetOptions: Tl3ParserOptions;
  {-}
begin
 Result := [];
 if CheckKeyWords then
  Include(Result, l3_poCheckKeyWords);
 if CheckFloat then
  Include(Result, l3_poCheckFloat);
 if CheckInt then
  Include(Result, l3_poCheckFloat);
 if CheckHex then
  Include(Result, l3_poCheckFloat);
 if CheckComment then
  Include(Result, l3_poCheckFloat);
 if CheckStringBracket then
  Include(Result, l3_poCheckFloat);
 if AddDigits2WordChars then
  Include(Result, l3_poCheckFloat);
 if NullAsEOF then
  Include(Result, l3_poCheckFloat);
end;*)

procedure Tl3CustomParser.pm_SetOptions(aValue: Tl3ParserOptions);
  {-}
begin
 CheckKeyWords := l3_poCheckKeyWords in aValue;
 CheckFloat := l3_poCheckFloat in aValue;
 CheckInt := l3_poCheckInt in aValue;
 CheckHex := l3_poCheckHex in aValue;
 CheckComment := l3_poCheckComment in aValue;
 CheckStringBracket := l3_poCheckStringBracket in aValue;
 AddDigits2WordChars := l3_poAddDigits2WordChars in aValue;
 NullAsEOF := l3_poNullAsEOF in aValue;
end;

procedure Tl3CustomParser.SkipLineComment;
begin
 SkipBlanks(l3NextTokenAllFlags, l3_csLine);
end;

function Tl3CustomParser.SkipBlanks(NTF: Tl3NextTokenFlags; aCommentState : Tl3CommentState = l3_csNone): Bool;
var
 l_C  : Ansichar;
 CS : Tl3CommentState;
 l_Line : Tl3String;
begin
 Result := false;
 l_Line := nil;
 if (l3_ntfSkipBlanks in NTF) then
 begin
  if CheckComment then
  begin
   l_Line := Filer.CheckLine;
   l_Line.Clear;
  end;//CheckComment
  CS := aCommentState;
  while not Filer.EOF do
  begin
   l_C := Filer.GetC.rAC;
   if (l_C = cc_Null) AND NullAsEOF then
    Exit
   else
    case l_C of
     cc_SoftEnter:
     begin
      if (CS = l3_csLine) then
      begin
       CS := l3_csNone;
       Inc(f_SourceLine);
      end//CS = l3_csLine
      else
      if (CS = l3_csMultiLine) AND CheckComment then
       l_Line.Append(l_C, 1, Filer.CodePage)
      else
      if (cc_SoftEnter in WhiteSpace) then
       Inc(f_SourceLine)
      else
      begin
       Filer.UngetC;
       break;
      end;//CS = l3_csLine
     end;//cc_SoftEnter
     cc_HardEnter:
     begin
      if (CS = l3_csLine) then
      begin
       CS := l3_csNone;
       if (Filer.GetC.rAC <> cc_SoftEnter) then
        Filer.UngetC;
       Inc(f_SourceLine);
      end//CS = l3_csLine
      else
      if (CS = l3_csMultiLine) AND CheckComment then
       l_Line.Append(l_C, 1, Filer.CodePage)
      else
      if not (cc_HardEnter in WhiteSpace) then
      begin
       Inc(f_SourceLine);
       Filer.UngetC;
       break;
      end;//not (cc_HardEnter in WhiteSpace)
     end;//cc_HardEnter
     else
     begin
      if not (l3_ntfSkipComment in NTF) then
      begin
       if not (l_C in WhiteSpace) then
       begin
        Filer.UngetC;
        break;
       end;//not (l_C in WhiteSpace)
      end//not (l3_ntfSkipComment in NTF)
      else
      begin
       Case CS of
        l3_csNone:
        begin
         if (Length(LineComment) > 0) then
         begin
          if (l_C = LineComment[1]) then
          begin
           if (Length(LineComment) = 1) OR
              (Filer.GetC.rAC = LineComment[2]) then
           begin
            CS := l3_csLine;
            continue;
           end//(Length(LineComment) = 1)
           else
            Filer.UngetC;
          end;//l_C = LineComment[1]
         end;//Length(LineComment) > 0
         if (Length(OpenComment) > 0) then
         begin
          if (l_C = OpenComment[1]) then
          begin
           if (Length(OpenComment) = 1) OR IsCommentBracket(True) then
           begin
            CS := l3_csMultiLine;
            continue;
           end;//(Length(OpenComment) = 1)   
          end;{l_C = LineComment[1]}
         end;{Length(OpenComment) > 0}
         if CheckOherComment(l_C, True) then
         begin
          CS := l3_csAnOtherMultiLine;
          continue;
         end;//(Length(OpenComment) = 1)
         if not (l_C in WhiteSpace) then
         begin
          Filer.UngetC;
          break;
         end;//not (l_C in WhiteSpace)
        end;{l3_csNone}
        l3_csMultiLine:
        begin
         if (Length(CloseComment) > 0) then
         begin
          if (l_C = CloseComment[1]) then
          begin
           if (Length(CloseComment) = 1) OR IsCommentBracket(False) then
           begin
            CS := l3_csNone;
            if CheckComment then
            begin
             f_TokenType := l3_ttComment;
             break;
            end;//CheckComment
           end;//(Length(CloseComment) = 1)..
           //l_C = CloseComment[1]
          end//(l_C = CloseComment[1])
          else
          if CheckComment then
           l_Line.Append(l_C, 1, Filer.CodePage);
         end;//Length(CloseComment) > 0
        end;//l3_csMultiLine
        l3_csAnOtherMultiLine: begin
          if CheckOherComment(l_C, False) then
          begin
           CS := l3_csNone;
           if CheckComment then
           begin
            f_TokenType := l3_ttComment;
            break;
           end;//CheckComment
          end//if CheckOherComment(l_C, True) then
          else
          if CheckComment then
           l_Line.Append(l_C, 1, Filer.CodePage);
        end;
       end;//Case CS
      end;//l3_ntfSkipComment in NTF
     end;//else
    end;//case l_C
  end;//while true
 end;//l3_ntfSkipBlanks in NTF
 Result := true;
end;

procedure Tl3CustomParser.Cleanup;
  {-}
begin
 FreeAndNil(f_ReplacementsParser);
 FreeAndNil(f_Replacements);
 inherited;
end;

procedure Tl3CustomParser.Release;
  {-}
begin
 KeyWord := nil;
 KeyWords := nil;
 Filer := nil;
 inherited;
end;

procedure Tl3CustomParser.CheckKeyWord;
  {-}
begin
 if (TokenType = l3_ttSymbol) OR
    ((TokenType = l3_ttDoubleQuotedString) AND
     (cc_DoubleQuote in WordChars)) then
 begin
  if (KeyWords <> nil) then
  begin
   KeyWord := KeyWords.KeyWordByName[l3CStr(TokenLongString)];
   if (KeyWord <> nil) then
    f_TokenType := l3_ttKeyWord;
  end;//KW <> nil
 end;//TokenType = l3_ttSymbol
end;

function Tl3CustomParser.CheckSingleChar(aChar: Ansichar; aString: Tl3String; aNTF: Tl3NextTokenFlags):
    Tl3TokenType;
var
 l_C: AnsiChar;

 procedure DoWordChar;
 begin//DoWordChar
  aString.Append(l_C, 1, Filer.CodePage);
  if (l_C = cc_DoubleQuote) then
   if (l3_ntfCheckDoubleQuotedString in aNTF) then
   begin
    l_C := Filer.GetC.rAC;
    while not Filer.EOF do
    begin
     Case l_C of
      cc_Null, cc_SoftEnter, cc_HardEnter:
       Error(SInvalidString);
      cc_DoubleQuote:
      begin
       aString.Append(l_C, 1, Filer.CodePage);
       break;
      end;//cc_DoubleQuote
      else
      begin
       aString.Append(l_C, 1, Filer.CodePage);
       l_C := Filer.GetC.rAC;
      end;//cc_DoubleQuote
     end;//Case l_C
    end;//while not Filer.EOF
   end;//l3_ntfCheckDoubleQuotedString in NTF
 end;//DoWordChar

begin//CheckSingleChar
 l_C:= aChar;
 if (l_C in WordChars) then
 begin
  aString.Append(l_C, 1, Filer.CodePage);
  while not Filer.EOF do
  begin
   l_C := Filer.GetC.rAC;
   if (l_C in WordChars) then
    DoWordChar
   else
   if AddDigits2WordChars AND (l_C in cc_Digits) then
    DoWordChar
   else
   begin
    Filer.UngetC;
    break;
   end;//AddDigits2WordChars AND (l_C in cc_Digits)
  end;//while true
  Result := l3_ttSymbol;
  f_TokenType := Result;
  if CheckKeyWords then
  begin
   CheckKeyWord;
   Result := f_TokenType;
  end;//CheckKeyWords
 end//l_C in Word Chars
 else
 begin
  aString.AsChar := l_C;
  Result := l3_ttSingleChar;
 end;//l_C in Word Chars
end;//CheckSingleChar

function Tl3CustomParser.TokenFloat: Extended;
begin
 Assert(f_ReplacementsParser = nil);
 Result := f_NumericToken.Float;
end;

function Tl3CustomParser.TokenInt: Long;
begin
 if (f_ReplacementsParser = nil) then
  Result := f_NumericToken.Int
 else
  Result := f_ReplacementsParser.TokenInt;
end;

function Tl3CustomParser.TokenString: AnsiString;
begin
 if (f_ReplacementsParser = nil) then
  Result := Filer.CheckLine(false).AsString
 else
  Result := f_ReplacementsParser.TokenString;
end;

function Tl3CustomParser.TokenLongString: Tl3String;
begin
 if (f_ReplacementsParser = nil) then
  Result := Filer.CheckLine(false)
 else
  Result := f_ReplacementsParser.TokenLongString;
end;

function Tl3CustomParser.TokenSymbolIs(const anS: AnsiString): Boolean;
begin
 Result := (TokenType = l3_ttSymbol) and
           (CompareText(anS, TokenString) = 0);
end;

function Tl3CustomParser.TokenKeyWordIs(aID: Long): Bool;
  {-}
begin
 Result := (TokenType = l3_ttKeyWord) AND
           (KeyWord <> nil) AND
           (KeyWord.StringID = aID);
end;

//procedure Tl3CustomParser.Msg2Log(const Msg: AnsiString);
//  {-}
//begin
//(* {$IfDef l3UseCOM}
// if Assigned(f_MessageLog) then
//  f_MessageLog.Msg2Log(Msg)
// else
// {$EndIf l3UseCOM}*)
//  l3System.Msg2Log(Msg);
//end;

procedure Tl3CustomParser.Str2Log(const Msg: AnsiString);
  {-}
begin
 if (g_DisableParserLog <= 0) then
 begin
(* {$IfDef l3UseCOM}
 if Assigned(f_MessageLog) then
  f_MessageLog.Str2Log(Msg)
 else
 {$EndIf l3UseCOM}*)
  l3System.Msg2Log(Msg);
 end;//g_DisableParserLog <= 0
end;

(*
function Tl3CustomParser.WaitTT(aTokenType: Tl3TokenType): Bool;
  {-}
var
 l_TokenType : Tl3TokenType;
begin
 Result := false;
 repeat
  l_TokenType := NextToken;
  if (l_TokenType = aTokenType) then
   Result := true
  else if (l_TokenType = l3_ttEOF) then
   break;
 until Result;
end;

function Tl3CustomParser.WaitKeyword(aKeyWord: Long): Bool;
  {-}
begin
 repeat
  Result := WaitTT(l3_ttKeyWord) AND (KeyWord.StringID = aKeyWord);
 until Result OR (TokenType = l3_ttEOF);
end;*)

function Tl3CustomParser.IsCommentBracket(anOpen: Boolean): Boolean;
begin
 if anOpen then
  Result := (Filer.GetC.rAC = OpenComment[2])
 else
  Result := (Filer.GetC.rAC = CloseComment[2]);
 if not Result then
  Filer.UngetC;
end;

function Tl3CustomParser.CheckOherComment(aChar: AnsiChar; anOpen: Boolean): Boolean;
begin
 Result := False;
end;

end.

