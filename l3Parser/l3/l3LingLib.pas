unit l3LingLib;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Бабанин В.Б.                 }
{ Модуль: l3LingLib - Интерфейс к лингвистической библиотеке Коваленко mlma32ru.dll }
{ Начат: 01.04.2009 }
{ $Id: l3LingLib.pas,v 1.22 2013/06/19 10:04:58 fireton Exp $ }

// $Log: l3LingLib.pas,v $
// Revision 1.22  2013/06/19 10:04:58  fireton
// - char -> AnsiChar (K 460261935)
//
// Revision 1.21  2013/04/12 16:25:07  lulin
// - отлаживаем под XE3.
//
// Revision 1.20  2013/04/10 13:59:30  lulin
// - портируем.
//
// Revision 1.19  2013/04/05 12:03:00  lulin
// - портируем.
//
// Revision 1.18  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.17  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.16  2010/10/20 14:00:08  voba
// no message
//
// Revision 1.15  2010/10/04 14:08:28  fireton
// - const перед Tl3WString и Il3CString
//
// Revision 1.14  2010/10/01 07:54:54  voba
// - k:235865115
//
// Revision 1.13  2010/08/20 11:46:01  voba
// - k:233016367
//
// Revision 1.12  2010/05/05 11:42:21  voba
// - enh. procedure ApplayCapsScheme вынес в интерфейс (bug fix)
//
// Revision 1.11  2010/05/05 10:28:07  voba
// - enh. procedure ApplayCapsScheme вынес в интерфейс
//
// Revision 1.10  2010/03/11 13:29:37  voba
// - add сохранение капитализации строки
//
// Revision 1.9  2009/12/21 08:46:51  voba
// no message
//
// Revision 1.8  2009/10/07 06:49:44  voba
// - add overload function mlmaLemmatize
// - add function mlmaRusIsVerb
// - add function mlmaRusIsconjunction
//
// Revision 1.7  2009/09/25 10:30:46  voba
// - add function mlmaLemmatize
//
// Revision 1.6  2009/06/09 08:29:22  voba
// - add function mlmaRusPartOfSpeechStr  (для отладки)
// - bug fix function mlmaRusDeclensionStr
//
// Revision 1.5  2009/05/14 13:04:10  voba
// - add function mlmaRusIsNoun
// - tune function mlmaRusDeclensionStr склоняем до первого существительного в именительном падеже
//
// Revision 1.4  2009/05/04 13:46:59  voba
// - bug fix function mlmaRusDeclensionStr
//
// Revision 1.3  2009/04/29 09:06:01  voba
// - динамическая линковка DLL
//
// Revision 1.2  2009/04/28 06:48:18  voba
// - добавил процедуры русского склонения
//
// Revision 1.1  2009/04/14 14:13:30  voba
// no message
//

interface
uses
 SysUtils,
 l3Interfaces;

const
 //Настройки анализатора
 maStopAfterFirst = $0001; // Сканировать словарь до первого отождествления
 maIgnoreCapitals = $0002; // Игнорировать неправильные схемы капитализации
 maHardForms      = $0004; // Разрешать затрудненные формы слов
 maAdjVerbs       = $0100; // Нормализовать причастия, как прилагательные

type
 TLexID = Cardinal;

 PSGramInfo = ^TSGramInfo;
 TSGramInfo = packed record
  rWInfo : Byte;
  rIForm : Byte;
  rGInfo : Word;
  rOther : Byte;
 end;

  PSGramInfoBox = ^TSGramInfoBox;
  TSGramInfoBox = packed record
   rCount    : Byte;
   rGramInfo : array [0..64] of TSGramInfo;
  end;

const
 cLexIDBufSize  = 32;
 cLemmBufSize   = 256;

type
 TLexIDBuf  = Array[0 .. Pred(cLexIDBufSize)] of TLexID;
 TLemmBuf   = Array[0 .. Pred(cLemmBufSize)] of AnsiChar;

//**************************************************************************/
//*            Грамматическая информация из таблиц окончаний               */
//*                                                                        */
//*                                *******                                 */
//*                                                                        */
//* Склоняющиеся слова, младшие 2 байта. Грамматическая информация.        */
//*                                                                        */
//* @+++++++ ++++++++ - возвратная форма (глаголы и прилагательные)        */
//* +@@@++++ ++++++++ - падеж                                              */
//* ++++@+++ ++++++++ - число                                              */
//* +++++@@+ ++++++++ - род                                                */
//* +++++++@ ++++++++ - краткая форма (для прил. и прич.)                  */
//* ++++++++ @+++++++ - сравнительная степень                              */
//* ++++++++ +@@+++++ - причастие, деепричастие, страдательное причастие   */
//* ++++++++ +++@@+++ - лицо (для глаголов и их форм)                      */
//* ++++++++ +++++@@@ - временн'ая характеристика глагольной формы         */
//*                                                                        */
//* Ниже документирован дополнительный "информационный" байт, сопутству-   */
//* ющий каждому элементу таблиц окончаний:                                */
//*                                                                        */
//*          +++++++@ - окончание для одушевленного имени                  */
//*          ++++++@+ - окончание для неодушевленного имени                */
//**************************************************************************/

