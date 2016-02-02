unit l3Types;
{* Базовые типы библиотеки L3. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Types -                   }
{ Начат: 14.04.1998 11:40             }
{ $Id: l3Types.pas,v 1.140 2015/10/29 14:32:46 lulin Exp $ }

// $Log: l3Types.pas,v $
// Revision 1.140  2015/10/29 14:32:46  lulin
// - обновляем.
//
// Revision 1.139  2015/06/03 12:43:16  lulin
// - пытаемся разрулить зависимости.
//
// Revision 1.138  2015/06/02 15:03:56  voba
// - переделка итератора по записям. Теперь пустые в подитеративную процедуру не передаются, стопзапись ставится внутри итератора
//
// Revision 1.137  2014/11/10 14:19:47  lukyanets
// Механизм обработки сообщений
//
// Revision 1.136  2014/10/14 12:35:17  lukyanets
// Пишем/читаем все базовые параметры
//
// Revision 1.135  2014/07/16 15:56:57  lulin
// - чистим код и упрощаем наследование.
//
// Revision 1.134  2014/02/19 15:05:08  lulin
// - добавляем эталоны.
//
// Revision 1.133  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.132  2013/03/28 17:25:05  lulin
// - портируем.
//
// Revision 1.131  2010/09/21 11:06:56  fireton
// - переводим деревья с PAnsiChar на Tl3WString
//
// Revision 1.130  2009/10/14 08:58:17  voba
// - избавляемся от библиотеки mg
// -add l3_fmFullShareReadWrite, l3_fmFullShareCreateReadWrite - открытие с расшаренным чтением и записью
//
// Revision 1.129  2009/07/20 16:44:09  lulin
// - убираем из некоторых листьевых параграфов хранение типа конкретного тега, вместо этого "плодим" под каждый тип тега свой тип класса.
//
// Revision 1.128  2009/07/17 12:42:04  lulin
// {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.127  2008/10/31 09:51:55  voba
// - add type
//
// Revision 1.126  2008/10/27 08:17:45  voba
// - move type TListIndex to l3Types
//
// Revision 1.125  2008/09/09 15:40:14  lulin
// - удалены ненужные свойства.
//
// Revision 1.124  2008/05/14 11:20:20  narry
// - уровень логгирования сообщений
//
// Revision 1.123  2008/03/28 13:53:45  lulin
// - рисуем модель в рамках <K>: 88081637.
//
// Revision 1.122  2008/03/04 08:28:05  lulin
// - <K>: 85721148.
//
// Revision 1.121  2008/02/28 15:12:11  lulin
// - переносим nevTools на модель.
//
// Revision 1.120  2008/02/21 18:13:28  lulin
// - избавляемся от ненужных типов.
//
// Revision 1.119  2008/02/20 19:01:29  lulin
// - удалён ненужный тип.
//
// Revision 1.118  2008/02/20 18:25:25  lulin
// - удалён ненужный тип.
//
// Revision 1.117  2008/02/20 14:06:42  lulin
// - удалены избыточные операции сравнения.
//
// Revision 1.116  2008/02/19 14:58:59  lulin
// - переводим сортировку списков на новые, менее виртуальные, рельсы.
//
// Revision 1.115  2008/02/13 13:05:29  lulin
// - cleanup.
//
// Revision 1.114  2008/02/12 16:35:59  lulin
// - итераторы переехали на примесь.
//
// Revision 1.113  2008/02/08 19:52:45  lulin
// - продолжаем санацию списков.
//
// Revision 1.112  2007/12/21 15:21:57  lulin
// - cleanup.
//
// Revision 1.111  2007/12/20 15:11:56  lulin
// - перегенерация.
//
// Revision 1.110  2007/12/18 14:04:42  lulin
// - избавился от неправильной зависимости.
//
// Revision 1.109  2007/09/20 17:16:43  lulin
// - для сегмента с параграфом возвращаем специальный атомарный шрифт.
//
// Revision 1.108  2007/09/04 12:54:55  lulin
// - при поиске минимизируем вычисление головы списка.
//
// Revision 1.107  2007/08/30 14:52:26  lulin
// - получаем дубликаты только один раз.
//
// Revision 1.106  2007/08/30 14:00:49  lulin
// - при поиске реже вычисляем размер элемента.
//
// Revision 1.105  2007/08/29 19:09:09  lulin
// - упрощаем поиск в списках.
//
// Revision 1.104  2007/08/29 16:03:03  lulin
// - cleanup.
//
// Revision 1.103  2007/08/09 11:19:29  lulin
// - cleanup.
//
// Revision 1.102  2007/08/02 10:37:10  lulin
// - добавлены структуры для оптимизации хранения строк.
//
// Revision 1.101  2007/07/24 18:14:49  lulin
// - собрался первый проект со сгенерированным модулем l3Interfaces.
//
// Revision 1.100  2007/05/24 09:24:23  lulin
// - по-другому идентифицируем комплексную сортировку.
//
// Revision 1.99  2007/05/24 07:30:52  lulin
// - добавлена константа, обозначающая сортировку по нескольким атрибутам.
//
// Revision 1.98  2007/02/19 15:20:02  lulin
// - bug fix: не собирался Архивариус.
//
// Revision 1.97  2007/01/30 15:24:25  lulin
// - текст ноды - теперь более простого типа.
//
// Revision 1.96  2007/01/17 11:20:20  lulin
// - cleanup.
//
// Revision 1.95  2007/01/12 13:48:16  lulin
// - cleanup.
//
// Revision 1.94  2007/01/11 14:06:33  lulin
// - интерфейс шрифта переехал в базовый модуль.
//
// Revision 1.93  2006/12/10 12:48:41  lulin
// - оптимизируем распределение памяти для маленьких кусочков.
//
// Revision 1.92  2006/12/08 13:25:54  lulin
// - сделана возможность управлять полной очисткой данных объекта при укладывании их в кеш.
//
// Revision 1.91  2006/11/27 10:23:16  lulin
// - cleanup.
//
// Revision 1.90  2006/11/27 08:43:26  lulin
// - cleanup.
//
// Revision 1.89  2006/11/25 14:31:53  lulin
// - корректнее записываем текст, который в кодировке, отличной от кодировки записываемого файла.
//
// Revision 1.88  2006/11/17 15:38:24  voba
// - add   to Tl3CompareData поле DataSize для  _l3_ctRawData для поиска по началу записи
//
// Revision 1.87  2006/05/02 11:16:27  lulin
// - вытерта лишняя процедура сортировки.
//
// Revision 1.86  2006/05/02 08:45:51  lulin
// - вычищен ненужный тип.
//
// Revision 1.85  2006/04/26 12:16:23  voba
// - bug fix: архивирующие потоки не работали над файловыми потоками, отличными от m3.
//
// Revision 1.84  2006/04/26 09:03:15  voba
// - введен режим открытия "по-Опоссуму" - l3_fmCreateReadWrite.
//
// Revision 1.83  2006/04/25 09:19:02  voba
// - add type TSmallIntArray
//
// Revision 1.82  2006/04/24 12:58:47  lulin
// - выпиливаем из списков общую функциональность.
//
// Revision 1.81  2006/04/12 13:13:39  oman
// - change: перевод механизма локализации строк на использование фабрик
// - new beh: Локализация nsc
//
// Revision 1.80  2006/03/06 12:02:29  oman
// - new behavior: контроль провисания ресурсов при добавлении объектов в кэш
//
// Revision 1.79  2005/11/24 17:14:47  demon
// - fix: после переноса функциональности на l3Control отъехала
// реализация возможности вызова Changing/Changed из DoChanged циклически
//
// Revision 1.78  2005/11/09 15:28:41  lulin
// - базовые интерфейсы перенесены в правильный модуль.
//
// Revision 1.77  2005/09/14 07:02:28  lulin
// - bug fix: исправлена очередная пачка ошибок с редактированием параграфа в Unicode.
//
// Revision 1.76  2005/08/23 07:17:42  mmorozov
// new: Tl3Bool (переехавший Tk2Bool);
//
// Revision 1.75  2005/06/29 10:30:24  lulin
// - введен собственный тип для множества скроллбар'ов - чтобы не такскать везде это виндовое уродство.
//
// Revision 1.74  2005/05/27 12:06:04  lulin
// - убраны лишние зависимости.
//
// Revision 1.73  2005/05/26 13:19:36  lulin
// - new unit: _l3ScreenIC.
//
// Revision 1.72  2005/03/30 15:56:33  lulin
// - TevLocation теперь наследуется от Tk2Tool - базового класса для инструментов тегов.
//
// Revision 1.71  2005/03/21 10:05:08  lulin
// - new interface: _Ik2Type.
//
// Revision 1.70  2005/02/22 12:27:44  lulin
// - рефакторинг работы с Tl3Point и Tl3Rect.
//
// Revision 1.69  2005/01/20 07:12:54  mmorozov
// change: WordOrderNames;
//
// Revision 1.68  2005/01/19 14:40:05  lulin
// - new type: Tl3StringArray.
//
// Revision 1.67  2004/12/16 08:15:14  mmorozov
// new: константы и типы для параметров контекстной фильтрации;
//
// Revision 1.66  2004/11/19 16:33:17  lulin
// - bug fix: съедались двухбуквенные ShortCut'ы.
//
// Revision 1.65  2004/09/11 14:15:54  lulin
// - класс _Tl3InterfacedComponent сделан кешируемым.
//
// Revision 1.64  2004/09/02 12:30:35  law
// - cleanup.
//
// Revision 1.63  2004/09/02 11:57:04  law
// - cleanup.
//
// Revision 1.62  2004/08/27 10:56:20  law
// - new const: l3_fmExclusiveReadWrite.
//
// Revision 1.61  2004/07/22 14:49:50  law
// - new type: _Tl3OperationCode.
//
// Revision 1.60  2004/06/18 10:15:46  law
// - класс _TevTextPara стал крайне аскетичным.
//
// Revision 1.59  2004/06/08 09:07:04  law
// - на Tl3PCharLen добавлены операции эквивалентности.
//
// Revision 1.58  2004/05/19 14:13:17  voba
// -add notify after delete node
//
// Revision 1.57  2004/05/14 13:29:38  law
// - new method: Tl3KeyWords.AddKeyWords.
//
// Revision 1.56  2004/04/29 14:57:04  law
// - bug fix: теперь табуляции корректно обрабатываются и в Unicode строке.
//
// Revision 1.55  2004/04/26 14:28:24  law
// - new behavior: Tl3Filer теперь при чтении посимвольно учитывает кодировку.
// - bug fix: в свойство TevMemo.Buffer теперь нормально присваиваются строки с кодировкой Unicode.
//
// Revision 1.54  2004/04/20 14:53:43  law
// - new method: Tl3PCharLen.InitPart.
// - remove proc: ev_plAssign.
//
// Revision 1.53  2004/04/19 16:08:23  law
// - new type: _Tl3PCharLenConst.
//
// Revision 1.52  2004/04/19 14:52:22  law
// - new proc: Tl3PCharLen.Shift.
//
// Revision 1.51  2004/03/05 13:09:48  law
// - cleanup.
//
// Revision 1.50  2003/05/30 12:25:58  law
// - change: константы nt* переехали в модуль l3Types.
//
// Revision 1.49  2003/04/09 13:26:56  law
// - new proc version: _l3BFind.
//
// Revision 1.48  2003/03/13 16:37:21  law
// - change: попытка портировать на Builder.
//
// Revision 1.47  2002/09/24 12:15:59  law
// no message
//
// Revision 1.46  2002/09/02 08:26:52  law
// - new tag types: k2_idDictItem, k2_idItemFlag.
// - change tag type: k2_idDictRec -> k2_idDictItem для k2_tiClasses, k2_tiTypes, k2_tiKeyWords, k2_tiPrefix.
//
// Revision 1.45  2002/07/22 13:54:58  law
// - rename type: TSetBitType -> Tl3SetBitType.
//
// Revision 1.44  2002/07/22 13:47:31  law
// - new methods: Il3Tree.ChangeExpand, Il3Tree.InsertNode.
//
// Revision 1.43  2002/07/09 11:12:42  law
// - new type: Tl3Inch.
//
// Revision 1.42  2002/04/19 09:18:28  law
// - new const: _l3_ctRawData.
//
// Revision 1.41  2002/04/03 13:50:39  law
// - new const: 3_fmExclusiveWrite, l3_fmExclusiveAppend.
//
// Revision 1.40  2002/02/21 15:58:15  law
// - optimization.
//
// Revision 1.39  2002/01/17 16:00:00  law
// - new type: Tl3MakeLong.
//
// Revision 1.38  2001/12/27 16:16:52  law
// - new const: l3Types.CP_Unicode.
//
// Revision 1.37  2001/12/27 16:06:34  law
// - change: изменен порядок полей Tl3PCharLen.
//
// Revision 1.36  2001/09/24 11:18:08  law
// - bug fix: не обновлялись максимальные размеры вертикального скроллера.
//
// Revision 1.35  2001/09/11 17:46:36  law
// - some new features.
//
// Revision 1.34  2001/09/04 12:43:47  voba
// - bug fix: неописанные типы под Delphi 5.
//
// Revision 1.33  2001/09/03 08:56:03  law
// - bug fix.
//
// Revision 1.32  2001/09/03 08:42:15  law
// - bug fix.
//
// Revision 1.31  2001/08/31 12:19:58  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.30  2001/08/31 08:50:08  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.29  2001/08/30 09:58:07  law
// - rename type: TDirection -> Tl3Direction.
//
// Revision 1.28  2001/07/27 15:46:05  law
// - comments: xHelpGen.
//
// Revision 1.27  2001/07/26 15:55:03  law
// - comments: xHelpGen.
//
// Revision 1.26  2001/07/24 12:30:24  law
// - comments: xHelpGen.
//
// Revision 1.25  2001/06/26 13:33:53  law
// - comments & cleanup.
//
// Revision 1.24  2001/04/18 13:25:24  law
// - comments: добавлены комментарии для xHelpGen.
//
// Revision 1.23  2001/04/05 08:55:58  law
// - new type: Tl3ClipboardFormats - массив форматов буфера обмена.
//
// Revision 1.22  2001/03/13 18:44:35  law
// - some cleaning, tuning & comments.
//
// Revision 1.21  2000/12/19 15:52:41  law
// - убраны ненужные директивы компиляции.
//
// Revision 1.20  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

