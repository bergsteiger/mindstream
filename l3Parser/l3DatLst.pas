unit l3DatLst;
{* Структуры данных. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Бабанин В.Б. © }
{ Модуль: l3DatLst - }
{ Начат: 17.03.1999 11:20 }
{ $Id: l3DatLst.pas,v 1.155 2014/02/14 16:59:31 lulin Exp $ }

// $Log: l3DatLst.pas,v $
// Revision 1.155  2014/02/14 16:59:31  lulin
// - избавляемся от ошибок молодости.
//
// Revision 1.154  2013/07/13 15:08:31  lulin
// - делаем возможность не определять тип, истанцирующий примесь.
//
// Revision 1.153  2013/04/19 14:52:57  lulin
// - портируем.
//
// Revision 1.152  2013/04/04 11:22:01  lulin
// - портируем.
//
// Revision 1.151  2013/04/03 15:28:56  lulin
// - портируем.
//
// Revision 1.150  2012/11/01 14:40:35  kostitsin
// [$407743861]
//
// Revision 1.149  2012/10/31 14:55:37  kostitsin
// переименовал методы Notify на двух интерфейсах
//
// Revision 1.148  2012/06/15 12:26:51  kostitsin
// [$371631792]
//
// Revision 1.147  2012/03/02 09:16:50  voba
// -k:310676394
//
// Revision 1.146  2011/05/18 17:46:00  lulin
// {RequestLink:266409354}.
//
// Revision 1.145  2011/02/16 17:19:17  lulin
// {RequestLink:245206622}.
//
// Revision 1.144  2010/09/28 13:06:11  fireton
// - Распределяем память для _PChar своими средствами
//
// Revision 1.143  2009/12/16 11:44:17  lulin
// - убираем неправильные приведения к своим собственным интерфейсам.
//
// Revision 1.142  2009/12/11 15:56:11  lulin
// {RequestLink:172984520}.
//
// Revision 1.141  2009/12/11 14:14:53  lulin
// {RequestLink:172984520}.
//
// Revision 1.140  2008/11/24 15:30:22  lulin
// - <K>: 121831507.
//
// Revision 1.139  2008/10/27 08:17:30  voba
// - move type TListIndex to l3Types
//
// Revision 1.138  2008/08/04 14:16:34  voba
// - enh. Tl3StringDataList.InsertStrItem не присваивается  пустое значение строки, т к оно там и так пустое
//
// Revision 1.137  2008/03/26 14:59:37  fireton
// - bugfix: корректно освобождаем список с host list
//
// Revision 1.136  2008/03/25 14:19:51  fireton
// - реализуем Empty на дереве
//
// Revision 1.135  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.134  2008/02/22 15:33:45  lulin
// - избавляемся от виртуальности.
//
// Revision 1.133  2008/02/22 12:28:15  lulin
// - cleanup.
//
// Revision 1.132  2008/02/22 12:11:48  lulin
// - при поиске используем типизацию.
//
// Revision 1.131  2008/02/21 12:50:57  lulin
// - упрощаем наследование.
//
// Revision 1.130  2008/02/20 10:47:13  lulin
// - удалена ненужная базовая функция очистки.
//
// Revision 1.129  2008/02/19 18:48:21  lulin
// - удалены ненужные классы.
//
// Revision 1.128  2008/02/19 16:45:41  lulin
// - используем типизацию элементов.
//
// Revision 1.127  2008/02/19 14:58:58  lulin
// - переводим сортировку списков на новые, менее виртуальные, рельсы.
//
// Revision 1.126  2008/02/19 12:48:44  lulin
// - сортировку переводим на новый рельсы.
// - <CQ>: 28467.
//
// Revision 1.125  2008/02/18 16:31:44  lulin
// - подчистил логику списков, связанную с сортированностью и добавлением элемента.
//
// Revision 1.124  2008/02/15 17:04:32  lulin
// - выпилил часть виртуальной функциональности списков.
//
// Revision 1.123  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.122  2008/02/13 13:05:29  lulin
// - cleanup.
//
// Revision 1.121  2008/02/07 19:13:17  lulin
// - избавляемся от излишне универсальных методов базовых списков.
//
// Revision 1.120  2008/02/07 14:44:45  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.119  2008/02/07 08:37:59  lulin
// - каждому базовому объекту по собственному модулю.
//
// Revision 1.118  2008/02/01 16:41:36  lulin
// - используем кошерные потоки.
//
// Revision 1.117  2008/02/01 12:17:52  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.116  2008/01/31 20:10:00  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.115  2008/01/17 13:51:16  lulin
// - подгоняем код под модель.
//
// Revision 1.114  2007/12/25 23:55:57  lulin
// - модуль l3Tree_TLB полностью перенесен на модель.
//
// Revision 1.113  2007/12/24 13:25:49  lulin
// - модуль l3InternalInterfaces полностью перенесен на модель.
//
// Revision 1.112  2007/09/07 12:53:28  lulin
// - удален ненужный параметр.
//
// Revision 1.111  2007/09/06 16:00:36  lulin
// - cleanup.
//
// Revision 1.110  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.109  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.108  2007/07/24 10:23:51  lulin
// - cleanup.
//
// Revision 1.107  2007/03/16 14:47:31  lulin
// - cleanup.
//
// Revision 1.106  2007/01/10 11:06:48  voba
// - cc
//
// Revision 1.105  2007/01/09 10:10:16  voba
// - add  function Tl3StringDataList.AddPCharLen
//
// Revision 1.104  2006/12/29 13:09:27  lulin
// - реализуем интерфейс расширенного списка строк.
//
// Revision 1.103  2006/08/29 11:11:19  fireton
// - добавлен try...finally в Tl3StringDataList.AddStr
//
// Revision 1.102  2006/06/14 10:08:15  fireton
// - bug fix: сортировка обрамлена changing/_changed - раньше сильно тормозило из-за того, что changing/_changed вызывался на каждый _Exchange.
//
// Revision 1.101  2006/05/02 13:40:39  lulin
// - cleanup.
//
// Revision 1.100  2006/05/02 13:11:15  lulin
// - cleanup.
//
// Revision 1.99  2006/05/02 12:55:10  lulin
// - cleanup.
//
// Revision 1.98  2006/05/02 11:51:45  lulin
// - cleanup.
//
// Revision 1.97  2006/05/02 11:29:52  lulin
// - вычищена лишняя процедура сортировки.
//
// Revision 1.96  2006/04/25 09:18:31  voba
// - code clean
//
// Revision 1.95  2006/04/24 12:58:47  lulin
// - выпиливаем из списков общую функциональность.
//
// Revision 1.94  2005/11/23 15:13:42  voba
// - Tl3StringDataList поддерживает Il3HandledStringList
//
// Revision 1.93  2005/11/18 13:26:35  lulin
// - в процедуру конца модификации теперь можно подавать пачку операций.
//
// Revision 1.92  2005/09/12 15:07:13  voba
// - improve использовали реализацию нотификации изменений из l3Notifier.int
//
// Revision 1.91  2005/08/09 15:18:13  voba
// - improve : боролся с NeedAllocStr := False
//
// Revision 1.90  2005/07/28 15:37:10  lulin
// - правки в соответствии с изменениями Вована в интерфейсах нотификаторов.
//
// Revision 1.89  2005/07/28 15:09:33  voba
// - improve : l3ItemStorages_TLB перетащили  в l3Interfaces
// - improve : AddNotifiedObj/DelNotifiedObj переименовли в Subscribe/Unsubscribe для поддержки интерфейса Il3ChangeNotifier
// - improve : Il3ItemNotifyRecipient.Notify добавили параметр aNotifier : Il3ChangeNotifier
//
// Revision 1.88  2005/07/21 14:16:43  lulin
// - интерфейсы для нотификации переехали в модуль базовых интерфейсов.
//
// Revision 1.87  2005/04/25 08:59:33  voba
// - add вывод стека при освобождении указателя
//
// Revision 1.86  2005/04/20 08:40:27  demon
// - new behavior: Если изсменение количества выделенных элементов идет внутри скобок Changing-_Changed, то нотификация вызывается лишь один раз в момент закрытия последней скобки _Changed.
//
// Revision 1.85  2005/03/16 08:36:34  voba
// - bug fix
//
// Revision 1.84  2005/02/11 17:36:03  step
// Tl3ItemsStorage._Changed меняет значение Modified
//
// Revision 1.83  2005/01/24 11:43:23  lulin
// - new behavior: при освобождении заглушки очищаем указатель на нее.
//
// Revision 1.82  2005/01/18 10:29:49  mmorozov
// new: method Tl3ItemsStorage.IsChanging;
//
// Revision 1.81  2004/12/21 11:56:55  lulin
// - убрано ругательное слово.
//
// Revision 1.80  2004/12/06 16:41:40  voba
// no message
//
// Revision 1.79  2004/11/26 09:10:23  voba
// - bug fix: set lfItemModified in InsertStrItem
//
// Revision 1.78  2004/10/26 08:49:10  demon
// - new behavior: собыеие SelectCountChanged вызывается после реального изменения количества выделенных элементов (раньше вызывалось ДО)
//
// Revision 1.77  2004/10/15 12:53:50  lulin
// - new interface: _Il3Window.
//
// Revision 1.76  2004/09/24 15:47:44  lulin
// - выводим в лог ошибку об освобождении указателя.
//
// Revision 1.75  2004/08/06 15:03:28  law
// - избавился от части Warnings/Hints.
//
// Revision 1.74  2004/07/22 10:34:29  voba
// - add property HostDataSize
//
// Revision 1.73  2004/07/12 15:37:08  voba
// -bug fix : при добавлении элемента  два раза добавлялся элемент в массив флагов
//
// Revision 1.72  2004/07/09 07:20:12  law
// - bug fix.
//
// Revision 1.71  2004/06/02 16:42:39  law
// - удален класс Tl3VList.
//
// Revision 1.70  2004/06/02 15:12:10  law
// - конструкторы Make перенесены с _Tl3PVList на _Tl3PtrRecList.
//
// Revision 1.69  2004/06/01 14:23:13  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
//
// Revision 1.68  2004/06/01 13:48:19  law
// - используем _Tl3LongintList.
//
// Revision 1.67  2004/05/27 14:33:46  voba
// - new behavior Notify
//
// Revision 1.66  2004/05/26 14:22:06  law
// - change: скестил "ежа с ужом" (старые деревья с новыми).
//
// Revision 1.65  2004/04/22 08:51:32  law
// - выделяем интерфейс Il3Tree. Промежуточный коммит. В старых проектах ничего разъехаться не должно.
//
// Revision 1.64  2004/04/02 13:59:39  voba
// -rename Add(const aStr : String) -> AddStr(const aStr : String)
//
// Revision 1.63  2004/03/31 16:24:25  law
// -  наведено подобие порядка с StringToPCharAlloc.
//
// Revision 1.62  2004/03/10 16:58:19  fireton
// - мелкая чистка кода
//
// Revision 1.61  2004/03/10 11:41:01  demon
// - new behavior: при изменении SelectCount всем подписчикам поддерживающим Il3SelectCountChangedRecipient рассылается сообщение.
//
// Revision 1.60  2004/03/05 13:09:48  law
// - cleanup.
//
// Revision 1.59  2004/03/05 12:21:08  law
// - new behavior: дерево теперь рассылает нотификацию для Il3NodeNotifyRecipient.
//
// Revision 1.58  2004/03/05 11:56:02  law
// - добавлены префиксы l3.
//
// Revision 1.57  2004/02/09 13:41:48  voba
// -new behavior Flags стала длиной 4 байта
//
// Revision 1.56  2004/01/28 17:03:51  voba
// - code clean
//
// Revision 1.55  2004/01/22 15:35:05  voba
// -new behavior: заменил события onChanging, onChanged на регистрацию рассылки соообщений Il3ChangeRecipient
//
// Revision 1.54  2004/01/20 10:30:04  voba
// -new feature: в SetHostDataList взводим счетчик ссылок
//
// Revision 1.53  2003/12/29 10:04:14  fireton
// no message
//
// Revision 1.52  2003/11/10 14:03:37  voba
// no message
//
// Revision 1.51  2003/11/04 14:04:26  voba
// -add method ChangedDataInderect
//
// Revision 1.50  2003/07/17 17:04:22  voba
// - bug fix: в функцию InsertStrItem вставил проверку на превышение  подаваемого размера данных значения DataSize
//
// Revision 1.49  2003/06/11 15:46:48  voba
// no message
//
// Revision 1.48  2003/06/06 12:26:38  voba
// - improvement _expand all tree
//
// Revision 1.47  2003/06/03 15:35:12  voba
// - rename TStringDataList AddData to Add
//
// Revision 1.46  2003/05/30 12:25:58  law
// - change: константы nt* переехали в модуль l3Types.
//
// Revision 1.45  2003/05/19 16:10:25  voba
// no message
//
// Revision 1.44  2003/04/23 15:33:34  voba
// - bug fix
//
// Revision 1.43  2003/04/16 09:26:55  voba
// - _format code
//
// Revision 1.42  2003/03/26 16:18:52  voba
// -new behavior :Теперь  если листу сказать Modified = False, то этот флажок сбросится у всех элементов.
//
// Revision 1.41  2003/03/12 08:23:59  voba
// -new behavior: при модификации элемента списка список помечается как модифицированный
//
// Revision 1.40  2002/11/10 16:37:56  voba
// - new behavior: StringDataList теперь сам умеет сортироваться
//
// Revision 1.39  2002/07/22 13:54:57  law
// - rename type: TSetBitType -> Tl3SetBitType.
//
// Revision 1.38  2002/07/22 13:47:31  law
// - new methods: Il3Tree.ChangeExpand, Il3Tree.InsertNode.
//
// Revision 1.37  2002/07/02 14:36:13  voba
// -new behavior : добавил процедуру сортировки элементов списка
//
// Revision 1.36  2002/03/25 14:39:23  law
// - cleanup: избавляемся от ненужных регулярных выражений.
//
// Revision 1.35  2001/12/27 15:32:27  law
// - rename proc: l3GetStrLen -> l3StrLen.
//
// Revision 1.34  2001/12/26 08:05:47  voba
// no message
//
// Revision 1.33  2001/11/21 12:12:06  voba
// no message
//
// Revision 1.32  2001/06/27 14:40:12  voba
// - Bug fix : проблемы с sorted
//
// Revision 1.31  2001/06/27 11:59:29  law
// - cleanup: удалены директивы safecall.
//
// Revision 1.30  2001/06/27 07:41:49  voba
// - bug fix: по умолчанию TCustomDataList должен быть не сортирован.
//
// Revision 1.29  2001/06/26 16:28:37  law
// - comments & cleanup.
//
// Revision 1.28  2001/06/26 13:33:53  law
// - comments & cleanup.
//
// Revision 1.27  2001/04/23 11:41:47  voba
// Bug fix
//
// Revision 1.26  2001/04/05 08:52:38  law
// - cleanup: использование модулей WinTypes и WinProcs заменен на Windows.
//
// Revision 1.25  2001/02/21 13:17:10  voba
// no message
//
// Revision 1.24  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  SysUtils,
  Windows,
  Classes,

  l3Interfaces,
  l3Types,
  l3Base,
  //l3ItemStorages_TLB,
  l3ChangeNotifier,
  l3InternalInterfaces,
  l3DataPtrList,
  l3LongintList,
  l3SimpleDataContainer,
  l3NotifyPtrList,
  l3ProtoPersistentDataContainer
  ;