const
 cwfMultiple   =  $40;    //  Множественное число

 cafAnimated   =  $01;    //
 cafNotAlive   =  $02;    //
 cafHardForm   =  $04;    //  Затрудненная форма
 cafJoiningC   =  $08;    //  Соед. гласная

 cgfRetForms   =  $8000;  //  Возвратная форма
 cgfFormMask   =  $7000;  //  Маска для падежей
 cgfMultiple   =  $0800;  //  Множественное число
 cgfGendMask   =  $0600;  //  Род
 cgfShortOne   =  $0100;  //  Краткая форма
 cgfCompared   =  $0080;  //  Сравнительная степень
 cgfVerbForm   =  $0060;  //  Причастная информация
 cgfAdverb     =  $0040;  //  Наречие от прил.
 cgfVerbFace   =  $0018;  //  Лицо
 cgfVerbTime   =  $0007;  //  Время

 cvtInfinitiv =   $0001;  //  Инфинитив
 cvtImperativ =   $0002;  //  Повелит. наклонение
 cvtFuture    =   $0003;  //  Будущее время
 cvtPresent   =   $0004;  //  Настоящее время
 cvtPast      =   $0005;  //  Прошедшее время

 cvbFirstFace  =  $0008;  //  Первое лицо
 cvbSecondFace =  $0010;  //  Второе лицо
 cvbThirdFace  =  $0018;  //  Третье лицо

 cvfVerb       =  $0000;  //  Глагольная форма
 cvfVerbActive =  $0020;  //  Действит. причастие
 cvfVerbPassiv =  $0040;  //  Страд. причастие
 cvfVerbDoing  =  $0060;  //  Деепричастие

type
 TLingException = class(Exception);

type
 TllAddStrProc = procedure(aWord : PAnsiChar; aWordLen : integer);


 function mlmaruCheckWord(aWord    : PAnsiChar;
                          aOptions : Word): Smallint;
{* -
  Функция выполняет проверку правописания слова по словарю и возвращает
    * 1, если слово опознано;
    * 0, если слово не опознано;
    * значение меньше нуля в случае ошибки (коды ошибок см. выше).
  Аргументы:
    * aWord - указатель на строку в кодировке 1251 Windows Cyrillic;
    * aOptions - настройки морфологического анализатора (см. выше).
}

 function mlmaruLemmatize(aWord    : PAnsiChar;
                          aOptions : Word;
                          aBuff    : PAnsiChar;
                          aLids    : Pointer;
                          aInfo    : PAnsiChar;
                          aBuffLen : Word;
                          aLidsLen : Word;
                          aInfoLen : Word): Smallint;
{* -
  Функция выполняет отождествление поданной строки по морфологическому словарю и возвращает
    * количество лексем, с формами которых произошло отождествление;
    * 0, если слово не опознано;
    * значение меньше нуля в случае ошибки (коды ошибок см. выше).
  Аргументы:
    * aWord    - указатель на строку в кодировке 1251 Windows Cyrillic;
    * aOptions - настройки морфологического анализатора (см. выше);
    * aBuff    - указатель на массив, в который анализатор помещает разделенные нулевым символом нормальные формы слов,
                 с которыми произошло отождествление (если передано нулевое значение, нормальные формы не строятся);
    * aLids    - указатель на массив, в который анализатор кладет идентификаторы лексем,
                 соответствующие нормальным формам слов (если передано нулевое значение, идентификаторы лексем не выдаются);
    * aInfo    - указатель на массив, в который анализатор выдает грамматические описания (SGramInfo) тех форм,
                 с которыми произошло отождествление (если передано нулевое значение, грамматические описания не строятся);
    * aBuffLen - размер массива lpLemm или 0, если lpLemm == NULL;
    * aLidsLen - размерность массива lpLids или 0, если lpLids == NULL;
    * aInfoLen - размер массива lpGram или 0, если lpGram == NULL.

    Формат формируемого массива грамматических описаний:
      Первым байтом лежит количество грамматических описаний отождествившихся форм для очередной лексемы.
      Следом за ним лежит указанное количество структур SGramInfo, каждая из которых описывает отождествление
      с конкретной грамматической формой. Всего же в lpGram восстанавливается столько блоков описанной структуры,
      с формами скольких лексем произошло отождествление.
      Например, при лемматизации слова "клавиатуры" функция mlmaruLemmatize возвращает 1.
      Это означает, что отождествление произошло с формами одной лексемы, в lpLemm будет восстановлено слово "клавиатура",
      в lpLids - идентификатор лексемы, а в lpGram будет помещен один блок грамматических описаний
      (количество отождествлений - 3, Р.ед., И.мн., В.мн.).
}

 function  mlmaruBuildForm(aWord    : PAnsiChar;
                           aLxID    : Longint;
                           aOptions : Word;
                           aFormID  : Byte;
                           aBuff    : PAnsiChar;
                           aBuffLen : Word): Smallint;
{* -
  Функция строит формы указанного слова, соответствующие идентификатору, и возвращает
    * количество построенных форм (значение больше нуля);
    * 0, если такого слова нет в словаре или у слова нет такой формы;
    * значение меньше нуля в случае ошибки (коды ошибок см. выше).
   Аргументы:
    * aWord    - указатель на строку в кодировке 1251 Windows Cyrillic (может быть 0, в этом случае обязательно должен быть задан идентификатор лексемы);
    * aLxID    - идентификатор лексемы (если задана строка, то его можно не указывать, однако желательно указать, чтобы не были построены шумовые формы, возникающие при отождествлении переданной строки с формами нескольких лексем);
    * aOptions - настройки морфологического анализатора (см. выше);
    * aFormID  - идентификатор грамматической формы слова;
    * aBuff    - указатель на массив, в который анализатор помещает разделенные нулевым символом формы слова;
    * aBuffLen - размер массива aBuff
}

 function mlmaruBuildFormGI(aWord    : PAnsiChar;
                            aLxID    : Longint;
                            aOptions : Word;
                            aGrInfo  : Word;
                            aFlags   : Byte;
                            aBuff    : PAnsiChar;
                            aBuffLen : Word): Smallint;
{* -
  Функция строит формы указанного слова, соответствующие переданному грамматическому описанию, и возвращает
    * количество построенных форм (значение больше нуля);
    * 0, если такого слова нет в словаре или у слова нет такой формы;
    * значение меньше нуля в случае ошибки (коды ошибок см. выше).
  Аргументы:
    * aWord    - указатель на строку в кодировке 1251 Windows Cyrillic (может быть 0, в этом случае обязательно должен быть задан идентификатор лексемы);
    * aLxID    - идентификатор лексемы (если задана строка, то его можно не указывать, однако желательно указать, чтобы не были построены шумовые формы, возникающие при отождествлении переданной строки с формами нескольких лексем);
    * aOptions - настройки морфологического анализатора (см. выше);
    * aGrInfo  - аддитивное грамматическое описание формы слова (см. выше);
    * aFlags   - флаги одушевленности/неодушевленности;
    * aBuff    - указатель на массив, в который анализатор помещает разделенные нулевым символом формы слова;
    * aBuffLen - размер массива aBuff
}

 function mlmaruCheckHelp(aWord       : PAnsiChar;
                          aSubstChars : PAnsiChar): Smallint;
{* -
  Функция низкоуровневого обслуживания подсказки для проверки орфографии и подобных нужд.
  В ответ на строку-шаблон, содержащую один символ ? или * строит список символов, которые могли бы стоять на его месте.
  При этом * служит для усечения справа, а ? обозначает один символ. Возвращает:
    * количество построенных символов в случае успешного завершения перебора;
    * 0 в случае, если данному шаблону не соответствует ни одна словоформа;
    * значение меньше нуля в случае ошибки (коды ошибок см. выше).
  Аргументы:
    * aWord       - указатель на строку-шаблон в кодировке 1251 Windows Cyrillic;
    * aSubstChars - адрес массива размером не менее 35 символов, в который будут помещены символы-заместители.
}

