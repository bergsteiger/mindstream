unit l3VirtualNode;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3VirtualNode -             }
{ Начат: 21.07.2005 18:23             }
{ $Id: l3VirtualNode.pas,v 1.17 2015/01/30 13:30:52 kostitsin Exp $ }

// $Log: l3VirtualNode.pas,v $
// Revision 1.17  2015/01/30 13:30:52  kostitsin
// рисуем l3Nodes
//
// Revision 1.16  2015/01/28 12:06:48  kostitsin
// рисуем Tl3PrimNode
//
// Revision 1.15  2012/08/02 09:30:38  kostitsin
// [$380616604]
//  - l3VirtualNode
//
// Revision 1.14  2011/12/28 11:13:02  lulin
// {RequestLink:325256237}
//
// Revision 1.13  2009/12/11 16:45:05  lulin
// - удаляем устаревший шаблон.
//
// Revision 1.12  2009/12/11 16:28:11  lulin
// - убираем излишнюю общность.
//
// Revision 1.11  2009/12/11 15:56:11  lulin
// {RequestLink:172984520}.
//
// Revision 1.10  2009/12/11 14:14:53  lulin
// {RequestLink:172984520}.
//
// Revision 1.9  2009/01/23 13:58:39  lulin
// - <K>: 135605086.
//
// Revision 1.8  2008/03/20 09:48:41  lulin
// - cleanup.
//
// Revision 1.7  2008/02/07 14:44:46  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.6  2007/01/22 13:05:22  lulin
// - cleanup.
//
// Revision 1.5  2006/12/27 09:46:41  lulin
// - два метода, вычисляющие уровень ноды объединены в один.
//
// Revision 1.4  2006/12/22 12:11:16  lulin
// - cleanup.
//
// Revision 1.3  2005/07/21 15:54:01  lulin
// - выделен шаблон, реализующий интерфес нотификатора - Il3ChangeNotifier.
//
// Revision 1.2  2005/07/21 14:56:14  lulin
// - выделен класс виртуальных нод, обладающих флагами.
//
// Revision 1.1  2005/07/21 14:47:36  lulin
// - базовая виртуальная нода вынесена в отдельный модуль.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types,
  l3TreeInterfaces,
  l3Tree_TLB,

  l3Base,
  l3Nodes,
  l3LongintList,
  l3NotifyPtrList
  ;