const
  FlagSize = SizeOf(Word);

  lfSelected     = $0001;
  lfSelModified  = $0002;

  lfItemModified = $0004;

type
  El3ListException  = class(Exception);

  TSelectCountChanger = record
                         NeedToNotify: Boolean;
                         OldCount: Long;
                        end;

 _ItemType_ = Pointer;                       
 _l3Sortable_Parent_ = Tl3ProtoPersistentDataContainer{Tl3SimpleDataContainer};
 {$Include l3Sortable.imp.pas}
  _l3ChangingChangedNotifier_Parent_ = _l3Sortable_;
  {$Include l3ChangingChangedNotifier.imp.pas}
  _l3LockedChange_Parent_ = _l3ChangingChangedNotifier_;
  {$Include l3LockedChange.imp.pas}
  Tl3ItemsStorage = class(_l3LockedChange_, Il3ChangeRecipient)
   {* Хранилище элементов. }
    protected
    // property f_ields
      f_SelectCount        : Longint;
      f_SelModifiedCount   : Longint;
      f_LockSelModify      : Integer;
      f_LockModified       : Integer;
      f_Modified           : boolean;
      f_SelectCountChanger : TSelectCountChanger;
    protected
    // internal methods
      function  pm_GetCount : Longint;
        virtual;
        abstract;
        {-}
      procedure pm_SetCount(Value : Longint);
        virtual;
        abstract;
        {-}
      function  SelectCntFix(OldFlag,  NewFlag : Integer) : Integer;
      function  Get_Flags(Index: Longint) : Integer;
        virtual;
        abstract;
      procedure SetFlags(Index: Longint; Value : Integer);
        virtual;
        abstract;
      function  Get_SelectCount : Longint;
        virtual;
      procedure SetSelectCount(aValue : Longint);
        virtual;
      function  Get_SelModifiedCount : Longint;
        virtual;
      procedure SetAllFlag(Mode : Tl3SetBitType; FlagMask : integer);
        virtual;
      procedure Set_Select(Index : Longint; Value : Boolean);
      function  Get_Select(Index : Longint) : Boolean;
        {-}
      procedure Set_Modified(Value : Boolean);
      function  Get_Modified : Boolean;
        {-}
      procedure SetLockModified(Value : Boolean);
      function  GetLockModified : Boolean;
        {-}
      procedure SelectCountChanged(anOldCount, aNewCount : Long);
        {-}
      function NeedSelectCountNotify: Boolean;
        {-}
      procedure DropSelectCountChanger;
        {-}
      function GetEmpty: Boolean;
        override;
    public
    // public methods
      function ItemSlot(anIndex: Integer): PItemType; virtual; abstract;
      procedure ItemChangeNotify;   {External notify}
      procedure AllSelect(Mode :  Tl3SetBitType);
      procedure Clear;
        virtual;
        {-}
      procedure ResetSelection;
        virtual;
        {-}
      property Flags[Index: Longint] : Integer
        read Get_Flags
        write SetFlags;
        {-}
      property Select[Index: Longint] : Boolean
        read Get_Select
        write Set_Select;
        {-}
      procedure LoadFromFile(const FileName: string);
      procedure SaveToFile(const FileName: string);
        {-}
      procedure LoadFromStream(Stream: TStream);
        reintroduce;
        virtual;
        abstract;
        {-}
      procedure SaveToStream(Stream: TStream);
        reintroduce;
        virtual;
        abstract;
        {-}
      function IsChanging : Boolean;
        {* - дерево находится в фазе обновления. }
      procedure FireChanged;
        override;
        {-}
      procedure SetLockSelModify(Value : Boolean);
      procedure LockSelModify;
      procedure UnLockSelModify;
      function  IsLockSelModify : Boolean;
        {-}
    public
    // public properties
      property SelectCount: Longint
        read Get_SelectCount;
        {-}
      property SelModifiedCount: Longint
        read Get_SelModifiedCount;
        {-}
      property LockModifiedFlag: Boolean
        write SetLockSelModify;
        {-}
      property LockModified: boolean
        read GetLockModified
        write SetLockModified;
        {* - предотвращает выставление флага lfItemModified у изменяемых элементов}
      property Modified: boolean
        read Get_Modified
        write Set_Modified;
        {* - признак изменения структуры данных. }
      property Count : Longint
        read pm_GetCount
        write pm_SetCount;
        {-}
  end;//Tl3ItemsStorage

  Tl3CustomDataList = class(Tl3ItemsStorage, Il3ItemNotifyRecipient)
    protected
    // property f_ields
      f_List           : Tl3DataPtrList;
      f_DataSize       : Word;
      f_SortIndex     : Tl3SortIndex;
      f_HostDataList   : Tl3CustomDataList;
      f_LastSurKey     : Longint;    // Next Surrogate key
      f_OnCompareItems : Tl3OnCompareItems;
    protected
    // internal methods
      function  AllocItem : PAnsiChar;
      procedure DestroyItem(Index : Longint);
        virtual;
      function  InsertItem(aIndex    : TListIndex;
                           aData     : PAnsiChar;
                           aDataSize : Word = 0) : TListIndex;
        virtual;
      function  InsertHostItem(Index     : Longint ;
                               HostIndex : Longint) : Longint;
        virtual;
      function  GetData(Index: Longint) : PAnsiChar;
        virtual;
      function  GetDataInt(anIndex: Longint) : Longint;
        virtual;
      procedure SetData(Index: Longint; Value : PAnsiChar);
        virtual;
      procedure SetDataInt(anIndex: Longint; aValue : Longint);
        virtual;
      function  GetSelfData(Index: Longint) : PAnsiChar;
      procedure SetSelfData(aIndex: Longint; Value : PAnsiChar);
      function  GetHostDataSize : Word;
      function  Get_Flags(Index: Longint) : Integer;
        override;
      procedure SetFlags(Index: Longint; Value : Integer);
        override;
      procedure SetDataSize(Value : Word);
        virtual;
      function  GetDataSize : Word;
      function  DoGetSortIndex: Tl3SortIndex;
        override;
      procedure DoSetSortIndex(Value: Tl3SortIndex);
        override;
        {-}
      procedure SetHostDataList(aValue : Tl3CustomDataList);
        {-}
      function  pm_GetCount : Longint;
        override;
        {-}
      procedure pm_SetCount(Value : Longint);
        override;
        {-}
      function  ExtDataSize : Word;
        virtual;
        {-}
      procedure ItemNotify(const aNotifier : Il3ChangeNotifier;
                       aOperation      : Integer;
                       aIndex          : Longint);
        virtual;
      procedure Il3ItemNotifyRecipient.Notify = ItemNotify;
        {-}
      function  FindHostItemPlace(Index : Longint) : Longint;
        virtual;
        {-}
      procedure Release;
        override;
        {-}
      function  DoCompare(I, J : Longint) : Longint;
        virtual;
        {-}
    public
    // public methods
      procedure FireChanging;
        override;
      procedure FireChanged;
        override;
        {-}
      function  Add(P : Pointer) : Longint;
        overload;
        virtual;
        {-}
      procedure Insert(aIndex    : TListIndex;
                       P         : Pointer;
                       aDataSize : Word = 0);
        reintroduce;
        virtual;
        {-}
      procedure Clear;
        override;
        {-}
      procedure ClearItem(Index : Longint);
        {-}
      procedure Delete(Index: Longint);
        reintroduce;
        virtual;
        {-}
      procedure Swap(Index1, Index2 : Longint);
        reintroduce;
        {-}
      procedure Move(CurIndex, NewIndex : Longint);
        reintroduce;
        virtual;
        {-}
      procedure Sort;
        override;
        {-}
      procedure SortF(aCompareAction : Tl3CompareAction);
        {-}
      procedure ChangedDataInderect(aIndex : Longint);
       { - следует вызывать при смене данных "напрямую", иначе не придет Notify подписанным объектам}
      function  IndexOfData(var SrchData;
                            SrchDataSize   : Word;
                            SrchDataOffset : Word = 0) : Longint;
      function  IndexOfSelfData(var SrchData;
                                SrchDataSize   : Word;
                                SrchDataOffset : Word = 0) : Longint;

      procedure LoadFromStream(Stream: TStream);
        override;
      procedure SaveToStream(Stream: TStream);
        override;
        {-}
      function  GetNextSurrogateKey : Longint;
        {-}
      constructor Create;
        reintroduce;
        virtual;
        {-}
      constructor CreateSize(DSize : Word);
        {-}
      property DataSize : Word
        read GetDataSize
        write SetDataSize;
        {-}
      property Data[Index: Longint] : PAnsiChar
        read GetData
        write SetData;
        {-}
      property DataInt[anIndex: Longint] : Longint
        read GetDataInt
        write SetDataInt;
        {-}
      property SelfData[Index: Longint] : PAnsiChar
        read GetSelfData
        write SetSelfData;
        {-}
      property HostDataList : Tl3CustomDataList
        read f_HostDataList
        write SetHostDataList;
        {-}
      property HostDataSize : Word
        read GetHostDataSize;
        {-}
      property  OnCompareItems : Tl3OnCompareItems
        read f_OnCompareItems
        write f_OnCompareItems;
        {-}
  end;//Tl3CustomDataList

  Tl3DataList = class(Tl3CustomDataList)
    public
    // public methods
      property Data;
        Default;
        {-}
  end;//Tl3DataList

  Tl3StringDataList = class(Tl3CustomDataList, Il3HandledStringList)
    protected
    // property f_ields
      f_NeedAllocStr       : Boolean;
      f_NeedDisposeStr     : Boolean;
      f_FullAssignStrList  : Boolean;
    protected
    // internal methods
      function  ExtDataSize : Word;
        override;
      function  GetItemString(Index: Longint) : PAnsiChar;
        virtual;
      function  GetItemPCharLen(anIndex: Longint) : Tl3PCharLen;

      function  GetItemPasStr(Index: Longint) : String;
        virtual;

      procedure SetItemString(Index: Longint; Value : PAnsiChar);
        virtual;
      procedure SetItemPCharLen(anIndex: Long; const anItem: Tl3PCharLen);

      procedure SetItemPasStr(aIndex: Longint; const aValue : String);
        virtual;

      function Il3HandledStringList.pm_GetItems = GetItemPCharLen;
      procedure Il3HandledStringList.pm_SetItems = SetItemPCharLen;

      function  Il3HandledStringList.pm_GetHandle = GetDataInt;
      procedure Il3HandledStringList.pm_SetHandle = SetDataInt;

      procedure DestroyItem(aIndex : TListIndex);
        override;
      function  InsertStrItem(aIndex : Longint; aStr : PAnsiChar; aData : PAnsiChar; aDataSize : Word) : TListIndex;
        virtual;
      function  FindHostItemPlace(Index : Longint) : Longint;
        override;
      function  DoCompare(I, J : Longint) : Longint;
        override;
      procedure SetNeedAllocStr(aValue : Boolean);
    public
      constructor Create;
        override;
      procedure AssignTo(Dest: TPersistent);
        override;
      procedure WriteItem(WPtr : PAnsiChar; aStr : PAnsiChar; aData : PAnsiChar);
      function  Add(P : Pointer) : Longint;
       override;
        {-}
      function  AddStr(const aStr : String; aData : PAnsiChar = nil; aDataSize : word = 0) : TListIndex;
       //override;
        {-}
      function AddPCharLen(const aStr : Tl3PCharLen; aData : PAnsiChar = nil; aDataSize : word = 0) : TListIndex;
        {-}
      function  Add(aStr : PAnsiChar; aData : PAnsiChar; aDataSize : word = 0) : TListIndex;
       overload;
       virtual;
        {-}
      procedure Insert(aIndex : TListIndex; P : Pointer; aDataSize : word = 0);
       override;
        {-}
      function  InsertData(aIndex : TListIndex; aStr : PAnsiChar; aData : PAnsiChar) : TListIndex;
        virtual;
        {-}
      function  InsertStrData(aIndex : TListIndex; const aStr : String; aData : PAnsiChar) : TListIndex;
        virtual;
        {-}
      function  FindStr(aStr : PAnsiChar; Var Ind : Longint) : Boolean;
      function  FindStrBegin(aStr : PAnsiChar; Var Ind : Longint) : Boolean;
        {-}
      procedure Assign(Source: TPersistent);
        override;
        {-}
      property FullAssignStrList : Boolean
        read f_FullAssignStrList
        write f_FullAssignStrList
        default True;
        {-}
      property NeedAllocStr : Boolean
        read f_NeedAllocStr
        write SetNeedAllocStr;
        {-}
      property NeedDisposeStr : Boolean
        read f_NeedDisposeStr
        write f_NeedDisposeStr
        default True;
        {-}
      property Strings[Index: Longint] : PAnsiChar
        read GetItemString
        write SetItemString;
        default;
        {-}
      property PasStr[Index: Longint] : String
        read GetItemPasStr
        write SetItemPasStr;
        {-}
  end;//Tl3StringDataList