{$WriteableConst Off }

interface

uses
  {$IfDef Delphi6}
  Types,
  {$IFDEF LINUX}
  {$Else  LINUX}
  Windows,
  ActiveX,
  {$EndIF LINUX}
  {$Else  Delphi6}
  Windows,
  ActiveX,
  {$EndIf Delphi6}
  Classes,

  SysUtils,

  l3Interfaces
  ;

////////////////////////////////////////////////////////////////////////////////
/// Типы и классы используемые для указания способа работы фильтра /////////////
////////////////////////////////////////////////////////////////////////////////
type
  Tl3Bool = (l3_bUnknown, l3_bFalse, l3_bTrue);
    {* Тип для кеширования булевского значения. }

type
  Tl3WordPosition = l3Interfaces.Tl3WordPosition;

  Tl3TreeLevelDist = l3Interfaces.Tl3TreeLevelDist;

  Tl3WordOrder = l3Interfaces.Tl3WordOrder;

////////////////////////////////////////////////////////////////////////////////

const
  SB_Vert = Windows.SB_Vert;
  SB_Horz = Windows.SB_Horz;
  SB_Both = Windows.SB_Both;

type
  PObject = ^TObject;
  PIUnknown = ^IUnknown;
  PInteger = l3Interfaces.PInteger;

  Tl3Rgn = hRgn;
   {* Регион. }

  Long = Longint;
   {* Самый большой доступный процессорный целый тип со знаком. }
  Large = Int64;
  PLarge = ^Large;
  Int  = SmallInt;
  PLong = ^Long;
  {$IfNDef Delphi6}
  PLongInt = Windows.PLongInt;
  PWord = Windows.PWord;
  {$EndIf Delphi6}
  Bool = Boolean;
   {* Паскалевское логическое значение. }
  CardinalBool = LongBool;
  WParam = Windows.WParam;
   {* Тип для параметра WParam. }
  LParam = Windows.LParam;
   {* Тип для параметра LParam. }
  PBool = ^Bool;
  PPointer = ^Pointer;
  PPChar = ^PAnsiChar;
  Tl3IStatus = HResult;
   {* Статус, возвращаемый методами интерфейсов. }

  sInt8  = ShortInt;
   {* Знаковое 8-битное целое. }
  uInt8  = Byte;
   {* Беззнаковое 8-битное целое. }
  sInt16 = SmallInt;
   {* Знаковое 16-битное целое. }
  uInt16 = Word;
   {* Беззнаковое 16-битное целое. }
  sInt32 = Long;
   {* Знаковое 32-битное целое. }
  uInt32 = Cardinal;
   {* Беззнаковое 32-битное целое. }

  Tl3OperationCode = l3Interfaces.Tl3OperationCode; 

  String255 = String[255];
   {* Короткая строка. }

  Tl3Operation = (l3_opDelete, l3_opInsert);
   {* Операция:
      |<br>
      |<ul>
      | <li><b>l3_opDelete</b> - удаление.</li>
      | <li><b>l3_opInsert</b> - вставка.</li>
      |</ul>
   }

  Tl3ItemFlag = (l3_ifNone, l3_ifNew, l3_ifDeleted, l3_ifModified);
   {* Флаг элемента. } 

  TByteSet = set of Byte;
   {* Множество байт. }

  TCharSet = l3Interfaces.TCharSet;
   {* Множество символов. }

  TCardinalSizeSet = set of 0..SizeOf(Cardinal) * 8 - 1;
  TLongSizeSet = set of 0..SizeOf(Long) * 8 - 1;

  Tl3MakeWord = packed record
   {* Тип для распаковки Word по байтам. }
    Lo: sInt8;
    Hi: sInt8;
  end;{Tl3MakeWord}

  Tl3MakeLong = packed record
   {* Тип для распаковки Long по Word. }
    Lo: uInt16;
    Hi: uInt16;
  end;{Tl3MakeWord}

  Tl3IteratorAction = function(Data: Pointer {на самом деле P<ItemType> для шаблонов}; Index: Long): Bool; register;
    {* Подитеративная функция. }
  Tl3FreeAction = function(Data: Pointer): Bool; register;
    {* Функция для итераторов и нотификаций об освобождении объекта. }

  Tl3BeforeAddToCacheEvent = procedure of object;
    {-}
  Tl3GetClassCacheEntryEvent = function: Pointer of object;
    {-}
  Tl3SetClassCacheEntryEvent = procedure(aValue: Pointer) of object;
    {-}

  Tl3BoolOp = (l3_boAnd, l3_boOr, l3_boAndNot);
    {* - операции над множествами}