type
  Rl3CustomVirtualNode = class of Tl3CustomVirtualNode;

  _l3ChangingChangedNotifier_Parent_ = Tl3CustomNode;
  {$Include l3ChangingChangedNotifier.imp.pas}
  _l3LockedChange_Parent_ = _l3ChangingChangedNotifier_;
  {$Include l3LockedChange.imp.pas}
  Tl3CustomVirtualNode = class(_l3LockedChange_, Il3Node, Il3NodeWrap, Il3RootNode, Il3InternalNode)
    protected
    // internal methods
      procedure Set_ParentNode(const aValue: Il3Node);
        virtual;
        abstract;
        {-}
      procedure Set_ChildNode(const aValue: Il3Node);
        virtual;
        abstract;
        {-}
      procedure Set_PrevNode(const aValue: Il3Node);
        virtual;
        abstract;
        {-}
      procedure Set_NextNodePrim(const aValue: Il3Node);
        virtual;
        abstract;
        {-}
      procedure Set_NextNode(const aValue: Il3Node);
        virtual;
        abstract;
        {-}
      function  Get_AllChildrenCount: Integer;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
      function  IterateNoParent(Action          : Tl3NodeAction;
                                IterMode        : integer;
                                const aFromNode : Il3Node = nil) : Il3Node;
        virtual;
        {-}
      function  IterateChild(Action          : Tl3NodeAction;
                             IterMode        : integer;
                             const aFromNode : Il3Node = nil) : Il3Node;
        override;
        {-}
      function  ChildNodeClass: Rl3CustomVirtualNode;
        virtual;
        {-}
      function  ParentNodeClass: Rl3CustomVirtualNode;
        virtual;
        {-}
      procedure CallNodeNotify(aOperation : Integer; const aNode : Il3Node);
        {* - прошла операция. }
    public
    // public methods
      procedure DoReleaseChilds;
        override;
        {-}
      procedure DoNotify(aOperation : Integer; const aNode : Il3Node);
        override;
        {-}
      function  GetLevelForParent(const aNode : Il3SimpleNode) : Integer;
        override;
        {-}
      function DoMove(aDirection : Tl3Direction) : Boolean;
        override;
        {-}
      function GetIsAcceptChild(const aChild : Il3Node) : Boolean;
        override;
        {-}
      function DoInsertChildBefore(const aNextChild : Il3Node;
                                  const aChild     : Il3Node) : Il3Node;
        override;
        {-}
      function DoGetChildByNumber(aNum : Integer) : Il3Node;
        override;
        {-}
      function DoIterate(Action          : Tl3NodeAction;
                       IterMode        : Integer = 0;
                       const aFromNode : Il3Node = nil) : Il3Node;
        override;
        {-}
      function DoGetNumInParent(aOnlyOneLevel : Boolean = false) : Integer;
        override;
        {-}
      class function IsCacheable: Bool;
        override;
        {-}
  function As_Il3ChangeNotifier: Il3ChangeNotifier;  
  end;//Tl3CustomVirtualNode

  Tl3VirtualFlagsNode = class(Tl3CustomVirtualNode)
    private
    // internal fields
      f_Flags  : Integer;
    protected
    // internal methods
      function  pm_GetFlags: Integer;
        override;
      procedure pm_SetFlags(aValue : Integer);
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
  end;//Tl3VirtualFlagsNode

implementation

uses
  SysUtils,
  
  l3Bits
  ;

{$Include l3ChangingChangedNotifier.imp.pas}

{$Include l3LockedChange.imp.pas}

// start class Tl3CustomVirtualNode

function Tl3CustomVirtualNode.Get_AllChildrenCount: Integer;
  //override;
  {-}

 procedure CountChild(const aNode: Il3Node);
 begin
  Inc(Result, aNode.AllChildrenCount);
  Inc(Result);
 end;

begin
 Result := 0;
 IterateF(l3L2NA(@CountChild), imOneLevel);
end;

procedure Tl3CustomVirtualNode.DoNotify(aOperation : Integer; const aNode : Il3Node);
begin
 inherited DoNotify(aOperation, aNode);
 CallNodeNotify(aOperation, aNode);
end;

function Tl3CustomVirtualNode.DoGetNumInParent(aOnlyOneLevel : Boolean = false) : Integer;
var
 l_Prev : Il3Node;
begin
 Result := 0;
 if not IsFirst then begin
  l_Prev := Get_PrevNode;
  Result := l_Prev.GetNumInParent(aOnlyOneLevel);
  Inc(Result);
  if Not aOnlyOneLevel then Inc(Result, l_Prev.AllChildrenCount);
 end;//not IsFirst
end;

class function Tl3CustomVirtualNode.IsCacheable: Bool;
  //override;
  {-}
begin
 Result := true;
end;

function Tl3CustomVirtualNode.As_Il3ChangeNotifier: Il3ChangeNotifier;
begin
 Result := Self; 
end;

procedure Tl3CustomVirtualNode.Cleanup;
begin
 ReleaseChilds;
 inherited;
end;

function Tl3CustomVirtualNode.ChildNodeClass: Rl3CustomVirtualNode;
  //virtual;
  {-}
begin
 Result := Rl3CustomVirtualNode(ClassType);
end;

function Tl3CustomVirtualNode.ParentNodeClass: Rl3CustomVirtualNode;
  //virtual;
  {-}