implementation

uses
  l3Const,
  l3MinMax,
  l3String,
  l3Stream
  ;

function DoCompareItems(const A: _ItemType_;
  const B: _ItemType_;
  aSortIndex: Tl3SortIndex
  {$IfDef l3Items_CompareItemsRec_NeedsRList}
  ;
  aList: _l3Sortable_
  {$EndIf l3Items_CompareItemsRec_NeedsRList}
  ): Integer;
(*var
 l_CI : CompareItemsRec;*)
begin
 Assert(False, 'Недоделано');
 Result := -1;
(* Assert(aList Is _l3Items_);
 l_CI.rA := _l3Items_(aList).ItemSlot(A);
 l_CI.rB := _l3Items_(aList).ItemSlot(B);
 l_CI.rSortIndex := aSortIndex;
 l_CI.rList := aList;
 Result := CompareExistingItems(l_CI);*)
end;

type _Instance_R_ = Tl3ItemsStorage;

{$Include l3Sortable.imp.pas}

{$Include l3ChangingChangedNotifier.imp.pas}

{$Include l3LockedChange.imp.pas}

type
 PPChar = ^PAnsiChar;

{Tl3ItemsStorage}

Function Tl3ItemsStorage.SelectCntFix(OldFlag, NewFlag : Integer) : Integer;
 {implement in SetFlags}
 begin
  if f_LockSelModify > 0
   then Result := NewFlag
   else Result := (NewFlag and not lfSelModified) or (OldFlag and lfSelModified);
  if ((NewFlag and lfSelected) = (OldFlag and lfSelected)) then Exit;

  if (NewFlag and lfSelected) = 0
   then SetSelectCount(f_SelectCount - 1)
   else SetSelectCount(f_SelectCount + 1);

  if f_LockSelModify > 0 then Exit;
  Result := Result xor lfSelModified;

  if Result and lfSelModified <> 0
   then Inc(f_SelModifiedCount)
   else Dec(f_SelModifiedCount);
 end;