const
  ntNone           = 0;
    {* - пустая операция. }
  ntInsert         = 1;
    {* - вставка элемента. }
  ntDelete         = 3;
    {* - удаление элемента. Вызывается до уничтожения ссылки}
  ntDeleteDone     = 4;
    {* - удаление элемента. Вызывается после уничтожения ссылки}
  ntDataChange     = 5;
    {* - изменились элемента. }
  ntMoveBegin      = 6;
    {* - началось движение элемента. }
  ntMoveEnd        = 7;
    {* - закончилось движение элемента. }

  ntClear          = 8;
    {* - очистили структуру данных. }
  ntClearItem      = 9;
    {* - очистили элемент. }
  ntChildClear     = 10;
    {* - очистили дочерний элемент. }
  ntChildInsert    = 11;
    {* - вставлен дочерний элемент. }
  ntFree           = 12;
    {* - освобождение элемента. }
  ntCountChange    = 13;
    {* - изменилось количество элементов. }
  ntChangeItemData = 14;
    {* - изменились данные элемента. }

  ntChanging       = 15;
    {* - началось изменение. }
  ntChanged        = 16;
    {* - закончилось изменение. }

  ntResortChild    = 17;
    {* - Дочерние элементы изменили взаимное расположение. }

type
  Tl3ClipboardFormat = l3Interfaces.Tl3ClipboardFormat;
   {* Формат данных буфера обмена. }
  Tl3ClipboardFormats = l3Interfaces.Tl3ClipboardFormats;
   {* Набор форматов данных буфера обмена. }
  Tl3FileMode = (l3_fmRead, l3_fmWrite, l3_fmReadWrite, l3_fmAppend,
                 l3_fmExclusiveReadWrite, l3_fmExclusiveWrite, l3_fmExclusiveAppend,
                 l3_fmCreateReadWrite,
                 l3_fmFullShareReadWrite, l3_fmFullShareCreateReadWrite);
   {* Режим работы с файлами:
      |<br>
      |<ul>
      | <li><b>l3_fmRead</b> - чтение.</li>
      | <li><b>l3_fmWrite</b> - запись.</li>
      | <li><b>l3_fmReadWrite</b> - чтение-запись.</li>
      | <li><b>l3_fmAppend</b> - добавление в конец.</li>
      |</ul>
   }
   {l3_fmFullShareReadWrite, l3_fmFullShareCreateReadWrite - открытие с расшаренным чтением и записью}
