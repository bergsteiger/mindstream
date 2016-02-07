unit l3TreeSupport;
{* Функции работы с деревьями. }

{ $Id: l3TreeSupport.pas,v 1.33 2012/04/20 15:20:32 lulin Exp $ }

// $Log: l3TreeSupport.pas,v $
// Revision 1.33  2012/04/20 15:20:32  lulin
// {RequestLink:283610570}
//
// Revision 1.32  2010/11/12 08:50:21  voba
// - K : 236721575
//
// Revision 1.31  2009/04/28 15:16:51  lulin
// - перегенерация документации и работа над ошибками за Вованом.
//
// Revision 1.30  2009/04/28 07:14:38  voba
// - CQ #146376504
//
// Revision 1.29  2009/03/10 15:28:19  voba
// - enh. procedure GetListFromTree работа с "отрицательными" ID
//
// Revision 1.28  2008/03/27 09:36:53  voba
// no message
//
// Revision 1.27  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.26  2008/02/07 19:13:17  lulin
// - избавляемся от излишне универсальных методов базовых списков.
//
// Revision 1.25  2008/02/07 14:44:45  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.24  2008/02/01 15:14:54  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.23  2007/12/26 07:54:03  dinishev
// не компилировалось
//
// Revision 1.22  2007/09/06 14:16:44  fireton
// - отвязываем l3 от k2
//
// Revision 1.21  2007/09/06 10:18:51  lulin
// - переименовано свойство.
//
// Revision 1.20  2007/06/28 10:43:55  narry
// - не компилировалось
//
// Revision 1.19  2005/12/07 09:07:36  fireton
// - new: SetAttrToTree и GetAttrFromTree
//
// Revision 1.18  2005/11/25 13:34:28  voba
// no message
//
// Revision 1.17  2005/08/09 15:15:28  voba
// - improve : боролся с NeedAllocStr := False
//
// Revision 1.16  2005/02/08 12:20:03  voba
// - small improve
//
// Revision 1.15  2004/06/02 16:42:39  law
// - удален класс Tl3VList.
//
// Revision 1.14  2004/05/26 19:27:34  law
// - new behavior: TvtCustomOutliner теперь знает только про интерфейсы Il3SimpleTree и Il3Tree, а не про объект Tl3Tree. Сделаны изменения, чтобы собирался Архивариус.
//
// Revision 1.13  2004/03/05 17:03:13  step
// чистка кода
//
// Revision 1.12  2004/03/03 18:04:05  law
// - rename unit: l3Tree2 -> l3Tree.
//
// Revision 1.11  2003/06/03 15:39:15  voba
// - rename Tl3StringDataList AddData to Add
//
// Revision 1.10  2002/01/22 16:24:00  voba
// no message
//
// Revision 1.9  2001/07/27 15:46:04  law
// - comments: xHelpGen.
//
// Revision 1.8  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

interface

uses
  l3Base, 
  l3Interfaces,
  l3DatLst,
  l3Tree,
  l3Nodes,
  l3Tree_TLB,
  l3LongintList
  ;

procedure GetListFromTree(const aTree : Il3Tree; aList : Tl3StringDataList; aWithMasterDoct : boolean = false);  overload;
  {* - Get StringList of selected leaf of Tree. }

procedure GetListFromTree(const aTree : Il3Tree; aList : Tl3LongintList);          overload;
  {* - Get StringList of selected leaf of Tree. }

procedure SetListToTree(aTree : Tl3Tree; aList : Tl3CustomDataList);          overload;
  {* - Select leaf of Tree by enumerated in list. }

procedure SetListToTree(const aTree : Il3Tree; aList : Tl3CustomDataList);    overload;
  {* - Select leaf of Tree by enumerated in list. }

procedure SetListToTree(aTree : Tl3Tree; aList : Tl3LongintList);                  overload;
  {* - Select leaf of Tree by enumerated in list. }

(*
 function TransListToValueList(aList : Tl3StringDataList; aValueList : Tl3PVList) : Tl3PVList; overload;
   {* - Translate List Of Selected Items to List of Values, return aValueList. }

 function TransValueListToList(aValueList : Tl3PVList; aList : Tl3StringDataList; aDict : Il3Node) : Tl3StringDataList;  overload;
   {* - Translate List of Values to List of Selected Items with name of Items,
        uses aDict as _dictionary, return aList. }

// function AddItemIDToList(aItemID : Integer; aList : Tl3StringDataList; aDict : TItemsStorage) : Boolean; overload;
 function AddItemIDToList(aItemID : Integer; aList : Tl3StringDataList; aDict : Tl3StringDataList) : Boolean; overload;
   {* - add one ItemID with name to aList, uses aTree as _dictionary. }
 function AddItemIDToList(aItemID : Integer; aList : Tl3StringDataList; aDict : Il3Node) : Boolean;       overload;
   {* - add one ItemID with name to aList, uses aTree as _dictionary. }
*)