procedure Tl3ItemsStorage.Set_Select(Index : Longint; Value : Boolean);
  begin
   if Value
    then
     Flags[Index] := Flags[Index] or lfSelected
    else
     Flags[Index] := Flags[Index] and not lfSelected
   {Flg := Flags[Index];
   if ((Flg and lfSelected) <> 0)  = Value then Exit;
   if Value
    then
     begin
      Flg:=Flg or lfSelected;
      Inc(FSelectCount);
     end
    else
     begin
      Flg:=Flg and Not lfSelected;
      Dec(FSelectCount);
     end;
   if Not LockModifiedFlag then
    begin
     Flg:=Flg xor lfSelModified;
     if Flg and lfSelModified <> 0
      then Inc(FSelModifiedCount)
      else Dec(FSelModifiedCount);
    end;
   Flags[Index] := Flg; }
  end;

procedure Tl3ItemsStorage.ResetSelection;
 var
  lFlags : Integer;
 begin
  lFlags := 0;
  if f_SelectCount > 0
   then lFlags := lFlags or lfSelected;

  if f_SelModifiedCount > 0
   then lFlags := lFlags or lfSelModified;

  if lFlags = 0 then exit;

  LockSelModify;
  Try
   SetAllFlag(sbDeselect, lFlags {lfSelected or lfSelModified});
  finally
   UnLockSelModify;
  end;
  SetSelectCount(0);
  f_SelModifiedCount := 0;
 end;

procedure Tl3ItemsStorage.AllSelect(Mode : Tl3SetBitType);
 begin
  SetAllFlag(Mode, lfSelected);
 end;

procedure Tl3ItemsStorage.SetAllFlag(Mode : Tl3SetBitType; FlagMask : integer);
 Var
  I : Longint;
 begin
  Case Mode of
   sbSelect   : for I:=0 to Pred(Count) do Flags[I] := Flags[I] or FlagMask;
   sbDeselect : for I:=0 to Pred(Count) do Flags[I] := Flags[I] and not FlagMask;
   sbInvert   : for I:=0 to Pred(Count) do Flags[I] := Flags[I] xor FlagMask;
  end;
 end;

function Tl3ItemsStorage.Get_SelectCount : Longint;
 begin
  Result := f_SelectCount;
 end;

procedure Tl3ItemsStorage.SetSelectCount(aValue : Longint);
var
 l_OldCount: LongInt;
begin
 if f_SelectCount <> aValue then
 begin
  l_OldCount := f_SelectCount;
  f_SelectCount := aValue;
  if not IsChanging then
   SelectCountChanged(l_OldCount, f_SelectCount)
  else
   if not NeedSelectCountNotify then
    with f_SelectCountChanger do
    begin
     NeedToNotify := True;
     OldCount := l_OldCount;
    end;
 end;
end;

function Tl3ItemsStorage.Get_SelModifiedCount : Longint;
 begin
  Result := f_SelModifiedCount;
 end;

{procedure Tl3ItemsStorage.SetSelModifiedCount(Value : Longint);
 begin
  fSelModifiedCount := Value;
 end;}

function Tl3ItemsStorage.Get_Select(Index : Longint) : Boolean;
 begin
  Result:=(Flags[Index] and lfSelected) <> 0;
 end;

procedure Tl3ItemsStorage.Clear;
 begin
  Count             := 0;
  SetSelectCount(0);
  f_SelModifiedCount := 0;
 end;

procedure Tl3ItemsStorage.Set_Modified(Value : Boolean);
 begin
  if LockModified or (f_Modified = Value) then Exit;

  f_Modified := Value;
  if Not f_Modified then
   SetAllFlag(sbDeselect, lfItemModified);
 end;

function  Tl3ItemsStorage.Get_Modified : Boolean;
 begin
  Result := f_Modified;
 end;

procedure Tl3ItemsStorage.SetLockSelModify(Value : Boolean);
 begin
  if Value
   then LockSelModify
   else UnLockSelModify;
 end;

procedure Tl3ItemsStorage.LockSelModify;
 begin
  Inc(f_LockSelModify);
 end;

procedure Tl3ItemsStorage.UnLockSelModify;
 begin
  Dec(f_LockSelModify);
 end;

function Tl3ItemsStorage.IsLockSelModify : Boolean;
 begin
  Result := f_LockSelModify > 0;
 end;