begin
 Result := Rl3CustomVirtualNode(ClassType);
end;

procedure Tl3CustomVirtualNode.CallNodeNotify(aOperation : Integer; const aNode : Il3Node);
  {* - прошла операция. }
var
 l_Index : Integer;
 l_Tree  : Il3NodeNotifyRecipient;
 l_Item  : Il3Notify;
begin

 if (f_NotifiedObjList <> nil) then
  for l_Index := f_NotifiedObjList.Hi downto 0 do
  begin
   try // - зачем ??!!
    l_Item := f_NotifiedObjList[l_Index];
    //if Supports(l_Item, Il3Tree, l_Tree) AND запил до шуриного возвращения
      if Supports(l_Item, Il3NodeNotifyRecipient, l_Tree) AND
       (l_Item = l_Tree) then
     try
      l_Tree.Notify(aOperation, aNode);
     finally
      l_Tree := nil;
     end;//try..finally
   except
    on E: Exception do
 	 	 l3System.Exception2Log(E);
   end;//try..except
  end;//for l_Index
end;

function Tl3CustomVirtualNode.GetIsAcceptChild(const aChild : Il3Node) : Boolean;
begin
 Result := (aChild as Il3NodeWrap).GetSelf.InheritsFrom(ChildNodeClass);
end;

function Tl3CustomVirtualNode.DoInsertChildBefore(const aNextChild : Il3Node;
                                                const aChild     : Il3Node) : Il3Node;
var
 lNewChild : Il3InternalNode;
 lPrevNode : Il3InternalNode;
 lNextNode : Il3InternalNode;
begin
 Changing;
 try
  if not Supports(aChild, Il3InternalNode, lNewChild) then
  begin
   Result := Self;
   Exit;
  end;//not Supports(aChild, Il3InternalNode, lNewChild)
  Result := aChild;
  //lNewChild := aChild As Il3InternalNode;
  lNewChild.ParentNode := Self;
  lNewChild._AddRef; //- ????

  if not HasChild then
  begin
   Set_ChildNode(lNewChild);
   //Flags := Flags or nfHasChild;
   lNewChild.PrevNode  := lNewChild;
   lNewChild.NextNode  := lNewChild;
  end
  else
  begin
   if ChildSorted then
   begin
    lNextNode := ChildNode As Il3InternalNode;
    while true do
    begin
     if (CompareChild(aChild, lNextNode) < 0) then
     begin
      if (ChildNode = lNextNode) then
       Set_ChildNode(lNewChild);
      Break;
     end;

     lNextNode := lNextNode.NextNode As Il3InternalNode;

     if lNextNode.IsFirst then
      {конец списка}
     begin
      lNextNode := ChildNode As Il3InternalNode;
      Break;
     end;//lNextNode.IsFirst
    end;//while true
   end//ChildSorted
   else
    if (aNextChild = nil) then
     lNextNode := ChildNode As Il3InternalNode
    else
    begin
     lNextNode := aNextChild As Il3InternalNode;
     if (ChildNode = lNextNode) then Set_ChildNode(lNewChild);
    end;

  //lNextNode := lPrevNode.Next;

   lPrevNode := lNextNode.PrevNode As Il3InternalNode;
   lPrevNode.NextNode := lNewChild;
   lNextNode.PrevNode := lNewChild;
   lNewChild.NextNode := lNextNode;
   lNewChild.PrevNode := lPrevNode;
  end;//not HasChild

  {Increment AllChildrenCount}
  IncAllChildrenCount(Succ(aChild.AllChildrenCount));
  Notify(ntInsert, aChild);
 finally
  Changed;
 end;
end;

function Tl3CustomVirtualNode.DoMove(aDirection : Tl3Direction) : Boolean;
var
 ltNode     : Il3InternalNode;
 ltNode2    : Il3InternalNode;
 lUserParam : Pointer;
