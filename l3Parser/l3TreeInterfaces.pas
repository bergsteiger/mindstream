unit l3TreeInterfaces;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}

{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces
  ;

type
 Il3Base = l3Interfaces.Il3Base;
  {* Базовый предок. }

 Il3Nodes = interface(Il3Base)
  {* контейнер узлов }
   ['{4A85EA5F-CCB1-4250-A410-635227213794}']
 end;//Il3Nodes

 Il3NotifySource = interface(Il3ChangeNotifier)
  {* Объект, рассылающий нотификацию об изменении структуры. }
   ['{714F2774-DCFE-4ACE-B48B-1EE8885A6170}']
 end;//Il3NotifySource

 Il3SimpleNode = interface;
 { - предварительное описание Il3SimpleNode. }

 Tl3TreeData = record
  {* Запись с данными о перемещаемом объекте }
   rMultiSelection : Boolean; // выделен один или много
   rNode : Il3SimpleNode; // выбранный узел.
   rNodes : Il3Nodes; // выбранные узлы
 end;//Tl3TreeData

 Il3SimpleNode = interface(Il3Base)
  {* Узел дерева. }
   ['{EA766D65-F343-4EF0-913E-70F7ACEAD59D}']
   function Get_Flags: Integer;
   function Get_ThisChildrenCount: Integer;
   function pm_GetIndexInParent: Integer;
   function Get_Text: Tl3PCharLenPrim;
   function Get_Parent: Il3SimpleNode;
   function Get_Child: Il3SimpleNode;
   function Get_Next: Il3SimpleNode;
   function Get_Flag(anIndex: Integer): Boolean;
   procedure Set_Flag(anIndex: Integer; aValue: Boolean);
   function Get_Prev: Il3SimpleNode;
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
   function CanAcceptData(const aData: Tl3TreeData): Boolean;
     {* может ли узел принять данные }
   function DropData(const aData: Tl3TreeData): Boolean;
     {* принять данные }
   function CanMove: Boolean;
     {* определяет возможность перемещения узла }
   property Flags: Integer
     read Get_Flags;
   property ThisChildrenCount: Integer
     read Get_ThisChildrenCount;
     {* число дочерних элементов, БЕЗ детей всех вложенные. }
   property IndexInParent: Integer
     read pm_GetIndexInParent;
     {* индекс узла в родительском. }
   property Text: Tl3PCharLenPrim
     read Get_Text;
     {* текст узла. }
   property Parent: Il3SimpleNode
     read Get_Parent;
     {* родительский узел. }
   property Child: Il3SimpleNode
     read Get_Child;
     {* первый дочерний элемент. }
   property Next: Il3SimpleNode
     read Get_Next;
     {* Следующий сосед. }
   property Flag[anIndex: Integer]: Boolean
     read Get_Flag
     write Set_Flag;
   property Prev: Il3SimpleNode
     read Get_Prev;
     {* Предыдущий сосед. }
 end;//Il3SimpleNode

 Il3SimpleRootNode = interface(Il3SimpleNode)
   ['{C15542CB-D1E5-4FC7-8303-3A3CB315C46D}']
   function CanExpandCollapseAll: Boolean;
   procedure ExpandCollapseAll(anExpand: Boolean);
 end;//Il3SimpleRootNode

 Tl3SimpleNodeAction = function (const Intf: Il3SimpleNode): Boolean;

 Il3RootSource = interface(Il3NotifySource)
  {* Источник корня дерева. }
   ['{5E3068EC-8647-4D64-B5AD-F85B3B91CF7D}']
   function Get_RootNode: Il3SimpleRootNode;
   procedure Set_RootNode(const aValue: Il3SimpleRootNode);
   property RootNode: Il3SimpleRootNode
     read Get_RootNode
     write Set_RootNode;
     {* корень дерева. }
 end;//Il3RootSource

 Il3HandleNode = interface(Il3Base)
  {* Узел дерева с целочисленным идентификатором. }
   ['{C581B66C-0E13-4B43-B8D0-3BCD989E28CA}']
   function Get_Handle: Integer;
   procedure Set_Handle(aValue: Integer);
   property Handle: Integer
     read Get_Handle
     write Set_Handle;
     {* идентификатор узла. }
 end;//Il3HandleNode

 Il3TreeFilters = interface(Il3Base)
  {* фильтры реально установленные на дереве }
   ['{949D1B99-493A-463D-A028-EFB087BD61D4}']
   function pm_GetContext: Il3CString;
   function SetContext(const aValue: Il3CString): Il3TreeFilters;
   function Clone: Il3TreeFilters;
   property Context: Il3CString
     read pm_GetContext;
 end;//Il3TreeFilters

 Il3ContextFilterParamsNotifier = interface(Il3Base)
  {* нотификатор о том что параметры изменились. }
   ['{7CFF12FA-1670-4D53-A10B-64E0870D7B54}']
   procedure ParamsChanged;
 end;//Il3ContextFilterParamsNotifier

 Il3ContextFilterTarget = interface(Il3Base)
  {* проверяет что контекст тот же самый. }
   ['{3A5CC96E-BA9A-44A8-970A-24D6D90B2211}']
   function IsSameContext(const aContext: Il3CString;
    out DiffStart: Cardinal): Boolean;
 end;//Il3ContextFilterTarget

 Il3ContextFilterParamsNotifySource = interface(Il3Base)
  {* источник нотификации о том что параметры изменились. }
   ['{D5B63786-ACB2-41F7-ABF7-67A7A0A3AD84}']
   procedure Subscribe(const aSubscriber: Il3ContextFilterParamsNotifier);
   procedure UnSubscribe(const aSubscriber: Il3ContextFilterParamsNotifier);
 end;//Il3ContextFilterParamsNotifySource

const
  { IterMode }
 imExpandOnly = $01;
  { перебирать только открытые узлы }
 imCheckResult = $02;
  { проверять результат, возвращаемый подитеративной функцией (см. Tl3NodeAction) }
 imOneLevel = $04;
  { перебрать только один уровень }
 imParentNeed = $08;
  { включить RootSubNode в список перебираемых }
 imNoSubRoot = $10;
  { RootSubNode - точка начала, но не корень, так же перебираются узлы расположенные на том же уровне, что и RootSubNode и выше него }
 imChildsBefore = $20;
  { перебрать все дочерние узлы перед их родителем, т.е. дети перебираются вперед }
 imNoChilds = $40;
  { не перебирать дочерние узлы, используется во внутренних процедурах }
 imNoHidden = $80;
  { не перебирать невидимые, поддерживается только процедурами Tl3Tree }
 imLeavesOnly = $100;
  { перебирать только "листьевые" узлы (у которых нет детей) }
  { TNode.Flags const }
 nfSelected = $0001;
  { узел выделен }
 nfSelModified = $0002;
  { выделение узла изменена }
 nfChildSelected = $0004;
  { у узла есть выделенные дочерние узлы }
 nfExpanded = $0008;
  { узел раскрыт }
 nfReadOnly = $0010;
  { узел не для редактирования }
 nfHidden = $0020;
  { узел не отображается }
 nfItemModified = $00010000;
  { узел модифицирован }
 nfHasChild = $00020000;
  { у узла есть дочерние узлы }
 nfWasDisappear = $00040000;
  { узел был удален, cm. IsDisappeared }
 nfUserDefined2 = $20000000;
  { флаг для использования "пользователем". Смысл определяется конкретной реализацией }
 nfUserDefined1 = $40000000;
  { флаг для использования "пользователем". Смысл определяется конкретной реализацией }
  { CountView }
 l3_NeedCountView = -1;
 l3_DelayedCountView = -2;
 l3_NotChangeCountView = -3;

type
 Il3SimpleTree = interface(Il3RootSource)
  {* Дерево. }
   ['{CABAE851-B96A-4BD6-8310-3154F8C3D53F}']
   function Get_ShowRoot: Boolean;
   procedure Set_ShowRoot(aValue: Boolean);
   function Get_CountView: Integer;
   function Get_SelectCount: Integer;
   function Get_Flags(anIndex: Integer): Integer;
   function Get_Select(anIndex: Integer): Boolean;
   procedure Set_Select(anIndex: Integer; aValue: Boolean);
   function Get_Nodes(anIndex: Integer): Il3SimpleNode;
   procedure CursorTop;
     {* переставить курсор на первый видимый элемент. }
   function GetIndex(const aNode: Il3SimpleNode;
    const aSubRootNode: Il3SimpleNode = nil): Integer;
     {* возвращает видимый индекс aNode относительно aSubRootNode или корня. }
   function GetLevel(const aNode: Il3SimpleNode): Integer;
     {* возвращает уровень узла относительно корня. }
   procedure SelectAllNodes(aMode: Tl3SetBitType);
     {* выделяет/развыделяет все узлы. }
   procedure SelectInterval(aFirstIndex: Integer;
    aLastIndex: Integer;
    aMode: Tl3SetBitType;
    aCleanOther: Boolean);
     {* выделяет/развыделяет узлы на указанном интервале. }
   function ChangeExpand(const aNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aForceMode: Boolean = false): Boolean;
     {* меняет развернутость узла. }
   procedure ExpandSubDir(const aNode: Il3SimpleNode = nil;
    anExpand: Boolean = true;
    aDeepLevel: Byte = 0);
     {* развернуть/свернуть узлы. }
   procedure SetBranchFlag(const aParentNode: Il3SimpleNode;
    aMode: Tl3SetBitType;
    aFlagsMask: Integer;
    anIterMode: Integer);
     {* зачем-то используется визуалкой в ExpandNode. }
   function CountViewItemsInSubDir(const aNode: Il3SimpleNode): Integer;
     {* зачем-то используется визуалкой в ShowMoreChildrenOnScreen. }
   function IsRoot(const aNode: Il3SimpleNode): Boolean;
     {* является ли узел корневым для дерева. }
   function IsExpanded(const aNode: Il3SimpleNode): Boolean;
     {* раскрыт ли узел. }
   function IsFirstVis(const aNode: Il3SimpleNode): Boolean;
     {* является ли узел первым видимым в ветке. }
   function IsLastVis(const aNode: Il3SimpleNode): Boolean;
     {* является ли узел последним видимым в ветке. }
   function HasVisibleChildren(const aNode: Il3SimpleNode): Boolean;
     {* есть ли видимые дети у aNode. }
   function GetLines(const aNode: Il3SimpleNode): Integer;
     {* маска для рисования линий (надо смотреть реализацию). }
   function Wake: Boolean;
     {* проснись!!! Типа начали рисовать. }
   function MoveNode(const aNode: Il3SimpleNode;
    aDirection: Tl3Direction): Boolean;
     {* переместить узел. }
   function SearchNameBegin(const aFirstNode: Il3SimpleNode;
    aSrchStr: PAnsiChar;
    aIterMode: Integer): Il3SimpleNode;
     {* зачем-то используется визуалкой в CharToItem. }
   function SearchNameOccur(const aFirstNode: Il3SimpleNode;
    aSrchStr: PAnsiChar;
    aIterMode: Integer): Il3SimpleNode;
     {* зачем-то используется визуалкой в SearchOccurStr,  который сейчас никем не используется. }
   function MakeNodeVisible(const aNode: Il3SimpleNode): Integer;
     {* зачем-то используется визуалкой в CharToItem, видимо для перемещения курсора на узел. }
   function GetPrev(const aNode: Il3SimpleNode): Il3SimpleNode;
     {* предыдущий узел. Зачем-то используется в CharToItem. }
   function SimpleIterateF(Action: Tl3SimpleNodeAction;
    IterMode: Integer = 0;
    const aSubRootNode: Il3SimpleNode = nil): Il3SimpleNode;
     {* перебрать все узлы и освободить заглушку для Action. IterMode: imCheckResult, imParentNeed }
   function IsChanging: Boolean;
     {* дерево находится в фазе обновления. }
   procedure Changing;
   procedure Changed;
   function MakeDataObject(const aNode: Il3SimpleNode;
    const aBitmap: IUnknown): IDataObject;
     {* сделать объект данных дерева, используется при перемещении элементов дерева в другие компоненты }
   function CanAcceptData(const aTargetNode: Il3SimpleNode;
    const aData: Tl3TreeData): Boolean;
   function DropData(const aTargetNode: Il3SimpleNode;
    const aData: Tl3TreeData): Boolean;
   property ShowRoot: Boolean
     read Get_ShowRoot
     write Set_ShowRoot;
     {* показывать ли корень? }
   property CountView: Integer
     read Get_CountView;
     {* полное количество видимых элементов. }
   property SelectCount: Integer
     read Get_SelectCount;
     {* количество выделенных узлов. }
   property Flags[anIndex: Integer]: Integer
     read Get_Flags;
     {* флаги узлов по видимому индексу [0..CountView-1]. }
   property Select[anIndex: Integer]: Boolean
     read Get_Select
     write Set_Select;
     {* признак видимости узлов по видимому индексу [0..CountView-1]. }
   property Nodes[anIndex: Integer]: Il3SimpleNode
     read Get_Nodes;
     {* возвращает узел по видимому индексу [0..CountView-1]. }
 end;//Il3SimpleTree

 Il3RootSpy = interface(Il3Notify)
  {* Объект, следящий за изменением корня. }
   ['{0C8B183A-508A-405D-938C-062F9BD183C3}']
   procedure RootChanged(const anOldRoot: Il3SimpleRootNode;
    const aNewRoot: Il3SimpleRootNode);
 end;//Il3RootSpy

 Il3NodeNotifyRecipient = interface(Il3Notify)
  {* Подписчик для получения нотификации об операции. }
   ['{7C2B1160-C7E3-4D53-B3D3-E3787BE5650F}']
   procedure Notify(aOperation: Integer;
    const aNode: Il3SimpleNode);
     {* прошла операция. }
 end;//Il3NodeNotifyRecipient

 Il3FilterableTree = interface(Il3Base)
  {* дерево умеющее накладывать фильтры. }
   ['{7AF1524E-84FD-4159-A755-DC621F06355E}']
   function CloneFilters: Il3TreeFilters;
   function MakeFiltered(const aFilters: Il3TreeFilters;
    const aCurrentNode: Il3SimpleNode;
    out aSyncIndex: Integer
    {* Нода для синхронизации. Индекс этой ноды в
                                   фильтрованном вью, будет возвращен в
                                   параметре sync_index.};
    aAutoOpen: Boolean = true
    {* Раскрывать узлы с фильтром автоматически.
                                   Узлы, часть детей которых отфильтрованно,
                                   будут автоматически раскрываться.};
    CalcPartialContext: Boolean = false
    {* пытаться вычислить максимальный контекстный фильтр,
                                   который еще вернет данные}): Il3SimpleTree;
 end;//Il3FilterableTree

 Il3ContextFilterParams = interface(Il3Base)
  {* параметры с которыми будет накладывается контекстный фильтр }
   ['{1E1132A2-C8C3-4E5C-BDF6-4A139CAE0A71}']
   function WordPosition: Tl3WordPosition;
   function WordOrder: Tl3WordOrder;
   function TreeLevelDist: Tl3TreeLevelDist;
 end;//Il3ContextFilterParams

 Il3ContextFilterNotifier = interface(Il3Base)
  {* нотификатор об изменении контекстного фильтра }
   ['{EF53023B-C2D6-4224-A775-9A8EF7BE1814}']
   procedure RequestReapply;
     {* Желательно переприменить фильтр. }
   procedure RequestClearAndTurnOff;
     {* Дерево выключило на себе фильтр. }
   procedure RequestCheckValid;
     {* Дерево поменялось - нужно проверить валидность фильтра. }
 end;//Il3ContextFilterNotifier

 Il3ContextFilterNotifySource = interface(Il3Base)
  {* источник нотификации о том что параметры изменились }
   ['{92B574FC-96C1-4508-BC37-684311D65FE9}']
   procedure SubscribeToContextFilter(const aSubscriber: Il3ContextFilterNotifier);
   procedure UnSubscribeFromContextFilter(const aSubscriber: Il3ContextFilterNotifier);
 end;//Il3ContextFilterNotifySource

 Il3ContextFilterTargetContainer = interface(Il3Base)
  {* Контайнер для проверяльшика }
   ['{8B89EA3D-277D-4AA6-A26F-462135D512CD}']
   function Unfold: Il3ContextFilterTarget;
 end;//Il3ContextFilterTargetContainer

 Il3Wake = interface(Il3Base)
   ['{DDC74AB7-2345-43E4-A26F-6BCC7C0781B1}']
   function Get_IsSleep: Boolean;
   function Wake: Boolean;
   property IsSleep: Boolean
     read Get_IsSleep;
 end;//Il3Wake

 Il3SimpleTreeSource = interface(Il3Base)
   ['{EA6A9D1A-ED3B-4B60-8F32-93F9558BF579}']
   function Get_Tree: Il3SimpleTree;
   procedure Set_Tree(const aValue: Il3SimpleTree);
   property Tree: Il3SimpleTree
     read Get_Tree
     write Set_Tree;
 end;//Il3SimpleTreeSource

 Il3CountViewChangeRecipient = interface(Il3Base)
  {* Подписчик для получения нотификации об изменении количества видимых элементов. }
   ['{55350BB2-0AF6-4C25-8B69-85E2F918F722}']
   procedure CountViewChanged(aCountView: Integer);
     {* прошла операция. }
 end;//Il3CountViewChangeRecipient

 Il3SimpleInternalNode = interface(Il3Base)
   ['{FD586615-B68E-4E35-BDB7-61F0E556D023}']
   procedure Set_Parent(const aValue: Il3SimpleNode);
   property Parent: Il3SimpleNode
     write Set_Parent;
     {* родительский узел. }
 end;//Il3SimpleInternalNode

 Pl3TreeData = ^Tl3TreeData;
  {* указатель на данные о перемещаемом объекте }

 Il3ExpandedSimpleTree = interface(Il3SimpleTree)
  {* Дерево с расширенной функциональностью. }
   ['{705500C4-0F50-4079-9A00-CAF8F9D01E69}']
   function FlagIterateF(Action: Tl3SimpleNodeAction;
    FlagMask: Word = 0;
    IterMode: Integer = 0;
    const aSubRootNode: Il3SimpleNode = nil;
    aCheckResult: Boolean = False): Il3SimpleNode;
     {* перебрать все узлы, удовлетворяющие FlagMask, и освободить заглушку для Action. IterMode: imCheckResult, imParentNeed }
 end;//Il3ExpandedSimpleTree

 Il3ExtItemNode = interface(Il3Base)
  {* Нода из связанного словаря. А место ли ей в этом модуле? }
   ['{9A362763-3CCF-4E69-9B9D-1B92253D0A85}']
   function Get_Data: Pointer;
   procedure Set_Data(aValue: Pointer);
   function Get_DataSize: Integer;
   property Data: Pointer
     read Get_Data
     write Set_Data;
   property DataSize: Integer
     read Get_DataSize;
 end;//Il3ExtItemNode

implementation

end.