const   
  l3_fmWriteMode = [l3_fmWrite, l3_fmReadWrite, l3_fmAppend,
                    l3_fmExclusiveWrite, l3_fmExclusiveAppend, l3_fmCreateReadWrite];
type
  Tl3ProgressProc = procedure(aState     : Byte;
                              aValue     : Long;
                              const aMsg : AnsiString = '') of object;
   {* Процедура индикации. aState - см. piStart. }
  {
    If Astate = piStart then AValue=Total Num of item (-1 if not defined),
                              aPercen = 0
    If Astate <> piStart and AMsg = '' then No Change Messages;
  }

  Tl3Method = packed record
   {* Тип для распаковки состовляющих указателя на метод. }
    Code, Data : Pointer;
  end;{Tl3Method}

const
  CP_ANSI         = l3Interfaces.CP_ANSI;
   {* - константа представляющая кодировку ANSI. }
  CP_Unicode      = l3Interfaces.CP_Unicode;
   {* - константа представляющая кодировку Unicode. }

type
  Tl3Char = record
    Case rCodePage : Integer of
     CP_Unicode : (rWC : WideChar);
     CP_ANSI    : (rAC : AnsiChar);
  end;//Tl3Char

  Tl3PCharLenBase = object(Tl3PCharLenPrim)
    public
    // public methods
      function  IsLast(aChar: AnsiChar): Boolean;
        {-}
      function  EQ(const aSt: Tl3PCharLenPrim): Boolean;
        {-}
      function  Diff(const aSt: Tl3PCharLenPrim): Integer;
        {-}
  end;//Tl3PCharLenBase

  Tl3PCharLen = object(Tl3PCharLenBase)
    public
    // public methods
      procedure Init(aSt: PAnsiChar = nil; aLen: Long = -1; aCodePage: Long = CP_ANSI);
        {-}
      procedure InitPart(aSt       : PAnsiChar;
                         aStart    : Long;
                         aFinish   : Long;
                         aCodePage : Long);
        {-}
      procedure Shift(aLen: Integer);
        {-}
      procedure MoveS(aLen: Integer = 1);
        {-}
  end;//Tl3PCharLen
  Pl3PCharLen = ^Tl3PCharLen;
  
  Tl3PCharLenConst = object(Tl3PCharLenBase)
  end;//Tl3PCharLenConst

  Tl3PCharRec = packed record
   rS         : PAnsiChar;
   rAllocated : Boolean;
  end;

  Tl3FontIndex = l3Interfaces.Tl3FontIndex;
   {* Индекс шрифта. }
  Tl3FontIndexes = l3Interfaces.Tl3FontIndexes;
   {* Множество индексов шрифта. }

  Tl3BMTable = array[0..255] of Byte;
   {* Table used by the Boyer-Moore search routines. }

  TSmallIntArray = array of SmallInt;
   {* Динамический массив коротких целых чисел. }
  TLongArray = array of Long;
   {* Динамический массив целых чисел. }
  TStringArray = Tl3StringArray;
   {* Динамический массив строк. }

  Tl3Handle = Long;
   {* Тип целочисленных идентификаторов. Знаковый. Размер не фиксирован. }
  Tl3Direction = l3Interfaces.Tl3Direction;
   {* - направление движения. }

  TListIndex = Integer;
   {* - индекс элемента списка. }