begin
 Result := False;
 if (Get_ParentNode = nil) then Exit;
 if Get_ParentNode.ChildSorted then Exit;

 Notify(ntMoveBegin, Self);
 try
  lUserParam := nil;
  BeginMove(lUserParam);
  try
   Case aDirection of
    dUp:
     if not IsFirst then
     begin
      Changing;
      try
       (Get_PrevNode As Il3InternalNode).NextNode := Get_NextNode;
       (Get_NextNode As Il3InternalNode).PrevNode := Get_PrevNode;

       if Get_ParentNode.ChildNode.IsSame(Get_PrevNode) then
        (Get_ParentNode As Il3InternalNode).ChildNode := Self;
       Set_NextNode(Get_PrevNode);
       Set_PrevNode(Get_PrevNode.PrevNode);
       (Get_NextNode As Il3InternalNode).PrevNode := Self;
       (Get_PrevNode As Il3InternalNode).NextNode := Self;
       Result := true;
      finally
       Changed;
      end;//try..finally
     end;

    dUpMax:
     if not IsFirst then
     begin
      Changing;
      try
       (Get_PrevNode As Il3InternalNode).NextNode := Get_NextNode;
       (Get_NextNode As Il3InternalNode).PrevNode := Get_PrevNode;

       Set_NextNode(Get_ParentNode.ChildNode);
       Set_PrevNode(Get_ParentNode.ChildNode.PrevNode);
       (Get_NextNode As Il3InternalNode).PrevNode := Self;
       (Get_PrevNode As Il3InternalNode).NextNode := Self;
       (Get_ParentNode As Il3InternalNode).ChildNode := Self;
       Result := true;
      finally
       Changed;
      end;//try..finally
     end;//not IsFirst

    dDown:
     if not IsLast then
     begin
      Changing;
      try
       (Get_PrevNode As Il3InternalNode).NextNode := Get_NextNode;
       (Get_NextNode As Il3InternalNode).PrevNode := Get_PrevNode;

       if IsFirst then
        (Get_ParentNode As Il3InternalNode).ChildNode := Get_NextNode;

       Set_PrevNode(Get_NextNode);
       Set_NextNode(Get_NextNode.NextNode);
       (Get_NextNode As Il3InternalNode).PrevNode := Self;
       (Get_PrevNode As Il3InternalNode).NextNode := Self;
       Result := true;
      finally
       Changed;
      end;//try..finally
     end;//not IsLast

    dLeft:
     if (Get_ParentNode <> nil) and (Get_ParentNode.ParentNode <> nil) then
     begin
      ltNode := (Get_ParentNode As Il3InternalNode);
      ltNode2 := (Get_NextNode As Il3InternalNode);
      if ltNode.ParentNode.IsAcceptChild(Self) then
      begin
       Changing;
       try
        //ltNode := Parent;
        Remove;
        try
         ltNode.ParentNode.InsertChildBefore(ltNode, Self);
         Result := true;
        except
         ltNode.InsertChildBefore(ltNode2, Self);
        end;//try..except
       finally
        Changed;
       end;//try..finally
      end;//ltNode.Parent.IsAcceptChild(Self)
     end;//Get_ParentNode <> nil

    dRight :
     if not IsLast then
     begin
      ltNode := (Get_NextNode As Il3InternalNode);
      if ltNode.IsAcceptChild(Self) then
      begin
       Changing;
       try
        //ltNode := Next;
        Remove;
        try
         ltNode.InsertChildBefore(ltNode.ChildNode, Self);
         Result := true;
        except
         ltNode.ParentNode.InsertChildBefore(ltNode, Self);
        end;
       finally
        Changed;
       end;//try..finally
      end;//ltNode.IsAcceptChild(Self)
     end;//not IsLast
   end;//Case aDirection
  finally
   EndMove(lUserParam);
  end;
 finally
  Notify(ntMoveEnd, Self);
 end;
end;