procedure Tl3ItemsStorage.SetLockModified(Value : Boolean);
 begin
  if Value
   then Inc(f_LockModified)
   else Dec(f_LockModified);
 end;

(*
procedure Tl3ItemsStorage.SetOnChange(Value : TNotifyEvent);
 begin
  fOnChange := Value;
 end;

procedure Tl3ItemsStorage.SetOnChanging(Value : TNotifyEvent);
 begin
  fOnChanging := Value;
 end;
*)

function  Tl3ItemsStorage.GetLockModified : Boolean;
 begin
  Result := f_LockModified > 0;
 end;

procedure Tl3ItemsStorage.SelectCountChanged(anOldCount, aNewCount : Long);
  {-}
var
 l_Index     : Integer;
 l_Recipient : Il3SelectCountChangedRecipient;
begin
 if anOldCount <> aNewCount then
  if (NotifiedObjList <> nil) and
     (NotifiedObjList.Count > 0) then
   for l_Index := 0 to Pred(NotifiedObjList.Count) do
    if Supports(IUnknown(NotifiedObjList.Items[l_Index]), Il3SelectCountChangedRecipient, l_Recipient) and
       (NotifiedObjList.Items[l_Index] = l_Recipient) then
     try
      l_Recipient.SelectCountChanged(anOldCount, aNewCount);
     finally
      l_Recipient := nil;
     end;//try.finally
end;

function Tl3ItemsStorage.NeedSelectCountNotify: Boolean;
  {-}
begin
 Result := f_SelectCountChanger.NeedToNotify;
end;

procedure Tl3ItemsStorage.DropSelectCountChanger;
  {-}
begin
 l3FillChar(f_SelectCountChanger, SizeOf(f_SelectCountChanger), 0);
end;

function Tl3ItemsStorage.IsChanging : Boolean;
{* - дерево находится в фазе обновления. }
begin
 Result := ChangeCount > 0;
end;

procedure Tl3ItemsStorage.FireChanged;
begin
(* if (ChangeCount = 1) then //!!Dec в inherited
 begin*)
  Modified := True;
  Inherited;
  if NeedSelectCountNotify then
  begin
   SelectCountChanged(f_SelectCountChanger.OldCount, f_SelectCount);
   DropSelectCountChanger;
  end;
(* end
 else
  Inherited;*)
end;

function Tl3ItemsStorage.GetEmpty: Boolean;
begin
 Result := (Count = 0);
end;

procedure Tl3ItemsStorage.ItemChangeNotify;
begin
 Changing;
 Changed;
end;

procedure Tl3ItemsStorage.LoadFromFile(const FileName: string);
var
 Stream: TStream;
begin
 Stream := Tl3FileStream.Create(FileName, l3_fmRead);
 try
  LoadFromStream(Stream);
 finally
  Stream.Free;
 end;
end;

procedure Tl3ItemsStorage.SaveToFile(const FileName: string);
var
 Stream: TStream;
begin
 Stream := Tl3FileStream.Create(FileName, l3_fmWrite);
 try
  SaveToStream(Stream);
 finally
  Stream.Free;
 end;
end;

{Tl3CustomDataList}
constructor Tl3CustomDataList.Create;
begin
 inherited;
 f_SortIndex := l3_siUnsorted;
 f_List := Tl3DataPtrList.Make;
end;

constructor Tl3CustomDataList.CreateSize(DSize : Word);
begin
 Create;
 SetDataSize(DSize);
end;

procedure Tl3CustomDataList.Release;
begin
 CallNotify(ntFree, 0);
 Inherited;

 if Assigned(f_HostDataList) then
 begin
  f_HostDataList.Unsubscribe(Il3ItemNotifyRecipient(Self));
  SetHostDataList(nil);
 end;

 if f_List <> nil then
 begin
  Clear;
  l3Free(f_List);
 end;
end;

procedure Tl3CustomDataList.FireChanging;
begin
 {if (ChangeCount = 0) then }CallNotify(ntChanging,0);
 inherited;
end;

procedure Tl3CustomDataList.FireChanged;
begin
 inherited;
 {if (ChangeCount = 0) then }CallNotify(ntChanged,0);
end;

procedure Tl3CustomDataList.ChangedDataInderect(aIndex : Longint);
begin
 CallNotify(ntChangeItemData, aIndex);
end;

function Tl3CustomDataList.AllocItem : PAnsiChar;
begin
 l3System.GetLocalMemZ(Result, DataSize+ExtDataSize);
end;

procedure Tl3CustomDataList.DestroyItem(Index : Longint);
begin
 try
 l3System.FreeLocalMem(f_List.ItemSlot(Index)^);
 except
 end;
end;

Function Tl3CustomDataList.InsertHostItem(Index : Longint; HostIndex : Longint) : Longint;
Var
 NewPtr : PAnsiChar;
 HostPtr : PAnsiChar;
begin
 Changing;
 Try
  HostPtr:= f_HostDataList.f_List[HostIndex];
  NewPtr := AllocItem;
  StrMove(NewPtr + ExtDataSize - SizeOf(Pointer), @HostPtr, SizeOf(Pointer));
  if Index = Count then
   f_List.Add(Pointer(NewPtr))
  else
   f_List.Insert(Index,Pointer(NewPtr));
  Result := Index;
  //CallNotify(ntInsert{dlAdd},Index); HOST ПОШЛЕТ
 finally
  Changed;
 end;
end;

function Tl3CustomDataList.InsertItem(aIndex : TListIndex; aData : PAnsiChar; aDataSize : Word = 0) : TListIndex;
var
 NewPtr : PAnsiChar;
begin
 Changing;
 try
  NewPtr := AllocItem;

  if aDataSize = 0 then
   aDataSize := DataSize
  else
   aDataSize := Min(aDataSize, DataSize);

  StrMove(NewPtr + ExtDataSize, aData, aDataSize);
  if aIndex = Count then
   f_List.Add(Pointer(NewPtr))
  else
   f_List.Insert(aIndex,Pointer(NewPtr));
  Result := aIndex;
  if Not LockModified then Flags[Result] := Flags[Result] or lfItemModified;
  CallNotify(ntInsert{dlAdd},aIndex);
 finally
  Changed;
 end;
end;

procedure Tl3CustomDataList.ClearItem(Index : Longint);
begin
 if Assigned(f_HostDataList) then
  f_HostDataList.ClearItem(Index)
 else
 begin
  Changing;
  try
   CallNotify(ntClearItem,Index);
   DestroyItem(Index);
   f_List[Index] := Nil;
  finally
   Changed;
  end;//try..finally
 end;//Assigned(f_HostDataList)
end;

function Tl3CustomDataList.Add(P : Pointer): Longint;
begin
 Result := InsertItem(Count, P);
end;

procedure Tl3CustomDataList.Clear;
var
 I: Longint;
begin
 if Count = 0 then Exit;
 Changing;
 try
  CallNotify(ntClear,Count);
  for I := 0 to Count - 1 do
   try
    DestroyItem(I);
   except
   end;//try..except
  f_List.Clear;
  //CallNotify(ntClear,0);
  inherited;
 finally
  Changed;
 end;//try..finally
end;

procedure Tl3CustomDataList.Delete(Index: Longint);
begin
 if Assigned(f_HostDataList) then
  f_HostDataList.Delete(Index)
 else
 begin
  Changing;
  try
   CallNotify(ntDelete,Index);
   try
    DestroyItem(Index);
   except
   end;//try..except
   f_List.Delete(Index);
  finally
   Changed;
  end;//try..finally
 end;//Assigned(f_HostDataList)
end;

procedure Tl3CustomDataList.Swap(Index1, Index2: Longint);
begin
 Changing;
 try
  f_List.Exchange(Index1, Index2);
 finally
  Changed;
 end;
end;

function Tl3CustomDataList.GetSelfData(Index: Longint) : PAnsiChar;
begin
 Result:=PAnsiChar(f_List[Index]);
 if Result <> nil then
  Result:=Result + ExtDataSize;
 {if Assigned(FHostDataList) then Result:=Result+SizeOf(Pointer);}
end;

procedure Tl3CustomDataList.SetSelfData(aIndex: Longint; Value : PAnsiChar);
var
 LP : PAnsiChar;
begin
 LP := f_List[aIndex];
 if not Assigned(LP) then
 begin
  LP := AllocItem;
  f_List[aIndex] := LP;
 end;
 StrMove(LP+ExtDataSize, Value, DataSize);
 if Not LockModified then
  Flags[aIndex] := Flags[aIndex] or lfItemModified;
 CallNotify(ntChangeItemData, aIndex);
end;

function Tl3CustomDataList.GetData(Index: Longint) : PAnsiChar;
var
 HDL : Tl3CustomDataList;