function  L2llAddStrProc(Action: Pointer): TllAddStrProc; register;
procedure FreellAddStrProc(var Stub: TllAddStrProc); register;

procedure mlmaSpellCheck(aWord : PAnsiChar; aWordLen : Word; {aCodePage: Longint;} aAddFunc : TllAddStrProc);

function mlmaCheckErr(aCode : Smallint) : Smallint;

function mlmaRusPartOfSpeechStr(aWInfo : Byte): AnsiString;

function mlmaLemmatize(aWord : PAnsiChar; aWordLen : word; aOptions : Word; aAddFunc : TllAddStrProc) : boolean;
 overload;

function mlmaLemmatize(const aWord : Tl3WString; aOptions : Word; aAddFunc : TllAddStrProc) : boolean;
 overload;
{}

const
//RusDeclension
// падежи

 rdIment  = $0000;  //именительный  кто? что?
 rdRodit  = $1000;  //родительный   кого? чего?
 rdDatel  = $2000;  //дательный     кому? чему?
 rdVinit  = $3000;  //винительный   кого? что?
 rdTvorit = $4000;  //творительный  кем? чем?
 rdPredl  = $5000;  //предложный    о ком? о чем?

type
 TRusDeclension = Word;

function mlmaRusDeclension(aWord : PAnsiChar; aWordLen : Word; aDeclension : TRusDeclension) : AnsiString;
function mlmaRusDeclensionStr(const aString: AnsiString; aDeclension : TRusDeclension): AnsiString;

//Часть речи
//Внимание! Часть речи есть (SGramInfo.wInfo & 0x3f) 	Значение
// 1 	 Глагол несовершенного вида
// 2 	 Непереходный глагол несовершенного вида
// 3 	 Глагол совершенного вида
// 4 	 Непереходный глагол совершенного вида
// 5 	 Двувидовой глагол
// 6 	 Непереходный двувидовой глагол

// 7 	 Неодуш. существительное мужского рода
// 8 	 Одуш. существительное мужского рода
// 9 	 Одуш.-неодуш. существительное мужского рода
// 10 	 Неодуш. существительное мужского рода, склоняющееся по схеме среднего
// 11 	 Одуш. существительное мужского рода, склоняющееся по схеме женского
// 12 	 Одуш. существительное мужского рода, склоняющееся по схеме среднего
// 13 	 Неодуш. существительное женского рода
// 14 	 Одуш. существительное женского рода
// 15 	 Одуш.-неодуш. существительное женского рода
// 16 	 Неодуш. существительное среднего рода
// 17 	 Одуш. существительное среднего рода
// 18 	 Одуш.-неодуш. существительное среднего рода
// 19 	 Неодуш. существительное общего рода
// 20 	 Одуш. существительное общего рода
// 21 	 Неодуш. существительное мужского/среднего рода
// 22 	 Одуш. существительное мужского/среднего рода
// 23 	 Неодуш. существительное женского/среднего рода
// 24 	 Неодуш. существительное множественного числа

// 25 	 Прилагательное
// 26 	 Прилагательное, образованное от географического названия
// 27 	 Притяжательное местоимение
// 28 	 Местоименное прилагательное
// 29 	 Местоимение множественного числа
// 30 	 Местоимение мужского рода
// 31 	 Местоимение женского рода
// 32 	 Местоимение среднего рода
// 33 	 Числительное
// 34 	 Числительное "два"
// 35 	 Собирательное числительное
// 36 	 Порядковое числительное
// 37 	 Имя собственное
// 38 	 Имя мужского рода
// 39 	 Имя женского рода
// 40 	 Отчество мужского рода
// 41 	 Отчество женского рода
// 42 	 Фамилия
// 43 	 Неизменяемое географическое название
// 44 	 Географическое название мужского рожа
// 45 	 Географическое название женского рода
// 46 	 Географическое название среднего рода
// 47 	 Географическое название множественного числа
// 48 	 Вводное слово
// 49 	 Междометье
// 50 	 Предикатив
// 51 	 Предлог
// 52 	 Союз
// 53 	 Частица
// 54 	 Наречие
// 59 	 Аббревиатура, пишущаяся прописными буквами
// 60 	 Аббревиатура, пишущаяся строчными буквами

function mlmaRusIsNoun(aGramInfo : TSGramInfo): Boolean; //Существительное
function mlmaRusIsAdjective(aGramInfo : TSGramInfo): Boolean; //Прилагательное
function mlmaRusIsWideAdjective(aGramInfo : TSGramInfo): Boolean; //Прилагательное "в широком смысле" (+ порядковые чмслительные)
function mlmaRusIsVerb(aGramInfo : TSGramInfo): Boolean; //Глагол
function mlmaRusIsconjunction(aGramInfo : TSGramInfo): Boolean; //Союз