implementation

uses
  l3MinMax,
  l3TreeInterfaces, 
  SysUtils
  ;

procedure GetListFromTree(const aTree : Il3Tree; aList : Tl3StringDataList; aWithMasterDoct : boolean = false);
 var
  lCurNode  : Il3Node;
  lCurParam : Longint;
  lExtNode  : Il3ExtItemNode;
 begin
  aList.Changing;
  try
   aList.Clear;
   aList.DataSize := SizeOf(lCurParam);
   If aTree = nil then Exit;
   lCurNode := Nil;
   Repeat
    lCurNode := aTree.GetNextSelect(lCurNode);
    If lCurNode = Nil then break;
    lCurParam := (lCurNode as Il3HandleNode).Handle;
    if aWithMasterDoct and not Supports(lCurNode, Il3ExtItemNode, lExtNode) then
     lCurParam := - lCurParam;
    aList.AddStr(l3GetFullPathStr(aTree.CRootNode, lCurNode, #13, '  ', False), @lCurParam, SizeOf(lCurParam));
   until false;
  finally
   aList.Changed;
  end;
 end;

procedure GetListFromTree(const aTree : Il3Tree; aList : Tl3LongintList);
 var
  lCurNode  : Il3Node;
 begin
  aList.Clear;
  If aTree = nil then Exit;
  lCurNode := Nil;
  Repeat
   lCurNode := aTree.GetNextSelect(lCurNode);
   If lCurNode = Nil then break;
   aList.Add((lCurNode as Il3HandleNode).Handle);
  until false;
 end;

procedure SetListToTree(aTree : Tl3Tree; aList : Tl3CustomDataList);  overload;
 var
  I         : Integer;
  lCurNode  : Il3Node;
 begin
  If aList = nil then Exit;
  For I := 0 to Pred(aList.Count) do
   begin
    lCurNode := aTree.FindNodeByParam(aTree.RootNode, aList.DataInt[I], 0);
    aTree.SelectedNode[lCurNode] := True;
   end;
 end;

procedure SetListToTree(const aTree : Il3Tree; aList : Tl3CustomDataList);    overload;
  {* - Select leaf of Tree by enumerated in list. }
var
 I         : Integer;
 lCurNode  : Il3Node;
begin
 If aList = nil then Exit;
 For I := 0 to Pred(aList.Count) do
  begin
   lCurNode := aTree.FindNodeByParam(aTree.CRootNode, aList.DataInt[I], 0);
   aTree.SelectedNode[lCurNode] := True;
  end;
end;

procedure SetListToTree(aTree : Tl3Tree; aList : Tl3LongintList);
 var
  I        : Integer;
  lCurNode : Il3Node;
 begin
  If aList = nil then Exit;
  For I := 0 to Pred(aList.Count) do
   begin
    lCurNode := aTree.FindNodeByParam(aTree.RootNode, Integer(aList.Items[I]), 0);
    aTree.SelectedNode[lCurNode] := True;
   end;
 end;


(*
function TransValueListToList(aValueList : Tl3PVList; aList : Tl3StringDataList) : Tl3StringDataList;
 var
  I : Integer;
 begin
  Result := aList;
  aList.Clear;
  aList.DataSize := 4;
  If aDict = nil then Exit;
  //aList.NeedAllocStr := False;
  For I := 0 to Pred(aValueList.Count) do
   AddItemIDToList(Integer(aValueList.Items[I]), aList, aDict);
 end;

function AddItemIDToList(aItemID : Integer; aList : Tl3StringDataList; aDict : Il3Node) : Boolean;
 var
  lCurNode  : Il3Node;
 begin
  If aList.IndexOfData(aItemID, Min(SizeOf(aItemID), aList.DataSize), 0) >= 0 then Exit;

  lCurNode := l3FindNodeByHandle(aDict, aItemID, 0);
  If lCurNode = Nil then Exit;
  aList.AddStr(l3GetFullPathStr(aDict, lCurNode), @aItemID, SizeOf(aItemID));
 end;

function AddItemIDToList(aItemID : Integer; aList : Tl3StringDataList; aDict : Tl3StringDataList) : Boolean;
 var
  lCurInd   : Integer;
 begin
  If aList.IndexOfData(aItemID, Min(SizeOf(aItemID), aList.DataSize), 0) >= 0 then Exit;
  lCurInd := Tl3StringDataList(aDict).IndexOfData(aItemID, Tl3StringDataList(aDict).DataSize, 0);
  aList.NeedAllocStr := True;
  aList.Add(Tl3StringDataList(aDict).Strings[lCurInd], @aItemID, SizeOf(aItemID));
 end;

*)
end.