const
  l3_opExclude = l3_opDelete;
   {* Исключение. }
  l3_opInclude = l3_opInsert;
   {* Включение. }

type
  Tl3MemoryFlag = l3Interfaces.Tl3MemoryFlag;
   {* Флаг распределения памяти. }
  Tl3PtrRec = l3Interfaces.Tl3PtrRec;

  Tl3OperationFlag = (ofInsert, ofDelete, ofModify, 
                      ofCanUndo, ofCanRedo);
   {* Флаг операции. }
  Tl3OperationFlags = set of Tl3OperationFlag;
   {* Флаги операции. }

  Tl3Duplicates = (l3_dupIgnore, l3_dupAccept, l3_dupError, l3_dupAssign, l3_dupChange);
   {* Операция применимая к совпадающим элементам списка:
      |<br>
      |<ul>
      | <li><b>l3_dupIgnore</b> - игнорировать новый элемент.</li>
      | <li><b>l3_dupAccept</b> - принять новый элемент.</li>
      | <li><b>l3_dupError</b> - выдать сообщение об ошибке.</li>
      | <li><b>l3_dupAssign</b> - присвоить новый элемент старому.</li>
      | <li><b>l3_dupChange</b> - заменить старый элемент новым.</li>
      |</ul>
   }

  Tl3SortIndex = type SmallInt;
   {* Индекс сортировки (см. l3_siByID и др). }