procedure Tl3CustomVirtualNode.DoReleaseChilds;
var
 lCurNode  : Il3InternalNode;
 lNextNode : Il3InternalNode;
 lLast     : Boolean;
begin
 Assert(false, 'Эта функция не реализована (Tl3CustomVirtualNode.ReleaseChilds).');
 if (Get_ChildNode = nil) then Exit;
 lCurNode := (Get_ChildNode.PrevNode As Il3InternalNode); // Last
 repeat
  lLast := lCurNode.IsSame(Get_ChildNode);
  lNextNode := (lCurNode.PrevNode As Il3InternalNode);
  lCurNode.ParentNode := nil;
  lCurNode._Release; // - ????

  {If lCurNode.RefCount = 1
   then l3Free(lCurNode)
   else
    begin
     lCurNode.Free;
     lCurNode.Parent := nil;
    end;}
  lCurNode := lNextNode;
 until lLast;
 Set_ChildNode(nil);
end;

function Tl3CustomVirtualNode.GetLevelForParent(const aNode : Il3SimpleNode) : Integer;
var
 lCNode  : Il3SimpleNode;
begin
 Result := 0;
 lCNode := Self;
 while (lCNode <> nil) and not lCNode.IsSame(aNode) do
 begin
  Inc(Result);
  lCNode := lCNode.Parent;
 end;//while (lCNode <> nil)
 if (lCNode = nil) then Result := -1;
end;

function  Tl3CustomVirtualNode.DoGetChildByNumber(aNum : Integer) : Il3Node;
begin
 Result := ChildNode;
 while (Result <> nil) do
 begin
  if (aNum = 0) then
   break
  else
   {If Result.IsExpanded then}
    if (aNum <= Result.AllChildrenCount) then
    begin
     Result := Result.GetNodeByNumber(aNum);
     Break;
    end//aNum <= Result.AllChildrenCount
    else Dec(aNum, Succ(Result.AllChildrenCount))
   {else Dec(aNum, 1)};
  Result := Result.NextNode;
 end;//while (Result <> nil)
 //If (Result <> nil) then Result := Result.GetNodeByNumber(aNum);
end;

function Tl3CustomVirtualNode.IterateChild(Action          : Tl3NodeAction;
                                           IterMode        : integer;
                                           const aFromNode : Il3Node = nil) : Il3Node;
var
 lCurNode  : Il3Node;
 lNextNode : Il3Node;
begin
 Result := nil;
 if not HasChild then Exit;
 if (aFromNode = nil) then
  lCurNode := ChildNode
 else
 begin
  if not IsSame(aFromNode.ParentNode) then Exit;
  lCurNode := aFromNode;
 end;//aFromNode = nil

 repeat
  if lCurNode.IsLast then
   lNextNode := nil
  else
   lNextNode := lCurNode.NextNode;

  Result := lCurNode.Iterate(Action, IterMode);
  // ## Result := (lCurNode as Il3InternalNode).GetSelf.Iterate(Action, IterMode);

  if (Result <> nil) or (lNextNode = nil) then Exit;

  lCurNode := lNextNode;
 until false;
 //until (lCurNode <> nil) and ((lCurNode as Il3InternalNode).GetSelf = Child);
end;

function Tl3CustomVirtualNode.IterateNoParent(Action          : Tl3NodeAction;
                                              IterMode        : integer;
                                              const aFromNode : Il3Node = nil) : Il3Node;
var
 //lParent,
 lNext    : Il3Node;
 lCNode   : Il3Node;

 function CheckMyChild: Boolean;
 begin//CheckMyChild
  Result := true;
  //aFromNode
 end;//CheckMyChild