begin
 Result:=PAnsiChar(f_List[Index]);
 if Result = nil then Exit;

 Result:=Result+ExtDataSize;

 HDL:=HostDataList;
 While Assigned(HDL) do
 begin
  Result:=PPChar(Result - SizeOf(Pointer))^;
  Result:=Result+HDL.ExtDataSize;
  HDL:=HDL.HostDataList;
 end;
end;

function Tl3CustomDataList.GetDataInt(anIndex: Longint) : Longint;
var
 lPtr : PAnsiChar;
begin
 Result := 0;
 if DataSize = 0 then
 begin
  lPtr := Data[anIndex];
  if lPtr <> nil then
   StrMove(@Result, lPtr, Min(4, GetHostDataSize));
 end
 else
 begin
  lPtr := SelfData[anIndex];
  if lPtr <> nil then
   StrMove(@Result, lPtr, Min(4, DataSize));
 end;
end;

procedure Tl3CustomDataList.SetDataInt(anIndex: Longint; aValue : Longint);
begin
 if DataSize = 0 then
  SetData(anIndex, @aValue)
 else
  SetSelfData(anIndex, @aValue);
end;

function  Tl3CustomDataList.GetHostDataSize : Word;
var
 HDL : Tl3CustomDataList;
begin
 HDL := Self;
 While Assigned(HDL.f_HostDataList) do
  HDL := HDL.HostDataList;
 Result := HDL.DataSize;
end;

procedure Tl3CustomDataList.SetData(Index: Longint; Value : PAnsiChar);
begin
 if Assigned(f_HostDataList) then
  f_HostDataList.SetData(Index, Value)  // wrong if another sort
 else SetSelfData(Index,Value);
end;

function Tl3CustomDataList.GetNextSurrogateKey : longint;
begin
 Inc(f_LastSurKey);
 Result := f_LastSurKey;
end;

function  Tl3CustomDataList.IndexOfData(Var SrchData; SrchDataSize : Word; SrchDataOffset : Word) : Longint;
var
 I : Longint;
begin
 Result := -1;
 Assert(SrchDataSize + SrchDataOffset <= GetHostDataSize, 'Размер данных для поиска слишком велик');

 for I := 0 to Count - 1 do
  if CompareMem(@SrchData, Data[I] + SrchDataOffset, SrchDataSize) {= 0} then
  begin
   Result := I;
   Break;
  end;
end;

function  Tl3CustomDataList.IndexOfSelfData(Var SrchData; SrchDataSize : Word; SrchDataOffset : Word) : Longint;
var
 I : Longint;
begin
 Result := -1;
 Assert(SrchDataSize + SrchDataOffset <= DataSize, 'Размер данных для поиска слишком велик');

 for I := 0 to Count - 1 do
  if CompareMem(@SrchData, SelfData[I] + SrchDataOffset, SrchDataSize) {= 0} then
  begin
   Result := I;
   Break;
  end;
end;

procedure Tl3CustomDataList.LoadFromStream(Stream: TStream);
begin
 {....}
end;

procedure Tl3CustomDataList.SaveToStream(Stream: TStream);
begin
 {....}
end;

function  Tl3CustomDataList.Get_Flags(Index: Longint) : Integer;
begin
 try
  Result := PWord(f_List[Index])^;
 except
  Result := 0;
 end;
end;

procedure Tl3CustomDataList.SetFlags(Index: Longint; Value : Integer);
var
 LP : PAnsiChar;
begin
 LP := f_List[Index];
 Value := SelectCntFix(PWord(f_List[Index])^, Value);
 if (Value and lfItemModified) <> 0 then
  Modified := True;
 if Assigned(LP) then StrMove(LP, @Value, FlagSize);
end;

procedure Tl3CustomDataList.SetDataSize (Value : Word);
var
 SaveHDL : Tl3CustomDataList;
begin
 if f_DataSize=Value then Exit;
 Clear;
 f_DataSize:=Value;
 if Assigned(f_HostDataList) then
 begin
  SaveHDL:=f_HostDataList;
  HostDataList:=Nil;
  HostDataList:=SaveHDL;
 end;
end;

function  Tl3CustomDataList.GetDataSize : Word;
begin
 Result:=f_DataSize;
 {if Assigned(f_HostDataList) then Inc(Result,4);}
end;

function  Tl3CustomDataList.ExtDataSize : Word;
begin
 Result:=FlagSize;
 if f_HostDataList <> nil then
  Inc(Result,SizeOf(Pointer));
end;

function  Tl3CustomDataList.pm_GetCount : Longint;
begin
 Result:=f_List.Count;
end;

procedure Tl3CustomDataList.pm_SetCount(Value : Longint);
begin
 if (f_HostDataList = nil) and (Count <> Value) then
 begin
  f_List.Count:=Value;
  CallNotify(ntCountChange,Value);
 end;
end;

function Tl3CustomDataList.DoGetSortIndex: Tl3SortIndex;
 //override;
 {-}
begin
 Result := f_SortIndex;
end;

procedure Tl3CustomDataList.DoSetSortIndex(Value: Tl3SortIndex);
 //override;
 {-}
begin
 f_SortIndex := Value;
end;

procedure Tl3CustomDataList.SetHostDataList(aValue : Tl3CustomDataList);
var
 I      : Longint;