const
  l3_siByID            = Tl3SortIndex(-7);
   {* Признак сортировки объектов по "идентификатору". }
  l3_siUnsorted        = Tl3SortIndex(-6);
   {* Признак отсутствия сортировки. }
  l3_siCaseUnsensitive = Tl3SortIndex(-5);
   {* Признак сортировки без учета регистра. }
  l3_siNative          = Tl3SortIndex(-4);
   {* Признак "родной" сортировки объектов. }

type  
  Tl3KW = record
    rName : String;
    rID   : Integer;
  end;//Tl3KW
  
  Tl3PtrCompareProc = function(A, B: Pointer): Long;
   {* Прототип сравнения данных по указателям. }
  Tl3OnCompareItems = function (I, J : Longint) : Longint of object;
   {-}
  Tl3CompareAction = l3Interfaces.Tl3CompareAction;
   {-}

  Tl3Index = l3Interfaces.Tl3Index;
   {* Индекс элементов. }

  {$IfDef Delphi6}
  {$IFDEF LINUX}
   IStream = Types.IStream;
   TStatStg = Types.TStatStg;
  {$Else LINUX}
   IStream = ActiveX.IStream;
   IStorage = ActiveX.IStorage;
   TStatStg = ActiveX.TStatStg;
  {$EndIF LINUX}
  {$Else Delphi6}
   IStream = ActiveX.IStream;
   TStatStg = ActiveX.TStatStg;
  {$EndIf Delphi6}

  Tl3SetBitType = l3Interfaces.Tl3SetBitType;

  Tl3PathStr = AnsiString;