begin
 Result := nil;
 If Not CheckMyChild then Exit;
 lNext := nil;
 IterMode := IterMode and not imNoSubRoot and not imParentNeed;

 Result := aFromNode.Iterate(Action, IterMode);

 lCNode := aFromNode;
 while (Result = nil) do
 begin
   //lCNode := aFromNode;
   while lCNode.IsLast do
   begin
    lCNode := lCNode.ParentNode;
    If IsSame(lCNode) then exit;
   end;//while lCNode.IsLast

   lNext := lCNode.NextNode;

   lCNode := lCNode.ParentNode;
   Result := lCNode.Iterate(Action, IterMode, lNext);
   If IsSame(lCNode) then exit;
   //Result := IterateChild(Action, IterMode);
 end;//while (Result = nil)
end;

function Tl3CustomVirtualNode.DoIterate(Action          : Tl3NodeAction;
                                      IterMode        : integer = 0;
                                      const aFromNode : Il3Node = nil) : Il3Node;
var
 lCurNode       : Il3Node;
 ActionResult   : Boolean;
 lParentNeed    : Boolean;
 l_FromNode     : Il3Node;
begin
 if aFromNode <> nil then
  if IsSame(aFromNode) then
   l_FromNode := nil
  else
   l_FromNode := aFromNode;

 If (IterMode and imNoSubRoot > 0) and (l_FromNode <> nil)
  then
   begin
    Result := IterateNoParent(Action, IterMode, l_FromNode);
    Exit;
   end;

 Result:=nil;
 lParentNeed := (IterMode and imParentNeed > 0);
 IterMode := IterMode or imParentNeed;

 If (IterMode and imChildsBefore > 0) {l3TestFlag(IterMode, imChildsBefore)}
    and (IterMode and imNoChilds = 0) {not l3TestFlag(IterMode, imNoChilds)}
    and HasChild
    {and (not l3TestFlag(IterMode, imExpandOnly) or IsExpanded)}
  then
   begin
    If (IterMode and imOneLevel > 0) {l3TestFlag(IterMode, imOneLevel)}
     then l3SetMask(IterMode, imNoChilds);
    Result := IterateChild(Action, IterMode, l_FromNode);
   end;

 If (Result = nil) and lParentNeed {and Not (() {or (IterMode and imNoSubRoot > 0))}
  then
   begin
    lCurNode := Self;
   {$IfDef SkipIterByExcept}
    try
     ActionResult := Action(lCurNode);
    except
     on E : ESkipIterateChilds do
     begin
      ActionResult := False;
      l3SetFlag(IterMode, imNoChilds);
     end;
     else
      raise;
    end;
   {$Else}
    ActionResult := Action(lCurNode);
    If Byte(ActionResult) = 2 then
     begin
      ActionResult := False;
      If l3TestMask(IterMode, imCheckResult) then
       l3SetMask(IterMode, imNoChilds);
     end;
   {$EndIf}

    If (IterMode and imCheckResult > 0) and ActionResult
    then
     begin
      Result := lCurNode;
      Exit;
     end;
   end;

 If (IterMode and imChildsBefore = 0)     {not l3TestFlag(IterMode, imChildsBefore)}
  and (IterMode and imNoChilds = 0) {not l3TestFlag(IterMode, imNoChilds)}
  and HasChild
  //and (not l3TestFlag(IterMode, imExpandOnly) or IsExpanded)
  then
   begin
    If (IterMode and imOneLevel > 0) {l3TestFlag(IterMode, imOneLevel)}
     then l3SetMask(IterMode, imNoChilds);
    Result := IterateChild(Action, IterMode, l_FromNode);
   end;
end;

// start class Tl3VirtualFlagsNode

procedure Tl3VirtualFlagsNode.Cleanup;
  //override;
  {-}
begin
 Set_Flags(0);
 inherited;
end;

function Tl3VirtualFlagsNode.pm_GetFlags: Integer;
  //override;
  {-}
begin
 Result := f_Flags;
end;

procedure Tl3VirtualFlagsNode.pm_SetFlags(aValue : Integer);
  //override;
  {-}
begin
 f_Flags := aValue;
end;

end.

