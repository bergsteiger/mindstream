unit l3Tree_TLB;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3TreeInterfaces,
  l3PureMixIns,
  SysUtils
  ;

type
 Il3Node = interface;
 { - предварительное описание Il3Node. }

 Tl3NodeAction = function (const Intf: Il3Node): Boolean;

 Il3Node = interface(Il3SimpleNode)
  {* Узел дерева. }
   ['{BDC2C857-504E-41EC-984D-89C2285E449D}']
   function Get_AllChildrenCount: Integer;
   function Get_ChildSorted: Boolean;
   procedure Set_ChildSorted(aValue: Boolean);
   function Get_ChildSortedFromParent: Boolean;
   procedure Set_ChildSortedFromParent(aValue: Boolean);
   function Get_Flags: Integer;
   procedure Set_Flags(aValue: Integer);
   function Get_Text: Tl3PCharLenPrim;
   procedure Set_Text(const aValue: Tl3PCharLenPrim);
   function Get_NextNode: Il3Node;
   function Get_PrevNode: Il3Node;
   function Get_ParentNode: Il3Node;
   function Get_ChildNode: Il3Node;
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
   procedure Remove;
     {* удалить узел из дерева. }
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
   property AllChildrenCount: Integer
     read Get_AllChildrenCount;
     {* число дочерних элементов, включая все вложенные. }
   property ChildSorted: Boolean
     read Get_ChildSorted
     write Set_ChildSorted;
     {* нужно ли сортировать ChildNode. }
   property ChildSortedFromParent: Boolean
     read Get_ChildSortedFromParent
     write Set_ChildSortedFromParent;
     {* спрашивать ChildSorted у ParentNode. }
   property Flags: Integer
     read Get_Flags
     write Set_Flags;
     {* Флаги. }
   property Text: Tl3PCharLenPrim
     read Get_Text
     write Set_Text;
     {* текст узла. }
   property NextNode: Il3Node
     read Get_NextNode;
     {* следующий узел того же уровня. }
   property PrevNode: Il3Node
     read Get_PrevNode;
     {* предыдущий узел того же уровня. }
   property ParentNode: Il3Node
     read Get_ParentNode;
     {* родительский узел. }
   property ChildNode: Il3Node
     read Get_ChildNode;
     {* первый дочерний элемент. }
  // Ml3ChangingChanged
   procedure Changed;
     {* нотификация о завершении изменения состояния объекта. Для перекрытия и использования в потомках. }
   procedure Changing;
     {* нотификация о начале изменения состояния объекта. Для перекрытия и использования в потомках. }
 end;//Il3Node

 Il3RootNode = interface(Il3Node{, Il3ChangeNotifier})
  {* Корневой узел }
   ['{42FD62D0-B4D4-4212-A282-1C78349A60F1}']
  // Методы преобразования к реализуемым интерфейсам
   function As_Il3ChangeNotifier: Il3ChangeNotifier;
 end;//Il3RootNode

 Il3Tree = interface(Il3SimpleTree)
  {* Дерево. }
   ['{A8F1929F-0BDE-47C0-B307-46ABC8EB84C1}']
   function Get_CommonExpanded: Boolean;
   procedure Set_CommonExpanded(aValue: Boolean);
   function Get_SelModifiedCount: Integer;
   function Get_Modified: Boolean;
   procedure Set_Modified(aValue: Boolean);
   function Get_CNodes(Index: Integer): Il3Node;
   function Get_SelectedNode(const Node: Il3Node): Boolean;
   procedure Set_SelectedNode(const Node: Il3Node; aValue: Boolean);
   function Get_NodeFlags(const Node: Il3Node): Integer;
   procedure Set_NodeFlags(const Node: Il3Node; aValue: Integer);
   function Get_CRootNode: Il3RootNode;
   procedure Set_CRootNode(const aValue: Il3RootNode);
   function Get_Strings(anIndex: Integer): PAnsiChar;
   function GetFlagsByAbsIndex(aAbsIndex: Integer): Integer;
   procedure SetFlagsByAbsIndex(aAbsIndex: Integer;
    aValue: Integer);
   function GetNodeByAbsIndex(aAbsIndex: Integer): Il3Node;
   function GetAbsIndex(const aCurNode: Il3Node): Integer;
   procedure Notify(aOperation: Integer;
    const aNode: Il3SimpleNode);
     {* нотификация об операции над узлом. anOperation см. ntNone etc. }
   function ChangeExpand(const RNode: Il3Node;
    Mode: Tl3SetBitType;
    aForceMode: Boolean = false): Boolean;
   function TestFlagMask(const aNode: Il3Node;
    aFlagMask: Integer): Boolean; overload; 
   function TestFlagMask(aAbsIndex: Integer;
    aFlagMask: Integer): Boolean; overload; 
   procedure SetFlagMask(aAbsIndex: Integer;
    aFlagMask: Integer;
    aMode: Tl3SetBitType); overload; 
   procedure SetFlagMask(const aRNode: Il3Node;
    aFlagMask: Integer;
    aMode: Tl3SetBitType); overload; 
   function GetPrev(const aCurNode: Il3Node): Il3Node;
     {* возвращает узел, находящийся непосредственно перед указанным независимо от иерархии. }
   function IterateF(Action: Tl3NodeAction;
    IterMode: Integer = 0;
    const aSubRootNode: Il3Node = nil;
    const aFromNode: Il3Node = nil): Il3Node;
     {* перебрать все узлы и освободить заглушку для Action. }
   procedure SetRootAndCountView(const aNode: Il3RootNode;
    aCountView: Integer);
     {* <?> Кандидат на удаление. }
   procedure SetAllFlag(aMode: Tl3SetBitType;
    aFlags: Integer);
   procedure PrintTreeList(const aFileName: TFileName;
    aWithNumber: Boolean;
    aIterMode: Integer = 0;
    const aLevelIndent: AnsiString = ' ');
   function SearchByName(const aFirstNode: Il3Node;
    aNameStr: PAnsiChar;
    aIterMode: Integer): Il3Node;
   function FindNodeByParam(const Parent: Il3Node;
    Param: Integer;
    aIterMode: Integer): Il3Node;
   procedure ResetSelection;
   procedure LockSelModify;
   procedure UnLockSelModify;
   function GetNextSetFlag(const aCurNode: Il3Node;
    aFlag: Integer): Il3Node;
     {* //vvv }
   procedure ChangeName(const aNode: Il3Node;
    NewTitle: PAnsiChar);
     {* изменить название узла. }
   function InsertNode(const aParentNode: Il3Node;
    const aNode: Il3Node): Il3Node;
     {* вставить новый узел. }
   function InsertNodeBefore(const aNextNode: Il3Node;
    const aNode: Il3Node): Il3Node;
     {* вставить новый узел перед указанным. }
   procedure SetLevelSlash(const aSt: AnsiString);
   function IsSelect(const aNode: Il3Node): Boolean;
     {* является ли узел отмеченным. }
   function IsChildSelect(const aNode: Il3Node): Boolean;
   procedure Clear;
   function MoveSelectedNodes(aDirection: Tl3Direction): Boolean;
     {* перместить выделенные узлы }
   function DeleteSelectedNodes: Boolean;
     {* Удалить выделенные узлы, }
   function GetNextSelect(const aCurNode: Il3Node): Il3Node;
   procedure ClearSelected;
   property CommonExpanded: Boolean
     read Get_CommonExpanded
     write Set_CommonExpanded;
   property SelModifiedCount: Integer
     read Get_SelModifiedCount;
   property Modified: Boolean
     read Get_Modified
     write Set_Modified;
     {* признак изменения структуры данных. }
   property CNodes[Index: Integer]: Il3Node
     read Get_CNodes;
     {* узлы по индексу. }
   property SelectedNode[const Node: Il3Node]: Boolean
     read Get_SelectedNode
     write Set_SelectedNode;
     {* выделенные узлы. }
   property NodeFlags[const Node: Il3Node]: Integer
     read Get_NodeFlags
     write Set_NodeFlags;
     {* флаги узлов. (см. nfSelected etc) }
   property CRootNode: Il3RootNode
     read Get_CRootNode
     write Set_CRootNode;
     {* корневой узел дерева. }
   property Strings[anIndex: Integer]: PAnsiChar
     read Get_Strings;
     {* строчки узлов по видимому индексу [0..CountView-1]. }
 end;//Il3Tree

 Il3InternalNode = interface(Il3Node)
  {* Внутреннее представление узла дерева. Для записи соседей и детей. }
   ['{6D78042F-D475-47B5-AA85-D90F0FE6CA9C}']
   function Get_ParentNode: Il3Node;
   procedure Set_ParentNode(const aValue: Il3Node);
   function Get_ChildNode: Il3Node;
   procedure Set_ChildNode(const aValue: Il3Node);
   function Get_NextNode: Il3Node;
   procedure Set_NextNode(const aValue: Il3Node);
   function Get_PrevNode: Il3Node;
   procedure Set_PrevNode(const aValue: Il3Node);
   property ParentNode: Il3Node
     read Get_ParentNode
     write Set_ParentNode;
     {* родительский узел. }
   property ChildNode: Il3Node
     read Get_ChildNode
     write Set_ChildNode;
     {* первый дочерний элемент. }
   property NextNode: Il3Node
     read Get_NextNode
     write Set_NextNode;
     {* следующий узел того же уровня. }
   property PrevNode: Il3Node
     read Get_PrevNode
     write Set_PrevNode;
     {* предыдущий узел того же уровня. }
 end;//Il3InternalNode

 Il3TreeWithLockRebuild = interface(IUnknown)
   ['{B9824BFD-4B51-417E-A2F5-3201CE829601}']
   procedure LockRebuild;
     {* Сигнатура метода LockRebuild }
   procedure UnlockRebuild;
     {* Сигнатура метода UnlockRebuild }
   function IsRebuildLocked: Boolean;
 end;//Il3TreeWithLockRebuild

 Il3TreeSource = interface(IUnknown)
  {* Источник структуры дерева. }
   ['{51C16453-58D7-4494-8A54-88554755533B}']
   function Get_Tree: Il3Tree;
   procedure Set_Tree(const aValue: Il3Tree);
   property Tree: Il3Tree
     read Get_Tree
     write Set_Tree;
     {* Дерево, предоставляемое источником. }
 end;//Il3TreeSource

implementation

end.