const
  l3MinIndex = Low(Tl3Index);
   {* - минимальный индекс элемента. }
  l3MaxIndex = High(Tl3Index);
   {* - максимальный индекс элемента. }

  l3GlyphFontName = '__Glyph__';

  {$IfDef Delphi6}
  RT_RCData = Types.RT_RCDATA;
  {$IFDEF LINUX}
  STG_E_INVALIDPOINTER = Types.STG_E_INVALIDPOINTER;
  STG_E_REVERTED = Types.STG_E_REVERTED;
  STG_E_INVALIDFUNCTION = Types.STG_E_INVALIDFUNCTION;
  STG_E_CANTSAVE = Types.STG_E_CANTSAVE;
  STREAM_SEEK_SET = Types.STREAM_SEEK_SET;
  STREAM_SEEK_END = Types.STREAM_SEEK_END;
  STGTY_STREAM = Types.STGTY_STREAM;
  LOCK_WRITE = Types.LOCK_WRITE;
  STREAM_SEEK_CUR = Types.STREAM_SEEK_CUR;
  {$Else LINUX}
  STG_E_INVALIDPOINTER = Windows.STG_E_INVALIDPOINTER;
  STG_E_REVERTED = Windows.STG_E_REVERTED;
  STG_E_INVALIDFUNCTION = Windows.STG_E_INVALIDFUNCTION;
  STG_E_CANTSAVE = Windows.STG_E_CANTSAVE;
  STREAM_SEEK_SET = ActiveX.STREAM_SEEK_SET;
  STREAM_SEEK_END = ActiveX.STREAM_SEEK_END;
  STGTY_STREAM = ActiveX.STGTY_STREAM;
  LOCK_WRITE = ActiveX.LOCK_WRITE;
  STREAM_SEEK_CUR = ActiveX.STREAM_SEEK_CUR;
  {$EndIF LINUX}
  {$Else Delphi6}
  STG_E_INVALIDPOINTER = Windows.STG_E_INVALIDPOINTER;
  STG_E_REVERTED = Windows.STG_E_REVERTED;
  STG_E_INVALIDFUNCTION = Windows.STG_E_INVALIDFUNCTION;
  STG_E_CANTSAVE = Windows.STG_E_CANTSAVE;
  RT_RCData = Windows.RT_RCDATA;
  STREAM_SEEK_SET = ActiveX.STREAM_SEEK_SET;
  STREAM_SEEK_END = ActiveX.STREAM_SEEK_END;
  STGTY_STREAM = ActiveX.STGTY_STREAM;
  LOCK_WRITE = ActiveX.LOCK_WRITE;
  STREAM_SEEK_CUR = ActiveX.STREAM_SEEK_CUR;
  {$EndIf Delphi6}

