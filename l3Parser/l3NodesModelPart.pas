unit l3NodesModelPart;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3TreeInterfaces,
  l3Tree_TLB,
  l3Base,
  l3CustomString,
  SysUtils,
  Classes,
  l3LongintList,
  l3DatLst,
  l3PureMixIns,
  l3Types,
  l3IID
  ;

type
 ESkipIterateChilds = class(Exception)
 end;//ESkipIterateChilds

 El3NodeExeption = class(Exception)
 end;//El3NodeExeption

 El3InsertDenied = class(El3NodeExeption)
 end;//El3InsertDenied

 Tl3PrimNode = class(Tl3CustomString, Il3SimpleNode, Il3SimpleRootNode, IUnknown)
 protected
 // property methods
   function pm_GetFlags: Integer; virtual;
   procedure pm_SetFlags(aValue: Integer); virtual;
   function pm_GetFlag(anIndex: Integer): Boolean; virtual; abstract;
   procedure pm_SetFlag(anIndex: Integer; aValue: Boolean); virtual; abstract;
 protected
 // realized methods
   function IsFirst: Boolean;
     {* это первый узел внутри родителя? }
   function IsLast: Boolean;
     {* это последний узел внутри родителя? }
   function HasChild: Boolean;
     {* есть ли дочерние узлы? }
   function MaybeChild: Boolean;
     {* может ли иметь дочерние узлы? }
   function GetLevel: Integer;
   function GetLevelFor(const aNode: Il3SimpleNode): Integer;
   function IsSame(const aNode: Il3SimpleNode): Boolean;
     {* сравнивает ноды. }
   function IsDisappeared: Boolean;
     {* True если интерфейс на удаленную ноду,
             применяется в виртуальных нодах - указателях на данные. }
   procedure BeginMove(var aUserParam: Pointer);
     {* начать перемещение узла. }
   procedure EndMove(aUserParam: Pointer);
     {* закончить перемещение узла. }
   procedure Delete;
     {* удалить узел из дерева, а его данные с постоянного носителя (например из БД) или связанные объекты. }
   function Get_Text: Tl3PCharLenPrim;
   function Get_Parent: Il3SimpleNode;
   function Get_Child: Il3SimpleNode;
   function Get_Next: Il3SimpleNode;
   function Get_Flag(anIndex: Integer): Boolean;
   procedure Set_Flag(anIndex: Integer; aValue: Boolean);
   function Get_Flags: Integer;
   function Get_ThisChildrenCount: Integer;
   function pm_GetIndexInParent: Integer;
   function CanExpandCollapseAll: Boolean;
   procedure ExpandCollapseAll(anExpand: Boolean);
   function CanAcceptData(const aData: Tl3TreeData): Boolean;
     {* может ли узел принять данные }
   function DropData(const aData: Tl3TreeData): Boolean;
     {* принять данные }
   function CanMove: Boolean;
     {* определяет возможность перемещения узла }
   function Get_Prev: Il3SimpleNode;
 protected
 // protected methods
   function DoGetIndexInParent: Integer; virtual; abstract;
   function Get_AllChildrenCount: Integer; virtual; abstract;
   function DoGetThisChildrenCount: Integer; virtual; abstract;
   function DoGetLevel: Integer; virtual;
   function GetIsSame(const aNode: Il3SimpleNode): Boolean; virtual;
   function Get_ParentNode: Il3Node; virtual; abstract;
   function Get_ChildNode: Il3Node; virtual; abstract;
   function Get_NextNode: Il3Node; virtual; abstract;
   function Get_PrevNode: Il3Node; virtual; abstract;
   function GetLevelForParent(const aNode: Il3SimpleNode): Integer; virtual; abstract;
   function IsFirstNode: Boolean; virtual; abstract;
   function IsLastNode: Boolean; virtual; abstract;
   function HasChildNode: Boolean; virtual; abstract;
   function GetMaybeChild: Boolean; virtual;
     {* может ли иметь дочерние узлы? }
   function GetIsDisappeared: Boolean; virtual; abstract;
     {* True если интерфейс на удаленную ноду, применяется в виртуальных нодах - указателях на данные. }
   procedure DoBeginMove(var theUserParam: Pointer); virtual; abstract;
   procedure DoEndMove(aUserParam: Pointer); virtual; abstract;
   procedure DoExpandCollapseAll(anExpand: Boolean); virtual;
   function GetCanExpandCollapseAll: Boolean; virtual;
   procedure DoDelete; virtual;
     {* Сигнатура метода DoDelete }
   procedure Remove; virtual; abstract;
     {* Сигнатура метода Remove }
   function GetCanAcceptData(const aData: Tl3TreeData): Boolean; virtual;
   function DoDropData(const aData: Tl3TreeData): Boolean; virtual;
   function GetCanMove: Boolean; virtual;
 public
 // public properties
   property Flags: Integer
     read pm_GetFlags
     write pm_SetFlags;
   property Flag[anIndex: Integer]: Boolean
     read pm_GetFlag
     write pm_SetFlag;
 end;//Tl3PrimNode


 Tl3CustomNode = class;


 Tl3NodeClass = class of Tl3Node;
 Il3NodeWrap = interface(Il3Base)
   ['{A7B003A3-ED64-402B-81B2-F9ABCAFB0989}']
   function GetSelf: Tl3CustomNode;
   function InheritFrom(aClassType: Tl3NodeClass): Boolean;
 end;//Il3NodeWrap

 _l3Changing_Parent_ = Tl3PrimNode;
 {$Include l3Changing.imp.pas}
 Tl3CustomNode = class(_l3Changing_, Il3Node, Il3NodeWrap)
 private
 // private fields
   f_MoveEnterCount : Integer;
   f_ChildSortMode : Integer;
 protected
 // property methods
   procedure Set_AllChildrenCount(aValue: Integer); virtual;
   function pm_GetChildSorted: Boolean; virtual;
   procedure pm_SetChildSorted(aValue: Boolean); virtual;
   function pm_GetChildSortedFromParent: Boolean; virtual;
   procedure pm_SetChildSortedFromParent(aValue: Boolean); virtual;
 protected
 // realized methods
   function InsertChild(const aNode: Il3Node): Il3Node;
   function InsertChildBefore(const aNextChild: Il3Node;
    const aNode: Il3Node): Il3Node;
   function IsAcceptChild(const aChild: Il3Node): Boolean;
   function GetChildByNumber(aNum: Integer): Il3Node;
     {* получить дочерний узел по номеру. }
   function GetNodeByNumber(aNum: Integer): Il3Node;
     {* получить узел по номеру. 0 = Self, остальные дочерние, }
   function GetNumInParent(aOnlyOneLevel: Boolean = false): Integer;
     {* получить порядковый номер узла в родительском узле.
          aOnlyOneLevel - считаем только непосредственных "детей",
          без учета вложенных }
   procedure Notify(aOperation: Integer;
    const aNode: Il3Node);
     {* нотификация об операции над узлом. anOperation см. ntNone etc. }
   procedure IncAllChildrenCount(aInc: Integer);
   function Move(aDirection: Tl3Direction): Boolean;
     {* переместить узел. }
   function Iterate(Action: Tl3NodeAction;
    IterMode: Integer = 0;
    const aFromNode: Il3Node = nil): Il3Node;
     {* перебрать все дочерние узлы. IterMode см. imExpandOnly etc. }
   function IterateF(Action: Tl3NodeAction;
    IterMode: Integer = 0;
    const aFromNode: Il3Node = nil): Il3Node;
     {* перебрать все дочерние узлы и освободить заглушку для Action. }
   procedure ReleaseChilds;
     {* освободить дочерние узлы. }
   function CompareChild(const aChildrenNode1: Il3Node;
    const aChildrenNode2: Il3Node): Integer;
     {* сравнивает aChildrenNode1 и aChildrenNode2 (обычно Text), используется при сортировке ветки дерева. }
   procedure SortChilds(const aChild: Il3Node = nil);
     {* пересортировывает aChild относительно других Nodes на том же уровне,
         обычно в случае изменения Text,
          если aChild = nil пересортировывает всю ветку (один уровень). }
   procedure Sort;
     {* пересортировывает себя относительно других Nodes на том же уровне. }
   function Get_Text: Tl3PCharLenPrim;
   procedure Set_Text(const aValue: Tl3PCharLenPrim);
   function Get_ChildSorted: Boolean;
   procedure Set_ChildSorted(aValue: Boolean);
   function Get_ChildSortedFromParent: Boolean;
   procedure Set_ChildSortedFromParent(aValue: Boolean);
   function Get_Flags: Integer;
   procedure Set_Flags(aValue: Integer);
   function GetSelf: Tl3CustomNode;
   function InheritFrom(aClassType: Tl3NodeClass): Boolean;
   function Get_AllChildrenCount: Integer; override;
   function DoGetThisChildrenCount: Integer; override;
   function HasChildNode: Boolean; override;
   function GetIsDisappeared: Boolean; override;
     {* True если интерфейс на удаленную ноду, применяется в виртуальных нодах - указателях на данные. }
   procedure DoBeginMove(var theUserParam: Pointer); override;
   procedure DoEndMove(aUserParam: Pointer); override;
 protected
 // overridden protected methods
   procedure DoChanged; override;
     {* Сигнатура метода DoChanged }
   procedure DoChanging; override;
     {* Сигнатура метода DoChanging }
 protected
 // protected methods
   function IterateChild(Action: Tl3NodeAction;
     IterMode: Integer;
     const aFromNode: Il3Node = nil): Il3Node; virtual; abstract;
   function DoCompareChild(const aChildrenNode1: Il3Node;
     const aChildrenNode2: Il3Node): Integer; virtual;
   procedure DoSortChilds(const aChild: Il3Node = nil); virtual;
   procedure DoSort; virtual;
     {* Сигнатура метода DoSort }
   function DoGetNumInParent(aOnlyOneLevel: Boolean = False): Integer; virtual; abstract;
   procedure DoReleaseChilds; virtual; abstract;
     {* Сигнатура метода DoReleaseChilds }
   function DoMove(aDirection: Tl3Direction): Boolean; virtual;
   procedure DoIncAllChildrenCount(aInc: Integer); virtual; abstract;
   procedure DoNotify(aOperation: Integer;
     const aNode: Il3Node); virtual;
   function DoGetNodeByNumber(aNum: Integer): Il3Node; virtual;
   function DoGetChildByNumber(aNum: Integer): Il3Node; virtual; abstract;
   function DoIterate(Action: Tl3NodeAction;
     IterMode: Integer = 0;
     const aFromNode: Il3Node = nil): Il3Node; virtual; abstract;
   function DoInsertChildBefore(const aNextChild: Il3Node;
     const aChild: Il3Node): Il3Node; virtual; abstract;
   function GetIsAcceptChild(const aChild: Il3Node): Boolean; virtual;
 public
 // public methods
   procedure ReleaseChildsPrim; virtual; abstract;
     {* Сигнатура метода ReleaseChildsPrim }
   procedure MovingStarted(var theUserParam: Pointer); virtual;
   procedure MovingStopped(aUserParam: Pointer); virtual;
 public
 // public properties
   property Text: Tl3PCharLenPrim
     read Get_Text
     write Set_Text;
   property AllChildrenCount: Integer
     read Get_AllChildrenCount
     write Set_AllChildrenCount;
   property ChildSorted: Boolean
     read pm_GetChildSorted
     write pm_SetChildSorted;
   property ChildSortedFromParent: Boolean
     read pm_GetChildSortedFromParent
     write pm_SetChildSortedFromParent;
   property NextNode: Il3Node
     read Get_NextNode;
   property PrevNode: Il3Node
     read Get_PrevNode;
   property ParentNode: Il3Node
     read Get_ParentNode;
   property ChildNode: Il3Node
     read Get_ChildNode;
   property ThisChildrenCount: Integer
     read Get_ThisChildrenCount;
 end;//Tl3CustomNode

 Tl3Node = class(Tl3CustomNode, Il3ChangeNotifier, Il3RootNode)
 private
 // private fields
   f_NotifiedObjList : Tl3LongintList;
    {* Поле для свойства NotifiedObjList}
 protected
 // property methods
   function pm_GetNext: Tl3Node; virtual; abstract;
   procedure pm_SetNext(aValue: Tl3Node); virtual; abstract;
   function pm_GetPrev: Tl3Node; virtual; abstract;
   procedure pm_SetPrev(aValue: Tl3Node); virtual; abstract;
   function pm_GetParent: Tl3Node; virtual; abstract;
   procedure pm_SetParent(aValue: Tl3Node); virtual; abstract;
   function pm_GetChild: Tl3Node; virtual; abstract;
   procedure pm_SetChild(aValue: Tl3Node); virtual; abstract;
 protected
 // realized methods
   procedure Subscribe(const aRecipient: Il3Notify);
     {* подписка на извещения. }
   procedure Unsubscribe(const aRecipient: Il3Notify);
     {* "отписка" от извещений. }
   function DoGetIndexInParent: Integer; override;
   function Get_ParentNode: Il3Node; override;
   function Get_ChildNode: Il3Node; override;
   function Get_NextNode: Il3Node; override;
   function Get_PrevNode: Il3Node; override;
   function GetLevelForParent(const aNode: Il3SimpleNode): Integer; override;
   procedure Remove; override;
     {* Сигнатура метода Remove }
   function IterateChild(Action: Tl3NodeAction;
     IterMode: Integer;
     const aFromNode: Il3Node = nil): Il3Node; override;
   function DoGetNumInParent(aOnlyOneLevel: Boolean = False): Integer; override;
   procedure DoReleaseChilds; override;
     {* Сигнатура метода DoReleaseChilds }
   procedure ReleaseChildsPrim; override;
     {* Сигнатура метода ReleaseChildsPrim }
   function DoGetChildByNumber(aNum: Integer): Il3Node; override;
   function DoIterate(Action: Tl3NodeAction;
     IterMode: Integer = 0;
     const aFromNode: Il3Node = nil): Il3Node; override;
   function DoInsertChildBefore(const aNextChild: Il3Node;
     const aChild: Il3Node): Il3Node; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoSortChilds(const aChild: Il3Node = nil); override;
   function DoMove(aDirection: Tl3Direction): Boolean; override;
   procedure DoNotify(aOperation: Integer;
     const aNode: Il3Node); override;
   function GetIsAcceptChild(const aChild: Il3Node): Boolean; override;
   procedure DoChanged; override;
     {* Сигнатура метода DoChanged }
   procedure DoChanging; override;
     {* Сигнатура метода DoChanging }
 protected
 // protected methods
   function IterateNoParent(Action: Tl3NodeAction;
     IterMode: Integer;
     const aFromNode: Il3Node = nil): Il3Node; virtual;
 protected
 // protected properties
   property NotifiedObjList: Tl3LongintList
     read f_NotifiedObjList;
   property Next: Tl3Node
     read pm_GetNext
     write pm_SetNext;
   property Prev: Tl3Node
     read pm_GetPrev
     write pm_SetPrev;
   property Parent: Tl3Node
     read pm_GetParent
     write pm_SetParent;
   property Child: Tl3Node
     read pm_GetChild
     write pm_SetChild;
 protected
 // Методы преобразования к реализуемым интерфейсам
   function As_Il3ChangeNotifier: Il3ChangeNotifier;
 end;//Tl3Node

 Tl3PlaceNode = class(Tl3Node)
 private
 // private fields
   f_Flags : Integer;
   f_Next : Tl3Node;
   f_Prev : Tl3Node;
   f_Parent : Tl3Node;
   f_Child : Tl3Node;
   f_Childcount : Integer;
    {* Поле для свойства Childcount}
 protected
 // realized methods
   function pm_GetFlag(anIndex: Integer): Boolean; override;
   procedure pm_SetFlag(anIndex: Integer; aValue: Boolean); override;
   function IsFirstNode: Boolean; override;
   function IsLastNode: Boolean; override;
   procedure DoIncAllChildrenCount(aInc: Integer); override;
   function pm_GetNext: Tl3Node; override;
   procedure pm_SetNext(aValue: Tl3Node); override;
   function pm_GetPrev: Tl3Node; override;
   procedure pm_SetPrev(aValue: Tl3Node); override;
   function pm_GetParent: Tl3Node; override;
   procedure pm_SetParent(aValue: Tl3Node); override;
   function pm_GetChild: Tl3Node; override;
   procedure pm_SetChild(aValue: Tl3Node); override;
 protected
 // overridden property methods
   function pm_GetFlags: Integer; override;
   procedure pm_SetFlags(aValue: Integer); override;
 protected
 // overridden protected methods
   function Get_AllChildrenCount: Integer; override;
   function HasChildNode: Boolean; override;
   function GetMaybeChild: Boolean; override;
     {* может ли иметь дочерние узлы? }
   procedure DoReleaseChilds; override;
     {* Сигнатура метода DoReleaseChilds }
 public
 // public methods
   constructor Create; reintroduce;
     {* Сигнатура метода Create }
   class function Make: Il3Node; reintroduce;
     {* Сигнатура фабрики Tl3PlaceNode.Make }
 protected
 // protected properties
   property Childcount: Integer
     read f_Childcount;
 end;//Tl3PlaceNode

 Tl3CacheableNode = class(Tl3PlaceNode)
 private
 // private fields
   f_ExternalNode : Il3SimpleNode;
   f_Text : Tl3String;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetAsPCharLen: Tl3WString; override;
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* Реализация запроса интерфейса }
 public
 // public methods
   constructor Create(const anExternalNode: Il3SimpleNode = nil); reintroduce;
   class function Make(const anExternalNode: Il3SimpleNode = nil): Il3Node; reintroduce;
     {* Сигнатура фабрики Tl3CacheableNode.Make }
 end;//Tl3CacheableNode

 Tl3HandleNode = class(Tl3PlaceNode, Il3HandleNode)
 protected
 // property methods
   function pm_GetHandle: Integer; virtual; abstract;
   procedure pm_SetHandle(aValue: Integer); virtual; abstract;
 protected
 // realized methods
   function Get_Handle: Integer;
   procedure Set_Handle(aValue: Integer);
 protected
 // overridden property methods
   function pm_GetStringID: Integer; override;
   procedure pm_SetStringID(aValue: Integer); override;
 public
 // public properties
   property Handle: Integer
     read pm_GetHandle
     write pm_SetHandle;
 end;//Tl3HandleNode

 Tl3UsualNode = class(Tl3HandleNode)
 private
 // private fields
   f_Text : Tl3String;
   f_Handle : Integer;
 protected
 // realized methods
   function pm_GetHandle: Integer; override;
   procedure pm_SetHandle(aValue: Integer); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetAsPCharLen: Tl3WString; override;
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
 end;//Tl3UsualNode

 Tl3RootNode = Tl3UsualNode;


 Tl3ListItemNode = class;

 Tl3CustomListContainerNode = class(Tl3UsualNode, Il3ChangeRecipient, Il3ItemNotifyRecipient)
  {* Базовый узел - контейнер списков }
 private
 // private fields
   f_UpdateCount : Integer;
 protected
 // property methods
   function pm_GetStrings(aIndex: Integer): Tl3WString; virtual; abstract;
   procedure pm_SetStrings(aIndex: Integer; const aValue: Tl3WString); virtual; abstract;
   function pm_GetItemParam(aIndex: Integer): Integer; virtual; abstract;
   procedure pm_SetItemParam(aIndex: Integer; aValue: Integer); virtual; abstract;
   function pm_GetItemFlag(aIndex: Integer): Integer; virtual; abstract;
   procedure pm_SetItemFlag(aIndex: Integer; aValue: Integer); virtual; abstract;
 protected
 // realized methods
   procedure Notify(const aNotifier: Il3ChangeNotifier;
    aOperation: Integer;
    aIndex: Integer);
     {* прошла операция. }
 protected
 // overridden property methods
   function pm_GetChild: Tl3Node; override;
   procedure pm_SetChild(aValue: Tl3Node); override;
 protected
 // overridden protected methods
   function Get_AllChildrenCount: Integer; override;
   function Get_ChildNode: Il3Node; override;
   function HasChildNode: Boolean; override;
   function IterateChild(Action: Tl3NodeAction;
     IterMode: Integer;
     const aFromNode: Il3Node = nil): Il3Node; override;
   procedure DoNotify(aOperation: Integer;
     const aNode: Il3Node); override;
   function DoGetChildByNumber(aNum: Integer): Il3Node; override;
   function DoInsertChildBefore(const aNextChild: Il3Node;
     const aChild: Il3Node): Il3Node; override;
   function GetIsAcceptChild(const aChild: Il3Node): Boolean; override;
   procedure DoChanged; override;
     {* Сигнатура метода DoChanged }
   procedure DoChanging; override;
     {* Сигнатура метода DoChanging }
 protected
 // protected methods
   function GetItemsCount: Integer; virtual; abstract;
   procedure DeleteChildItem(aIndex: Integer;
     const aDelete: Il3Node); virtual;
   procedure SubscribeChild(aChildNode: Tl3ListItemNode);
     {* подписка на извещения ноды - обертки вокруг элемента листа }
   procedure UnsubscribeChild(aChildNode: Tl3ListItemNode);
     {* "отписка" от извещений ноды - обертки вокруг элемента листа }
   function MakeChildNode: Tl3ListItemNode; virtual; abstract;
   procedure MoveChildItemPrim(aCurIndex: Integer;
     aNewIndex: Integer); virtual; abstract;
   function MoveChildItem(aChildNode: Tl3ListItemNode;
     aDirection: Tl3Direction): Boolean;
   procedure ItemNotify(const aNotifier: Il3ChangeNotifier;
     aOperation: Integer;
     aIndex: Integer); virtual;
 public
 // public properties
   property Strings[aIndex: Integer]: Tl3WString
     read pm_GetStrings
     write pm_SetStrings;
   property ItemParam[aIndex: Integer]: Integer
     read pm_GetItemParam
     write pm_SetItemParam;
   property ItemFlag[aIndex: Integer]: Integer
     read pm_GetItemFlag
     write pm_SetItemFlag;
 end;//Tl3CustomListContainerNode

 Tl3ListItemNode = class(Tl3CustomNode, Il3HandleNode, Il3NodeNotifyRecipient)
 private
 // private fields
   f_ListNode : Tl3CustomListContainerNode;
    {* Поле для свойства ListNode}
   f_ListItem : Integer;
    {* Поле для свойства ListItem}
 protected
 // property methods
   procedure pm_SetListNode(aValue: Tl3CustomListContainerNode); virtual;
   function pm_GetHandle: Integer; virtual;
   procedure pm_SetHandle(aValue: Integer); virtual;
 protected
 // realized methods
   function Get_Handle: Integer;
   procedure Set_Handle(aValue: Integer);
   procedure Notify(aOperation: Integer;
    const aNode: Il3SimpleNode);
     {* прошла операция. }
   function Get_ParentNode: Il3Node; override;
   function Get_ChildNode: Il3Node; override;
   function Get_NextNode: Il3Node; override;
   function Get_PrevNode: Il3Node; override;
   function GetLevelForParent(const aNode: Il3SimpleNode): Integer; override;
   function pm_GetFlag(anIndex: Integer): Boolean; override;
   procedure pm_SetFlag(anIndex: Integer; aValue: Boolean); override;
   function IsFirstNode: Boolean; override;
   function IsLastNode: Boolean; override;
   function DoGetNumInParent(aOnlyOneLevel: Boolean = False): Integer; override;
   function DoIterate(Action: Tl3NodeAction;
     IterMode: Integer = 0;
     const aFromNode: Il3Node = nil): Il3Node; override;
 protected
 // overridden property methods
   function pm_GetStringID: Integer; override;
   procedure pm_SetStringID(aValue: Integer); override;
   function pm_GetFlags: Integer; override;
   procedure pm_SetFlags(aValue: Integer); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure Release; override;
   function GetAsPCharLen: Tl3WString; override;
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
   function GetIsSame(const aNode: Il3SimpleNode): Boolean; override;
   function GetIsDisappeared: Boolean; override;
     {* True если интерфейс на удаленную ноду, применяется в виртуальных нодах - указателях на данные. }
   procedure DoDelete; override;
     {* Сигнатура метода DoDelete }
   function DoMove(aDirection: Tl3Direction): Boolean; override;
 public
 // public properties
   property ListNode: Tl3CustomListContainerNode
     read f_ListNode
     write pm_SetListNode;
   property ListItem: Integer
     read f_ListItem
     write f_ListItem;
   property Handle: Integer
     read pm_GetHandle
     write pm_SetHandle;
 end;//Tl3ListItemNode

 Tl3StrListItemNode = class(Tl3ListItemNode)
 end;//Tl3StrListItemNode

 Tl3ListContainerNode = class(Tl3CustomListContainerNode)
 private
 // private fields
   f_Items : TStringList;
    {* Поле для свойства Items}
 protected
 // property methods
   function pm_GetItems: TStringList;
   procedure pm_SetItems(aValue: TStringList);
 protected
 // realized methods
   function pm_GetStrings(aIndex: Integer): Tl3WString; override;
   procedure pm_SetStrings(aIndex: Integer; const aValue: Tl3WString); override;
   function pm_GetItemParam(aIndex: Integer): Integer; override;
   procedure pm_SetItemParam(aIndex: Integer; aValue: Integer); override;
   function pm_GetItemFlag(aIndex: Integer): Integer; override;
   procedure pm_SetItemFlag(aIndex: Integer; aValue: Integer); override;
   function GetItemsCount: Integer; override;
   function MakeChildNode: Tl3ListItemNode; override;
   procedure MoveChildItemPrim(aCurIndex: Integer;
     aNewIndex: Integer); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoReleaseChilds; override;
     {* Сигнатура метода DoReleaseChilds }
   procedure DeleteChildItem(aIndex: Integer;
     const aDelete: Il3Node); override;
 protected
 // protected methods
   procedure ListChanged(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure ListChanging(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
 public
 // public properties
   property Items: TStringList
     read pm_GetItems
     write pm_SetItems;
 end;//Tl3ListContainerNode

 Tl3DataListContainerNode = class(Tl3CustomListContainerNode)
 private
 // private fields
   f_Items : Tl3StringDataList;
    {* Поле для свойства Items}
 protected
 // property methods
   function pm_GetItems: Tl3StringDataList;
   procedure pm_SetItems(aValue: Tl3StringDataList);
   function pm_GetItemData(aIndex: Integer): PAnsiChar; virtual;
   procedure pm_SetItemData(aIndex: Integer; aValue: PAnsiChar); virtual;
   function pm_GetItemDataSize(aIndex: Integer): Cardinal; virtual;
   procedure pm_SetItemDataSize(aIndex: Integer; aValue: Cardinal); virtual;
 protected
 // realized methods
   function pm_GetStrings(aIndex: Integer): Tl3WString; override;
   procedure pm_SetStrings(aIndex: Integer; const aValue: Tl3WString); override;
   function pm_GetItemParam(aIndex: Integer): Integer; override;
   procedure pm_SetItemParam(aIndex: Integer; aValue: Integer); override;
   function pm_GetItemFlag(aIndex: Integer): Integer; override;
   procedure pm_SetItemFlag(aIndex: Integer; aValue: Integer); override;
   function GetItemsCount: Integer; override;
   function MakeChildNode: Tl3ListItemNode; override;
   procedure MoveChildItemPrim(aCurIndex: Integer;
     aNewIndex: Integer); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoReleaseChilds; override;
     {* Сигнатура метода DoReleaseChilds }
   procedure DeleteChildItem(aIndex: Integer;
     const aDelete: Il3Node); override;
 public
 // public properties
   property Items: Tl3StringDataList
     read pm_GetItems
     write pm_SetItems;
   property ItemData[aIndex: Integer]: PAnsiChar
     read pm_GetItemData
     write pm_SetItemData;
   property ItemDataSize[aIndex: Integer]: Cardinal
     read pm_GetItemDataSize
     write pm_SetItemDataSize;
 end;//Tl3DataListContainerNode

 Tl3IListContainerNode = class(Tl3CustomListContainerNode)
 private
 // private fields
   f_Items : Il3HandledStringList;
    {* Поле для свойства Items}
 protected
 // property methods
   function pm_GetItems: Il3HandledStringList;
   procedure pm_SetItems(const aValue: Il3HandledStringList);
 protected
 // realized methods
   function pm_GetStrings(aIndex: Integer): Tl3WString; override;
   procedure pm_SetStrings(aIndex: Integer; const aValue: Tl3WString); override;
   function pm_GetItemParam(aIndex: Integer): Integer; override;
   procedure pm_SetItemParam(aIndex: Integer; aValue: Integer); override;
   function pm_GetItemFlag(aIndex: Integer): Integer; override;
   procedure pm_SetItemFlag(aIndex: Integer; aValue: Integer); override;
   function GetItemsCount: Integer; override;
   function MakeChildNode: Tl3ListItemNode; override;
   procedure MoveChildItemPrim(aCurIndex: Integer;
     aNewIndex: Integer); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
   procedure DoReleaseChilds; override;
     {* Сигнатура метода DoReleaseChilds }
   procedure DeleteChildItem(aIndex: Integer;
     const aDelete: Il3Node); override;
 protected
 // protected methods
   procedure ListChanged(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure ListChanging(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
 public
 // public properties
   property Items: Il3HandledStringList
     read pm_GetItems
     write pm_SetItems;
 end;//Tl3IListContainerNode

 Tl3DataListItemNode = class(Tl3ListItemNode)
 protected
 // property methods
   function Get_Data: PAnsiChar; virtual;
   procedure Set_Data(aValue: PAnsiChar); virtual;
   function Get_DataSize: Cardinal; virtual;
   procedure Set_DataSize(aValue: Cardinal); virtual;
 public
 // public properties
   property Data: PAnsiChar
     read Get_Data
     write Set_Data;
   property DataSize: Cardinal
     read Get_DataSize
     write Set_DataSize;
 end;//Tl3DataListItemNode

 Tl3CustomUsualNode = Tl3Node;

var cDefCodePage : Integer = CP_ANSI;

implementation

uses
  l3InterfacesMisc
  {$If not defined(NoScripts)}
  ,
  l3NodesKeyWordsPack
  {$IfEnd} //not NoScripts
  ,
  l3String,
  l3Bits
  {$If not defined(NoScripts)}
  ,
  InterfacedNodeWords
  {$IfEnd} //not NoScripts
  ,
  l3Nodes,
  l3Chars
  ;

// start class Tl3PrimNode

function Tl3PrimNode.DoGetLevel: Integer;
//#UC START# *54C78D4603D6_4ADDDFE60236_var*
var
 l_Node : Il3SimpleNode;
//#UC END# *54C78D4603D6_4ADDDFE60236_var*
begin
//#UC START# *54C78D4603D6_4ADDDFE60236_impl*
 Result := 0;
 l_Node := Get_Parent;
 while (l_Node <> nil) do
 begin
  Inc(Result);
  l_Node := l_Node.Parent;
 end;//while (l_Node <> nil)
//#UC END# *54C78D4603D6_4ADDDFE60236_impl*
end;//Tl3PrimNode.DoGetLevel

function Tl3PrimNode.GetIsSame(const aNode: Il3SimpleNode): Boolean;
//#UC START# *54C78D9201B9_4ADDDFE60236_var*
//#UC END# *54C78D9201B9_4ADDDFE60236_var*
begin
//#UC START# *54C78D9201B9_4ADDDFE60236_impl*
 Result := l3IEQ(Self, aNode);
//#UC END# *54C78D9201B9_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetIsSame

function Tl3PrimNode.GetMaybeChild: Boolean;
//#UC START# *54C79013011B_4ADDDFE60236_var*
//#UC END# *54C79013011B_4ADDDFE60236_var*
begin
//#UC START# *54C79013011B_4ADDDFE60236_impl*
 Result := HasChild;
//#UC END# *54C79013011B_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetMaybeChild

procedure Tl3PrimNode.DoExpandCollapseAll(anExpand: Boolean);
//#UC START# *54C791370155_4ADDDFE60236_var*
//#UC END# *54C791370155_4ADDDFE60236_var*
begin
//#UC START# *54C791370155_4ADDDFE60236_impl*
//#UC END# *54C791370155_4ADDDFE60236_impl*
end;//Tl3PrimNode.DoExpandCollapseAll

function Tl3PrimNode.GetCanExpandCollapseAll: Boolean;
//#UC START# *54C7915203C9_4ADDDFE60236_var*
//#UC END# *54C7915203C9_4ADDDFE60236_var*
begin
//#UC START# *54C7915203C9_4ADDDFE60236_impl*
 Result := False;
//#UC END# *54C7915203C9_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetCanExpandCollapseAll

procedure Tl3PrimNode.DoDelete;
//#UC START# *54C79185029B_4ADDDFE60236_var*
//#UC END# *54C79185029B_4ADDDFE60236_var*
begin
//#UC START# *54C79185029B_4ADDDFE60236_impl*
 Flags := Flags or nfWasDisappear;
 Remove;
//#UC END# *54C79185029B_4ADDDFE60236_impl*
end;//Tl3PrimNode.DoDelete

function Tl3PrimNode.GetCanAcceptData(const aData: Tl3TreeData): Boolean;
//#UC START# *54C7921F0238_4ADDDFE60236_var*
//#UC END# *54C7921F0238_4ADDDFE60236_var*
begin
//#UC START# *54C7921F0238_4ADDDFE60236_impl*
 Result := False;
//#UC END# *54C7921F0238_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetCanAcceptData

function Tl3PrimNode.DoDropData(const aData: Tl3TreeData): Boolean;
//#UC START# *54C7925B018A_4ADDDFE60236_var*
//#UC END# *54C7925B018A_4ADDDFE60236_var*
begin
//#UC START# *54C7925B018A_4ADDDFE60236_impl*
 Result := False;
//#UC END# *54C7925B018A_4ADDDFE60236_impl*
end;//Tl3PrimNode.DoDropData

function Tl3PrimNode.GetCanMove: Boolean;
//#UC START# *54C7927D0085_4ADDDFE60236_var*
//#UC END# *54C7927D0085_4ADDDFE60236_var*
begin
//#UC START# *54C7927D0085_4ADDDFE60236_impl*
 Result := False;
//#UC END# *54C7927D0085_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetCanMove

function Tl3PrimNode.pm_GetFlags: Integer;
//#UC START# *54C78756019B_4ADDDFE60236get_var*
//#UC END# *54C78756019B_4ADDDFE60236get_var*
begin
//#UC START# *54C78756019B_4ADDDFE60236get_impl*

//#UC END# *54C78756019B_4ADDDFE60236get_impl*
end;//Tl3PrimNode.pm_GetFlags

procedure Tl3PrimNode.pm_SetFlags(aValue: Integer);
//#UC START# *54C78756019B_4ADDDFE60236set_var*
//#UC END# *54C78756019B_4ADDDFE60236set_var*
begin
//#UC START# *54C78756019B_4ADDDFE60236set_impl*

//#UC END# *54C78756019B_4ADDDFE60236set_impl*
end;//Tl3PrimNode.pm_SetFlags

function Tl3PrimNode.IsFirst: Boolean;
//#UC START# *47723CDB00A4_4ADDDFE60236_var*
//#UC END# *47723CDB00A4_4ADDDFE60236_var*
begin
//#UC START# *47723CDB00A4_4ADDDFE60236_impl*
 Result := IsFirstNode;
//#UC END# *47723CDB00A4_4ADDDFE60236_impl*
end;//Tl3PrimNode.IsFirst

function Tl3PrimNode.IsLast: Boolean;
//#UC START# *47723CFF0148_4ADDDFE60236_var*
//#UC END# *47723CFF0148_4ADDDFE60236_var*
begin
//#UC START# *47723CFF0148_4ADDDFE60236_impl*
 Result := IsLastNode;
//#UC END# *47723CFF0148_4ADDDFE60236_impl*
end;//Tl3PrimNode.IsLast

function Tl3PrimNode.HasChild: Boolean;
//#UC START# *47723D0F0392_4ADDDFE60236_var*
//#UC END# *47723D0F0392_4ADDDFE60236_var*
begin
//#UC START# *47723D0F0392_4ADDDFE60236_impl*
 Result := HasChildNode;
//#UC END# *47723D0F0392_4ADDDFE60236_impl*
end;//Tl3PrimNode.HasChild

function Tl3PrimNode.MaybeChild: Boolean;
//#UC START# *47723D1D03D6_4ADDDFE60236_var*
//#UC END# *47723D1D03D6_4ADDDFE60236_var*
begin
//#UC START# *47723D1D03D6_4ADDDFE60236_impl*
 Result := GetMaybeChild;
//#UC END# *47723D1D03D6_4ADDDFE60236_impl*
end;//Tl3PrimNode.MaybeChild

function Tl3PrimNode.GetLevel: Integer;
//#UC START# *47723D2E0051_4ADDDFE60236_var*
//#UC END# *47723D2E0051_4ADDDFE60236_var*
begin
//#UC START# *47723D2E0051_4ADDDFE60236_impl*
 Result := DoGetLevel;
//#UC END# *47723D2E0051_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetLevel

function Tl3PrimNode.GetLevelFor(const aNode: Il3SimpleNode): Integer;
//#UC START# *47723D3B0058_4ADDDFE60236_var*
//#UC END# *47723D3B0058_4ADDDFE60236_var*
begin
//#UC START# *47723D3B0058_4ADDDFE60236_impl*
 Result := GetLevelForParent(aNode);
//#UC END# *47723D3B0058_4ADDDFE60236_impl*
end;//Tl3PrimNode.GetLevelFor

function Tl3PrimNode.IsSame(const aNode: Il3SimpleNode): Boolean;
//#UC START# *47723D4C0360_4ADDDFE60236_var*
//#UC END# *47723D4C0360_4ADDDFE60236_var*
begin
//#UC START# *47723D4C0360_4ADDDFE60236_impl*
 Result := GetIsSame(aNode);
//#UC END# *47723D4C0360_4ADDDFE60236_impl*
end;//Tl3PrimNode.IsSame

function Tl3PrimNode.IsDisappeared: Boolean;
//#UC START# *47723DB901CA_4ADDDFE60236_var*
//#UC END# *47723DB901CA_4ADDDFE60236_var*
begin
//#UC START# *47723DB901CA_4ADDDFE60236_impl*
 Result := GetIsDisappeared;
//#UC END# *47723DB901CA_4ADDDFE60236_impl*
end;//Tl3PrimNode.IsDisappeared

procedure Tl3PrimNode.BeginMove(var aUserParam: Pointer);
//#UC START# *47723DD1008F_4ADDDFE60236_var*
//#UC END# *47723DD1008F_4ADDDFE60236_var*
begin
//#UC START# *47723DD1008F_4ADDDFE60236_impl*
 DoBeginMove(aUserParam);
//#UC END# *47723DD1008F_4ADDDFE60236_impl*
end;//Tl3PrimNode.BeginMove

procedure Tl3PrimNode.EndMove(aUserParam: Pointer);
//#UC START# *47723DE0009F_4ADDDFE60236_var*
//#UC END# *47723DE0009F_4ADDDFE60236_var*
begin
//#UC START# *47723DE0009F_4ADDDFE60236_impl*
 DoEndMove(aUserParam);
//#UC END# *47723DE0009F_4ADDDFE60236_impl*
end;//Tl3PrimNode.EndMove

procedure Tl3PrimNode.Delete;
//#UC START# *47723DED006A_4ADDDFE60236_var*
//#UC END# *47723DED006A_4ADDDFE60236_var*
begin
//#UC START# *47723DED006A_4ADDDFE60236_impl*
 DoDelete;
//#UC END# *47723DED006A_4ADDDFE60236_impl*
end;//Tl3PrimNode.Delete

function Tl3PrimNode.Get_Text: Tl3PCharLenPrim;
//#UC START# *47723E8C0086_4ADDDFE60236get_var*
//#UC END# *47723E8C0086_4ADDDFE60236get_var*
begin
//#UC START# *47723E8C0086_4ADDDFE60236get_impl*
 Result := AsPCharLen;
//#UC END# *47723E8C0086_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Text

function Tl3PrimNode.Get_Parent: Il3SimpleNode;
//#UC START# *4772408A0361_4ADDDFE60236get_var*
//#UC END# *4772408A0361_4ADDDFE60236get_var*
begin
//#UC START# *4772408A0361_4ADDDFE60236get_impl*
 Result := Get_ParentNode;
//#UC END# *4772408A0361_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Parent

function Tl3PrimNode.Get_Child: Il3SimpleNode;
//#UC START# *477240B10267_4ADDDFE60236get_var*
//#UC END# *477240B10267_4ADDDFE60236get_var*
begin
//#UC START# *477240B10267_4ADDDFE60236get_impl*
 Result := Get_ChildNode;
//#UC END# *477240B10267_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Child

function Tl3PrimNode.Get_Next: Il3SimpleNode;
//#UC START# *477241AC00B9_4ADDDFE60236get_var*
//#UC END# *477241AC00B9_4ADDDFE60236get_var*
begin
//#UC START# *477241AC00B9_4ADDDFE60236get_impl*
 Result := Get_NextNode;
//#UC END# *477241AC00B9_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Next

function Tl3PrimNode.Get_Flag(anIndex: Integer): Boolean;
//#UC START# *4772423302AF_4ADDDFE60236get_var*
//#UC END# *4772423302AF_4ADDDFE60236get_var*
begin
//#UC START# *4772423302AF_4ADDDFE60236get_impl*
 Result := pm_GetFlag(anIndex);
//#UC END# *4772423302AF_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Flag

procedure Tl3PrimNode.Set_Flag(anIndex: Integer; aValue: Boolean);
//#UC START# *4772423302AF_4ADDDFE60236set_var*
//#UC END# *4772423302AF_4ADDDFE60236set_var*
begin
//#UC START# *4772423302AF_4ADDDFE60236set_impl*
 pm_SetFlag(anIndex, aValue)
//#UC END# *4772423302AF_4ADDDFE60236set_impl*
end;//Tl3PrimNode.Set_Flag

function Tl3PrimNode.Get_Flags: Integer;
//#UC START# *477242700004_4ADDDFE60236get_var*
//#UC END# *477242700004_4ADDDFE60236get_var*
begin
//#UC START# *477242700004_4ADDDFE60236get_impl*
 Result := pm_GetFlags; 
//#UC END# *477242700004_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Flags

function Tl3PrimNode.Get_ThisChildrenCount: Integer;
//#UC START# *4772429202E4_4ADDDFE60236get_var*
//#UC END# *4772429202E4_4ADDDFE60236get_var*
begin
//#UC START# *4772429202E4_4ADDDFE60236get_impl*
 Result := DoGetThisChildrenCount;
//#UC END# *4772429202E4_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_ThisChildrenCount

function Tl3PrimNode.pm_GetIndexInParent: Integer;
//#UC START# *477242A40219_4ADDDFE60236get_var*
//#UC END# *477242A40219_4ADDDFE60236get_var*
begin
//#UC START# *477242A40219_4ADDDFE60236get_impl*
 Result := DoGetIndexInParent;
//#UC END# *477242A40219_4ADDDFE60236get_impl*
end;//Tl3PrimNode.pm_GetIndexInParent

function Tl3PrimNode.CanExpandCollapseAll: Boolean;
//#UC START# *4772433F0008_4ADDDFE60236_var*
//#UC END# *4772433F0008_4ADDDFE60236_var*
begin
//#UC START# *4772433F0008_4ADDDFE60236_impl*
 Result := False;
//#UC END# *4772433F0008_4ADDDFE60236_impl*
end;//Tl3PrimNode.CanExpandCollapseAll

procedure Tl3PrimNode.ExpandCollapseAll(anExpand: Boolean);
//#UC START# *47724349030A_4ADDDFE60236_var*
//#UC END# *47724349030A_4ADDDFE60236_var*
begin
//#UC START# *47724349030A_4ADDDFE60236_impl*
//#UC END# *47724349030A_4ADDDFE60236_impl*
end;//Tl3PrimNode.ExpandCollapseAll

function Tl3PrimNode.CanAcceptData(const aData: Tl3TreeData): Boolean;
//#UC START# *47A86F070101_4ADDDFE60236_var*
//#UC END# *47A86F070101_4ADDDFE60236_var*
begin
//#UC START# *47A86F070101_4ADDDFE60236_impl*
 Result := GetCanAcceptData(aData);
//#UC END# *47A86F070101_4ADDDFE60236_impl*
end;//Tl3PrimNode.CanAcceptData

function Tl3PrimNode.DropData(const aData: Tl3TreeData): Boolean;
//#UC START# *47A86F1C016B_4ADDDFE60236_var*
//#UC END# *47A86F1C016B_4ADDDFE60236_var*
begin
//#UC START# *47A86F1C016B_4ADDDFE60236_impl*
 Result := DoDropData(aData);
//#UC END# *47A86F1C016B_4ADDDFE60236_impl*
end;//Tl3PrimNode.DropData

function Tl3PrimNode.CanMove: Boolean;
//#UC START# *47ADA09C019B_4ADDDFE60236_var*
//#UC END# *47ADA09C019B_4ADDDFE60236_var*
begin
//#UC START# *47ADA09C019B_4ADDDFE60236_impl*
 Result := GetCanMove;
//#UC END# *47ADA09C019B_4ADDDFE60236_impl*
end;//Tl3PrimNode.CanMove

function Tl3PrimNode.Get_Prev: Il3SimpleNode;
//#UC START# *47B5759A03C0_4ADDDFE60236get_var*
//#UC END# *47B5759A03C0_4ADDDFE60236get_var*
begin
//#UC START# *47B5759A03C0_4ADDDFE60236get_impl*
 Result := Get_PrevNode;
//#UC END# *47B5759A03C0_4ADDDFE60236get_impl*
end;//Tl3PrimNode.Get_Prev
{$Include l3Changing.imp.pas}

// start class Tl3CustomNode

function Tl3CustomNode.DoCompareChild(const aChildrenNode1: Il3Node;
  const aChildrenNode2: Il3Node): Integer;
//#UC START# *54C8E03003CD_4ADDDFD50118_var*
//#UC END# *54C8E03003CD_4ADDDFD50118_var*
begin
//#UC START# *54C8E03003CD_4ADDDFD50118_impl*
 Result := l3Compare(aChildrenNode1.Text, aChildrenNode2.Text);
//#UC END# *54C8E03003CD_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoCompareChild

procedure Tl3CustomNode.DoSortChilds(const aChild: Il3Node = nil);
//#UC START# *54C8E0850062_4ADDDFD50118_var*
//#UC END# *54C8E0850062_4ADDDFD50118_var*
begin
//#UC START# *54C8E0850062_4ADDDFD50118_impl*
//#UC END# *54C8E0850062_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoSortChilds

procedure Tl3CustomNode.DoSort;
//#UC START# *54C8E0D301F8_4ADDDFD50118_var*
//#UC END# *54C8E0D301F8_4ADDDFD50118_var*
begin
//#UC START# *54C8E0D301F8_4ADDDFD50118_impl*
 if (ParentNode <> nil) and (ParentNode.ChildSorted) then
  ParentNode.SortChilds(Self);
//#UC END# *54C8E0D301F8_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoSort

procedure Tl3CustomNode.MovingStarted(var theUserParam: Pointer);
//#UC START# *54C8E3CA008E_4ADDDFD50118_var*
//#UC END# *54C8E3CA008E_4ADDDFD50118_var*
begin
//#UC START# *54C8E3CA008E_4ADDDFD50118_impl*
//#UC END# *54C8E3CA008E_4ADDDFD50118_impl*
end;//Tl3CustomNode.MovingStarted

procedure Tl3CustomNode.MovingStopped(aUserParam: Pointer);
//#UC START# *54C8E3DE0029_4ADDDFD50118_var*
//#UC END# *54C8E3DE0029_4ADDDFD50118_var*
begin
//#UC START# *54C8E3DE0029_4ADDDFD50118_impl*
//#UC END# *54C8E3DE0029_4ADDDFD50118_impl*
end;//Tl3CustomNode.MovingStopped

function Tl3CustomNode.DoMove(aDirection: Tl3Direction): Boolean;
//#UC START# *54C8E45103D9_4ADDDFD50118_var*
//#UC END# *54C8E45103D9_4ADDDFD50118_var*
begin
//#UC START# *54C8E45103D9_4ADDDFD50118_impl*
 Result := False;
//#UC END# *54C8E45103D9_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoMove

procedure Tl3CustomNode.DoNotify(aOperation: Integer;
  const aNode: Il3Node);
//#UC START# *54C8E4FA0325_4ADDDFD50118_var*
var
 lNode: Il3Node;
//#UC END# *54C8E4FA0325_4ADDDFD50118_var*
begin
//#UC START# *54C8E4FA0325_4ADDDFD50118_impl*
 lNode := ParentNode;
 if lNode <> nil then
  lNode.Notify(aOperation, aNode);
//#UC END# *54C8E4FA0325_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoNotify

function Tl3CustomNode.DoGetNodeByNumber(aNum: Integer): Il3Node;
//#UC START# *54C8E54F008C_4ADDDFD50118_var*
//#UC END# *54C8E54F008C_4ADDDFD50118_var*
begin
//#UC START# *54C8E54F008C_4ADDDFD50118_impl*
 if (aNum < 0) or (aNum > AllChildrenCount) then
  Result := Nil
 else
 if (aNum = 0) then
  Result := Self
 else
 begin
  Dec(aNum);
  Result := GetChildByNumber(aNum);
 end;
//#UC END# *54C8E54F008C_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoGetNodeByNumber

function Tl3CustomNode.GetIsAcceptChild(const aChild: Il3Node): Boolean;
//#UC START# *54C8E65102F8_4ADDDFD50118_var*
//#UC END# *54C8E65102F8_4ADDDFD50118_var*
begin
//#UC START# *54C8E65102F8_4ADDDFD50118_impl*
 Result := True;
//#UC END# *54C8E65102F8_4ADDDFD50118_impl*
end;//Tl3CustomNode.GetIsAcceptChild

procedure Tl3CustomNode.Set_AllChildrenCount(aValue: Integer);
//#UC START# *54C8DD88028F_4ADDDFD50118set_var*
//#UC END# *54C8DD88028F_4ADDDFD50118set_var*
begin
//#UC START# *54C8DD88028F_4ADDDFD50118set_impl*
 IncAllChildrenCount(aValue - AllChildrenCount);
//#UC END# *54C8DD88028F_4ADDDFD50118set_impl*
end;//Tl3CustomNode.Set_AllChildrenCount

function Tl3CustomNode.pm_GetChildSorted: Boolean;
//#UC START# *54C8DF73038F_4ADDDFD50118get_var*
//#UC END# *54C8DF73038F_4ADDDFD50118get_var*
begin
//#UC START# *54C8DF73038F_4ADDDFD50118get_impl*
 case f_ChildSortMode of
  2: Result := false;
  1: Result := true;
  0:
   if (ParentNode <> nil) then
    Result := ParentNode.ChildSorted
   else
    Result := false;
  else
  begin
   Result := false;
   Assert(false);
  end;//else
 end;//case f_ChildSortMode
//#UC END# *54C8DF73038F_4ADDDFD50118get_impl*
end;//Tl3CustomNode.pm_GetChildSorted

procedure Tl3CustomNode.pm_SetChildSorted(aValue: Boolean);
//#UC START# *54C8DF73038F_4ADDDFD50118set_var*
//#UC END# *54C8DF73038F_4ADDDFD50118set_var*
begin
//#UC START# *54C8DF73038F_4ADDDFD50118set_impl*
 if aValue then
  f_ChildSortMode := 1
 else
  f_ChildSortMode := 2;
//#UC END# *54C8DF73038F_4ADDDFD50118set_impl*
end;//Tl3CustomNode.pm_SetChildSorted

function Tl3CustomNode.pm_GetChildSortedFromParent: Boolean;
//#UC START# *54C8DFC602F8_4ADDDFD50118get_var*
//#UC END# *54C8DFC602F8_4ADDDFD50118get_var*
begin
//#UC START# *54C8DFC602F8_4ADDDFD50118get_impl*
 Result := f_ChildSortMode = 1;
//#UC END# *54C8DFC602F8_4ADDDFD50118get_impl*
end;//Tl3CustomNode.pm_GetChildSortedFromParent

procedure Tl3CustomNode.pm_SetChildSortedFromParent(aValue: Boolean);
//#UC START# *54C8DFC602F8_4ADDDFD50118set_var*
//#UC END# *54C8DFC602F8_4ADDDFD50118set_var*
begin
//#UC START# *54C8DFC602F8_4ADDDFD50118set_impl*
 if aValue then
  f_ChildSortMode := 0
 else
  f_ChildSortMode := 2;
//#UC END# *54C8DFC602F8_4ADDDFD50118set_impl*
end;//Tl3CustomNode.pm_SetChildSortedFromParent

function Tl3CustomNode.InsertChild(const aNode: Il3Node): Il3Node;
//#UC START# *47710BBE0052_4ADDDFD50118_var*
//#UC END# *47710BBE0052_4ADDDFD50118_var*
begin
//#UC START# *47710BBE0052_4ADDDFD50118_impl*
 Result := InsertChildBefore(nil, aNode);
//#UC END# *47710BBE0052_4ADDDFD50118_impl*
end;//Tl3CustomNode.InsertChild

function Tl3CustomNode.InsertChildBefore(const aNextChild: Il3Node;
  const aNode: Il3Node): Il3Node;
//#UC START# *47710BCC0099_4ADDDFD50118_var*
//#UC END# *47710BCC0099_4ADDDFD50118_var*
begin
//#UC START# *47710BCC0099_4ADDDFD50118_impl*
 Result := DoInsertChildBefore(aNextChild, aNode);
//#UC END# *47710BCC0099_4ADDDFD50118_impl*
end;//Tl3CustomNode.InsertChildBefore

function Tl3CustomNode.IsAcceptChild(const aChild: Il3Node): Boolean;
//#UC START# *47710BF103B7_4ADDDFD50118_var*
//#UC END# *47710BF103B7_4ADDDFD50118_var*
begin
//#UC START# *47710BF103B7_4ADDDFD50118_impl*
 Result := GetIsAcceptChild(aChild);
//#UC END# *47710BF103B7_4ADDDFD50118_impl*
end;//Tl3CustomNode.IsAcceptChild

function Tl3CustomNode.GetChildByNumber(aNum: Integer): Il3Node;
//#UC START# *47710BFD00A6_4ADDDFD50118_var*
//#UC END# *47710BFD00A6_4ADDDFD50118_var*
begin
//#UC START# *47710BFD00A6_4ADDDFD50118_impl*
 Result := DoGetChildByNumber(aNum);
//#UC END# *47710BFD00A6_4ADDDFD50118_impl*
end;//Tl3CustomNode.GetChildByNumber

function Tl3CustomNode.GetNodeByNumber(aNum: Integer): Il3Node;
//#UC START# *47710C0E00D9_4ADDDFD50118_var*
//#UC END# *47710C0E00D9_4ADDDFD50118_var*
begin
//#UC START# *47710C0E00D9_4ADDDFD50118_impl*
 Result := DoGetNodebyNumber(aNum);
//#UC END# *47710C0E00D9_4ADDDFD50118_impl*
end;//Tl3CustomNode.GetNodeByNumber

function Tl3CustomNode.GetNumInParent(aOnlyOneLevel: Boolean = false): Integer;
//#UC START# *47710C1F0389_4ADDDFD50118_var*
//#UC END# *47710C1F0389_4ADDDFD50118_var*
begin
//#UC START# *47710C1F0389_4ADDDFD50118_impl*
 Result := DoGetNumInParent(aOnlyOneLevel);
//#UC END# *47710C1F0389_4ADDDFD50118_impl*
end;//Tl3CustomNode.GetNumInParent

procedure Tl3CustomNode.Notify(aOperation: Integer;
  const aNode: Il3Node);
//#UC START# *47710C4A017A_4ADDDFD50118_var*
//#UC END# *47710C4A017A_4ADDDFD50118_var*
begin
//#UC START# *47710C4A017A_4ADDDFD50118_impl*
 DoNotify(aOperation, aNode);
//#UC END# *47710C4A017A_4ADDDFD50118_impl*
end;//Tl3CustomNode.Notify

procedure Tl3CustomNode.IncAllChildrenCount(aInc: Integer);
//#UC START# *47710C5B0032_4ADDDFD50118_var*
//#UC END# *47710C5B0032_4ADDDFD50118_var*
begin
//#UC START# *47710C5B0032_4ADDDFD50118_impl*
 DoIncAllChildrenCount(aInc);
//#UC END# *47710C5B0032_4ADDDFD50118_impl*
end;//Tl3CustomNode.IncAllChildrenCount

function Tl3CustomNode.Move(aDirection: Tl3Direction): Boolean;
//#UC START# *47710C8C007B_4ADDDFD50118_var*
//#UC END# *47710C8C007B_4ADDDFD50118_var*
begin
//#UC START# *47710C8C007B_4ADDDFD50118_impl*
 Result := DoMove(aDirection);
//#UC END# *47710C8C007B_4ADDDFD50118_impl*
end;//Tl3CustomNode.Move

function Tl3CustomNode.Iterate(Action: Tl3NodeAction;
  IterMode: Integer = 0;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *47710C9F001E_4ADDDFD50118_var*
//#UC END# *47710C9F001E_4ADDDFD50118_var*
begin
//#UC START# *47710C9F001E_4ADDDFD50118_impl*
 Result := DoIterate(Action, IterMode, aFromNode);
//#UC END# *47710C9F001E_4ADDDFD50118_impl*
end;//Tl3CustomNode.Iterate

function Tl3CustomNode.IterateF(Action: Tl3NodeAction;
  IterMode: Integer = 0;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *47710CC30122_4ADDDFD50118_var*
//#UC END# *47710CC30122_4ADDDFD50118_var*
begin
//#UC START# *47710CC30122_4ADDDFD50118_impl*
 try
  Result := Iterate(Action, IterMode, aFromNode);
 finally
  l3FreeFA(Tl3FreeAction(Action));
 end;{try..finally}
//#UC END# *47710CC30122_4ADDDFD50118_impl*
end;//Tl3CustomNode.IterateF

procedure Tl3CustomNode.ReleaseChilds;
//#UC START# *47710CE400B0_4ADDDFD50118_var*
//#UC END# *47710CE400B0_4ADDDFD50118_var*
begin
//#UC START# *47710CE400B0_4ADDDFD50118_impl*
 DoReleaseChilds;
//#UC END# *47710CE400B0_4ADDDFD50118_impl*
end;//Tl3CustomNode.ReleaseChilds

function Tl3CustomNode.CompareChild(const aChildrenNode1: Il3Node;
  const aChildrenNode2: Il3Node): Integer;
//#UC START# *47710DC10100_4ADDDFD50118_var*
//#UC END# *47710DC10100_4ADDDFD50118_var*
begin
//#UC START# *47710DC10100_4ADDDFD50118_impl*
 Result := DoCompareChild(aChildrenNode1, aChildrenNode2);
//#UC END# *47710DC10100_4ADDDFD50118_impl*
end;//Tl3CustomNode.CompareChild

procedure Tl3CustomNode.SortChilds(const aChild: Il3Node = nil);
//#UC START# *47710DE4027E_4ADDDFD50118_var*
//#UC END# *47710DE4027E_4ADDDFD50118_var*
begin
//#UC START# *47710DE4027E_4ADDDFD50118_impl*
 DoSortChilds(aChild);
//#UC END# *47710DE4027E_4ADDDFD50118_impl*
end;//Tl3CustomNode.SortChilds

procedure Tl3CustomNode.Sort;
//#UC START# *47710DF70238_4ADDDFD50118_var*
//#UC END# *47710DF70238_4ADDDFD50118_var*
begin
//#UC START# *47710DF70238_4ADDDFD50118_impl*
 DoSort;
//#UC END# *47710DF70238_4ADDDFD50118_impl*
end;//Tl3CustomNode.Sort

function Tl3CustomNode.Get_Text: Tl3PCharLenPrim;
//#UC START# *47710E430313_4ADDDFD50118get_var*
//#UC END# *47710E430313_4ADDDFD50118get_var*
begin
//#UC START# *47710E430313_4ADDDFD50118get_impl*
 Result := inherited Get_Text;
//#UC END# *47710E430313_4ADDDFD50118get_impl*
end;//Tl3CustomNode.Get_Text

procedure Tl3CustomNode.Set_Text(const aValue: Tl3PCharLenPrim);
//#UC START# *47710E430313_4ADDDFD50118set_var*
//#UC END# *47710E430313_4ADDDFD50118set_var*
begin
//#UC START# *47710E430313_4ADDDFD50118set_impl*
 Changing;
 try
  AsPCharLen := Tl3PCharLen(aValue);
  Sort;
  Notify(ntDataChange, Self);
 finally
  Changed;
 end;
//#UC END# *47710E430313_4ADDDFD50118set_impl*
end;//Tl3CustomNode.Set_Text

function Tl3CustomNode.Get_ChildSorted: Boolean;
//#UC START# *47710E8D018C_4ADDDFD50118get_var*
//#UC END# *47710E8D018C_4ADDDFD50118get_var*
begin
//#UC START# *47710E8D018C_4ADDDFD50118get_impl*
 Result := pm_GetChildSorted;
//#UC END# *47710E8D018C_4ADDDFD50118get_impl*
end;//Tl3CustomNode.Get_ChildSorted

procedure Tl3CustomNode.Set_ChildSorted(aValue: Boolean);
//#UC START# *47710E8D018C_4ADDDFD50118set_var*
//#UC END# *47710E8D018C_4ADDDFD50118set_var*
begin
//#UC START# *47710E8D018C_4ADDDFD50118set_impl*
 pm_SetChildSorted(aValue);
//#UC END# *47710E8D018C_4ADDDFD50118set_impl*
end;//Tl3CustomNode.Set_ChildSorted

function Tl3CustomNode.Get_ChildSortedFromParent: Boolean;
//#UC START# *47710E9D0055_4ADDDFD50118get_var*
//#UC END# *47710E9D0055_4ADDDFD50118get_var*
begin
//#UC START# *47710E9D0055_4ADDDFD50118get_impl*
 Result := pm_GetChildSortedFromParent
//#UC END# *47710E9D0055_4ADDDFD50118get_impl*
end;//Tl3CustomNode.Get_ChildSortedFromParent

procedure Tl3CustomNode.Set_ChildSortedFromParent(aValue: Boolean);
//#UC START# *47710E9D0055_4ADDDFD50118set_var*
//#UC END# *47710E9D0055_4ADDDFD50118set_var*
begin
//#UC START# *47710E9D0055_4ADDDFD50118set_impl*
 pm_SetChildSortedFromParent(aValue);
//#UC END# *47710E9D0055_4ADDDFD50118set_impl*
end;//Tl3CustomNode.Set_ChildSortedFromParent

function Tl3CustomNode.Get_Flags: Integer;
//#UC START# *47710EAD0211_4ADDDFD50118get_var*
//#UC END# *47710EAD0211_4ADDDFD50118get_var*
begin
//#UC START# *47710EAD0211_4ADDDFD50118get_impl*
 Result := pm_GetFlags;
//#UC END# *47710EAD0211_4ADDDFD50118get_impl*
end;//Tl3CustomNode.Get_Flags

procedure Tl3CustomNode.Set_Flags(aValue: Integer);
//#UC START# *47710EAD0211_4ADDDFD50118set_var*
//#UC END# *47710EAD0211_4ADDDFD50118set_var*
begin
//#UC START# *47710EAD0211_4ADDDFD50118set_impl*
 pm_SetFlags(aValue);
//#UC END# *47710EAD0211_4ADDDFD50118set_impl*
end;//Tl3CustomNode.Set_Flags

function Tl3CustomNode.GetSelf: Tl3CustomNode;
//#UC START# *54C6199B01BE_4ADDDFD50118_var*
//#UC END# *54C6199B01BE_4ADDDFD50118_var*
begin
//#UC START# *54C6199B01BE_4ADDDFD50118_impl*
 Result := Self;
//#UC END# *54C6199B01BE_4ADDDFD50118_impl*
end;//Tl3CustomNode.GetSelf

function Tl3CustomNode.InheritFrom(aClassType: Tl3NodeClass): Boolean;
//#UC START# *54C619B103B9_4ADDDFD50118_var*
//#UC END# *54C619B103B9_4ADDDFD50118_var*
begin
//#UC START# *54C619B103B9_4ADDDFD50118_impl*
 Result := Self is aClassType;
//#UC END# *54C619B103B9_4ADDDFD50118_impl*
end;//Tl3CustomNode.InheritFrom

function Tl3CustomNode.Get_AllChildrenCount: Integer;
//#UC START# *54C78C200291_4ADDDFD50118_var*
//#UC END# *54C78C200291_4ADDDFD50118_var*
begin
//#UC START# *54C78C200291_4ADDDFD50118_impl*
 Result := 0;
//#UC END# *54C78C200291_4ADDDFD50118_impl*
end;//Tl3CustomNode.Get_AllChildrenCount

function Tl3CustomNode.DoGetThisChildrenCount: Integer;
//#UC START# *54C78C8102DD_4ADDDFD50118_var*
 procedure CountChild(const aNode: Il3Node);
 begin
  Inc(Result);
 end;
//#UC END# *54C78C8102DD_4ADDDFD50118_var*
begin
//#UC START# *54C78C8102DD_4ADDDFD50118_impl*
 Result := 0;
 IterateF(l3L2NA( @CountChild), imOneLevel);
//#UC END# *54C78C8102DD_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoGetThisChildrenCount

function Tl3CustomNode.HasChildNode: Boolean;
//#UC START# *54C78FC902EA_4ADDDFD50118_var*
//#UC END# *54C78FC902EA_4ADDDFD50118_var*
begin
//#UC START# *54C78FC902EA_4ADDDFD50118_impl*
 Result := (ChildNode <> nil);
//#UC END# *54C78FC902EA_4ADDDFD50118_impl*
end;//Tl3CustomNode.HasChildNode

function Tl3CustomNode.GetIsDisappeared: Boolean;
//#UC START# *54C7905B00BA_4ADDDFD50118_var*
//#UC END# *54C7905B00BA_4ADDDFD50118_var*
begin
//#UC START# *54C7905B00BA_4ADDDFD50118_impl*
 Result := l3TestMask(Flags, nfWasDisappear);
//#UC END# *54C7905B00BA_4ADDDFD50118_impl*
end;//Tl3CustomNode.GetIsDisappeared

procedure Tl3CustomNode.DoBeginMove(var theUserParam: Pointer);
//#UC START# *54C790D002B4_4ADDDFD50118_var*
//#UC END# *54C790D002B4_4ADDDFD50118_var*
begin
//#UC START# *54C790D002B4_4ADDDFD50118_impl*
 if f_MoveEnterCount = 0 then
  MovingStarted(theUserParam);
 Inc(f_MoveEnterCount);
//#UC END# *54C790D002B4_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoBeginMove

procedure Tl3CustomNode.DoEndMove(aUserParam: Pointer);
//#UC START# *54C790EC0246_4ADDDFD50118_var*
//#UC END# *54C790EC0246_4ADDDFD50118_var*
begin
//#UC START# *54C790EC0246_4ADDDFD50118_impl*
 Dec(f_MoveEnterCount);
 if f_MoveEnterCount = 0 then
  MovingStopped(aUserParam);
//#UC END# *54C790EC0246_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoEndMove

procedure Tl3CustomNode.DoChanged;
//#UC START# *54D9E08D0212_4ADDDFD50118_var*
var
 lNode : Il3Node;
//#UC END# *54D9E08D0212_4ADDDFD50118_var*
begin
//#UC START# *54D9E08D0212_4ADDDFD50118_impl*
 lNode := ParentNode;
 if lNode <> nil then
  lNode.Changed;
 inherited;
//#UC END# *54D9E08D0212_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoChanged

procedure Tl3CustomNode.DoChanging;
//#UC START# *54D9E09D018D_4ADDDFD50118_var*
var
 lNode : Il3Node;
//#UC END# *54D9E09D018D_4ADDDFD50118_var*
begin
//#UC START# *54D9E09D018D_4ADDDFD50118_impl*
 inherited;
 lNode := ParentNode;
 if lNode <> nil then
  lNode.Changing;
//#UC END# *54D9E09D018D_4ADDDFD50118_impl*
end;//Tl3CustomNode.DoChanging
// start class Tl3Node

function Tl3Node.IterateNoParent(Action: Tl3NodeAction;
  IterMode: Integer;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *54CA26F7039B_4ADDDFC50302_var*
var
 lNext: Il3Node;
 lCNode: Il3Node;
//#UC END# *54CA26F7039B_4ADDDFC50302_var*
begin
//#UC START# *54CA26F7039B_4ADDDFC50302_impl*
 Result := nil;
 lNext := nil;
 IterMode := IterMode and not imNoSubRoot and not imParentNeed;

 lCNode := aFromNode;
 repeat
  Result := lCNode.Iterate(Action, IterMode, lNext);
  if (Result <> nil) or IsSame(lCNode) then
   Exit;

  while lCNode.IsLast do
  begin
   lCNode := lCNode.ParentNode;
   if IsSame(lCNode) then
    Exit;
  end;

  lNext := lCNode.NextNode;
  lCNode := lCNode.ParentNode;
 until false;
//#UC END# *54CA26F7039B_4ADDDFC50302_impl*
end;//Tl3Node.IterateNoParent

procedure Tl3Node.Subscribe(const aRecipient: Il3Notify);
//#UC START# *46A44F6B035E_4ADDDFC50302_var*
//#UC END# *46A44F6B035E_4ADDDFC50302_var*
begin
//#UC START# *46A44F6B035E_4ADDDFC50302_impl*
 if f_NotifiedObjList = nil then
  f_NotifiedObjList := Tl3LongintList.MakeSorted;
 f_NotifiedObjList.Add(Integer(aRecipient));
//#UC END# *46A44F6B035E_4ADDDFC50302_impl*
end;//Tl3Node.Subscribe

procedure Tl3Node.Unsubscribe(const aRecipient: Il3Notify);
//#UC START# *46A44FFE0143_4ADDDFC50302_var*
//#UC END# *46A44FFE0143_4ADDDFC50302_var*
begin
//#UC START# *46A44FFE0143_4ADDDFC50302_impl*
 if f_NotifiedObjList <> nil then
  f_NotifiedObjList.Remove(Integer(aRecipient));
//#UC END# *46A44FFE0143_4ADDDFC50302_impl*
end;//Tl3Node.Unsubscribe

function Tl3Node.DoGetIndexInParent: Integer;
//#UC START# *54C78A1E033E_4ADDDFC50302_var*
//#UC END# *54C78A1E033E_4ADDDFC50302_var*
begin
//#UC START# *54C78A1E033E_4ADDDFC50302_impl*
 Result := GetNumInParent(True);
//#UC END# *54C78A1E033E_4ADDDFC50302_impl*
end;//Tl3Node.DoGetIndexInParent

function Tl3Node.Get_ParentNode: Il3Node;
//#UC START# *54C78E1002BE_4ADDDFC50302_var*
//#UC END# *54C78E1002BE_4ADDDFC50302_var*
begin
//#UC START# *54C78E1002BE_4ADDDFC50302_impl*
 Result := Parent;
//#UC END# *54C78E1002BE_4ADDDFC50302_impl*
end;//Tl3Node.Get_ParentNode

function Tl3Node.Get_ChildNode: Il3Node;
//#UC START# *54C78E2702B3_4ADDDFC50302_var*
//#UC END# *54C78E2702B3_4ADDDFC50302_var*
begin
//#UC START# *54C78E2702B3_4ADDDFC50302_impl*
 Result := Child;
//#UC END# *54C78E2702B3_4ADDDFC50302_impl*
end;//Tl3Node.Get_ChildNode

function Tl3Node.Get_NextNode: Il3Node;
//#UC START# *54C78E370213_4ADDDFC50302_var*
//#UC END# *54C78E370213_4ADDDFC50302_var*
begin
//#UC START# *54C78E370213_4ADDDFC50302_impl*
 Result := Next;
//#UC END# *54C78E370213_4ADDDFC50302_impl*
end;//Tl3Node.Get_NextNode

function Tl3Node.Get_PrevNode: Il3Node;
//#UC START# *54C78E440118_4ADDDFC50302_var*
//#UC END# *54C78E440118_4ADDDFC50302_var*
begin
//#UC START# *54C78E440118_4ADDDFC50302_impl*
 Result := Prev;
//#UC END# *54C78E440118_4ADDDFC50302_impl*
end;//Tl3Node.Get_PrevNode

function Tl3Node.GetLevelForParent(const aNode: Il3SimpleNode): Integer;
//#UC START# *54C78EA30198_4ADDDFC50302_var*
var
 lCNode : Il3SimpleNode;
//#UC END# *54C78EA30198_4ADDDFC50302_var*
begin
//#UC START# *54C78EA30198_4ADDDFC50302_impl*
 Result := 0;
 lCNode := Self;
 while (lCNode <> nil) and not lCNode.IsSame(aNode) do
 begin
  Inc(Result);
  lCNode := lCNode.Parent;
 end;//while (lCNode <> nil)
 if (lCNode = nil) then
  Result := -1;
//#UC END# *54C78EA30198_4ADDDFC50302_impl*
end;//Tl3Node.GetLevelForParent

procedure Tl3Node.Remove;
//#UC START# *54C791DB001D_4ADDDFC50302_var*
//#UC END# *54C791DB001D_4ADDDFC50302_var*
begin
//#UC START# *54C791DB001D_4ADDDFC50302_impl*
 if Parent = nil then
  exit;
 Changing;
 try
  Flags := Flags or nfWasDisappear;
  Notify(ntDelete, Self);
  try
   if IsFirst then
    if IsLast then
     Parent.Child := nil
    else
     Parent.Child := Next;

   if Parent.Child <> nil then
   begin
    Next.Prev := Prev;
    Prev.Next := Next;
   end;

   if Next = Self then
   begin
    Next := nil;
    Prev := nil;
   end;
   Parent.IncAllChildrenCount( -Succ(AllChildrenCount));
   //Parent := nil; Changed send to Parent!!!
  finally
   Notify(ntDeleteDone, Self);
  end;
 finally
  Changed;
 end;
 Parent := nil;
 Free;
//#UC END# *54C791DB001D_4ADDDFC50302_impl*
end;//Tl3Node.Remove

function Tl3Node.IterateChild(Action: Tl3NodeAction;
  IterMode: Integer;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *54C8DFF102DD_4ADDDFC50302_var*
var
 lCurNode : Il3Node;
 lNextNode : Il3Node;
//#UC END# *54C8DFF102DD_4ADDDFC50302_var*
begin
//#UC START# *54C8DFF102DD_4ADDDFC50302_impl*
 Result := nil;
 if not HasChild then
  Exit;
 if (aFromNode = nil) then
  lCurNode := ChildNode
 else
 begin
  if not IsSame(aFromNode.ParentNode) then
   Exit;
  lCurNode := aFromNode;
 end;

 repeat
  if lCurNode.IsLast then
   lNextNode := nil
  else lNextNode := lCurNode.NextNode;

  Result := lCurNode.Iterate(Action, IterMode);
  // ## Result := (lCurNode as Il3NodeWrap).GetSelf.Iterate(Action, IterMode);

  if (Result <> nil) or (lNextNode = nil) then
   Exit;

  lCurNode := lNextNode;
 until False;
//#UC END# *54C8DFF102DD_4ADDDFC50302_impl*
end;//Tl3Node.IterateChild

function Tl3Node.DoGetNumInParent(aOnlyOneLevel: Boolean = False): Integer;
//#UC START# *54C8E1F30128_4ADDDFC50302_var*
var
 lNode : Tl3Node;
//#UC END# *54C8E1F30128_4ADDDFC50302_var*
begin
//#UC START# *54C8E1F30128_4ADDDFC50302_impl*
 Result := 0;
 lNode := Self;
 while not lNode.IsFirst do
 begin
  lNode := lNode.Prev;
  Inc(Result);
  if not aOnlyOneLevel then
   Inc(Result, lNode.AllChildrenCount);
 end;
//#UC END# *54C8E1F30128_4ADDDFC50302_impl*
end;//Tl3Node.DoGetNumInParent

procedure Tl3Node.DoReleaseChilds;
//#UC START# *54C8E22F0223_4ADDDFC50302_var*
//#UC END# *54C8E22F0223_4ADDDFC50302_var*
begin
//#UC START# *54C8E22F0223_4ADDDFC50302_impl*
 if Child = nil then
  Exit;

 Changing;
 try
  Notify(ntChildClear, Self);
  AllChildrenCount := 0;
  ReleaseChildsPrim;
 finally
  Changed;
 end;
//#UC END# *54C8E22F0223_4ADDDFC50302_impl*
end;//Tl3Node.DoReleaseChilds

procedure Tl3Node.ReleaseChildsPrim;
//#UC START# *54C8E23B01AB_4ADDDFC50302_var*
var
 lCurNode : Tl3Node;
 lNextNode : Tl3Node;
 lLast : Boolean;
//#UC END# *54C8E23B01AB_4ADDDFC50302_var*
begin
//#UC START# *54C8E23B01AB_4ADDDFC50302_impl*
 if Child = nil then
  Exit;

 lCurNode := Child.Prev; // Last
 repeat
  lLast := lCurNode = Child;
  lNextNode := lCurNode.Prev;
  lCurNode.Parent := nil;
  lCurNode.Free;
  lCurNode := lNextNode;
 until lLast;
 Child := nil;
//#UC END# *54C8E23B01AB_4ADDDFC50302_impl*
end;//Tl3Node.ReleaseChildsPrim

function Tl3Node.DoGetChildByNumber(aNum: Integer): Il3Node;
//#UC START# *54C8E5660144_4ADDDFC50302_var*
//#UC END# *54C8E5660144_4ADDDFC50302_var*
begin
//#UC START# *54C8E5660144_4ADDDFC50302_impl*
 Result := ChildNode;
 while (Result <> nil) do
 begin
  if aNum = 0 then
   Break
  else
  if aNum <= Result.AllChildrenCount then
  begin
   Result := Result.GetNodeByNumber(aNum);
   Break;
  end
  else Dec(aNum, Succ(Result.AllChildrenCount));
  Result := Result.NextNode;
 end;
//#UC END# *54C8E5660144_4ADDDFC50302_impl*
end;//Tl3Node.DoGetChildByNumber

function Tl3Node.DoIterate(Action: Tl3NodeAction;
  IterMode: Integer = 0;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *54C8E5AF00F8_4ADDDFC50302_var*
var
 lCurNode : Il3Node;
 ActionResult : Boolean;
 lParentNeed : Boolean;
 lFromNode : Il3Node;
//#UC END# *54C8E5AF00F8_4ADDDFC50302_var*
begin
//#UC START# *54C8E5AF00F8_4ADDDFC50302_impl*
 lFromNode := aFromNode;
 if IsSame(lFromNode) then
  lFromNode := nil
 else
  lFromNode := aFromNode;

 if (IterMode and imNoSubRoot > 0) and (lFromNode <> nil) then
 begin
  Result := IterateNoParent(Action, IterMode, lFromNode);
  Exit;
 end;

 Result := nil;
 lParentNeed := l3TestMask(IterMode, imParentNeed);
 IterMode := IterMode or imParentNeed;

 if (IterMode and imChildsBefore > 0) and (IterMode and imNoChilds = 0) and HasChild then
 begin
  if (IterMode and imOneLevel > 0) then
   l3SetMask(IterMode, imNoChilds);
  Result := IterateChild(Action, IterMode, lFromNode);
 end;

 if (Result = nil) and lParentNeed then
 begin
  lCurNode := Self;
{$IfDef SkipIterByExcept}
  try
   if (IterMode and imLeavesOnly > 0) then
   begin
    if (not lCurNode.HasChild) then
     ActionResult := Action(lCurNode)
    else
     ActionResult := False;
   end
   else
    ActionResult := Action(lCurNode);
  except
   on E: ESkipIterateChilds do
   begin
    ActionResult := False;
    l3SetMask(IterMode, imNoChilds);
   end;
   else raise;
  end;
{$Else}
  if (IterMode and imLeavesOnly > 0) then
  begin
   if (not lCurNode.HasChild) then
    ActionResult := Action(lCurNode)
   else
    ActionResult := False;
  end
  else
   ActionResult := Action(lCurNode);

  if Byte(ActionResult) = 2 then
  begin
   ActionResult := False;
   if l3TestMask(IterMode, imCheckResult) then
    l3SetMask(IterMode, imNoChilds);
  end;
{$EndIf}

  if (IterMode and imCheckResult > 0) and ActionResult then
  begin
   Result := lCurNode;
   Exit;
  end;
 end;

 if (IterMode and imChildsBefore = 0) and (IterMode and imNoChilds = 0) and HasChild then
 begin
  if (IterMode and imOneLevel > 0) then
   l3SetMask(IterMode, imNoChilds);
  Result := IterateChild(Action, IterMode, lFromNode);
 end;
//#UC END# *54C8E5AF00F8_4ADDDFC50302_impl*
end;//Tl3Node.DoIterate

function Tl3Node.DoInsertChildBefore(const aNextChild: Il3Node;
  const aChild: Il3Node): Il3Node;
//#UC START# *54C8E60703B6_4ADDDFC50302_var*
var
 lNewChild : Tl3Node;
 lPrevNode : Tl3Node;
 lNextNode : Tl3Node;
//#UC END# *54C8E60703B6_4ADDDFC50302_var*
begin
//#UC START# *54C8E60703B6_4ADDDFC50302_impl*
 Changing;
 try
  Result := aChild;
  lNewChild := (aChild as Il3NodeWrap).GetSelf as Tl3Node;
  lNewChild.Parent := Self;
  lNewChild.Use;
  lNewChild.Flags := lNewChild.Flags and not nfWasDisappear;

  if not HasChild then
  begin
   Child := lNewChild;
   //Flags := Flags or nfHasChild;
   lNewChild.Prev := lNewChild;
   lNewChild.Next := lNewChild;
  end
  else
  begin
   if ChildSorted then
   begin
    lNextNode := Child;
    while True do
    begin
     if CompareChild(aChild, lNextNode) < 0 then
     begin
      if Child = lNextNode then
       Child := lNewChild;
      Break;
     end;

     lNextNode := lNextNode.Next;

     if lNextNode.IsFirst then
     begin
      lNextNode := Child;
      Break;
     end;
    end;
   end
   else if aNextChild = nil then
    lNextNode := Child
   else
   begin
    lNextNode := (aNextChild as Il3NodeWrap).GetSelf as Tl3Node;
    if Child = lNextNode then
     Child := lNewChild;
   end;

   //lNextNode := lPrevNode.Next;

   lPrevNode := lNextNode.Prev;
   lPrevNode.Next := lNewChild;
   lNextNode.Prev := lNewChild;
   lNewChild.Next := lNextNode;
   lNewChild.Prev := lPrevNode;
  end;

  {Increment AllChildrenCount}
  IncAllChildrenCount(Succ(aChild.AllChildrenCount));
  Notify(ntInsert, aChild);
 finally
  Changed;
 end;
//#UC END# *54C8E60703B6_4ADDDFC50302_impl*
end;//Tl3Node.DoInsertChildBefore

procedure Tl3Node.Cleanup;
//#UC START# *479731C50290_4ADDDFC50302_var*
//#UC END# *479731C50290_4ADDDFC50302_var*
begin
//#UC START# *479731C50290_4ADDDFC50302_impl*
 l3Free(f_NotifiedObjList);
 ReleaseChilds;
 inherited;
//#UC END# *479731C50290_4ADDDFC50302_impl*
end;//Tl3Node.Cleanup

procedure Tl3Node.DoSortChilds(const aChild: Il3Node = nil);
//#UC START# *54C8E0850062_4ADDDFC50302_var*
var
 lChild : Tl3Node;
 lNextNode : Tl3Node;
 lNextOfChild : Tl3Node;
 lEndList : Boolean;

 lMakeFirst : Boolean;
 lUserParam : Pointer;

 procedure lpMoveNode(const aMoveNode, aNextNode: Tl3Node; aMakeFirst: Boolean);
 begin
  if (aMoveNode.Next = aNextNode) and
   ( not aMakeFirst or (Child = aMoveNode)) then
   Exit;

  Notify(ntMoveBegin, aMoveNode);
  try
   lUserParam := nil;
   aMoveNode.BeginMove(lUserParam);

   try
    if aMakeFirst then
     Child := aMoveNode
    else
     if Child = aMoveNode then
      Child := aMoveNode.Next;

    if (aMoveNode <> aNextNode) and
       (aMoveNode.Next <> aNextNode) then
    begin
     with aMoveNode do
     begin
      Next.Prev := Prev;
      Prev.Next := Next;
     end;

     aMoveNode.Prev := lNextNode.Prev;
     aMoveNode.Next := aNextNode;
     aMoveNode.Prev.Next := aMoveNode;
     aNextNode.Prev := aMoveNode;
    end;

   finally
    aMoveNode.EndMove(lUserParam);
   end;
  finally
   Notify(ntMoveEnd, aMoveNode);
  end;
 end;
//#UC END# *54C8E0850062_4ADDDFC50302_var*
begin
//#UC START# *54C8E0850062_4ADDDFC50302_impl*
 if not HasChild then
  Exit;
 if aChild <> nil then
 begin
  if not IsSame(aChild.ParentNode) then
   Exit;
  if Child.IsLast then
   Exit;
  lNextNode := Child;
  lChild := (aChild as Il3NodeWrap).GetSelf as Tl3Node;

  lMakeFirst := False;

  while True do
  begin
   if (lChild <> lNextNode) then
   begin
    if CompareChild(aChild, lNextNode) < 0 then
    begin
     lMakeFirst := Child = lNextNode;
     Break;
    end;
   end;

   lNextNode := lNextNode.Next;

   if lNextNode.IsFirst then {конец списка}
   begin
    lNextNode := Child;
    Break;
   end;
  end;
  Changing;
  try
   lpMoveNode(lChild, lNextNode, lMakeFirst);
  finally
   Changed;
  end;
 end
 else
 begin
  if Child.IsLast then
   Exit;
  lChild := Child.Next;
  lEndList := lChild.IsLast;
  Changing;
  try
   while True do
   begin
    lNextNode := Child;
    //lMakeFirst := False;

    while True do
    begin
     if (lChild <> lNextNode) then
     begin
      if CompareChild(lChild, lNextNode) < 0 then
      begin
       lMakeFirst := Child = lNextNode;
       lNextOfChild := lChild.Next;
       lpMoveNode(lChild, lNextNode, lMakeFirst);
       lChild := lNextOfChild;
       Break;
      end
     end
     else
     begin
      lChild := lChild.Next;
      Break;
     end;
     lNextNode := lNextNode.Next;
    end;

    if lEndList then
     Break; {конец списка}
    lEndList := lChild.IsLast;
   end;
  finally
   Changed;
  end;
 end;
//#UC END# *54C8E0850062_4ADDDFC50302_impl*
end;//Tl3Node.DoSortChilds

function Tl3Node.DoMove(aDirection: Tl3Direction): Boolean;
//#UC START# *54C8E45103D9_4ADDDFC50302_var*
var
 ltParentNode       : Il3Node;
 ltParentParentNode : Il3Node;
 ltNextNode         : Il3Node;
 ltNextNextNode     : Il3Node;
 lUserParam         : Pointer;
//#UC END# *54C8E45103D9_4ADDDFC50302_var*
begin
//#UC START# *54C8E45103D9_4ADDDFC50302_impl*
 Result := False;
 if Parent = Nil then
  Exit;
 if Parent.ChildSorted then
  Exit;

 Notify(ntMoveBegin, Self);
 try
  lUserParam := nil;
  BeginMove(lUserParam);
  try
   case aDirection of
    dUp:
     if not IsFirst then
     begin
      Changing;
      try
       Prev.Next := Next;
       Next.Prev := Prev;

       if Parent.Child = Prev then
        Parent.Child := Self;
       Next := Prev;
       Prev := Prev.Prev;
       Next.Prev := Self;
       Prev.Next := Self;
       Result := True;
      finally
       Changed;
      end;
     end;

    dUpMax:
     if not IsFirst then
     begin
      Changing;
      try
       Prev.Next := Next;
       Next.Prev := Prev;

       Next := Parent.Child;
       Prev := Parent.Child.Prev;
       Next.Prev := Self;
       Prev.Next := Self;
       Parent.Child := Self;
       Result := True;
      finally
       Changed;
      end;
     end;

    dDown:
     if not IsLast then
     begin
      Changing;
      try
       Prev.Next := Next;
       Next.Prev := Prev;

       if IsFirst then
        Parent.Child := Next;

       Prev := Next;
       Next := Next.Next;
       Next.Prev := Self;
       Prev.Next := Self;
       Result := True;
      finally
       Changed;
      end;
     end;
    (*
    dLeft:
     if Assigned(Parent) and Assigned(Parent.Parent) then
     begin
      ltParentNode := ParentNode;
      ltNextNode := NextNode;
      if ltParentNode.ParentNode.IsAcceptChild(Self) then
      begin
       Changing;
       try
        Remove;
        try
         ltParentNode.ParentNode.InsertChildBefore(ltParentNode, Self);
         Result := True;
        except
         ltParentNode.InsertChildBefore(ltNextNode, Self);
        end;
       finally
        Changed;
       end;
      end;
     end;

    dRight:
     if not IsLast then
     begin
      ltNextNode := NextNode;
      if ltNextNode.IsAcceptChild(Self) then
      begin
       Changing;
       try
        //ltNextNode := Next;
        Remove;
        try
         ltNextNode.InsertChildBefore(ltNextNode.ChildNode, Self);
         Result := True;
        except
         ltNextNode.ParentNode.InsertChildBefore(ltNextNode, Self);
        end;
       finally
        Changed;
       end;
      end;
     end;

     *)
    dLeft:
     if Assigned(Parent) and Assigned(Parent.Parent) then
     begin
      ltParentNode := ParentNode;
      ltNextNode := NextNode;
      if ltNextNode.IsFirst then
       ltNextNode := nil;

      ltParentParentNode := ltParentNode.ParentNode;
      if ltParentParentNode.IsAcceptChild(Self) then
      begin
       Changing;
       try
        Remove;
        try
         if ltParentNode.IsLast then
          ltParentNode := nil
         else
          ltParentNode := ltParentNode.NextNode;
         ltParentParentNode.InsertChildBefore(ltParentNode, Self);
         Result := True;

         While ltNextNode <> nil do
         begin
          ltNextNextNode := ltNextNode.NextNode;
          if ltNextNextNode.IsFirst then
           ltNextNextNode := nil;
          ltNextNode.Remove;
          InsertChild(ltNextNode);

          ltNextNode := ltNextNextNode;
         end;

        except
         // это работать не будет ltParentNode.InsertChildBefore(ltNextNode, Self);
         on E: Exception do
          l3System.Exception2Log(E);
        end;

       finally
        Changed;
       end;
      end;
     end;

    dRight:
     if not IsFirst then
     begin
      ltParentNode := PrevNode;

      if ltParentNode.IsAcceptChild(Self) then
      begin
       Changing;
       try
        //ltNextNode := Next;
        Remove;
        try
         ltParentNode.InsertChild(Self);
         Result := True;
        except
         on E: Exception do
         begin
          l3System.Exception2Log(E);
          if ltParentNode.IsLast then
           ltNextNode := nil
          else
           ltNextNode := ltParentNode.NextNode;
          ltParentNode.ParentNode.InsertChildBefore(ltNextNode, Self);
         end;
        end;
       finally
        Changed;
       end;
      end;
     end;
   end;
  finally
   EndMove(lUserParam);
  end;
 finally
  Notify(ntMoveEnd, Self);
 end;
//#UC END# *54C8E45103D9_4ADDDFC50302_impl*
end;//Tl3Node.DoMove

procedure Tl3Node.DoNotify(aOperation: Integer;
  const aNode: Il3Node);
//#UC START# *54C8E4FA0325_4ADDDFC50302_var*
var
 l_Index : Integer;
 l_NotifyRecipient : Il3NodeNotifyRecipient;
 l_Item  : IUnknown;
//#UC END# *54C8E4FA0325_4ADDDFC50302_var*
begin
//#UC START# *54C8E4FA0325_4ADDDFC50302_impl*
 inherited DoNotify(aOperation, aNode);
 if (f_NotifiedObjList <> nil) then
  for l_Index := 0 to f_NotifiedObjList.Hi do
  begin
   try // - зачем ??!!
    l_Item := IUnknown(f_NotifiedObjList[l_Index]);
    if Supports(l_Item, Il3NodeNotifyRecipient, l_NotifyRecipient) AND
       (l_Item = l_NotifyRecipient) then
     try
      l_NotifyRecipient.Notify(aOperation, aNode);
     finally
      l_NotifyRecipient := nil;
     end;//try..finally
   except
    on E: Exception do
     l3System.Exception2Log(E);
   end;
  end;
//#UC END# *54C8E4FA0325_4ADDDFC50302_impl*
end;//Tl3Node.DoNotify

function Tl3Node.GetIsAcceptChild(const aChild: Il3Node): Boolean;
//#UC START# *54C8E65102F8_4ADDDFC50302_var*
//#UC END# *54C8E65102F8_4ADDDFC50302_var*
begin
//#UC START# *54C8E65102F8_4ADDDFC50302_impl*
 Result := (aChild as Il3NodeWrap).GetSelf is Tl3Node;
//#UC END# *54C8E65102F8_4ADDDFC50302_impl*
end;//Tl3Node.GetIsAcceptChild

procedure Tl3Node.DoChanged;
//#UC START# *54D9E08D0212_4ADDDFC50302_var*
var
 l_Index : Integer;
 l_Intf  : Il3ChangeRecipient;
 l_Item  : IUnknown;
//#UC END# *54D9E08D0212_4ADDDFC50302_var*
begin
//#UC START# *54D9E08D0212_4ADDDFC50302_impl*
 inherited;
 if (f_NotifiedObjList <> nil) then
  for l_Index := 0 to f_NotifiedObjList.Hi do
  begin
   try // - зачем ??!!
    l_Item := IUnknown(f_NotifiedObjList[l_Index]);
    if Supports(l_Item, Il3ChangeRecipient, l_Intf) AND
       (l_Item = l_Intf) then
     try
      l_Intf.Changed;
     finally
      l_Intf := nil;
     end;//try..finally
   except
    on E: Exception do
     l3System.Exception2Log(E);
   end;
  end;
//#UC END# *54D9E08D0212_4ADDDFC50302_impl*
end;//Tl3Node.DoChanged

procedure Tl3Node.DoChanging;
//#UC START# *54D9E09D018D_4ADDDFC50302_var*
var
 l_Index : Integer;
 l_Intf  : Il3ChangeRecipient;
 l_Item  : IUnknown;
//#UC END# *54D9E09D018D_4ADDDFC50302_var*
begin
//#UC START# *54D9E09D018D_4ADDDFC50302_impl*
 inherited;
 if (f_NotifiedObjList <> nil) then
  for l_Index := 0 to f_NotifiedObjList.Hi do
  begin
   try // - зачем ??!!
    l_Item := IUnknown(f_NotifiedObjList[l_Index]);
    if Supports(l_Item, Il3ChangeRecipient, l_Intf) AND
       (l_Item = l_Intf) then
     try
      l_Intf.Changing;
     finally
      l_Intf := nil;
     end;//try..finally
   except
    on E: Exception do
     l3System.Exception2Log(E);
   end;
  end;
//#UC END# *54D9E09D018D_4ADDDFC50302_impl*
end;//Tl3Node.DoChanging

// Методы преобразования к реализуемым интерфейсам

function Tl3Node.As_Il3ChangeNotifier: Il3ChangeNotifier;
begin
 Result := Self;
end;
// start class Tl3PlaceNode

constructor Tl3PlaceNode.Create;
//#UC START# *54CBB0C901D6_4A573D2F00C6_var*
//#UC END# *54CBB0C901D6_4A573D2F00C6_var*
begin
//#UC START# *54CBB0C901D6_4A573D2F00C6_impl*
 inherited;
//#UC END# *54CBB0C901D6_4A573D2F00C6_impl*
end;//Tl3PlaceNode.Create

class function Tl3PlaceNode.Make: Il3Node;
var
 l_Inst : Tl3PlaceNode;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3PlaceNode.pm_GetFlag(anIndex: Integer): Boolean;
//#UC START# *54C78F15023E_4A573D2F00C6get_var*
//#UC END# *54C78F15023E_4A573D2F00C6get_var*
begin
//#UC START# *54C78F15023E_4A573D2F00C6get_impl*
 Result := f_Flags and anIndex > 0;
//#UC END# *54C78F15023E_4A573D2F00C6get_impl*
end;//Tl3PlaceNode.pm_GetFlag

procedure Tl3PlaceNode.pm_SetFlag(anIndex: Integer; aValue: Boolean);
//#UC START# *54C78F15023E_4A573D2F00C6set_var*
//#UC END# *54C78F15023E_4A573D2F00C6set_var*
begin
//#UC START# *54C78F15023E_4A573D2F00C6set_impl*
 if aValue then
  f_Flags := f_Flags or anIndex
 else
  f_Flags := f_Flags and not anIndex;
//#UC END# *54C78F15023E_4A573D2F00C6set_impl*
end;//Tl3PlaceNode.pm_SetFlag

function Tl3PlaceNode.IsFirstNode: Boolean;
//#UC START# *54C78F5702CE_4A573D2F00C6_var*
var
 lNode : Tl3Node;
//#UC END# *54C78F5702CE_4A573D2F00C6_var*
begin
//#UC START# *54C78F5702CE_4A573D2F00C6_impl*
 lNode := Parent;
 if lNode = nil then
  Result := True
 else
 begin
  lNode := lNode.Child;
  Result :=(lNode = nil) or (lNode = Self);
 end;
//#UC END# *54C78F5702CE_4A573D2F00C6_impl*
end;//Tl3PlaceNode.IsFirstNode

function Tl3PlaceNode.IsLastNode: Boolean;
//#UC START# *54C78F8902C6_4A573D2F00C6_var*
var
 lNode : Tl3Node;
//#UC END# *54C78F8902C6_4A573D2F00C6_var*
begin
//#UC START# *54C78F8902C6_4A573D2F00C6_impl*
 lNode := Parent;
 if lNode = nil then
  Result := True
 else
 begin
  lNode := lNode.Child;
  Result := (lNode = nil) or (lNode.Prev = Self);
 end;
//#UC END# *54C78F8902C6_4A573D2F00C6_impl*
end;//Tl3PlaceNode.IsLastNode

procedure Tl3PlaceNode.DoIncAllChildrenCount(aInc: Integer);
//#UC START# *54C8E4A8037A_4A573D2F00C6_var*
//#UC END# *54C8E4A8037A_4A573D2F00C6_var*
begin
//#UC START# *54C8E4A8037A_4A573D2F00C6_impl*
 if aInc = 0 then
  Exit;
 f_ChildCount := f_ChildCount + aInc;
 if ParentNode <> nil then
  ParentNode.IncAllChildrenCount(aInc);
//#UC END# *54C8E4A8037A_4A573D2F00C6_impl*
end;//Tl3PlaceNode.DoIncAllChildrenCount

function Tl3PlaceNode.pm_GetNext: Tl3Node;
//#UC START# *54CA277703C9_4A573D2F00C6get_var*
//#UC END# *54CA277703C9_4A573D2F00C6get_var*
begin
//#UC START# *54CA277703C9_4A573D2F00C6get_impl*
 Result := f_Next;
//#UC END# *54CA277703C9_4A573D2F00C6get_impl*
end;//Tl3PlaceNode.pm_GetNext

procedure Tl3PlaceNode.pm_SetNext(aValue: Tl3Node);
//#UC START# *54CA277703C9_4A573D2F00C6set_var*
//#UC END# *54CA277703C9_4A573D2F00C6set_var*
begin
//#UC START# *54CA277703C9_4A573D2F00C6set_impl*
 f_Next := aValue;
//#UC END# *54CA277703C9_4A573D2F00C6set_impl*
end;//Tl3PlaceNode.pm_SetNext

function Tl3PlaceNode.pm_GetPrev: Tl3Node;
//#UC START# *54CA279002FB_4A573D2F00C6get_var*
//#UC END# *54CA279002FB_4A573D2F00C6get_var*
begin
//#UC START# *54CA279002FB_4A573D2F00C6get_impl*
 Result := f_Prev;
//#UC END# *54CA279002FB_4A573D2F00C6get_impl*
end;//Tl3PlaceNode.pm_GetPrev

procedure Tl3PlaceNode.pm_SetPrev(aValue: Tl3Node);
//#UC START# *54CA279002FB_4A573D2F00C6set_var*
//#UC END# *54CA279002FB_4A573D2F00C6set_var*
begin
//#UC START# *54CA279002FB_4A573D2F00C6set_impl*
 f_Prev := aValue;
//#UC END# *54CA279002FB_4A573D2F00C6set_impl*
end;//Tl3PlaceNode.pm_SetPrev

function Tl3PlaceNode.pm_GetParent: Tl3Node;
//#UC START# *54CA279B01C1_4A573D2F00C6get_var*
//#UC END# *54CA279B01C1_4A573D2F00C6get_var*
begin
//#UC START# *54CA279B01C1_4A573D2F00C6get_impl*
 Result := f_Parent;
//#UC END# *54CA279B01C1_4A573D2F00C6get_impl*
end;//Tl3PlaceNode.pm_GetParent

procedure Tl3PlaceNode.pm_SetParent(aValue: Tl3Node);
//#UC START# *54CA279B01C1_4A573D2F00C6set_var*
//#UC END# *54CA279B01C1_4A573D2F00C6set_var*
begin
//#UC START# *54CA279B01C1_4A573D2F00C6set_impl*
 f_Parent := aValue;
//#UC END# *54CA279B01C1_4A573D2F00C6set_impl*
end;//Tl3PlaceNode.pm_SetParent

function Tl3PlaceNode.pm_GetChild: Tl3Node;
//#UC START# *54CA27AF0001_4A573D2F00C6get_var*
//#UC END# *54CA27AF0001_4A573D2F00C6get_var*
begin
//#UC START# *54CA27AF0001_4A573D2F00C6get_impl*
 Result := f_Child;
//#UC END# *54CA27AF0001_4A573D2F00C6get_impl*
end;//Tl3PlaceNode.pm_GetChild

procedure Tl3PlaceNode.pm_SetChild(aValue: Tl3Node);
//#UC START# *54CA27AF0001_4A573D2F00C6set_var*
//#UC END# *54CA27AF0001_4A573D2F00C6set_var*
begin
//#UC START# *54CA27AF0001_4A573D2F00C6set_impl*
 f_Child := aValue;
//#UC END# *54CA27AF0001_4A573D2F00C6set_impl*
end;//Tl3PlaceNode.pm_SetChild

function Tl3PlaceNode.pm_GetFlags: Integer;
//#UC START# *54C78756019B_4A573D2F00C6get_var*
//#UC END# *54C78756019B_4A573D2F00C6get_var*
begin
//#UC START# *54C78756019B_4A573D2F00C6get_impl*
 Result := f_Flags;
//#UC END# *54C78756019B_4A573D2F00C6get_impl*
end;//Tl3PlaceNode.pm_GetFlags

procedure Tl3PlaceNode.pm_SetFlags(aValue: Integer);
//#UC START# *54C78756019B_4A573D2F00C6set_var*
//#UC END# *54C78756019B_4A573D2F00C6set_var*
begin
//#UC START# *54C78756019B_4A573D2F00C6set_impl*
 f_Flags := aValue;
//#UC END# *54C78756019B_4A573D2F00C6set_impl*
end;//Tl3PlaceNode.pm_SetFlags

function Tl3PlaceNode.Get_AllChildrenCount: Integer;
//#UC START# *54C78C200291_4A573D2F00C6_var*
//#UC END# *54C78C200291_4A573D2F00C6_var*
begin
//#UC START# *54C78C200291_4A573D2F00C6_impl*
 Result := f_ChildCount;
//#UC END# *54C78C200291_4A573D2F00C6_impl*
end;//Tl3PlaceNode.Get_AllChildrenCount

function Tl3PlaceNode.HasChildNode: Boolean;
//#UC START# *54C78FC902EA_4A573D2F00C6_var*
//#UC END# *54C78FC902EA_4A573D2F00C6_var*
begin
//#UC START# *54C78FC902EA_4A573D2F00C6_impl*
 Result := Child <> nil;
//#UC END# *54C78FC902EA_4A573D2F00C6_impl*
end;//Tl3PlaceNode.HasChildNode

function Tl3PlaceNode.GetMaybeChild: Boolean;
//#UC START# *54C79013011B_4A573D2F00C6_var*
//#UC END# *54C79013011B_4A573D2F00C6_var*
begin
//#UC START# *54C79013011B_4A573D2F00C6_impl*
 Result := HasChild or ((Flags and nfHasChild) <> 0);
//#UC END# *54C79013011B_4A573D2F00C6_impl*
end;//Tl3PlaceNode.GetMaybeChild

procedure Tl3PlaceNode.DoReleaseChilds;
//#UC START# *54C8E22F0223_4A573D2F00C6_var*
//#UC END# *54C8E22F0223_4A573D2F00C6_var*
begin
//#UC START# *54C8E22F0223_4A573D2F00C6_impl*
 inherited;
 f_ChildCount := 0;
//#UC END# *54C8E22F0223_4A573D2F00C6_impl*
end;//Tl3PlaceNode.DoReleaseChilds
// start class Tl3CacheableNode

constructor Tl3CacheableNode.Create(const anExternalNode: Il3SimpleNode = nil);
//#UC START# *54CBABF301A7_4ADDE0C8004E_var*
//#UC END# *54CBABF301A7_4ADDE0C8004E_var*
begin
//#UC START# *54CBABF301A7_4ADDE0C8004E_impl*
 inherited Create;
 f_ExternalNode := anExternalNode;
//#UC END# *54CBABF301A7_4ADDE0C8004E_impl*
end;//Tl3CacheableNode.Create

class function Tl3CacheableNode.Make(const anExternalNode: Il3SimpleNode = nil): Il3Node;
var
 l_Inst : Tl3CacheableNode;
begin
 l_Inst := Create(anExternalNode);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure Tl3CacheableNode.Cleanup;
//#UC START# *479731C50290_4ADDE0C8004E_var*
//#UC END# *479731C50290_4ADDE0C8004E_var*
begin
//#UC START# *479731C50290_4ADDE0C8004E_impl*
 f_ExternalNode := nil;
 l3Free(f_Text);
 inherited;
//#UC END# *479731C50290_4ADDE0C8004E_impl*
end;//Tl3CacheableNode.Cleanup

function Tl3CacheableNode.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4ADDE0C8004E_var*
//#UC END# *47A869BB02DE_4ADDE0C8004E_var*
begin
//#UC START# *47A869BB02DE_4ADDE0C8004E_impl*
 if (f_ExternalNode <> nil) then
  Result := f_ExternalNode.Text
 else
  Result := f_Text.AsPCharLen;
//#UC END# *47A869BB02DE_4ADDE0C8004E_impl*
end;//Tl3CacheableNode.GetAsPCharLen

procedure Tl3CacheableNode.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4ADDE0C8004E_var*
//#UC END# *47A869D10074_4ADDE0C8004E_var*
begin
//#UC START# *47A869D10074_4ADDE0C8004E_impl*
 l3Set(f_Text, Value);
//#UC END# *47A869D10074_4ADDE0C8004E_impl*
end;//Tl3CacheableNode.DoSetAsPCharLen

function Tl3CacheableNode.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4ADDE0C8004E_var*
//#UC END# *4A60B23E00C3_4ADDE0C8004E_var*
begin
//#UC START# *4A60B23E00C3_4ADDE0C8004E_impl*
 Result := inherited COMQueryInterface(IID, Obj);
 if Result.Fail then
 begin
  if (f_ExternalNode = nil) then
   Result.SetNOINTERFACE
  else
   Result := Tl3HResult_C(f_ExternalNode.QueryInterface(IID.IID, Obj));
 end;//l3IFail(Result)
//#UC END# *4A60B23E00C3_4ADDE0C8004E_impl*
end;//Tl3CacheableNode.COMQueryInterface
// start class Tl3HandleNode

function Tl3HandleNode.Get_Handle: Integer;
//#UC START# *46827CAF03CD_4ADDDFB20186get_var*
//#UC END# *46827CAF03CD_4ADDDFB20186get_var*
begin
//#UC START# *46827CAF03CD_4ADDDFB20186get_impl*
 Result := pm_GetHandle;
//#UC END# *46827CAF03CD_4ADDDFB20186get_impl*
end;//Tl3HandleNode.Get_Handle

procedure Tl3HandleNode.Set_Handle(aValue: Integer);
//#UC START# *46827CAF03CD_4ADDDFB20186set_var*
//#UC END# *46827CAF03CD_4ADDDFB20186set_var*
begin
//#UC START# *46827CAF03CD_4ADDDFB20186set_impl*
 pm_SetHandle(aValue);
//#UC END# *46827CAF03CD_4ADDDFB20186set_impl*
end;//Tl3HandleNode.Set_Handle

function Tl3HandleNode.pm_GetStringID: Integer;
//#UC START# *47BC3BFD017F_4ADDDFB20186get_var*
//#UC END# *47BC3BFD017F_4ADDDFB20186get_var*
begin
//#UC START# *47BC3BFD017F_4ADDDFB20186get_impl*
 Result := Get_Handle;
//#UC END# *47BC3BFD017F_4ADDDFB20186get_impl*
end;//Tl3HandleNode.pm_GetStringID

procedure Tl3HandleNode.pm_SetStringID(aValue: Integer);
//#UC START# *47BC3BFD017F_4ADDDFB20186set_var*
//#UC END# *47BC3BFD017F_4ADDDFB20186set_var*
begin
//#UC START# *47BC3BFD017F_4ADDDFB20186set_impl*
 Set_Handle(aValue);
//#UC END# *47BC3BFD017F_4ADDDFB20186set_impl*
end;//Tl3HandleNode.pm_SetStringID
// start class Tl3UsualNode

function Tl3UsualNode.pm_GetHandle: Integer;
//#UC START# *54CBB9F8036D_4ADDDF9B0101get_var*
//#UC END# *54CBB9F8036D_4ADDDF9B0101get_var*
begin
//#UC START# *54CBB9F8036D_4ADDDF9B0101get_impl*
 Result := f_Handle;
//#UC END# *54CBB9F8036D_4ADDDF9B0101get_impl*
end;//Tl3UsualNode.pm_GetHandle

procedure Tl3UsualNode.pm_SetHandle(aValue: Integer);
//#UC START# *54CBB9F8036D_4ADDDF9B0101set_var*
//#UC END# *54CBB9F8036D_4ADDDF9B0101set_var*
begin
//#UC START# *54CBB9F8036D_4ADDDF9B0101set_impl*
 Changing;
 try
  f_Handle := aValue;
  Notify(ntDataChange, Self);
 finally
  Changed;
 end;
//#UC END# *54CBB9F8036D_4ADDDF9B0101set_impl*
end;//Tl3UsualNode.pm_SetHandle

procedure Tl3UsualNode.Cleanup;
//#UC START# *479731C50290_4ADDDF9B0101_var*
//#UC END# *479731C50290_4ADDDF9B0101_var*
begin
//#UC START# *479731C50290_4ADDDF9B0101_impl*
 l3Free(f_Text);
 inherited;
//#UC END# *479731C50290_4ADDDF9B0101_impl*
end;//Tl3UsualNode.Cleanup

function Tl3UsualNode.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4ADDDF9B0101_var*
//#UC END# *47A869BB02DE_4ADDDF9B0101_var*
begin
//#UC START# *47A869BB02DE_4ADDDF9B0101_impl*
 Result := f_Text.AsPCharLen;
//#UC END# *47A869BB02DE_4ADDDF9B0101_impl*
end;//Tl3UsualNode.GetAsPCharLen

procedure Tl3UsualNode.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4ADDDF9B0101_var*
//#UC END# *47A869D10074_4ADDDF9B0101_var*
begin
//#UC START# *47A869D10074_4ADDDF9B0101_impl*
 l3Set(f_Text, Value);
//#UC END# *47A869D10074_4ADDDF9B0101_impl*
end;//Tl3UsualNode.DoSetAsPCharLen
// start class Tl3CustomListContainerNode

procedure Tl3CustomListContainerNode.DeleteChildItem(aIndex: Integer;
  const aDelete: Il3Node);
//#UC START# *54CBBF3C0184_4ADDE0F50179_var*
//#UC END# *54CBBF3C0184_4ADDE0F50179_var*
begin
//#UC START# *54CBBF3C0184_4ADDE0F50179_impl*
 inherited Notify(ntDelete, aDelete);
 inherited Notify(ntDeleteDone, aDelete);
//#UC END# *54CBBF3C0184_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.DeleteChildItem

procedure Tl3CustomListContainerNode.SubscribeChild(aChildNode: Tl3ListItemNode);
//#UC START# *54CBBF9F00FA_4ADDE0F50179_var*
var
 l_NotifyRecipient: Il3NodeNotifyRecipient;
//#UC END# *54CBBF9F00FA_4ADDE0F50179_var*
begin
//#UC START# *54CBBF9F00FA_4ADDE0F50179_impl*
 if Supports(aChildNode, Il3NodeNotifyRecipient, l_NotifyRecipient) then
 try
  Subscribe(l_NotifyRecipient);
 finally
  l_NotifyRecipient := nil;
 end;
//#UC END# *54CBBF9F00FA_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.SubscribeChild

procedure Tl3CustomListContainerNode.UnsubscribeChild(aChildNode: Tl3ListItemNode);
//#UC START# *54CBBFB203CE_4ADDE0F50179_var*
var
 l_NotifyRecipient: Il3NodeNotifyRecipient;
//#UC END# *54CBBFB203CE_4ADDE0F50179_var*
begin
//#UC START# *54CBBFB203CE_4ADDE0F50179_impl*
 if Supports(aChildNode, Il3NodeNotifyRecipient, l_NotifyRecipient) then
 try
  Unsubscribe(l_NotifyRecipient);
 finally
  l_NotifyRecipient := nil;
 end;
//#UC END# *54CBBFB203CE_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.UnsubscribeChild

function Tl3CustomListContainerNode.MoveChildItem(aChildNode: Tl3ListItemNode;
  aDirection: Tl3Direction): Boolean;
//#UC START# *54CBC049028E_4ADDE0F50179_var*
var
 lNewIndex : Integer;
 lUserParam : Pointer;
 lItemsLast : Integer;
//#UC END# *54CBC049028E_4ADDE0F50179_var*
begin
//#UC START# *54CBC049028E_4ADDE0F50179_impl*
 lNewIndex := aChildNode.ListItem;

 lItemsLast := Pred(GetItemsCount);
 case aDirection of
  dUp:
   if lNewIndex > 0 then
    Dec(lNewIndex);
  dUpMax:
   if lNewIndex > 0 then
    lNewIndex := 0;
  dDown:
   if lNewIndex < lItemsLast then
    Inc(lNewIndex);
  dDownMax:
   if lNewIndex < lItemsLast then
    lNewIndex := lItemsLast;
 end;
 Result := lNewIndex <> aChildNode.ListItem;
 if Result then
 begin
  inherited Notify(ntMoveBegin, Self);
  try
   lUserParam := nil;
   BeginMove(lUserParam);
   try
    MoveChildItemPrim(aChildNode.ListItem, lNewIndex);
    //!! lList.Move(f_ListItem, lNewIndex);

    aChildNode.ListItem := lNewIndex;
   finally
    EndMove(lUserParam);
   end;
  finally
   inherited Notify(ntMoveEnd, Self);
  end;
 end;
//#UC END# *54CBC049028E_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.MoveChildItem

procedure Tl3CustomListContainerNode.ItemNotify(const aNotifier: Il3ChangeNotifier;
  aOperation: Integer;
  aIndex: Integer);
//#UC START# *54CF6FEC023C_4ADDE0F50179_var*
var
 lNode : Il3Node;
//#UC END# *54CF6FEC023C_4ADDE0F50179_var*
begin
//#UC START# *54CF6FEC023C_4ADDE0F50179_impl*
 AllChildrenCount := GetItemsCount;
 if aOperation = ntClear then
  inherited Notify(ntChildClear, Self)
 else
 begin
  lNode := GetChildByNumber(aIndex);
  // lNode - информационный объект с полем f_ListItem = aIndex
  // с другой стороны это нода-обертка вокруг элемента листа,
  // подписанная на нотификацию
  // При нотификации ntDelete ( см. Tl3ListItemNode.NodeNotify) объект
  // сбрасывает значение f_ListItem = -1, что приводит к некорректной обработке
  // нотификации для последующих элементов списка рассылки (fNotifiedObjList)
  // для подавления этого эффекта убираем информационный объект из списка рассылки
  // Конечно, в общем случае так делать неправильно, поскольку GetChildByNumber может
  // вернуть реальный объект-ноду, которая таким образом не получит нотификации
  // об изменени состояния, но в данном случае реализация такова, что каждый раз создается
  // новая нода-обертка, которая больше нигде не используется.
  // Собственно все проблемы из-за наличия нескольких оберток вокруг одного элемента листа

  UnSubscribe(lNode as Il3NodeNotifyRecipient); // см. UnsubscribeChild(aChildNode : Tl3ListItemNode);

  inherited Notify(aOperation, lNode);
 end;
//#UC END# *54CF6FEC023C_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.ItemNotify

procedure Tl3CustomListContainerNode.Notify(const aNotifier: Il3ChangeNotifier;
  aOperation: Integer;
  aIndex: Integer);
//#UC START# *46A4504B03C4_4ADDE0F50179_var*
//#UC END# *46A4504B03C4_4ADDE0F50179_var*
begin
//#UC START# *46A4504B03C4_4ADDE0F50179_impl*
 ItemNotify(aNotifier, aOperation, aIndex);
     {* прошла операция. }
//#UC END# *46A4504B03C4_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.Notify

function Tl3CustomListContainerNode.Get_AllChildrenCount: Integer;
//#UC START# *54C78C200291_4ADDE0F50179_var*
//#UC END# *54C78C200291_4ADDE0F50179_var*
begin
//#UC START# *54C78C200291_4ADDE0F50179_impl*
 Result := GetItemsCount;
 if (ChildCount <> Result) then
  IncAllChildrenCount(Result - ChildCount);
//#UC END# *54C78C200291_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.Get_AllChildrenCount

function Tl3CustomListContainerNode.Get_ChildNode: Il3Node;
//#UC START# *54C78E2702B3_4ADDE0F50179_var*
//#UC END# *54C78E2702B3_4ADDE0F50179_var*
begin
//#UC START# *54C78E2702B3_4ADDE0F50179_impl*
 Result := GetChildByNumber(0);
//#UC END# *54C78E2702B3_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.Get_ChildNode

function Tl3CustomListContainerNode.HasChildNode: Boolean;
//#UC START# *54C78FC902EA_4ADDE0F50179_var*
//#UC END# *54C78FC902EA_4ADDE0F50179_var*
begin
//#UC START# *54C78FC902EA_4ADDE0F50179_impl*
 Result := AllChildrenCount > 0;
//#UC END# *54C78FC902EA_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.HasChildNode

function Tl3CustomListContainerNode.IterateChild(Action: Tl3NodeAction;
  IterMode: Integer;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *54C8DFF102DD_4ADDE0F50179_var*
var
 I : Integer;
 lChildsCnt : Integer;
 lCheckResultLog : Boolean;
 lActionResult : Boolean;
//#UC END# *54C8DFF102DD_4ADDE0F50179_var*
begin
//#UC START# *54C8DFF102DD_4ADDE0F50179_impl*
 if not HasChild then
  Exit;
 lCheckResultLog := IterMode and imCheckResult > 0;

 if (aFromNode = nil) then
  I := 0
 else
 begin
  if not IsSame(aFromNode.ParentNode) then
   Exit;
  I := Tl3ListItemNode((aFromNode as Il3NodeWrap).GetSelf).ListItem;
 end;

 //I := 0;
 lChildsCnt := AllChildrenCount;
 while AllChildrenCount > I do
 begin
  Result := GetChildByNumber(I);
    {$IfDef SkipIterByExcept}
  try
   lActionResult := Action(Result);
  except
   on E: ESkipIterateChilds do
    lActionResult := False;
   else raise;
  end;
    {$Else}
  lActionResult := Action(Result);
  if Byte(lActionResult) = 2 then
   lActionResult := False;
    {$EndIf}
  if lActionResult and lCheckResultLog then
   Exit;
  if lChildsCnt = AllChildrenCount then
   Inc(I)
  else lChildsCnt := AllChildrenCount;  // В Action удалили текущий
 end;
 Result := Nil;
//#UC END# *54C8DFF102DD_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.IterateChild

procedure Tl3CustomListContainerNode.DoNotify(aOperation: Integer;
  const aNode: Il3Node);
//#UC START# *54C8E4FA0325_4ADDE0F50179_var*
var
 I : Integer;
 lIntf : Il3Node;
//#UC END# *54C8E4FA0325_4ADDE0F50179_var*
begin
//#UC START# *54C8E4FA0325_4ADDE0F50179_impl*
 inherited DoNotify(aOperation, aNode);
 if (NotifiedObjList <> nil) and
  (NotifiedObjList.Count > 0) then
  for I := Pred(NotifiedObjList.Count) to 0 do
  begin
   if l3IOk(IUnknown(NotifiedObjList.Items[I]).QueryInterface(Il3Node, lIntf)) and
    (lIntf.IsDisappeared) then
    NotifiedObjList.Delete(I);
  end;
//#UC END# *54C8E4FA0325_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.DoNotify

function Tl3CustomListContainerNode.DoGetChildByNumber(aNum: Integer): Il3Node;
//#UC START# *54C8E5660144_4ADDE0F50179_var*
var
 aNode : Tl3ListItemNode;
//#UC END# *54C8E5660144_4ADDE0F50179_var*
begin
//#UC START# *54C8E5660144_4ADDE0F50179_impl*
 if (aNum < 0) or (aNum >= AllChildrenCount) then
  Result := nil
 else
 begin
  aNode := MakeChildNode;
  try
   aNode.ListNode := Self;
   aNode.ListItem := aNum;
   Result := aNode;
   SubscribeChild(aNode);
  finally
   l3Free(aNode);
  end;
 end;
//#UC END# *54C8E5660144_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.DoGetChildByNumber

function Tl3CustomListContainerNode.DoInsertChildBefore(const aNextChild: Il3Node;
  const aChild: Il3Node): Il3Node;
//#UC START# *54C8E60703B6_4ADDE0F50179_var*
//#UC END# *54C8E60703B6_4ADDE0F50179_var*
begin
//#UC START# *54C8E60703B6_4ADDE0F50179_impl*
 Abort;
//#UC END# *54C8E60703B6_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.DoInsertChildBefore

function Tl3CustomListContainerNode.GetIsAcceptChild(const aChild: Il3Node): Boolean;
//#UC START# *54C8E65102F8_4ADDE0F50179_var*
//#UC END# *54C8E65102F8_4ADDE0F50179_var*
begin
//#UC START# *54C8E65102F8_4ADDE0F50179_impl*
 Result := False;
//#UC END# *54C8E65102F8_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.GetIsAcceptChild

function Tl3CustomListContainerNode.pm_GetChild: Tl3Node;
//#UC START# *54CA27AF0001_4ADDE0F50179get_var*
//#UC END# *54CA27AF0001_4ADDE0F50179get_var*
begin
//#UC START# *54CA27AF0001_4ADDE0F50179get_impl*
 Result := nil;
 Assert(False, 'Перекрыть надо');
//#UC END# *54CA27AF0001_4ADDE0F50179get_impl*
end;//Tl3CustomListContainerNode.pm_GetChild

procedure Tl3CustomListContainerNode.pm_SetChild(aValue: Tl3Node);
//#UC START# *54CA27AF0001_4ADDE0F50179set_var*
//#UC END# *54CA27AF0001_4ADDE0F50179set_var*
begin
//#UC START# *54CA27AF0001_4ADDE0F50179set_impl*
 Assert(False, 'Перекрыть надо');
//#UC END# *54CA27AF0001_4ADDE0F50179set_impl*
end;//Tl3CustomListContainerNode.pm_SetChild

procedure Tl3CustomListContainerNode.DoChanged;
//#UC START# *54D9E08D0212_4ADDE0F50179_var*
//#UC END# *54D9E08D0212_4ADDE0F50179_var*
begin
//#UC START# *54D9E08D0212_4ADDE0F50179_impl*
 Dec(f_UpdateCount);
 if (f_UpdateCount < 0) then
  f_UpdateCount := 0;
 if (f_UpdateCount = 0) then
 begin
  AllChildrenCount := GetItemsCount;
  inherited;
 end;
//#UC END# *54D9E08D0212_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.DoChanged

procedure Tl3CustomListContainerNode.DoChanging;
//#UC START# *54D9E09D018D_4ADDE0F50179_var*
//#UC END# *54D9E09D018D_4ADDE0F50179_var*
begin
//#UC START# *54D9E09D018D_4ADDE0F50179_impl*
 if (f_UpdateCount = 0) then
  inherited;
 Inc(f_UpdateCount);
//#UC END# *54D9E09D018D_4ADDE0F50179_impl*
end;//Tl3CustomListContainerNode.DoChanging
// start class Tl3ListItemNode

procedure Tl3ListItemNode.pm_SetListNode(aValue: Tl3CustomListContainerNode);
//#UC START# *54CBC0C80360_4ADDE17D0077set_var*
//#UC END# *54CBC0C80360_4ADDE17D0077set_var*
begin
//#UC START# *54CBC0C80360_4ADDE17D0077set_impl*
 f_ListNode := aValue;
//#UC END# *54CBC0C80360_4ADDE17D0077set_impl*
end;//Tl3ListItemNode.pm_SetListNode

function Tl3ListItemNode.pm_GetHandle: Integer;
//#UC START# *54CBC1EF0289_4ADDE17D0077get_var*
//#UC END# *54CBC1EF0289_4ADDE17D0077get_var*
begin
//#UC START# *54CBC1EF0289_4ADDE17D0077get_impl*
 Result := f_ListNode.ItemParam[f_ListItem];
//#UC END# *54CBC1EF0289_4ADDE17D0077get_impl*
end;//Tl3ListItemNode.pm_GetHandle

procedure Tl3ListItemNode.pm_SetHandle(aValue: Integer);
//#UC START# *54CBC1EF0289_4ADDE17D0077set_var*
//#UC END# *54CBC1EF0289_4ADDE17D0077set_var*
begin
//#UC START# *54CBC1EF0289_4ADDE17D0077set_impl*
 Changing;
 try
  f_ListNode.ItemParam[f_ListItem] := aValue;
  Notify(ntDataChange, Self);
 finally
  Changed;
 end;
//#UC END# *54CBC1EF0289_4ADDE17D0077set_impl*
end;//Tl3ListItemNode.pm_SetHandle

function Tl3ListItemNode.Get_Handle: Integer;
//#UC START# *46827CAF03CD_4ADDE17D0077get_var*
//#UC END# *46827CAF03CD_4ADDE17D0077get_var*
begin
//#UC START# *46827CAF03CD_4ADDE17D0077get_impl*
 Result := pm_GetHandle;
//#UC END# *46827CAF03CD_4ADDE17D0077get_impl*
end;//Tl3ListItemNode.Get_Handle

procedure Tl3ListItemNode.Set_Handle(aValue: Integer);
//#UC START# *46827CAF03CD_4ADDE17D0077set_var*
//#UC END# *46827CAF03CD_4ADDE17D0077set_var*
begin
//#UC START# *46827CAF03CD_4ADDE17D0077set_impl*
 pm_SetHandle(aValue);
//#UC END# *46827CAF03CD_4ADDE17D0077set_impl*
end;//Tl3ListItemNode.Set_Handle

procedure Tl3ListItemNode.Notify(aOperation: Integer;
  const aNode: Il3SimpleNode);
//#UC START# *477244190062_4ADDE17D0077_var*
var
 lListIndex : Integer;
 lAnotherNode : Tl3ListItemNode;
//#UC END# *477244190062_4ADDE17D0077_var*
begin
//#UC START# *477244190062_4ADDE17D0077_impl*
(*
  ntInsert           {* - вставка элемента. }
  ntMoveBegin        {* - началось движение элемента. }
  ntMoveEnd          {* - закончилось движение элемента. }
  //ntChildInsert      {* - вставлен дочерний элемент. }
  //ntCountChange      {* - изменилось количество элементов. }
*)
 try
  if (aNode <> nil) and l3IEQ(ParentNode, aNode.Parent) then //проверка что оба из одного листа
   case aOperation of
    ntChildClear:   // удалили все
     ListItem := -1;

    ntDelete:        // удалили элемент.
    begin
     lAnotherNode := (aNode as Il3NodeWrap).GetSelf as Tl3ListItemNode;
     lListIndex := lAnotherNode.ListItem;

     if (lListIndex >= 0) and (lListIndex < ListItem) then
      ListItem := ListItem - 1
     else
     if lListIndex = ListItem then
      ListItem := -1; //указывал на удаленный элемент
    end;

      (*
      ntInsert           {* - вставка элемента. }
      ntMoveBegin        {* - началось движение элемента. }
      ntMoveEnd          {* - закончилось движение элемента. }
      //ntChildInsert    {* - вставлен дочерний элемент. }
      //ntCountChange    {* - изменилось количество элементов. }
      *)

   end; // case Operation
 except
  on E: Exception do
   l3System.Exception2Log(E);
 end;
//#UC END# *477244190062_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Notify

function Tl3ListItemNode.Get_ParentNode: Il3Node;
//#UC START# *54C78E1002BE_4ADDE17D0077_var*
//#UC END# *54C78E1002BE_4ADDE17D0077_var*
begin
//#UC START# *54C78E1002BE_4ADDE17D0077_impl*
 Result := f_ListNode;
//#UC END# *54C78E1002BE_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Get_ParentNode

function Tl3ListItemNode.Get_ChildNode: Il3Node;
//#UC START# *54C78E2702B3_4ADDE17D0077_var*
//#UC END# *54C78E2702B3_4ADDE17D0077_var*
begin
//#UC START# *54C78E2702B3_4ADDE17D0077_impl*
 Result := nil;
//#UC END# *54C78E2702B3_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Get_ChildNode

function Tl3ListItemNode.Get_NextNode: Il3Node;
//#UC START# *54C78E370213_4ADDE17D0077_var*
var
 lNextIndex : Integer;
//#UC END# *54C78E370213_4ADDE17D0077_var*
begin
//#UC START# *54C78E370213_4ADDE17D0077_impl*
 if IsLast then
  lNextIndex := 0
 else
  lNextIndex := Succ(f_ListItem);
 Result := f_ListNode.GetChildByNumber(lNextIndex);
//#UC END# *54C78E370213_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Get_NextNode

function Tl3ListItemNode.Get_PrevNode: Il3Node;
//#UC START# *54C78E440118_4ADDE17D0077_var*
var
 lPrevIndex : Integer;
//#UC END# *54C78E440118_4ADDE17D0077_var*
begin
//#UC START# *54C78E440118_4ADDE17D0077_impl*
 if IsFirst then
  lPrevIndex := Pred(f_ListNode.AllChildrenCount)
 else
  lPrevIndex := Pred(f_ListItem);
 Result := f_ListNode.GetChildByNumber(lPrevIndex);
//#UC END# *54C78E440118_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Get_PrevNode

function Tl3ListItemNode.GetLevelForParent(const aNode: Il3SimpleNode): Integer;
//#UC START# *54C78EA30198_4ADDE17D0077_var*
//#UC END# *54C78EA30198_4ADDE17D0077_var*
begin
//#UC START# *54C78EA30198_4ADDE17D0077_impl*
 Result := 1;
 if (ParentNode <> nil) then
  Inc(Result, ParentNode.GetLevelFor(aNode));
//#UC END# *54C78EA30198_4ADDE17D0077_impl*
end;//Tl3ListItemNode.GetLevelForParent

function Tl3ListItemNode.pm_GetFlag(anIndex: Integer): Boolean;
//#UC START# *54C78F15023E_4ADDE17D0077get_var*
//#UC END# *54C78F15023E_4ADDE17D0077get_var*
begin
//#UC START# *54C78F15023E_4ADDE17D0077get_impl*
 Result := f_ListNode.ItemFlag[f_ListItem] and anIndex > 0;
//#UC END# *54C78F15023E_4ADDE17D0077get_impl*
end;//Tl3ListItemNode.pm_GetFlag

procedure Tl3ListItemNode.pm_SetFlag(anIndex: Integer; aValue: Boolean);
//#UC START# *54C78F15023E_4ADDE17D0077set_var*
var
 l_Flags: Integer;
//#UC END# *54C78F15023E_4ADDE17D0077set_var*
begin
//#UC START# *54C78F15023E_4ADDE17D0077set_impl*
 l_Flags := f_ListNode.ItemFlag[f_ListItem];
 if aValue then
  l_Flags := l_Flags or anIndex
 else
  l_Flags := l_Flags and not anIndex;

 f_ListNode.ItemFlag[f_ListItem] := l_Flags;
//#UC END# *54C78F15023E_4ADDE17D0077set_impl*
end;//Tl3ListItemNode.pm_SetFlag

function Tl3ListItemNode.IsFirstNode: Boolean;
//#UC START# *54C78F5702CE_4ADDE17D0077_var*
//#UC END# *54C78F5702CE_4ADDE17D0077_var*
begin
//#UC START# *54C78F5702CE_4ADDE17D0077_impl*
 Result := f_ListItem = 0;
//#UC END# *54C78F5702CE_4ADDE17D0077_impl*
end;//Tl3ListItemNode.IsFirstNode

function Tl3ListItemNode.IsLastNode: Boolean;
//#UC START# *54C78F8902C6_4ADDE17D0077_var*
//#UC END# *54C78F8902C6_4ADDE17D0077_var*
begin
//#UC START# *54C78F8902C6_4ADDE17D0077_impl*
 Result := f_ListItem = Pred(f_ListNode.AllChildrenCount);
//#UC END# *54C78F8902C6_4ADDE17D0077_impl*
end;//Tl3ListItemNode.IsLastNode

function Tl3ListItemNode.DoGetNumInParent(aOnlyOneLevel: Boolean = False): Integer;
//#UC START# *54C8E1F30128_4ADDE17D0077_var*
//#UC END# *54C8E1F30128_4ADDE17D0077_var*
begin
//#UC START# *54C8E1F30128_4ADDE17D0077_impl*
 Result := f_ListItem;
//#UC END# *54C8E1F30128_4ADDE17D0077_impl*
end;//Tl3ListItemNode.DoGetNumInParent

function Tl3ListItemNode.DoIterate(Action: Tl3NodeAction;
  IterMode: Integer = 0;
  const aFromNode: Il3Node = nil): Il3Node;
//#UC START# *54C8E5AF00F8_4ADDE17D0077_var*
var
 lCurNode : Il3Node;
 ActionResult : Boolean;
//#UC END# *54C8E5AF00F8_4ADDE17D0077_var*
begin
//#UC START# *54C8E5AF00F8_4ADDE17D0077_impl*
 if l3TestMask(IterMode, imParentNeed) then
 begin
  lCurNode := Self;
{$IfDef SkipIterByExcept}
  try
   ActionResult := Action(lCurNode);
  except
   on E: ESkipIterateChilds do
   begin
    ActionResult := False;
    l3SetMask(IterMode, imNoChilds);
   end;
   else raise;
  end;
{$Else}
  ActionResult := Action(lCurNode);
  if Byte(ActionResult) = 2 then
  begin
   ActionResult := False;
   if l3TestMask(IterMode, imCheckResult) then
    l3SetMask(IterMode, imNoChilds);
  end;
{$EndIf}

  if (IterMode and imCheckResult > 0) and ActionResult then
  begin
   Result := lCurNode;
   Exit;
  end;
 end;
//#UC END# *54C8E5AF00F8_4ADDE17D0077_impl*
end;//Tl3ListItemNode.DoIterate

procedure Tl3ListItemNode.Cleanup;
//#UC START# *479731C50290_4ADDE17D0077_var*
//#UC END# *479731C50290_4ADDE17D0077_var*
begin
//#UC START# *479731C50290_4ADDE17D0077_impl*
 ListNode := nil;
 inherited;
//#UC END# *479731C50290_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Cleanup

procedure Tl3ListItemNode.Release;
//#UC START# *479F2AFB0397_4ADDE17D0077_var*
//#UC END# *479F2AFB0397_4ADDE17D0077_var*
begin
//#UC START# *479F2AFB0397_4ADDE17D0077_impl*
 f_ListNode.UnsubscribeChild(Self);
 inherited;
//#UC END# *479F2AFB0397_4ADDE17D0077_impl*
end;//Tl3ListItemNode.Release

function Tl3ListItemNode.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4ADDE17D0077_var*
//#UC END# *47A869BB02DE_4ADDE17D0077_var*
begin
//#UC START# *47A869BB02DE_4ADDE17D0077_impl*
 Result := f_ListNode.Strings[f_ListItem];
//#UC END# *47A869BB02DE_4ADDE17D0077_impl*
end;//Tl3ListItemNode.GetAsPCharLen

procedure Tl3ListItemNode.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4ADDE17D0077_var*
//#UC END# *47A869D10074_4ADDE17D0077_var*
begin
//#UC START# *47A869D10074_4ADDE17D0077_impl*
 f_ListNode.Strings[f_ListItem] := Value;
//#UC END# *47A869D10074_4ADDE17D0077_impl*
end;//Tl3ListItemNode.DoSetAsPCharLen

function Tl3ListItemNode.pm_GetStringID: Integer;
//#UC START# *47BC3BFD017F_4ADDE17D0077get_var*
//#UC END# *47BC3BFD017F_4ADDE17D0077get_var*
begin
//#UC START# *47BC3BFD017F_4ADDE17D0077get_impl*
 Result := Get_Handle;
//#UC END# *47BC3BFD017F_4ADDE17D0077get_impl*
end;//Tl3ListItemNode.pm_GetStringID

procedure Tl3ListItemNode.pm_SetStringID(aValue: Integer);
//#UC START# *47BC3BFD017F_4ADDE17D0077set_var*
//#UC END# *47BC3BFD017F_4ADDE17D0077set_var*
begin
//#UC START# *47BC3BFD017F_4ADDE17D0077set_impl*
 Set_Handle(aValue);
//#UC END# *47BC3BFD017F_4ADDE17D0077set_impl*
end;//Tl3ListItemNode.pm_SetStringID

function Tl3ListItemNode.pm_GetFlags: Integer;
//#UC START# *54C78756019B_4ADDE17D0077get_var*
//#UC END# *54C78756019B_4ADDE17D0077get_var*
begin
//#UC START# *54C78756019B_4ADDE17D0077get_impl*
 Result := f_ListNode.ItemFlag[f_ListItem];
//#UC END# *54C78756019B_4ADDE17D0077get_impl*
end;//Tl3ListItemNode.pm_GetFlags

procedure Tl3ListItemNode.pm_SetFlags(aValue: Integer);
//#UC START# *54C78756019B_4ADDE17D0077set_var*
//#UC END# *54C78756019B_4ADDE17D0077set_var*
begin
//#UC START# *54C78756019B_4ADDE17D0077set_impl*
 f_ListNode.ItemFlag[f_ListItem] := aValue;
//#UC END# *54C78756019B_4ADDE17D0077set_impl*
end;//Tl3ListItemNode.pm_SetFlags

function Tl3ListItemNode.GetIsSame(const aNode: Il3SimpleNode): Boolean;
//#UC START# *54C78D9201B9_4ADDE17D0077_var*
var
 lIntfObj : Tl3ListItemNode;
//#UC END# *54C78D9201B9_4ADDE17D0077_var*
begin
//#UC START# *54C78D9201B9_4ADDE17D0077_impl*
 try
{$IfOpt D+}
  Result := False;
  lIntfObj := Tl3ListItemNode((aNode as Il3NodeWrap).GetSelf);
  if not (lIntfObj is Tl3ListItemNode) then
   Exit;
{$else}
  lIntfObj := (aNode as Il3NodeWrap).GetSelf as Tl3ListItemNode;
{$endif}

  Result := Self = lIntfObj;
  if Result then
   Exit;
  Result := (f_ListNode = lIntfObj.f_ListNode) and (f_ListItem = lIntfObj.f_ListItem);
 except
  on E: Exception do
  begin
   Result := False;
   l3System.Exception2Log(E);
  end;
 end;
//#UC END# *54C78D9201B9_4ADDE17D0077_impl*
end;//Tl3ListItemNode.GetIsSame

function Tl3ListItemNode.GetIsDisappeared: Boolean;
//#UC START# *54C7905B00BA_4ADDE17D0077_var*
//#UC END# *54C7905B00BA_4ADDE17D0077_var*
begin
//#UC START# *54C7905B00BA_4ADDE17D0077_impl*
 Result := ListItem = -1;
//#UC END# *54C7905B00BA_4ADDE17D0077_impl*
end;//Tl3ListItemNode.GetIsDisappeared

procedure Tl3ListItemNode.DoDelete;
//#UC START# *54C79185029B_4ADDE17D0077_var*
//#UC END# *54C79185029B_4ADDE17D0077_var*
begin
//#UC START# *54C79185029B_4ADDE17D0077_impl*
 f_ListNode.DeleteChildItem(f_ListItem, Self);
//#UC END# *54C79185029B_4ADDE17D0077_impl*
end;//Tl3ListItemNode.DoDelete

function Tl3ListItemNode.DoMove(aDirection: Tl3Direction): Boolean;
//#UC START# *54C8E45103D9_4ADDE17D0077_var*
//#UC END# *54C8E45103D9_4ADDE17D0077_var*
begin
//#UC START# *54C8E45103D9_4ADDE17D0077_impl*
 Result := ListNode.MoveChildItem(Self, aDirection);
//#UC END# *54C8E45103D9_4ADDE17D0077_impl*
end;//Tl3ListItemNode.DoMove
// start class Tl3ListContainerNode

procedure Tl3ListContainerNode.ListChanged(Sender: TObject);
//#UC START# *54CF8E8F0079_4ADDE1300362_var*
//#UC END# *54CF8E8F0079_4ADDE1300362_var*
begin
//#UC START# *54CF8E8F0079_4ADDE1300362_impl*
 Changed;
//#UC END# *54CF8E8F0079_4ADDE1300362_impl*
end;//Tl3ListContainerNode.ListChanged

procedure Tl3ListContainerNode.ListChanging(Sender: TObject);
//#UC START# *54CF8E9B0330_4ADDE1300362_var*
//#UC END# *54CF8E9B0330_4ADDE1300362_var*
begin
//#UC START# *54CF8E9B0330_4ADDE1300362_impl*
 Changing;
//#UC END# *54CF8E9B0330_4ADDE1300362_impl*
end;//Tl3ListContainerNode.ListChanging

function Tl3ListContainerNode.pm_GetItems: TStringList;
//#UC START# *54CF8E1E02AA_4ADDE1300362get_var*
//#UC END# *54CF8E1E02AA_4ADDE1300362get_var*
begin
//#UC START# *54CF8E1E02AA_4ADDE1300362get_impl*
 Result := f_Items;
//#UC END# *54CF8E1E02AA_4ADDE1300362get_impl*
end;//Tl3ListContainerNode.pm_GetItems

procedure Tl3ListContainerNode.pm_SetItems(aValue: TStringList);
//#UC START# *54CF8E1E02AA_4ADDE1300362set_var*
//#UC END# *54CF8E1E02AA_4ADDE1300362set_var*
begin
//#UC START# *54CF8E1E02AA_4ADDE1300362set_impl*
 if f_Items = aValue then
  Exit;
 Changing;
 try
  if f_Items <> nil then
  begin
   f_Items.OnChange := nil;
   f_Items.OnChanging := nil;
  end;

  l3Set(f_Items, aValue);
  if f_Items <> nil then
  begin
   f_Items.OnChange := ListChanged;
   f_Items.OnChanging := ListChanging;
   AllChildrenCount := f_Items.Count;
  end;
 finally
  Changed;
 end;
//#UC END# *54CF8E1E02AA_4ADDE1300362set_impl*
end;//Tl3ListContainerNode.pm_SetItems

function Tl3ListContainerNode.pm_GetStrings(aIndex: Integer): Tl3WString;
//#UC START# *54CBBE4F02F4_4ADDE1300362get_var*
//#UC END# *54CBBE4F02F4_4ADDE1300362get_var*
begin
//#UC START# *54CBBE4F02F4_4ADDE1300362get_impl*
 Result := l3PCharLen(Items.Strings[aIndex], cDefCodePage);
//#UC END# *54CBBE4F02F4_4ADDE1300362get_impl*
end;//Tl3ListContainerNode.pm_GetStrings

procedure Tl3ListContainerNode.pm_SetStrings(aIndex: Integer; const aValue: Tl3WString);
//#UC START# *54CBBE4F02F4_4ADDE1300362set_var*
//#UC END# *54CBBE4F02F4_4ADDE1300362set_var*
begin
//#UC START# *54CBBE4F02F4_4ADDE1300362set_impl*
 Items.Strings[aIndex] := l3Str(aValue, CP_DefaultValue);
//#UC END# *54CBBE4F02F4_4ADDE1300362set_impl*
end;//Tl3ListContainerNode.pm_SetStrings

function Tl3ListContainerNode.pm_GetItemParam(aIndex: Integer): Integer;
//#UC START# *54CBBE830320_4ADDE1300362get_var*
//#UC END# *54CBBE830320_4ADDE1300362get_var*
begin
//#UC START# *54CBBE830320_4ADDE1300362get_impl*
 Result := Integer(Items.Objects[aIndex]);
//#UC END# *54CBBE830320_4ADDE1300362get_impl*
end;//Tl3ListContainerNode.pm_GetItemParam

procedure Tl3ListContainerNode.pm_SetItemParam(aIndex: Integer; aValue: Integer);
//#UC START# *54CBBE830320_4ADDE1300362set_var*
//#UC END# *54CBBE830320_4ADDE1300362set_var*
begin
//#UC START# *54CBBE830320_4ADDE1300362set_impl*
 Items.Objects[aIndex] := Pointer(aValue);
//#UC END# *54CBBE830320_4ADDE1300362set_impl*
end;//Tl3ListContainerNode.pm_SetItemParam

function Tl3ListContainerNode.pm_GetItemFlag(aIndex: Integer): Integer;
//#UC START# *54CBBEAD001E_4ADDE1300362get_var*
//#UC END# *54CBBEAD001E_4ADDE1300362get_var*
begin
//#UC START# *54CBBEAD001E_4ADDE1300362get_impl*
 Result := 0;
//#UC END# *54CBBEAD001E_4ADDE1300362get_impl*
end;//Tl3ListContainerNode.pm_GetItemFlag

procedure Tl3ListContainerNode.pm_SetItemFlag(aIndex: Integer; aValue: Integer);
//#UC START# *54CBBEAD001E_4ADDE1300362set_var*
//#UC END# *54CBBEAD001E_4ADDE1300362set_var*
begin
//#UC START# *54CBBEAD001E_4ADDE1300362set_impl*
//#UC END# *54CBBEAD001E_4ADDE1300362set_impl*
end;//Tl3ListContainerNode.pm_SetItemFlag

function Tl3ListContainerNode.GetItemsCount: Integer;
//#UC START# *54CBBF2003C3_4ADDE1300362_var*
//#UC END# *54CBBF2003C3_4ADDE1300362_var*
begin
//#UC START# *54CBBF2003C3_4ADDE1300362_impl*
 if f_Items <> nil then
  Result := f_Items.Count
 else
  Result := 0;
//#UC END# *54CBBF2003C3_4ADDE1300362_impl*
end;//Tl3ListContainerNode.GetItemsCount

function Tl3ListContainerNode.MakeChildNode: Tl3ListItemNode;
//#UC START# *54CBBFDF025B_4ADDE1300362_var*
//#UC END# *54CBBFDF025B_4ADDE1300362_var*
begin
//#UC START# *54CBBFDF025B_4ADDE1300362_impl*
 Result := Tl3StrListItemNode.Create;
//#UC END# *54CBBFDF025B_4ADDE1300362_impl*
end;//Tl3ListContainerNode.MakeChildNode

procedure Tl3ListContainerNode.MoveChildItemPrim(aCurIndex: Integer;
  aNewIndex: Integer);
//#UC START# *54CBC0240017_4ADDE1300362_var*
//#UC END# *54CBC0240017_4ADDE1300362_var*
begin
//#UC START# *54CBC0240017_4ADDE1300362_impl*
 Items.Move(aCurIndex, aNewIndex);
//#UC END# *54CBC0240017_4ADDE1300362_impl*
end;//Tl3ListContainerNode.MoveChildItemPrim

procedure Tl3ListContainerNode.Cleanup;
//#UC START# *479731C50290_4ADDE1300362_var*
//#UC END# *479731C50290_4ADDE1300362_var*
begin
//#UC START# *479731C50290_4ADDE1300362_impl*
 Items := nil;
 inherited;
//#UC END# *479731C50290_4ADDE1300362_impl*
end;//Tl3ListContainerNode.Cleanup

procedure Tl3ListContainerNode.DoReleaseChilds;
//#UC START# *54C8E22F0223_4ADDE1300362_var*
//#UC END# *54C8E22F0223_4ADDE1300362_var*
begin
//#UC START# *54C8E22F0223_4ADDE1300362_impl*
 Changing;
 try
  Il3Node(Self).Notify(ntChildClear, Self);
  Items := nil;
 finally
  Changed;
 end;
//#UC END# *54C8E22F0223_4ADDE1300362_impl*
end;//Tl3ListContainerNode.DoReleaseChilds

procedure Tl3ListContainerNode.DeleteChildItem(aIndex: Integer;
  const aDelete: Il3Node);
//#UC START# *54CBBF3C0184_4ADDE1300362_var*
//#UC END# *54CBBF3C0184_4ADDE1300362_var*
begin
//#UC START# *54CBBF3C0184_4ADDE1300362_impl*
 Items.Delete(aIndex);
 inherited DeleteChildItem(aIndex, aDelete);
//#UC END# *54CBBF3C0184_4ADDE1300362_impl*
end;//Tl3ListContainerNode.DeleteChildItem
// start class Tl3DataListContainerNode

function Tl3DataListContainerNode.pm_GetItems: Tl3StringDataList;
//#UC START# *54CF8FD00391_4ADDE144032Aget_var*
//#UC END# *54CF8FD00391_4ADDE144032Aget_var*
begin
//#UC START# *54CF8FD00391_4ADDE144032Aget_impl*
 Result := f_Items;
//#UC END# *54CF8FD00391_4ADDE144032Aget_impl*
end;//Tl3DataListContainerNode.pm_GetItems

procedure Tl3DataListContainerNode.pm_SetItems(aValue: Tl3StringDataList);
//#UC START# *54CF8FD00391_4ADDE144032Aset_var*
//#UC END# *54CF8FD00391_4ADDE144032Aset_var*
begin
//#UC START# *54CF8FD00391_4ADDE144032Aset_impl*
 if f_Items = aValue then
  Exit;
 Changing;
 try
  if f_Items <> nil then
  begin
   Il3Node(Self).Notify(ntChildClear, Self);
   Il3ChangeNotifier(f_Items).Unsubscribe(Il3ItemNotifyRecipient(Self));
   Il3ChangeNotifier(f_Items).Unsubscribe(Il3ChangeRecipient(Self));
  end;

  l3Set(f_Items, aValue);

  if f_Items <> nil then
  begin
   f_Items.NeedDisposeStr := True;
   f_Items.NeedAllocStr := True;
   Il3ChangeNotifier(f_Items).Subscribe(Il3ItemNotifyRecipient(Self));
   Il3ChangeNotifier(f_Items).Subscribe(Il3ChangeRecipient(Self));
   IncAllChildrenCount(f_Items.Count - ChildCount);
   Il3Node(Self).Notify(ntChildInsert, Self);
  end;
 finally
  Changed;
 end;
//#UC END# *54CF8FD00391_4ADDE144032Aset_impl*
end;//Tl3DataListContainerNode.pm_SetItems

function Tl3DataListContainerNode.pm_GetItemData(aIndex: Integer): PAnsiChar;
//#UC START# *54CF8FFC02A4_4ADDE144032Aget_var*
//#UC END# *54CF8FFC02A4_4ADDE144032Aget_var*
begin
//#UC START# *54CF8FFC02A4_4ADDE144032Aget_impl*
 Result := Items.Data[aIndex];
//#UC END# *54CF8FFC02A4_4ADDE144032Aget_impl*
end;//Tl3DataListContainerNode.pm_GetItemData

procedure Tl3DataListContainerNode.pm_SetItemData(aIndex: Integer; aValue: PAnsiChar);
//#UC START# *54CF8FFC02A4_4ADDE144032Aset_var*
//#UC END# *54CF8FFC02A4_4ADDE144032Aset_var*
begin
//#UC START# *54CF8FFC02A4_4ADDE144032Aset_impl*
 Items.Data[aIndex] := aValue;
//#UC END# *54CF8FFC02A4_4ADDE144032Aset_impl*
end;//Tl3DataListContainerNode.pm_SetItemData

function Tl3DataListContainerNode.pm_GetItemDataSize(aIndex: Integer): Cardinal;
//#UC START# *54CF9024028A_4ADDE144032Aget_var*
//#UC END# *54CF9024028A_4ADDE144032Aget_var*
begin
//#UC START# *54CF9024028A_4ADDE144032Aget_impl*
 Result := Items.HostDataSize;
//#UC END# *54CF9024028A_4ADDE144032Aget_impl*
end;//Tl3DataListContainerNode.pm_GetItemDataSize

procedure Tl3DataListContainerNode.pm_SetItemDataSize(aIndex: Integer; aValue: Cardinal);
//#UC START# *54CF9024028A_4ADDE144032Aset_var*
//#UC END# *54CF9024028A_4ADDE144032Aset_var*
begin
//#UC START# *54CF9024028A_4ADDE144032Aset_impl*
//#UC END# *54CF9024028A_4ADDE144032Aset_impl*
end;//Tl3DataListContainerNode.pm_SetItemDataSize

function Tl3DataListContainerNode.pm_GetStrings(aIndex: Integer): Tl3WString;
//#UC START# *54CBBE4F02F4_4ADDE144032Aget_var*
//#UC END# *54CBBE4F02F4_4ADDE144032Aget_var*
begin
//#UC START# *54CBBE4F02F4_4ADDE144032Aget_impl*
 Result := l3PCharLen(Items.Strings[aIndex], -1, cDefCodePage);
//#UC END# *54CBBE4F02F4_4ADDE144032Aget_impl*
end;//Tl3DataListContainerNode.pm_GetStrings

procedure Tl3DataListContainerNode.pm_SetStrings(aIndex: Integer; const aValue: Tl3WString);
//#UC START# *54CBBE4F02F4_4ADDE144032Aset_var*
//#UC END# *54CBBE4F02F4_4ADDE144032Aset_var*
begin
//#UC START# *54CBBE4F02F4_4ADDE144032Aset_impl*
 Items.Strings[aIndex] := PAnsiChar(l3Str(aValue, CP_DefaultValue));
//#UC END# *54CBBE4F02F4_4ADDE144032Aset_impl*
end;//Tl3DataListContainerNode.pm_SetStrings

function Tl3DataListContainerNode.pm_GetItemParam(aIndex: Integer): Integer;
//#UC START# *54CBBE830320_4ADDE144032Aget_var*
//#UC END# *54CBBE830320_4ADDE144032Aget_var*
begin
//#UC START# *54CBBE830320_4ADDE144032Aget_impl*
 Result := Integer(Items.DataInt[aIndex]);
//#UC END# *54CBBE830320_4ADDE144032Aget_impl*
end;//Tl3DataListContainerNode.pm_GetItemParam

procedure Tl3DataListContainerNode.pm_SetItemParam(aIndex: Integer; aValue: Integer);
//#UC START# *54CBBE830320_4ADDE144032Aset_var*
//#UC END# *54CBBE830320_4ADDE144032Aset_var*
begin
//#UC START# *54CBBE830320_4ADDE144032Aset_impl*
 Items.DataInt[aIndex] := aValue;
//#UC END# *54CBBE830320_4ADDE144032Aset_impl*
end;//Tl3DataListContainerNode.pm_SetItemParam

function Tl3DataListContainerNode.pm_GetItemFlag(aIndex: Integer): Integer;
//#UC START# *54CBBEAD001E_4ADDE144032Aget_var*
//#UC END# *54CBBEAD001E_4ADDE144032Aget_var*
begin
//#UC START# *54CBBEAD001E_4ADDE144032Aget_impl*
 Result := Integer(Items.Flags[aIndex]);
//#UC END# *54CBBEAD001E_4ADDE144032Aget_impl*
end;//Tl3DataListContainerNode.pm_GetItemFlag

procedure Tl3DataListContainerNode.pm_SetItemFlag(aIndex: Integer; aValue: Integer);
//#UC START# *54CBBEAD001E_4ADDE144032Aset_var*
//#UC END# *54CBBEAD001E_4ADDE144032Aset_var*
begin
//#UC START# *54CBBEAD001E_4ADDE144032Aset_impl*
 Items.Flags[aIndex] := aValue;
//#UC END# *54CBBEAD001E_4ADDE144032Aset_impl*
end;//Tl3DataListContainerNode.pm_SetItemFlag

function Tl3DataListContainerNode.GetItemsCount: Integer;
//#UC START# *54CBBF2003C3_4ADDE144032A_var*
//#UC END# *54CBBF2003C3_4ADDE144032A_var*
begin
//#UC START# *54CBBF2003C3_4ADDE144032A_impl*
 if f_Items <> nil then
  Result := f_Items.Count
 else
  Result := 0;
//#UC END# *54CBBF2003C3_4ADDE144032A_impl*
end;//Tl3DataListContainerNode.GetItemsCount

function Tl3DataListContainerNode.MakeChildNode: Tl3ListItemNode;
//#UC START# *54CBBFDF025B_4ADDE144032A_var*
//#UC END# *54CBBFDF025B_4ADDE144032A_var*
begin
//#UC START# *54CBBFDF025B_4ADDE144032A_impl*
 Result := Tl3DataListItemNode.Create;
//#UC END# *54CBBFDF025B_4ADDE144032A_impl*
end;//Tl3DataListContainerNode.MakeChildNode

procedure Tl3DataListContainerNode.MoveChildItemPrim(aCurIndex: Integer;
  aNewIndex: Integer);
//#UC START# *54CBC0240017_4ADDE144032A_var*
//#UC END# *54CBC0240017_4ADDE144032A_var*
begin
//#UC START# *54CBC0240017_4ADDE144032A_impl*
 Items.Move(aCurIndex, aNewIndex);
//#UC END# *54CBC0240017_4ADDE144032A_impl*
end;//Tl3DataListContainerNode.MoveChildItemPrim

procedure Tl3DataListContainerNode.Cleanup;
//#UC START# *479731C50290_4ADDE144032A_var*
//#UC END# *479731C50290_4ADDE144032A_var*
begin
//#UC START# *479731C50290_4ADDE144032A_impl*
 Items := nil;
 inherited;
//#UC END# *479731C50290_4ADDE144032A_impl*
end;//Tl3DataListContainerNode.Cleanup

procedure Tl3DataListContainerNode.DoReleaseChilds;
//#UC START# *54C8E22F0223_4ADDE144032A_var*
//#UC END# *54C8E22F0223_4ADDE144032A_var*
begin
//#UC START# *54C8E22F0223_4ADDE144032A_impl*
 Changing;
 try
  Il3Node(Self).Notify(ntChildClear, Self);
  l3Free(f_Items);
 finally
  Changed;
 end;
//#UC END# *54C8E22F0223_4ADDE144032A_impl*
end;//Tl3DataListContainerNode.DoReleaseChilds

procedure Tl3DataListContainerNode.DeleteChildItem(aIndex: Integer;
  const aDelete: Il3Node);
//#UC START# *54CBBF3C0184_4ADDE144032A_var*
//#UC END# *54CBBF3C0184_4ADDE144032A_var*
begin
//#UC START# *54CBBF3C0184_4ADDE144032A_impl*
 f_Items.Delete(aIndex);
//#UC END# *54CBBF3C0184_4ADDE144032A_impl*
end;//Tl3DataListContainerNode.DeleteChildItem
// start class Tl3IListContainerNode

procedure Tl3IListContainerNode.ListChanged(Sender: TObject);
//#UC START# *54CF91B400ED_4ADDE158034A_var*
//#UC END# *54CF91B400ED_4ADDE158034A_var*
begin
//#UC START# *54CF91B400ED_4ADDE158034A_impl*
 Changed;
//#UC END# *54CF91B400ED_4ADDE158034A_impl*
end;//Tl3IListContainerNode.ListChanged

procedure Tl3IListContainerNode.ListChanging(Sender: TObject);
//#UC START# *54CF91C20055_4ADDE158034A_var*
//#UC END# *54CF91C20055_4ADDE158034A_var*
begin
//#UC START# *54CF91C20055_4ADDE158034A_impl*
 Changing;
//#UC END# *54CF91C20055_4ADDE158034A_impl*
end;//Tl3IListContainerNode.ListChanging

function Tl3IListContainerNode.pm_GetItems: Il3HandledStringList;
//#UC START# *54CF91550398_4ADDE158034Aget_var*
//#UC END# *54CF91550398_4ADDE158034Aget_var*
begin
//#UC START# *54CF91550398_4ADDE158034Aget_impl*
 Result := f_Items;
//#UC END# *54CF91550398_4ADDE158034Aget_impl*
end;//Tl3IListContainerNode.pm_GetItems

procedure Tl3IListContainerNode.pm_SetItems(const aValue: Il3HandledStringList);
//#UC START# *54CF91550398_4ADDE158034Aset_var*
//#UC END# *54CF91550398_4ADDE158034Aset_var*
begin
//#UC START# *54CF91550398_4ADDE158034Aset_impl*
 if f_Items = aValue then
  Exit;
 Changing;
 try
  if f_Items <> nil then
  begin
   Il3Node(Self).Notify(ntChildClear, Self);
   with (f_Items as Il3ChangeNotifier) do
   begin
    Unsubscribe(Il3ItemNotifyRecipient(Self));
    Unsubscribe(Il3ChangeRecipient(Self));
   end;
  end;

  f_Items := aValue;

  if f_Items <> nil then
  begin
   with (f_Items as Il3ChangeNotifier) do
   begin
    Subscribe(Il3ItemNotifyRecipient(Self));
    Subscribe(Il3ChangeRecipient(Self));
   end;
   IncAllChildrenCount(f_Items.Count - ChildCount);
   Il3Node(Self).Notify(ntChildInsert, Self);
  end;
 finally
  Changed;
 end;
//#UC END# *54CF91550398_4ADDE158034Aset_impl*
end;//Tl3IListContainerNode.pm_SetItems

function Tl3IListContainerNode.pm_GetStrings(aIndex: Integer): Tl3WString;
//#UC START# *54CBBE4F02F4_4ADDE158034Aget_var*
//#UC END# *54CBBE4F02F4_4ADDE158034Aget_var*
begin
//#UC START# *54CBBE4F02F4_4ADDE158034Aget_impl*
 Result := Items[aIndex];
//#UC END# *54CBBE4F02F4_4ADDE158034Aget_impl*
end;//Tl3IListContainerNode.pm_GetStrings

procedure Tl3IListContainerNode.pm_SetStrings(aIndex: Integer; const aValue: Tl3WString);
//#UC START# *54CBBE4F02F4_4ADDE158034Aset_var*
//#UC END# *54CBBE4F02F4_4ADDE158034Aset_var*
begin
//#UC START# *54CBBE4F02F4_4ADDE158034Aset_impl*
 Items[aIndex] := Tl3PCharLen(aValue);
//#UC END# *54CBBE4F02F4_4ADDE158034Aset_impl*
end;//Tl3IListContainerNode.pm_SetStrings

function Tl3IListContainerNode.pm_GetItemParam(aIndex: Integer): Integer;
//#UC START# *54CBBE830320_4ADDE158034Aget_var*
//#UC END# *54CBBE830320_4ADDE158034Aget_var*
begin
//#UC START# *54CBBE830320_4ADDE158034Aget_impl*
 Result := Integer(Items.Handle[aIndex]);
//#UC END# *54CBBE830320_4ADDE158034Aget_impl*
end;//Tl3IListContainerNode.pm_GetItemParam

procedure Tl3IListContainerNode.pm_SetItemParam(aIndex: Integer; aValue: Integer);
//#UC START# *54CBBE830320_4ADDE158034Aset_var*
//#UC END# *54CBBE830320_4ADDE158034Aset_var*
begin
//#UC START# *54CBBE830320_4ADDE158034Aset_impl*
 Items.Handle[aIndex] := aValue;
//#UC END# *54CBBE830320_4ADDE158034Aset_impl*
end;//Tl3IListContainerNode.pm_SetItemParam

function Tl3IListContainerNode.pm_GetItemFlag(aIndex: Integer): Integer;
//#UC START# *54CBBEAD001E_4ADDE158034Aget_var*
//#UC END# *54CBBEAD001E_4ADDE158034Aget_var*
begin
//#UC START# *54CBBEAD001E_4ADDE158034Aget_impl*
 Result := 0;
//#UC END# *54CBBEAD001E_4ADDE158034Aget_impl*
end;//Tl3IListContainerNode.pm_GetItemFlag

procedure Tl3IListContainerNode.pm_SetItemFlag(aIndex: Integer; aValue: Integer);
//#UC START# *54CBBEAD001E_4ADDE158034Aset_var*
//#UC END# *54CBBEAD001E_4ADDE158034Aset_var*
begin
//#UC START# *54CBBEAD001E_4ADDE158034Aset_impl*
//#UC END# *54CBBEAD001E_4ADDE158034Aset_impl*
end;//Tl3IListContainerNode.pm_SetItemFlag

function Tl3IListContainerNode.GetItemsCount: Integer;
//#UC START# *54CBBF2003C3_4ADDE158034A_var*
//#UC END# *54CBBF2003C3_4ADDE158034A_var*
begin
//#UC START# *54CBBF2003C3_4ADDE158034A_impl*
 if f_Items <> nil then
  Result := f_Items.Count
 else
  Result := 0;
//#UC END# *54CBBF2003C3_4ADDE158034A_impl*
end;//Tl3IListContainerNode.GetItemsCount

function Tl3IListContainerNode.MakeChildNode: Tl3ListItemNode;
//#UC START# *54CBBFDF025B_4ADDE158034A_var*
//#UC END# *54CBBFDF025B_4ADDE158034A_var*
begin
//#UC START# *54CBBFDF025B_4ADDE158034A_impl*
 Result := Tl3ListItemNode.Create;
//#UC END# *54CBBFDF025B_4ADDE158034A_impl*
end;//Tl3IListContainerNode.MakeChildNode

procedure Tl3IListContainerNode.MoveChildItemPrim(aCurIndex: Integer;
  aNewIndex: Integer);
//#UC START# *54CBC0240017_4ADDE158034A_var*
//#UC END# *54CBC0240017_4ADDE158034A_var*
begin
//#UC START# *54CBC0240017_4ADDE158034A_impl*
//#UC END# *54CBC0240017_4ADDE158034A_impl*
end;//Tl3IListContainerNode.MoveChildItemPrim

procedure Tl3IListContainerNode.Cleanup;
//#UC START# *479731C50290_4ADDE158034A_var*
//#UC END# *479731C50290_4ADDE158034A_var*
begin
//#UC START# *479731C50290_4ADDE158034A_impl*
 Items := nil;
 inherited;
//#UC END# *479731C50290_4ADDE158034A_impl*
end;//Tl3IListContainerNode.Cleanup

procedure Tl3IListContainerNode.ClearFields;
 {-}
begin
 Items := nil;
 inherited;
end;//Tl3IListContainerNode.ClearFields

procedure Tl3IListContainerNode.DoReleaseChilds;
//#UC START# *54C8E22F0223_4ADDE158034A_var*
//#UC END# *54C8E22F0223_4ADDE158034A_var*
begin
//#UC START# *54C8E22F0223_4ADDE158034A_impl*
 Changing;
 try
  Il3Node(Self).Notify(ntChildClear, Self);
  Items := nil;
 finally
  Changed;
 end;
//#UC END# *54C8E22F0223_4ADDE158034A_impl*
end;//Tl3IListContainerNode.DoReleaseChilds

procedure Tl3IListContainerNode.DeleteChildItem(aIndex: Integer;
  const aDelete: Il3Node);
//#UC START# *54CBBF3C0184_4ADDE158034A_var*
//#UC END# *54CBBF3C0184_4ADDE158034A_var*
begin
//#UC START# *54CBBF3C0184_4ADDE158034A_impl*
 Items.Delete(aIndex);
//#UC END# *54CBBF3C0184_4ADDE158034A_impl*
end;//Tl3IListContainerNode.DeleteChildItem
// start class Tl3DataListItemNode

function Tl3DataListItemNode.Get_Data: PAnsiChar;
//#UC START# *54CF92730021_4ADDE1D8022Fget_var*
//#UC END# *54CF92730021_4ADDE1D8022Fget_var*
begin
//#UC START# *54CF92730021_4ADDE1D8022Fget_impl*
 Result := Tl3DataListContainerNode(f_ListNode).ItemData[f_ListItem];
//#UC END# *54CF92730021_4ADDE1D8022Fget_impl*
end;//Tl3DataListItemNode.Get_Data

procedure Tl3DataListItemNode.Set_Data(aValue: PAnsiChar);
//#UC START# *54CF92730021_4ADDE1D8022Fset_var*
//#UC END# *54CF92730021_4ADDE1D8022Fset_var*
begin
//#UC START# *54CF92730021_4ADDE1D8022Fset_impl*
 Changing;
 try
  Tl3DataListContainerNode(f_ListNode).ItemData[f_ListItem] := aValue;
  Notify(ntDataChange, Self);
 finally
  Changed;
 end;
//#UC END# *54CF92730021_4ADDE1D8022Fset_impl*
end;//Tl3DataListItemNode.Set_Data

function Tl3DataListItemNode.Get_DataSize: Cardinal;
//#UC START# *54CF9287015D_4ADDE1D8022Fget_var*
//#UC END# *54CF9287015D_4ADDE1D8022Fget_var*
begin
//#UC START# *54CF9287015D_4ADDE1D8022Fget_impl*
 Result := Tl3DataListContainerNode(f_ListNode).ItemDataSize[f_ListItem];
//#UC END# *54CF9287015D_4ADDE1D8022Fget_impl*
end;//Tl3DataListItemNode.Get_DataSize

procedure Tl3DataListItemNode.Set_DataSize(aValue: Cardinal);
//#UC START# *54CF9287015D_4ADDE1D8022Fset_var*
//#UC END# *54CF9287015D_4ADDE1D8022Fset_var*
begin
//#UC START# *54CF9287015D_4ADDE1D8022Fset_impl*
 Changing;
 try
  Tl3DataListContainerNode(f_ListNode).ItemDataSize[f_ListItem] := aValue;
  Notify(ntDataChange, Self);
 finally
  Changed;
 end;
//#UC END# *54CF9287015D_4ADDE1D8022Fset_impl*
end;//Tl3DataListItemNode.Set_DataSize

end.