type
 TCapScheme = Set Of byte;

function GetCapsScheme(aWord : PAnsiChar; aWordLen : Word) : TCapScheme;
// получить схему капитализации
procedure ApplayCapsScheme(aWord : PAnsiChar; aWordLen : Word; aScheme : TCapScheme); overload;
// применить схему капитализации
procedure ApplayCapsScheme(aWord : PAnsiChar; aWordLen : Word; aSrcWord : PAnsiChar; aSrcWordLen : Word); overload;
// скопировать схему капитализации с aSrcWord

implementation
uses
 Windows,
 l3Base,
 l3Bits,
 l3MinMax,
 l3String;

type
 TmlmaCheckWord = function(aWord: PAnsiChar;
                           aOptions: Word): SmallInt; stdcall;

 TmlmaLemmatize = function(aWord: PAnsiChar;
                           aOptions: Word;
                           aBuff: PAnsiChar;
                           aLids: Pointer;
                           aInfo: PAnsiChar;
                           aBuffLen: Word;
                           aLidsLen: Word;
                           aInfoLen: Word): SmallInt; stdcall;

 TmlmaBuildForm = function(aWord    : PAnsiChar;
                           aLxID    : Longint;
                           aOptions : Word;
                           aFormID  : Byte;
                           aBuff    : PAnsiChar;
                           aBuffLen : Word): SmallInt; stdcall;

 TmlmaBuildFormGI = function(aWord    : PAnsiChar;
                             aLxID    : Longint;
                             aOptions : Word;
                             aGrInfo  : Word;
                             aFlags   : Byte;
                             aBuff    : PAnsiChar;
                             aBuffLen : Word): SmallInt; stdcall;

 TmlmaCheckHelp = function(aWord       : PAnsiChar;
                           aSubstChars : PAnsiChar): SmallInt; stdcall;


resourcestring
  rcCannonLoadLibrary = 'Невозможно загрузить библиотеку: ';
  rcLingDllName = 'mlma32ru.dll';

var
  gLingDLL : hModule = 0;

 // функции из mlma32ru.dll:
 gfCheckWord   : TmlmaCheckWord   = nil;
 gfLemmatize   : TmlmaLemmatize   = nil;
 gfBuildForm   : TmlmaBuildForm   = nil;
 gfBuildFormGI : TmlmaBuildFormGI = nil;
 gfCheckHelp   : TmlmaCheckHelp   = nil;

procedure CheckLingDLL;
begin
 if (gLingDLL <> 0) then Exit;

 gLingDLL := LoadLibrary(PChar(rcLingDllName));
 if (gLingDLL = 0) then
  raise Exception.Create(rcCannonLoadLibrary + rcLingDllName);

 @gfCheckWord   := GetProcAddress(gLingDLL, 'mlmaruCheckWord');
 @gfLemmatize   := GetProcAddress(gLingDLL, 'mlmaruLemmatize');
 @gfBuildForm   := GetProcAddress(gLingDLL, 'mlmaruBuildForm');
 @gfBuildFormGI := GetProcAddress(gLingDLL, 'mlmaruBuildFormGI');
 @gfCheckHelp   := GetProcAddress(gLingDLL, 'mlmaruCheckHelp');
end;

function mlmaruCheckWord(aWord: PAnsiChar;
                         aOptions: Word): SmallInt;
begin
 CheckLingDLL;
 Result := gfCheckWord(aWord, aOptions);
end;

function mlmaruLemmatize(aWord: PAnsiChar;
                         aOptions: Word;
                         aBuff: PAnsiChar;
                         aLids: Pointer;
                         aInfo: PAnsiChar;
                         aBuffLen: Word;
                         aLidsLen: Word;
                         aInfoLen: Word): SmallInt;
begin
 CheckLingDLL;
 Result := gfLemmatize(aWord, aOptions, aBuff, aLids, aInfo, aBuffLen, aLidsLen, aInfoLen);
end;

function  mlmaruBuildForm(aWord    : PAnsiChar;
                          aLxID    : Longint;
                          aOptions : Word;
                          aFormID  : Byte;
                          aBuff    : PAnsiChar;
                          aBuffLen : Word): SmallInt;
begin
 CheckLingDLL;
 Result := gfBuildForm(aWord, aLxID, aOptions, aFormID, aBuff, aBuffLen);
end;

function mlmaruBuildFormGI(aWord    : PAnsiChar;
                           aLxID    : Longint;
                           aOptions : Word;
                           aGrInfo  : Word;
                           aFlags   : Byte;
                           aBuff    : PAnsiChar;
                           aBuffLen : Word): SmallInt;
begin
 CheckLingDLL;
 Result := gfBuildFormGI(aWord, aLxID, aOptions, aGrInfo, aFlags, aBuff, aBuffLen);
end;

function mlmaruCheckHelp(aWord       : PAnsiChar;
                         aSubstChars : PAnsiChar): SmallInt;
begin
 CheckLingDLL;
 Result := gfCheckHelp(aWord, aSubstChars);
end;