type
  EDoChangedAlreadyDone = class(Exception)
  end;//EDoChangedAlreadyDone

const
 l3_msgAll = 0;
 l3_msgLevel1 = 1;
 l3_msgLevel2 = 2;
 l3_msgLevel3 = 3;
 l3_msgLevel10 = 10;

implementation

uses
  l3String
  ;

// start object Tl3PCharLen

procedure Tl3PCharLen.Init(aSt: PAnsiChar = nil; aLen: Long = -1; aCodePage: Long = CP_ANSI);
  {-}
begin
 S := aSt;
 if (aLen < 0) then
 begin
  if (aCodePage = CP_Unicode) then
   SLen := l3StrLen(PWideChar(S))
  else
   SLen := l3StrLen(S);
 end//aLen < 0
 else
  SLen := aLen;
 SCodePage := aCodePage;
end;

procedure Tl3PCharLen.InitPart(aSt       : PAnsiChar;
                               aStart    : Long;
                               aFinish   : Long;
                               aCodePage : Long);
  {-}
begin
 if (aCodePage = CP_Unicode) then
  S := aSt + aStart * SizeOf(WideChar)
 else
  S := aSt + aStart * SizeOf(ANSIChar);
 if (aFinish > aStart) then
  SLen := aFinish - aStart
 else
  SLen := 0;
 SCodePage := aCodePage;
end;

procedure Tl3PCharLen.Shift(aLen: Integer);
  {-}
begin
 Dec(SLen, aLen);
 if (SLen < 0) then SLen := 0; {-учитываем конечные пробелы}
 MoveS(aLen);
end;

procedure Tl3PCharLen.MoveS(aLen: Integer = 1);
  {-}
begin
 if (SCodePage = CP_Unicode) then
  Inc(S, aLen * SizeOf(WideChar))
 else
  Inc(S, aLen * SizeOf(ANSIChar));
end;

// start object Tl3PCharLenBase

function Tl3PCharLenBase.IsLast(aChar: AnsiChar): Boolean;
  {-}
begin
 if (SLen <= 0) then
  Result := false
 else
 begin
  if (SCodePage = CP_Unicode) then
   Result := (PWideChar(S)[Pred(SLen)] = WideChar(aChar))
  else
   Result := (S[Pred(SLen)] = aChar);
 end;//SLen <= 0
end;

function Tl3PCharLenBase.EQ(const aSt: Tl3PCharLenPrim): Boolean;
  {-}
begin
 Result := (S = aSt.S) AND (SLen = aSt.SLen) AND (SCodePage = aSt.SCodePage);
end;

function Tl3PCharLenBase.Diff(const aSt: Tl3PCharLenPrim): Integer;
  {-}
begin
 Assert(SCodePage = aSt.SCodePage);
 if (SCodePage = CP_Unicode) then
  Result := (S - aSt.S) div 2
 else
  Result := (S - aSt.S);
end;

end.