begin
 if f_HostDataList = aValue then Exit;
 Changing;
 Try
  if Assigned(f_HostDataList)
   then f_HostDataList.Unsubscribe(Il3ItemNotifyRecipient(Self));
  Clear;
  l3Set(f_HostDataList, aValue);
  if Assigned(f_HostDataList) then
  begin
   f_List.Capacity := f_HostDataList.Count;

   for I := 0 to Pred(f_HostDataList.Count) do
    InsertHostItem(Count, I);
   f_HostDataList.Subscribe(Il3ItemNotifyRecipient(Self));
   {Предупредить Host o новом User'e}
   Sorted := f_HostDataList.Sorted; {Time Patch}
  end
  else
   f_List.Clear;
 finally
  Changed;
 end;
end;

function Tl3CustomDataList.FindHostItemPlace(Index : Longint) : Longint;
begin
 Result:=Count;
 {if Sorted then }
end;

procedure Tl3CustomDataList.ItemNotify(const aNotifier : Il3ChangeNotifier;
                                   aOperation      : Integer;
                                   aIndex          : Longint);
var
 NewPtr,
 HostPtr : PAnsiChar;
 I, Cnt  : Longint;
 lNeedSendNotify : Boolean;

begin
 lNeedSendNotify := True;

 Case aOperation of
  //dlAdd,
  ntInsert      : begin
                   Changing;
                   Try
                    I:=FindHostItemPlace(aIndex);
                    InsertHostItem(I, aIndex);
                   finally
                    Changed;
                   end;
                  end;

  {dlInsert : begin end;}

  ntDelete      : begin
                   Changing;
                   Try
                    CallNotify(ntDelete,aIndex);
                    lNeedSendNotify := False;
                    DestroyItem(aIndex);
                    {if Ind >=0 then } f_List.Delete(aIndex);
                   finally
                    Changed;
                   end;
                  end;

  ntClearItem   : begin
                   Changing;
                   Try
                    CallNotify(ntClearItem,aIndex);
                    lNeedSendNotify := False;
                    DestroyItem(aIndex);
                    f_List[aIndex] := Nil;
                   finally
                    Changed;
                   end;
                  end;

  ntChanging    : begin
                   Changing;
                  end;

  ntChanged     : begin
                   Changed;
                  end;

  ntChangeItemData : begin
                      NewPtr := f_List[aIndex];
                      if Not Assigned(NewPtr) then
                      begin
                       NewPtr := AllocItem;
                       f_List[aIndex] := NewPtr;
                      end;

                      HostPtr:= f_HostDataList.f_List[aIndex];
                      StrMove(NewPtr + ExtDataSize - SizeOf(Pointer),@HostPtr, SizeOf(Pointer));

                      //CallNotify(ntChangeItemData,aIndex);
                     end;

  ntCountChange : begin
                   if Count < aIndex then
                   begin
                    Cnt := Count;
                    for I:=Cnt to Pred(aIndex) do
                     begin
                      NewPtr := AllocItem;
                      HostPtr:= f_HostDataList.f_List[I];
                      StrMove(NewPtr + ExtDataSize - SizeOf(Pointer),@HostPtr, SizeOf(Pointer));
                      f_List.Add(Pointer(NewPtr));
                     end;
                   end
                   else
                    Count := aIndex;
                   CallNotify(ntCountChange,aIndex);
                   lNeedSendNotify := False;
                   Changing;
                   Changed;
                  end;

  ntClear       : Clear;

  ntFree        : SetHostDataList(Nil);
 end;

if lNeedSendNotify then
 CallNotify(aOperation, aIndex);
end;

function Tl3CustomDataList.DoCompare(I, J : Longint) : Longint;
begin
 if Assigned(f_OnCompareItems) then
  Result := f_OnCompareItems(I, J)
 else
  Result := -1;
end;

procedure Tl3CustomDataList.Sort;

 function _Compare(I, J: Integer): Integer;
 begin
  Result := DoCompare(I, J);
 end;

begin
 SortF(l3LocalStub(@_Compare));
end;

procedure Tl3CustomDataList.SortF(aCompareAction : Tl3CompareAction);

 procedure QuickSort(iL, iR : Longint);
  var
   L, R, M : Integer;
  begin//QuickSort
   repeat
    L := iL ;
    R := iR ;
    M := (L + R) div 2;

    repeat
     while aCompareAction(L, M) < 0 do
      Inc(L);
     while aCompareAction(M, R) < 0 do
      Dec(R);

     if (L <= R) then
     begin
      Swap(L, R);
      if (M = L) then
       M := R
      else
      if (M = R) then
       M := L;
      Inc(L);
      Dec(R);
     end;//L <= R
    until (L > R);

    if (R - iL) > (iR - L) then
    begin {Sort left here}
     if L < iR then
      QuickSort(L, iR);
     iR := R;
    end//(R - iL) > (iR - L)
    else
    begin
     if iL < R then
      QuickSort(iL, R);
     iL := L;
    end;//(R - iL) > (iR - L)
   until (iL >= iR);
  end;//QuickSort

var
 l_A : Pointer absolute aCompareAction;
begin
 try
  if f_List.Count > 1 then
  begin
   Changing;
   try
    QuickSort(0, Pred(f_List.Count));
   finally
    Changed;
   end;
  end;
 finally
  l3FreeLocalStub(l_A);
 end;
end;

procedure Tl3CustomDataList.Move(CurIndex, NewIndex : Longint);
begin
 if Not Assigned(f_HostDataList) then
 begin
  f_List.Move(CurIndex, NewIndex);
  //и детей предупредить надо
 end;
end;

procedure Tl3CustomDataList.Insert(aIndex : TListIndex; P : Pointer; aDataSize : word = 0);
begin
 InsertItem(aIndex, P, aDataSize);
end;

 {Tl3StringDataList}

constructor Tl3StringDataList.Create;
begin
 inherited;
 {FNeedAllocStr:=True;}
 f_NeedDisposeStr := True;
 FullAssignStrList := True;
end;

function Tl3StringDataList.ExtDataSize : Word;
begin
 Result := inherited ExtDataSize;
 if (f_HostDataList = nil) or not(f_HostDataList is Tl3StringDataList) then
  Inc(Result,SizeOf(PAnsiChar));
end;

function Tl3StringDataList.GetItemString(Index: Longint) : PAnsiChar;
begin
 if Assigned(f_HostDataList) and (f_HostDataList Is Tl3StringDataList) then
  Result := Tl3StringDataList(f_HostDataList).GetItemString(Index)
 else
 begin
  Result := PAnsiChar(f_List[Index]);
  if (Result <> nil) then
   Result := PPChar(Result + FlagSize)^;
 end;
end;

function  Tl3StringDataList.GetItemPCharLen(anIndex: Longint) : Tl3PCharLen;
begin
 Result := l3PCharLen(GetItemString(anIndex));
end;

function Tl3StringDataList.GetItemPasStr(Index: Longint) : String;
begin
 Result := l3GetStrPas(Strings[Index]);
end;

procedure Tl3StringDataList.SetItemPasStr(aIndex: Longint; const aValue : String);
var
 lSaveNeedAlloc : Boolean;
begin
 lSaveNeedAlloc := f_NeedAllocStr;
 f_NeedAllocStr := False;
 SetItemString(aIndex, l3StrNew(PAnsiChar(aValue)));
 f_NeedAllocStr := lSaveNeedAlloc;
end;

procedure Tl3StringDataList.SetItemString(Index: Longint; Value : PAnsiChar);
var
 LP : PAnsiChar;
begin
 Changing;
 Try
  LP := f_List[Index];
  if Not Assigned(LP) then
  begin
   LP := AllocItem;
   f_List[Index] := LP;
   CallNotify(ntChangeItemData, Index);
  end;
  LP := LP + FlagSize; { + Inherited ExtDataSize;}
  if NeedDisposeStr and (PPChar(LP)^ <> Nil) then
   l3StrDispose(PPChar(LP)^);
  if NeedAllocStr and (Value <> Nil) then
   Value := l3StrNew(Value);

  if Value <> Nil then l3Move(Value, LP^, SizeOf(Value));
 finally
  Changed;
 end;
end;

procedure Tl3StringDataList.SetItemPCharLen(anIndex: Longint; const anItem: Tl3PCharLen);
begin
 SetItemString(anIndex, anItem.S);
end;

Function Tl3StringDataList.Add(P : Pointer) : Longint;
begin
 Result := Add(P, nil);
end;

procedure Tl3StringDataList.WriteItem(WPtr : PAnsiChar; aStr : PAnsiChar; aData : PAnsiChar);
begin
 StrMove(WPtr + ExtDataSize, aData, DataSize);
 WPtr := WPtr + Inherited ExtDataSize;
 if NeedAllocStr then aStr := l3StrNew(aStr);
 l3Move(aStr, WPtr^, SizeOf(aStr));
end;

procedure Tl3StringDataList.Insert(aIndex : TListIndex; P : Pointer; aDataSize : word = 0);
begin
 InsertStrItem(aIndex, nil, P, aDataSize);
end;

function  Tl3StringDataList.InsertData(aIndex : TListIndex; aStr : PAnsiChar; aData : PAnsiChar) : TListIndex;
begin
 Result := InsertStrItem(aIndex, aStr, aData, 0);
end;

function  Tl3StringDataList.InsertStrData(aIndex : TListIndex; const aStr : String; aData : PAnsiChar) : TListIndex;
var
 lSaveNeedAlloc : Boolean;
begin
 lSaveNeedAlloc := NeedAllocStr;
 f_NeedAllocStr := False;
 Result := InsertStrItem(aIndex, l3PCharAlloc(aStr), aData, 0);
 f_NeedAllocStr := lSaveNeedAlloc;
end;

function  Tl3StringDataList.Add(aStr : PAnsiChar; aData : PAnsiChar; aDataSize : word = 0) : TListIndex;
begin
 Result := InsertStrItem(Count, aStr, aData, aDataSize);
end;

function Tl3StringDataList.AddStr(const aStr : String; aData : PAnsiChar = nil; aDataSize : word = 0) : TListIndex;
var
 lSaveNeedAlloc : Boolean;
begin
 lSaveNeedAlloc := NeedAllocStr;
 try
  f_NeedAllocStr := False;
  Result := Add(l3PCharAlloc(aStr), aData, aDataSize);
 finally
  f_NeedAllocStr := lSaveNeedAlloc;
 end;
end;

function Tl3StringDataList.AddPCharLen(const aStr : Tl3PCharLen; aData : PAnsiChar = nil; aDataSize : word = 0) : TListIndex;
var
 lSaveNeedAlloc : Boolean;
begin
 lSaveNeedAlloc := NeedAllocStr;
 try
  f_NeedAllocStr := False;
  Result := Add(l3PCharAlloc(aStr), aData, aDataSize);
 finally
  f_NeedAllocStr := lSaveNeedAlloc;
 end;
end;

procedure Tl3StringDataList.DestroyItem(aIndex : TListIndex);
var
 PS : PAnsiChar;
begin
 // освобождаем строки И   либо хост не assigned            либо он - не Tl3StringDataList
 if NeedDisposeStr and ((not Assigned(f_HostDataList)) or (not (f_HostDataList is Tl3StringDataList))) then
 begin
  PS := f_List[aIndex];
  if PS = nil then Exit;
  PS:=PS + inherited ExtDataSize;
  PS := PPChar(PS)^;
  try
   l3StrDispose(PS);
  except
   l3System.Stack2Log(Format('Ошибка при освобождении указателя %p', [Pointer(PS)]));
  end;//try..except
 end;//NeedDisposeStr
 l3System.FreeLocalMem(f_List.ItemSlot(aIndex)^);
end;

function Tl3StringDataList.InsertStrItem(aIndex : Longint; aStr : PAnsiChar; aData : PAnsiChar; aDataSize : Word) : TListIndex;
var
 NewPtr : PAnsiChar;
begin
 if Assigned(f_HostDataList) then
 begin
  Changing;
  try
   if (f_HostDataList is Tl3StringDataList) then
    Result := Tl3StringDataList(f_HostDataList).InsertData(aIndex, aStr, aData)
   else
    Result := f_HostDataList.InsertItem(aIndex, aData, aDataSize);
   if aStr <> nil then Strings[Result] := aStr;
  finally
   Changed;
  end;
 end//Assigned(f_HostDataList)
 else
 if (Sorted and (aIndex <= -1)) or (aIndex = Count) then
 begin
  NewPtr := AllocItem;
  Changing;
  try
   if Sorted then
   begin
    FindStr(aStr, Result);
    f_List.Insert(Result, Pointer(NewPtr));
   end//Sorted
   else
    Result := f_List.Add(Pointer(NewPtr));

   if (aData <> nil) and (aDataSize = 0) then
    aDataSize := DataSize
   else
   if aDataSize > DataSize then
    Raise El3ListException.Create(Format('Поданный размер данных (%d) больше размера данных в списке (%d)',[aDataSize, DataSize]));

   if aData <> nil then
    StrMove(NewPtr + ExtDataSize, aData, aDataSize);

   if aStr <> nil then
   begin
    NewPtr := NewPtr + inherited ExtDataSize;
    if NeedAllocStr then
     aStr := l3StrNew(aStr);
    //assert(NeedAllocStr, 'list without allocstr');
    l3Move(aStr, NewPtr^, SizeOf(aStr));
   end;

   if Not LockModified then
    Flags[Result] := Flags[Result] or lfItemModified;
   CallNotify(ntInsert{dlAdd},Result);
  finally
   Changed;
  end;
 end//Sorted..
 else  {Insert}
 begin
  Changing;
  try
   aIndex := Abs(aIndex);
   NewPtr := AllocItem;
   Result := aIndex;
   f_List.Insert(aIndex, Pointer(NewPtr));
   if DataSize > 0 then
   begin
    if aData <> nil then
     StrMove(NewPtr + ExtDataSize, aData, DataSize)
    else
     l3FillChar((NewPtr + ExtDataSize)^,DataSize,0);
   end;//DataSize > 0

   if aStr <> nil then
   begin
    NewPtr := NewPtr + inherited ExtDataSize;
    if NeedAllocStr then
     aStr := l3StrNew(aStr);
    //assert(NeedAllocStr, 'list without allocstr');
    l3Move(aStr, NewPtr^, SizeOf(aStr));
   end;

   if not LockModified then
    Flags[Result] := Flags[Result] or lfItemModified;
   CallNotify(ntInsert,Result);
  finally
   Changed;
  end;//try..finally
 end;//Sorted..
end;

function Tl3StringDataList.FindHostItemPlace(Index : Longint) : Longint;
begin
 Result := Index;
 if Sorted and
    ((HostDataList <> nil) and (HostDataList is Tl3StringDataList)) then
 begin
  FindStr(Tl3StringDataList(HostDataList).Strings[Index],Result);
  Result := Abs(Result);
 end;
end;

procedure Tl3StringDataList.SetNeedAllocStr(aValue : Boolean);
begin
 f_NeedAllocStr := aValue;
end;

function Tl3StringDataList.DoCompare(I, J : Longint) : Longint;
begin
 if Assigned(f_OnCompareItems) then
  Result := f_OnCompareItems(I, J)
 else
  Result := AnsiCompareStr(Strings[I], Strings[J]);
end;

function Tl3StringDataList.FindStr(aStr : PAnsiChar; var Ind : Longint) : Boolean;
var
 I,L,H,M : Longint;
 Res : Integer;
begin
 Ind := 0;
 Result := False;
 if Count = 0 then
  Exit;
 if Sorted then
 begin
  L:=0;
  H:=Count-1;
  Res := l3AnsiStrLICompExt(aStr, Strings[L], High(Word));
  if Res <= 0 then
  begin
   Result := (Res = 0);
   Ind := L;
   Exit;
  end;

  Res := l3AnsiStrLICompExt(aStr, Strings[H], High(Word));
  if Res >= 0 then
  begin
   Result := (Res = 0);
   Ind := H;
   if not Result then
    Inc(Ind);
   Exit;
  end;

  repeat
   M:=(L+H) div 2;
   if M = L then
   begin
    Result:=False;
    Ind:=L+1;
    Exit;
   end;

   Res:=l3AnsiStrLICompExt(aStr, Strings[M], High(Word));

   if Res = 0 then
   begin
    Result := true;
    Ind := M;
    Exit;
   end;

   if Res > 0 then
    L := M
   else
    H := M;
  until False;
 end
 else
  for I := 0 to Count - 1 do
  begin
   Res:=l3AnsiStrLICompExt(aStr, Strings[I], High(Word));
   if (Res = 0) then
   begin
    Ind := I;
    Result := True;
    Break;
   end;
  end;//for I
end;

function Tl3StringDataList.FindStrBegin(aStr : PAnsiChar; Var Ind : Longint) : Boolean;
Var
 I,L,H,M : Longint;
 Res : Integer;
 Len   : Word;

begin
 Len := l3StrLen(aStr);
 Ind:=0;
 Result:=False;
 if Count = 0 then
  Exit;

 if Sorted then
   begin
    L:=0;
    H:=Count-1;
    Res:= l3AnsiStrLICompExt(aStr, Strings[L], Succ(Len));
    if Res <= 0 then
     begin
      Result:= Res = 0;
      Ind:=L;
      Exit;
     end;

    Res:= l3AnsiStrLICompExt(aStr, Strings[H], Succ(Len));
    if Res >= 0 then
     begin
      Result:= Res = 0;
      Ind:=H;
      if Not Result then Inc(Ind);
      Exit;
     end;

    Repeat
     M:=(L+H) div 2;
     if M = L then
      begin
       Ind:=L+1;
       Result:=l3AnsiStrLICompExt(aStr, Strings[Ind], Len) = 0;
       Exit;
      end;

     Res := l3AnsiStrLICompExt(aStr, Strings[M], Succ(Len));

     if Res = 0 then
      begin
       Result:=True;
       Ind:=M;
       Exit;
      end;

     if Res > 0
      then L := M
      else H := M;
    until False;
   end
  else
   for I:=0 to Count - 1 do
   begin
    Res := l3AnsiStrLICompExt(aStr, Strings[I], Len);
    if Res = 0 then
    begin
     Ind := I;
     Result := True;
     Break;
    end;
   end;
end;

procedure Tl3StringDataList.AssignTo(Dest: TPersistent);
var
 Obj : TObject;
 I : Longint;
begin
 if Dest is Tl3StringDataList then
  Dest.Assign(Self)
 else
 if (Dest is TStrings) then
 begin
  TStrings(Dest).Clear;
  if (Count > 0) then
  begin
   if FullAssignStrList then
   begin
    for I := 0 to Pred(Count) do
    begin
     Obj := TObject(DataInt[I]);
     TStrings(Dest).AddObject(PasStr[I],Obj);
    end;
   end
   else
   for I := 0 to Pred(Count) do
    TStrings(Dest).Add(PasStr[I]);
  end;//Count > 0
 end;//Dest is TStrings
end;

procedure Tl3StringDataList.Assign(Source: TPersistent);
var
 I   : Integer;
 S   : PAnsiChar;
 Obj : Pointer;
 SrcDataSize : word;
begin
 if (Source is Tl3StringDataList) then
 begin
  Changing;
  try
   Clear;
   if Tl3StringDataList(Source).Count > 0 then
    begin
     f_List.Capacity:=Tl3StringDataList(Source).Count;
     if DataSize < Tl3StringDataList(Source).DataSize
      then DataSize := Tl3StringDataList(Source).DataSize;

     SrcDataSize := Tl3StringDataList(Source).DataSize;

     for I:=0 to Tl3StringDataList(Source).Count-1 do
      begin
       Obj:=Tl3StringDataList(Source).Data[I];
       S:=Tl3StringDataList(Source)[I];
       InsertStrItem(Count, S, Obj, SrcDataSize);
      end;

    end;
  finally
   Changed;
  end;//try..finally
 end//Source is Tl3StringDataList
 else
 if Source is TStrings then
 begin
  Changing;
  try
   Clear;
   if (TStrings(Source).Count > 0) then
   begin
    f_List.Capacity:=TStrings(Source).Count;
    if FullAssignStrList then
    begin
     if DataSize < SizeOf(Obj) then
      DataSize := SizeOf(Obj);
     for I:=0 to TStrings(Source).Count-1 do
      begin
       Obj:=TStrings(Source).Objects[I];
       Add(l3PCharAlloc(TStrings(Source)[I]),@Obj);
      end;
    end
    else
     for I:=0 to TStrings(Source).Count-1 do
      Add(l3PCharAlloc(TStrings(Source)[I]), nil, 0);
   end;//TStrings(Source).Count > 0
  finally
   Changed;
  end;//try..finally
 end;
end;

end.