procedure helpRegisterStr(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
var
 lLexIDBuf  : TLexIDBuf;
 lSGInfoBuf : TSGramInfoBox;
 lLemmBuf   : TLemmBuf;
begin
 if gfCheckWord(aWord, 0) = 1 then
  // регистр правильный
  aAddFunc(aWord, aWordLen)
 else
  if gfLemmatize(aWord, maIgnoreCapitals,
                     nil, @lLexIDBuf, @lSGInfoBuf,
                     0, SizeOf(lLexIDBuf), SizeOf(lSGInfoBuf)) = 1 then

   if gfBuildForm(nil, lLexIDBuf[0], 0, lSGInfoBuf.rGramInfo[0].rIForm,
                      @lLemmBuf, Pred(cLemmBufSize)) = 1 then
    aAddFunc(@lLemmBuf, StrLen(PAnsiChar(@lLemmBuf)))
end;

procedure helpCheckVariant(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
begin
 if gfCheckWord(aWord, maIgnoreCapitals) = 1 then
  helpRegisterStr(aWord, aWordLen, aAddFunc);
end;

procedure helpFindMistype(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
// неправильная буква
var
 lSaveChar   : AnsiChar;
 lSubstChars : array[0..34] of AnsiChar;
 lSCharsCnt  : Integer;
 lPos        : Integer;
begin
 for lPos := Pred(aWordLen) downto 0 do
 begin
  lSaveChar := aWord[lPos];
  aWord[lPos] := '?';
  try
   lSCharsCnt := gfCheckHelp(aWord, lSubstChars);

   while lSCharsCnt > 0 do
   begin
    aWord[lPos] := lSubstChars[Pred(lSCharsCnt)];
    helpCheckVariant(aWord, aWordLen, aAddFunc);
    Dec(lSCharsCnt);
   end;
  finally
   aWord[lPos] := lSaveChar;
  end;
 end;
end;

procedure helpFindSkipped(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
// пропущенная буква
var
 lSubstChars : array[0..34] of AnsiChar;
 lWordCopy   : array[0..255] of AnsiChar;
 lSCharsCnt  : Integer;
 lPos        : Integer;
begin
 //make copy
 StrMove(@lWordCopy[0], aWord, aWordLen);
 lWordCopy[aWordLen] := #0;

 for lPos := aWordLen downto 1 do
 begin
  lWordCopy[lPos + 1] := lWordCopy[lPos];
  lWordCopy[lPos] := '?';
  lSCharsCnt := gfCheckHelp(lWordCopy, lSubstChars);
  while lSCharsCnt > 0 do
  begin
   lWordCopy[lPos] := lSubstChars[Pred(lSCharsCnt)];
   helpCheckVariant(lWordCopy, aWordLen + 1, aAddFunc);
   Dec(lSCharsCnt);
  end;
 end;
end;

procedure helpFindNoSpace(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
// слипшиеся слова
var
 lSubstChars : array[0..34] of AnsiChar;
 lWordCopy   : array[0..255] of AnsiChar;
 lSCharsCnt  : Integer;
 lPos        : Integer;
begin
 //make copy
 StrMove(@lWordCopy[0], aWord, aWordLen);
 lWordCopy[aWordLen + 1] := #0;

 for lPos := pred(aWordLen) downto 1 do
 begin
  lWordCopy[lPos + 1] := lWordCopy[lPos];
  lWordCopy[lPos] := #0;

  if (gfCheckWord(lWordCopy, 0) = 1) and
     (gfCheckWord(lWordCopy + lPos + 1, 0) = 1) then
  begin
   lWordCopy[lPos] := ' ';
   aAddFunc(lWordCopy, aWordLen + 1);
  end;
 end;
end;

procedure helpFindRandoms(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
// лишняя буква
var
 lSaveChar : AnsiChar;
 lSaveChar2 : AnsiChar;
 lCharPtr  : Integer;
begin
 if aWordLen <= 1 then Exit;

 lCharPtr := 0;
 lSaveChar := aWord[0];

 while true do
 begin
  helpCheckVariant(aWord + 1, aWordLen - 1, aAddFunc);
  Inc(lCharPtr);
  if lCharPtr = aWordLen then
   break;
  lSaveChar2 := aWord[lCharPtr];
  aWord[lCharPtr] := lSaveChar;
  lSaveChar := lSaveChar2;
 end;

 // восстановим строку
 if lCharPtr > 0 then
 begin
  StrMove(aWord + 1, aWord + 2, aWordLen - 2);
  aWord[aWordLen - 1] := lSaveChar;
 end;
end;

procedure helpFindSwapped(aWord : PAnsiChar; aWordLen : Word; aAddFunc : TllAddStrProc);
// поменяные буквы
var
 lSaveChar : AnsiChar;
 I : Integer;
begin
 if aWordLen <= 1 then Exit;

 for I := 0 to aWordLen - 2 do
 begin
  {swap}
  lSaveChar := aWord[I];
  aWord[I] := aWord[I+1];
  aWord[I+1] := lSaveChar;

  helpCheckVariant(aWord, aWordLen, aAddFunc);

  {revert swap}
  lSaveChar := aWord[I];
  aWord[I] := aWord[I+1];
  aWord[I+1] := lSaveChar;
 end;
end;

procedure mlmaSpellCheck(aWord : PAnsiChar; aWordLen : Word; {aCodePage: Long;} aAddFunc : TllAddStrProc);
var
 lWordCopy : array[0..255] of AnsiChar;
begin
 CheckLingDLL; //все вложенные считают что проверено
 if aWordLen > 255 then Exit; // в буфер не влезет !! единственная проверка все вложенные ПОДРАЗУМЕВАЮТ это
 //make copy
 StrMove(@lWordCopy[0], aWord, aWordLen);
 lWordCopy[aWordLen] := #0;

 //if aCodePage <> CP_ANSI then
 // {конвертнуть};

 helpFindMistype(lWordCopy, aWordLen, aAddFunc);
 helpFindRandoms(lWordCopy, aWordLen, aAddFunc);
 helpFindSwapped(lWordCopy, aWordLen, aAddFunc);
 helpFindSkipped(lWordCopy, aWordLen, aAddFunc);
 helpFindNoSpace(lWordCopy, aWordLen, aAddFunc);
end;

function mlmaLemmatize(aWord : PAnsiChar; aWordLen : word; aOptions : Word; aAddFunc : TllAddStrProc) : boolean;
begin
 Result := mlmaLemmatize(l3PCharLen(aWord, aWordLen), aOptions, aAddFunc);
end;

function mlmaLemmatize(const aWord : Tl3WString; aOptions : Word; aAddFunc : TllAddStrProc) : boolean;


var
 lWordCopy : array[0..255] of AnsiChar;
 lCount    : Smallint;
 lLemmBuf  : TLemmBuf;
 I         : Smallint;
 lLen      : Integer;
 lNormWord : PAnsiChar;
begin
 CheckLingDLL;
 if aWord.SLen > 255 then Exit; // в буфер не влезет
 //make copy
 StrMove(@lWordCopy[0], aWord.S, aWord.SLen);
 lWordCopy[aWord.SLen] := #0;

 //if l3IsANSI(aWord.SCodePage) then
 // {конвертнуть};

 lCount := gfLemmatize(@lWordCopy[0], aOptions,
                       @lLemmBuf, nil {aLids}, nil {aInfo},
                       Pred(cLemmBufSize), 0 {aLidsLen}, 0 {aInfoLen});

 Result := lCount > 0;

 lNormWord := @lLemmBuf;
 for I := 0 to Pred(lCount) do
 begin
  lLen := StrLen(lNormWord);
  aAddFunc(lNormWord, lLen);
  Inc(lNormWord, lLen + 1);
 end;
end;

function mlmaRusDeclensionEx(aWord : PAnsiChar; aWordLen : Word; aDeclension : TRusDeclension; var aGramInfo : TSGramInfo) : AnsiString;
 type
  TWordFormEntry = record
   //rPtr     : PAnsiChar;
   rGInfo   : TSGramInfo;
   rFormInd : Integer;
  end;

 var
  lFormsCount : SmallInt;
  lFormIndex  : Integer;
  lIndex      : Byte;

  lLexIDBuf   : TLexIDBuf;
  lSGInfoBuf  : array[0..$fff{4kb}] of char;
  lSGInfoBufPtr : PAnsiChar;

  lOutWord    : TLemmBuf;

  lWordCopy : array[0..255] of AnsiChar;

  lNounEntry : TWordFormEntry;  //Найденное существительное
  lAdjEntry : TWordFormEntry;   //Найденное прилагательное

 const
  cUndefIndex = -1;

begin
 CheckLingDLL;
 if aWordLen > 255 then Exit; // в буфер не влезет !!

 lNounEntry.rFormInd := cUndefIndex;
 lAdjEntry .rFormInd := cUndefIndex;

 //make copy
 StrMove(@lWordCopy[0], aWord, aWordLen);
 lWordCopy[aWordLen] := #0;
 if ({not (m0STRAnsiIsUpper(lWordCopy)) and} (gfCheckWord(lWordCopy, maIgnoreCapitals) = 1)) then
 begin
  lSGInfoBufPtr := @lSGInfoBuf;
  lFormsCount := gfLemmatize(lWordCopy, maIgnoreCapitals,
                 nil, @lLexIDBuf, @lSGInfoBuf,
                 0, SizeOf(lLexIDBuf), SizeOf(lSGInfoBuf));

 // поищем среди найденных словоформ существительное и прилагательное в именительном падеже
 // некотрые слова, например "городской" дают Инфо как существительное и прилагательное одновременно
 // наружу будем выдавать форму для "прилагательного", если это возможно, т к на существительном склонение фразы заканчиватся
  for lFormIndex := 0 to Pred(lFormsCount) do
  begin
   with PSGramInfoBox(lSGInfoBufPtr)^ do
    begin
     for lIndex := 0 to Pred(rCount) do
      with rGramInfo[lIndex] do
      begin
       if ((rGInfo and cgfFormMask) = 0) then // именительный падеж
       begin

        if (lAdjEntry.rFormInd = cUndefIndex) and mlmaRusIsWideAdjective(rGramInfo[lIndex]) then
        begin
         with lAdjEntry do
         begin
          rGInfo := rGramInfo[lIndex];
          rFormInd := lFormIndex;
         end;
         Break;
        end;

        if (lNounEntry.rFormInd = cUndefIndex) and mlmaRusIsNoun(rGramInfo[lIndex]) then
        begin
         with lNounEntry do
         begin
          rGInfo := rGramInfo[lIndex];
          rFormInd := lFormIndex;
         end;
        end;

       end;
      end;
     Inc(lSGInfoBufPtr, SizeOf(rCount) + rCount * SizeOf(TSGramInfo));
   end; //with PSGramInfoBox(lSGInfoBufPtr)^ do
  end;

  // если нашли прилагательное возьмем его
  if (lAdjEntry.rFormInd <> cUndefIndex) then
  begin
   with lAdjEntry.rGInfo do
   if (mlmaCheckErr(gfBuildFormGI(nil, lLexIDBuf[lAdjEntry.rFormInd], maIgnoreCapitals, rGInfo and not cgfFormMask or aDeclension, rOther, @lOutWord, SizeOf(lOutWord))) > 0) then
   begin
    aGramInfo := lAdjEntry.rGInfo;
    Result := StrPas(lOutWord);
    Exit;
   end;
  end;

  // если нашли существительное то его
  if (lNounEntry.rFormInd <> cUndefIndex) then
  begin
   with lNounEntry.rGInfo do
   if (mlmaCheckErr(gfBuildFormGI(nil, lLexIDBuf[lNounEntry.rFormInd], maIgnoreCapitals, rGInfo and not cgfFormMask or aDeclension, rOther, @lOutWord, SizeOf(lOutWord))) > 0) then
   begin
    aGramInfo := lNounEntry.rGInfo;
    Result := StrPas(lOutWord);
    Exit;
   end;
  end;

 end;
 Result := ''; //StrPas(lWordCopy);
end;

function mlmaRusDeclension(aWord : PAnsiChar; aWordLen : Word; aDeclension : TRusDeclension) : AnsiString;
var
 lGrInfo   : TSGramInfo;
begin
 Result := mlmaRusDeclensionEx(aWord, aWordLen, aDeclension, lGrInfo);
end;

function GetCapsScheme(aWord : PAnsiChar; aWordLen : Word) : TCapScheme;
// получить схему капитализации
var
 lHasLow : boolean;
 I : Byte;
begin
 Result := [];
 lHasLow := False;
 aWordLen := Min(aWordLen, High(Byte));
 for I := 0 to Pred(aWordLen) do
  if l3IsUpper(aWord[I]) then
   Include(Result, I)
  else
   lHasLow := True;
 if not lHasLow then
  Result := [Low(Byte) .. High(Byte)];
end;

procedure ApplayCapsScheme(aWord : PAnsiChar; aWordLen : Word; aScheme : TCapScheme); overload;
// применить схему капитализации
var
 I : Byte;
begin
 if aScheme = [] then exit; // приезжает все в нижнем
 if aScheme = [Low(Byte) .. High(Byte)] then
  CharUpperBuffA(aWord, aWordLen);
 aWordLen := Min(aWordLen, High(Byte));
 for I := 0 to Pred(aWordLen) do
  if I in aScheme then
   CharUpperBuffA(@aWord[I], 1);
end;

procedure ApplayCapsScheme(aWord : PAnsiChar; aWordLen : Word; aSrcWord : PAnsiChar; aSrcWordLen : Word); overload;
// скопировать схему капитализации с aSrcWord
begin
 ApplayCapsScheme(aWord, aWordLen, GetCapsScheme(aSrcWord, aSrcWordLen));
end;

function mlmaRusDeclensionStr(const aString: AnsiString; aDeclension : TRusDeclension): AnsiString;
var
 lWStart   : Longint;
 lWEnd     : Longint;

 lStrLen   : Integer;

 lDeclWord : AnsiString;
 lDelta    : Integer;
 lBeFound  :  Boolean;

 lGrInfo   : TSGramInfo;
 lCapsScheme : TCapScheme;

begin
 lBeFound := false;
 Result := aString;
 lWStart := 1;
 lStrLen := Length(Result);

 while (lWStart < lStrLen) do
 begin
  while (lWStart <= lStrLen) and
        (l3IsWordDelim(Result[lWStart])) do
   Inc(lWStart);

  lWEnd := lWStart;
  while (lWEnd <= lStrLen) AND
        not (l3IsWordDelim(Result[lWEnd])) do
   Inc(lWEnd);

  if (lWEnd > lWStart) then
  begin
   lCapsScheme := GetCapsScheme(@Result[lWStart], lWEnd - lWStart);
   lDeclWord := mlmaRusDeclensionEx(@Result[lWStart], lWEnd - lWStart, aDeclension, lGrInfo);

   if lDeclWord <> '' then
   begin
    ApplayCapsScheme(PAnsiChar(lDeclWord), Length(lDeclWord), lCapsScheme);
    Delete(Result, lWStart, lWEnd - lWStart);
    Insert(lDeclWord, Result, lWStart);
    lDelta := Length(lDeclWord) - (lWEnd - lWStart); // корррекция на разницу в длинах слов
    lWStart := lWEnd + lDelta;
    lStrLen := lStrLen + lDelta;
    lBeFound := true;

    if mlmaRusIsNoun(lGrInfo) then // если существительное - дальше не склоняем, а то "Постановление Правительства" превращается в "О Постановлении Правительств"
     lWStart := Succ(lStrLen); // end of process
   end
   else
    if lBeFound then
     lWStart := Succ(lStrLen) // end of process
    else
     lWStart := lWEnd;
  end;//l_WordFinish > l_Offset
 end;//not l3IsNil(aStr)
end;

function mlmaRusPartOfSpeechStr(aWInfo : Byte): AnsiString;
begin
 Case (aWInfo and $3f) of
  1  : Result := 'Глагол несовершенного вида';
  2  : Result := 'Непереходный глагол несовершенного вида';
  3  : Result := 'Глагол совершенного вида';
  4  : Result := 'Непереходный глагол совершенного вида';
  5  : Result := 'Двувидовой глагол';
  6  : Result := 'Непереходный двувидовой глагол';

  7  : Result := 'Неодуш. существительное мужского рода';
  8  : Result := 'Одуш. существительное мужского рода';
  9  : Result := 'Одуш.-неодуш. существительное мужского рода';
  10 : Result := 'Неодуш. существительное мужского рода, склоняющееся по схеме среднего';
  11 : Result := 'Одуш. существительное мужского рода, склоняющееся по схеме женского';
  12 : Result := 'Одуш. существительное мужского рода, склоняющееся по схеме среднего';
  13 : Result := 'Неодуш. существительное женского рода';
  14 : Result := 'Одуш. существительное женского рода';
  15 : Result := 'Одуш.-неодуш. существительное женского рода';
  16 : Result := 'Неодуш. существительное среднего рода';
  17 : Result := 'Одуш. существительное среднего рода';
  18 : Result := 'Одуш.-неодуш. существительное среднего рода';
  19 : Result := 'Неодуш. существительное общего рода';
  20 : Result := 'Одуш. существительное общего рода';
  21 : Result := 'Неодуш. существительное мужского/среднего рода';
  22 : Result := 'Одуш. существительное мужского/среднего рода';
  23 : Result := 'Неодуш. существительное женского/среднего рода';
  24 : Result := 'Неодуш. существительное множественного числа';

  25 : Result := 'Прилагательное';
  26 : Result := 'Прилагательное, образованное от географического названия';
  27 : Result := 'Притяжательное местоимение';
  28 : Result := 'Местоименное прилагательное';
  29 : Result := 'Местоимение множественного числа';
  30 : Result := 'Местоимение мужского рода';
  31 : Result := 'Местоимение женского рода';
  32 : Result := 'Местоимение среднего рода';
  33 : Result := 'Числительное';
  34 : Result := 'Числительное "два"';
  35 : Result := 'Собирательное числительное';
  36 : Result := 'Порядковое числительное';
  37 : Result := 'Имя собственное';
  38 : Result := 'Имя мужского рода';
  39 : Result := 'Имя женского рода';
  40 : Result := 'Отчество мужского рода';
  41 : Result := 'Отчество женского рода';
  42 : Result := 'Фамилия';
  43 : Result := 'Неизменяемое географическое название';
  44 : Result := 'Географическое название мужского рода';
  45 : Result := 'Географическое название женского рода';
  46 : Result := 'Географическое название среднего рода';
  47 : Result := 'Географическое название множественного числа';
  48 : Result := 'Вводное слово';
  49 : Result := 'Междометье';
  50 : Result := 'Предикатив';
  51 : Result := 'Предлог';
  52 : Result := 'Союз';
  53 : Result := 'Частица';
  54 : Result := 'Наречие';
  59 : Result := 'Аббревиатура, пишущаяся прописными буквами';
  60 : Result := 'Аббревиатура, пишущаяся строчными буквами'
  else
       Result := format('Unknown = %d', [(aWInfo and $3f)]);

 end;
end;

function mlmaRusIsNoun(aGramInfo : TSGramInfo): Boolean; //Существительное
begin
 Result := (aGramInfo.rWInfo and $3f) in [7..24];
end;

function mlmaRusIsAdjective(aGramInfo : TSGramInfo): Boolean; //Прилагательное
begin
 Result := (aGramInfo.rWInfo and $3f) in [25];
end;

function mlmaRusIsWideAdjective(aGramInfo : TSGramInfo): Boolean; //Прилагательное "в широком смысле" (+ порядковые чмслительные)
begin
 Result := (aGramInfo.rWInfo and $3f) in [25, 36];
end;

function mlmaRusIsVerb(aGramInfo : TSGramInfo): Boolean; //Глагол
begin
 Result := ((aGramInfo.rWInfo and $3f) in [1..6]) and
           ((aGramInfo.rGInfo and (cvfVerbActive or cvfVerbPassiv or cvfVerbDoing)) = 0);
end;

function mlmaRusIsconjunction(aGramInfo : TSGramInfo): Boolean; //Союз
begin
 Result := (aGramInfo.rWInfo and $3f) in [52];
end;


//Часть речи
//Внимание! Часть речи есть (SGramInfo.wInfo & 0x3f) 	Значение
// 1 	 Глагол несовершенного вида
// 2 	 Непереходный глагол несовершенного вида
// 3 	 Глагол совершенного вида
// 4 	 Непереходный глагол совершенного вида
// 5 	 Двувидовой глагол
// 6 	 Непереходный двувидовой глагол

// 7 	 Неодуш. существительное мужского рода
// 8 	 Одуш. существительное мужского рода
// 9 	 Одуш.-неодуш. существительное мужского рода
// 10 	 Неодуш. существительное мужского рода, склоняющееся по схеме среднего
// 11 	 Одуш. существительное мужского рода, склоняющееся по схеме женского
// 12 	 Одуш. существительное мужского рода, склоняющееся по схеме среднего
// 13 	 Неодуш. существительное женского рода
// 14 	 Одуш. существительное женского рода
// 15 	 Одуш.-неодуш. существительное женского рода
// 16 	 Неодуш. существительное среднего рода
// 17 	 Одуш. существительное среднего рода
// 18 	 Одуш.-неодуш. существительное среднего рода
// 19 	 Неодуш. существительное общего рода
// 20 	 Одуш. существительное общего рода
// 21 	 Неодуш. существительное мужского/среднего рода
// 22 	 Одуш. существительное мужского/среднего рода
// 23 	 Неодуш. существительное женского/среднего рода
// 24 	 Неодуш. существительное множественного числа

// 25 	 Прилагательное
// 26 	 Прилагательное, образованное от географического названия
// 27 	 Притяжательное местоимение
// 28 	 Местоименное прилагательное
// 29 	 Местоимение множественного числа
// 30 	 Местоимение мужского рода
// 31 	 Местоимение женского рода
// 32 	 Местоимение среднего рода
// 33 	 Числительное
// 34 	 Числительное "два"
// 35 	 Собирательное числительное
// 36 	 Порядковое числительное
// 37 	 Имя собственное
// 38 	 Имя мужского рода
// 39 	 Имя женского рода
// 40 	 Отчество мужского рода
// 41 	 Отчество женского рода
// 42 	 Фамилия
// 43 	 Неизменяемое географическое название
// 44 	 Географическое название мужского рожа
// 45 	 Географическое название женского рода
// 46 	 Географическое название среднего рода
// 47 	 Географическое название множественного числа
// 48 	 Вводное слово
// 49 	 Междометье
// 50 	 Предикатив
// 51 	 Предлог
// 52 	 Союз
// 53 	 Частица
// 54 	 Наречие
// 59 	 Аббревиатура, пишущаяся прописными буквами
// 60 	 Аббревиатура, пишущаяся строчными буквами



function mlmaCheckErr(aCode : Smallint) : Smallint;
begin
 Result := aCode;
 if aCode < 0 then
 case aCode of
  -1 : raise TLingException.Create('Недостаточно места в массиве нормальных форм');
  -2 : raise TLingException.Create('Недостаточно места в массиве лексем');
  -3 : raise TLingException.Create('Недостаточно места для грамматических описаний');
  -4 : raise TLingException.Create('Слишком длинное слово или плохой указатель');
  -5 : raise TLingException.Create('Не удалось найти страницу словаря');
  -6 : raise TLingException.Create('Не удалось загрузить страницу словаря');
 end;
end;

function L2llAddStrProc(Action: Pointer): TllAddStrProc; register;
asm
 jmp  l3LocalStub
end;{asm}

procedure FreellAddStrProc(var Stub: TllAddStrProc); register;
asm
 jmp  l3FreeLocalStub
end;{asm}

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3LingLib.pas initialization enter'); {$EndIf}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3LingLib.pas initialization leave'); {$EndIf}
finalization
 if (gLingDLL <> 0) then FreeLibrary(gLingDLL);
end.
