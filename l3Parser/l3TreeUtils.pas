unit l3TreeUtils;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3TreeUtils - }
{ Начат: 03.03.2004 20:17 }
{ $Id: l3TreeUtils.pas,v 1.6 2013/04/04 11:33:02 lulin Exp $ }

// $Log: l3TreeUtils.pas,v $
// Revision 1.6  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.5  2007/05/14 12:19:39  fireton
// - l3IsNodeFromTree переведен на Il3SimpleNode
//
// Revision 1.4  2007/01/30 15:24:25  lulin
// - текст ноды - теперь более простого типа.
//
// Revision 1.3  2005/01/24 15:31:54  demon
// - new behavior: function l3IsNodeFromTree - определяет из текущего ли дерева указанная нода.
//
// Revision 1.2  2004/03/03 18:04:05  law
// - rename unit: l3Tree2 -> l3Tree.
//
// Revision 1.1  2004/03/03 17:40:06  law
// - cleanup.
// - new unit: l3TreeUtils.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3TreeInterfaces,
  l3Tree_TLB,
  l3Tree
  ;

const
  l3DefLevelSlash ='\';

function l3ExpandByPath(aTree        : Tl3Tree;
                        const aPath  : AnsiString;
                        const aSlash : AnsiString = l3DefLevelSlash): Il3Node;
  {-}
function l3IsNodeFromTree(aTree: Tl3Tree;
                          const aNode: Il3Node): Boolean; overload;
  {-}
function l3IsNodeFromTree(const aRoot: Il3SimpleNode;
                          const aNode: Il3SimpleNode): Boolean; overload;
  {-}

implementation

uses
  SysUtils,

  l3Types,
  l3Nodes
  ;

function l3ExpandByPath(aTree        : Tl3Tree;
                        const aPath  : AnsiString;
                        const aSlash : AnsiString = l3DefLevelSlash): Il3Node;
  {-}
var
 lCurNode : Il3Node;
 NBegin   : PAnsiChar;
 NEnd     : PAnsiChar;
begin
 with aTree do
 begin
  Changing;
  try
   lCurNode := RootNode;
   NBegin := StrPos(PAnsiChar(aPath), PAnsiChar(aSlash));
   If (NBegin <> nil) then
    NBegin := NBegin + Length(aSlash);
   while (NBegin <> nil) do
   begin
    NEnd := StrPos(NBegin, PAnsiChar(aSlash));
    if (NEnd <> nil) then
    begin
     NEnd[0]:=#0;
     Inc(NEnd);
    end;//NEnd <> Nil
    if lCurNode.HasChild then
     ChangeExpand(lCurNode, sbSelect);

    if (NBegin[0] = #0) then
     Break;
    lCurNode := SearchByName(lCurNode, NBegin, imExpandOnly or imOneLevel);
    NBegin:=NEnd;
   end;//while (NBegin <> nil)
   MarkNeedCountView;
   Result := lCurNode;
  finally
   Changed;
  end;//try..finally
 end;//with aTree
end;

function l3IsNodeFromTree(aTree: Tl3Tree;
                          const aNode: Il3Node): Boolean;
  {overload}
  {-}
var
 l_RootNode: Il3Node;
begin
 l_RootNode := aTree.RootNode;
 try
  Result := l3IsNodeFromTree(l_RootNode, aNode);
 finally
  l_RootNode := nil;
 end;
end;

function l3IsNodeFromTree(const aRoot: Il3SimpleNode;
                          const aNode: Il3SimpleNode): Boolean;
  {overload}
  {-}
var
 l_Parent: Il3SimpleNode;
begin
 Result := false;
 l_Parent := aNode;
 while l_Parent <> nil do
 begin
  if l_Parent.IsSame(aRoot) then
  begin
   Result := true;
   break;
  end;
  l_Parent := l_Parent.Parent;
 end;
end;

end.

