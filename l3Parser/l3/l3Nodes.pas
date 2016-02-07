{$F+,X+,I-,S-}
unit l3Nodes;
{* –ализации различных узлов дерева. }

{ Ѕиблиотека "L3 (Low Level Library)" }
{ јвтор: Ѕабанин ¬.Ѕ. © }
{ ћодуль: l3Nodes - }
{ Ќачат: 24.06.1999 }
{ $Id: l3Nodes.pas,v 1.216 2015/02/02 18:26:56 kostitsin Exp $ }

// $Log: l3Nodes.pas,v $
// Revision 1.216  2015/02/02 18:26:56  kostitsin
// рисуем l3Nodes
//

{$I l3Define.inc }
{$IfDef ItsVoba}
 {$Warnings On}
 {$Hints On}
{$EndIf ItsVoba}

interface

uses
  Classes,
  SysUtils,

  l3NodesModelPart,
  l3InternalInterfaces,
  l3Interfaces,
  l3Base,
  l3Types,
  l3DatLst,
  l3TreeInterfaces,
  l3Tree_TLB,
  l3IID,
  l3LongintList
  ;

type
 ESkipIterateChilds = l3NodesModelPart.ESkipIterateChilds;
 El3NodeExeption = l3NodesModelPart.El3NodeExeption;
 El3InsertDenied = l3NodesModelPart.El3InsertDenied;
 Tl3Node = l3NodesModelPart.Tl3Node;
 Tl3NodeClass = l3NodesModelPart.Tl3NodeClass;

 Tl3PrimNode = l3NodesModelPart.Tl3PrimNode;
 Tl3CustomNode = l3NodesModelPart.Tl3CustomNode;
 Il3NodeWrap = l3NodesModelPart.Il3NodeWrap;
 Tl3CustomUsualNode = l3NodesModelPart.Tl3CustomUsualNode;

 Tl3PlaceNode = l3NodesModelPart.Tl3PlaceNode;
 Tl3CacheableNode = l3NodesModelPart.Tl3CacheableNode;

 Tl3HandleNode = l3NodesModelPart.Tl3HandleNode;

 Tl3UsualNode = l3NodesModelPart.Tl3UsualNode;

 Tl3ListItemNode = l3NodesModelPart.Tl3ListItemNode;

 Tl3CustomListContainerNode = l3NodesModelPart.Tl3CustomListContainerNode; 

 Tl3ListContainerNode = l3NodesModelPart.Tl3ListContainerNode;

 Tl3DataListContainerNode = l3NodesModelPart.Tl3DataListContainerNode;

 Tl3StrListItemNode = l3NodesModelPart.Tl3StrListItemNode;

 Tl3DataListItemNode = l3NodesModelPart.Tl3DataListItemNode;
 Tl3IListContainerNode = l3NodesModelPart.Tl3IListContainerNode;

 Tl3RootNode = Tl3UsualNode;

const
 Tl3StdNode: Tl3NodeClass = Tl3UsualNode;
{* - стандартный класс дл€ реализации узла дерева. }

function l3L2NA(Action: Pointer): Tl3NodeAction;
{* - делает заглушку дл€ локальной процедуры (как l3L2FA). }
function l3L2SNA(Action: Pointer): Tl3SimpleNodeAction;
{* - делает заглушку дл€ локальной процедуры (как l3L2FA). }
function MakeNode(aNodeName: PAnsiChar; aNodeClass: Tl3NodeClass = nil): Il3Node;
  overload;
{* - сделать новый узел. }
function MakeNode(const aNodeName: AnsiString; aNodeClass: Tl3NodeClass = nil): Il3Node;
  overload;
{* - сделать новый узел. }
function MakeNode(const aNodeName: Tl3WString; aNodeClass: Tl3NodeClass = nil): Il3Node;
  overload;
{* - сделать новый узел. }
function MakeParamNode(aNodeName: PAnsiChar; aParam: Integer; aNodeClass: Tl3NodeClass = nil): Il3Node;
{* - сделать новый узел с параметром. }
function MakeParamNodeStr(const aNodeName: AnsiString; aParam: Integer; aNodeClass: Tl3NodeClass = nil): Il3Node;
{* - сделать новый узел с параметром. }

function l3IterateSubTreeF(const aRootNode: Il3Node;
 Action: Tl3NodeAction;
 aIterMode: Integer = 0;
 const aFromNode: Il3Node = nil): Il3Node;
{* - перебрать узлы дл€ aRootNode и освободить заглушку. }

function l3FindNodeByHandle(const aRootNode: Il3Node;
 aHandle: Integer;
 aIterMode: Integer = 0;
 const aFromNode: Il3Node = nil): Il3Node;

function l3SearchByPath(const aRootNode: Il3Node; const aPathStr: Tl3WString; const aLevelSlash: AnsiString = '\'): Il3Node;
function l3SearchByName(const aRootNode : Il3Node;
                        const aNameStr  : AnsiString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  overload;
function l3SearchByName(const aRootNode : Il3Node;
                        const aNameStr  : Tl3WString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  overload;
  {-}
function l3SearchByName(const aTree     : Il3SimpleTree;
                        const aNameStr  : Tl3WString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3SimpleNode = nil): Il3SimpleNode;
  overload;
  {-}
function l3SearchByName(const aRootNode : Il3Node;
                        const aNameStr  : Il3CString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  overload;
  {-}
function l3SearchNameBegin(const aRootNode: Il3Node; const aSrchStr: Tl3WString; aIterMode: Integer; const aFromNode: Il3Node = nil): Il3Node;
function l3SearchNameOccur(const aRootNode: Il3Node; const aSrchStr: Tl3WString; aIterMode: Integer; const aFromNode: Il3Node = nil): Il3Node;
function l3GetPartPath(const aRootNode: Il3Node; var thePathStr: Tl3WString; const aLevelSlash: AnsiString = '\'): Il3Node;
function l3GetSPartPath(const aTree       : Il3SimpleTree;
                        var thePathStr    : Tl3WString;
                        const aLevelSlash : AnsiString = '\'): Il3SimpleNode;

function l3SearchByNode(const aRootNode : Il3Node;
                        aCriterionNode  : Il3Node;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;

function l3GetFullPathLen(const aRootNode    : Il3SimpleNode;
                          const aNode        : Il3SimpleNode;
                          const aLevelSlash  : AnsiString = '\';
                          const aLevelIndent : AnsiString = '';
                          aRootInclude       : Boolean = False;
                          aLevelNumerate     : Boolean = False): Cardinal;

function l3GetFullPathAlloc(const aRootNode    : Il3Node;
                            const aNode        : Il3Node;
                            const aLevelSlash  : AnsiString = '\';
                            const aLevelIndent : AnsiString = '';
                            aRootInclude       : Boolean = False;
                            aLevelNumerate     : Boolean = False): PAnsiChar;

function l3GetFullPathCStr(const aRootNode: Il3SimpleNode;
                            const aNode: Il3SimpleNode;
                            aCodePage :  Integer = CP_ANSI;
                            const aLevelSlash: AnsiString = '\';
                            const aLevelIndent: AnsiString = '';
                            aRootInclude: Boolean = False;
                            aLevelNumerate: Boolean = False): Il3CString;


procedure l3GetFullPath(const aRootNode    : Il3SimpleNode;
                        const aNode        : Il3SimpleNode;
                        aPath              : PAnsiChar;
                        var MaxLen         : Cardinal;
                        const aLevelSlash  : AnsiString = '\';
                        const aLevelIndent : AnsiString = '';
                        aRootInclude       : Boolean = False;
                        aLevelNumerate     : Boolean = False);

function l3GetFullPathStr(const aRootNode: Il3SimpleNode;
 const aNode: Il3SimpleNode;
 const aLevelSlash: AnsiString = '\';
 const aLevelIndent: AnsiString = '';
 aRootInclude: Boolean = False;
 aLevelNumerate: Boolean = False): AnsiString; overload;

function l3GetFullPathStr(const aRootNode: Il3Node;
 aNodeHandle: Integer;
 const aLevelSlash: AnsiString = '\';
 const aLevelIndent: AnsiString = '';
 aRootInclude: Boolean = False;
 aLevelNumerate: Boolean = False): AnsiString; overload;

function l3GetLastPartOfName(const aName : AnsiString; const aLevelSlash: AnsiString = '\') : AnsiString;

function l3GetNodeIndentString(const aRootNode: Il3Node;
 const aNode: Il3Node;
 const aLevelIndent: AnsiString = ''): AnsiString;

implementation

uses
 StrUtils,
 l3Const, l3String, l3InterfacesMisc, l3Bits, l3Chars,
 l3InterfacedString
 ;

function MakeNode(aNodeName: PAnsiChar; aNodeClass: Tl3NodeClass = nil{Tl3StdNode}): Il3Node;
  {-}
begin
 Result := MakeNode(l3PCharLen(aNodeName), aNodeClass);
end;

function MakeNode(const aNodeName: AnsiString; aNodeClass: Tl3NodeClass = nil{Tl3StdNode}): Il3Node;
  {-}
begin
 Result := MakeNode(l3PCharLen(aNodeName), aNodeClass);
end;

function MakeNode(const aNodeName: Tl3WString; aNodeClass: Tl3NodeClass = nil): Il3Node;
  //overload;
  {-}
var
 aNode : Tl3Node;
begin
 if (aNodeClass = nil) then
  aNode := Tl3StdNode.Create
 else
  aNode := aNodeClass.Create;
 try
  aNode.Text := aNodeName;
  Result := aNode;
 finally
  l3Free(aNode);
 end;//try..finally
end;

function MakeParamNode(aNodeName: PAnsiChar; aParam: Integer; aNodeClass: Tl3NodeClass = nil{Tl3StdNode}): Il3Node;
begin
 Result := MakeNode(aNodeName, aNodeClass);
 (Result as Il3HandleNode).Handle := aParam;
end;

function MakeParamNodeStr(const aNodeName: AnsiString; aParam: Integer; aNodeClass: Tl3NodeClass = nil{Tl3StdNode}): Il3Node;
begin
 Result := MakeParamNode(PAnsiChar(aNodeName), aParam, aNodeClass);
end;

function l3L2NA(Action: Pointer): Tl3NodeAction; register;
asm
 jmp  l3LocalStub
end;{asm}

function l3L2SNA(Action: Pointer): Tl3SimpleNodeAction; register;
asm
 jmp  l3LocalStub
end;{asm}

function l3IterateSubTreeF(const aRootNode: Il3Node;
                           Action: Tl3NodeAction;
                           aIterMode: Integer = 0;
                           const aFromNode: Il3Node = nil): Il3Node;
begin
 try
  if aRootNode = nil then
   Exit;
  Result := aRootNode.Iterate(Action, aIterMode, aFromNode);
 finally
  l3FreeFA(Tl3FreeAction(Action));
 end;{try..finally}
end;

function l3FindNodeByHandle(const aRootNode: Il3Node;
                            aHandle: Integer;
                            aIterMode: Integer = 0;
                            const aFromNode: Il3Node = nil): Il3Node;

 function IterHandler(const CurNode: Il3Node): Boolean; 
 var
  l_HandleNode : Il3HandleNode;
 begin
  try
   if l3IOk(CurNode.QueryInterface(Il3HandleNode, l_HandleNode)) then
    try
     Result := (aHandle = l_HandleNode.Handle);
    finally
     l_HandleNode := nil;
    end//try..finally
   else
    Result := False;
  except
   on E: Exception do
   begin
    Result := False;
    l3System.Exception2Log(E);
   end;
  end;
 end;

begin
 Result := l3IterateSubTreeF(aRootNode, l3L2NA( @IterHandler), imCheckResult or aIterMode, aFromNode);
end;

function l3SearchByName(const aRootNode : Il3Node;
                        const aNameStr  : AnsiString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  //overload;
begin
 Result := l3SearchByName(aRootNode, l3PCharLen(aNameStr), aIterMode, aFromNode);
end;

function l3SearchByName(const aRootNode : Il3Node;
                        const aNameStr  : Tl3WString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  {-}

 function IterHandler(const CurNode: Il3Node): Boolean;
 begin
  Result := l3Same(CurNode.Text, aNameStr, true);
 end;

begin
 Result := l3IterateSubTreeF(aRootNode, l3L2NA( @IterHandler), aIterMode or imCheckResult, aFromNode);
end;

function l3SearchByName(const aTree     : Il3SimpleTree;
                        const aNameStr  : Tl3WString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3SimpleNode = nil): Il3SimpleNode;
  //overload;
  {-}

 function IterHandler(const CurNode: Il3SimpleNode): Boolean;
 begin
  Result := l3Same(CurNode.Text, aNameStr, true);
 end;

begin
 Result := aTree.SimpleIterateF(l3L2SNA(@IterHandler), aIterMode or imCheckResult, aFromNode);
end;
  
function l3SearchByName(const aRootNode : Il3Node;
                        const aNameStr  : Il3CString;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  //overload;
  {-}
begin
 Result := l3SearchByName(aRootNode, l3PCharLen(aNameStr), aIterMode, aFromNode);
end;

function l3SearchNameBegin(const aRootNode : Il3Node;
                           const aSrchStr        : Tl3WString;
                           aIterMode       : Integer;
                           const aFromNode : Il3Node = nil): Il3Node;

 function IterHandler(const CurNode: Il3Node): Boolean;
 begin
  Result := l3AnsiStrLICompExt(aSrchStr.S, CurNode.Text.S, aSrchStr.SLen) = 0;
 end;

begin
 Result := l3IterateSubTreeF(aRootNode, l3L2NA( @IterHandler), aIterMode or imCheckResult, aFromNode);
end;

function l3SearchNameOccur(const aRootNode: Il3Node;
                           const aSrchStr: Tl3WString;
                           aIterMode: Integer;
                           const aFromNode: Il3Node = nil): Il3Node;
var
 BT : Tl3BMTable;
 Pos : Cardinal;
 S : Tl3String;

 function IterHandler(const aCurNode: Il3Node): Boolean;
 begin
  Result := S.BMSearchUC((aCurNode as Il3NodeWrap).GetSelf, BT, Pos);
 end;

begin
 S := Tl3String.Make(aSrchStr);
 try
  S.MakeUpper;
  S.MakeBMTable(BT);
  Result := l3IterateSubTreeF(aRootNode, l3L2NA( @IterHandler), aIterMode or imCheckResult, aFromNode);
 finally
  l3Free(S);
 end;{try..finally}
end;

function l3SearchByNode(const aRootNode : Il3Node;
                        aCriterionNode  : Il3Node;
                        aIterMode       : Integer = 0;
                        const aFromNode : Il3Node = nil): Il3Node;
  {-}

 function IterHandler(const CurNode: Il3Node): Boolean; 
 begin
  Result :=  aCriterionNode.IsSame(CurNode);
 end;

begin
 Result := l3IterateSubTreeF(aRootNode, l3L2NA( @IterHandler), aIterMode or imCheckResult, aFromNode);
end;


function l3SearchByPath(const aRootNode: Il3Node;
                        const aPathStr: Tl3WString;
                        const aLevelSlash: AnsiString = '\'): Il3Node;
var
 l_Str: Tl3WString;
begin
 if l3IsNil(aPathStr) then
  Result := aRootNode // дл€ пустого пути возвращаем корневой узел
 else
 begin
  l_Str := aPathStr;
  Result := l3GetPartPath(aRootNode, l_Str, aLevelSlash);
  if not l3IsNil(l_Str) then
   Result := nil;
 end;
end;

function l3GetPartPath(const aRootNode   : Il3Node;
                       var thePathStr    : Tl3WString;
                       const aLevelSlash : AnsiString = '\'): Il3Node;
var
 l_End : Integer;
 l_Res : Il3Node;
 l_LevSlash : Tl3WString;
 l_Len : integer;
begin
 Result := aRootNode;
 l_LevSlash := l3PCharLen(aLevelSlash);
 while not l3IsNil(thePathStr) do
 begin
  l_End := l3Pos(thePathStr, l_LevSlash);
  if l_End = 0 then
  begin
   thePathStr := l3Copy(thePathStr, l_LevSlash.SLen, MaxInt);
   Continue;
  end;

  if l_End <> l3NotFound then
   l_Len := l_End
  else
   l_Len := thePathStr.SLen;
   //MakeSubTree(CurNode);
  if l_Len = 0 then
   Break;

  l_Res := l3SearchByName(Result, l3PCharLen(thePathStr.S, l_Len), imOneLevel);
  if l_Res = nil then
   Break
  else
   Result := l_Res;
  if l_End = l3NotFound then
   l3AssignNil(thePathStr)
  else
   thePathStr := l3Copy(thePathStr, l_End + l_LevSlash.SLen, MaxInt);
 end;//while (aPathStr <> nil)
end;

function l3GetSPartPath(const aTree       : Il3SimpleTree;
                        var thePathStr    : Tl3WString;
                        const aLevelSlash : AnsiString = '\'): Il3SimpleNode;
var
 l_End : Integer;
 l_Res : Il3SimpleNode;
 l_LevSlash : Tl3WString;
 l_Len : integer;
begin
 Result := aTree.RootNode;
 l_LevSlash := l3PCharLen(aLevelSlash);
 while not l3IsNil(thePathStr) do
 begin
  l_End := l3Pos(thePathStr, l_LevSlash);
  if l_End = 0 then
  begin
   thePathStr := l3Copy(thePathStr, l_LevSlash.SLen, MaxInt);
   Continue;
  end;

  if l_End <> l3NotFound then
   l_Len := l_End
  else
   l_Len := thePathStr.SLen;
   //MakeSubTree(CurNode);
  if l_Len = 0 then
   Break;

  l_Res := l3SearchByName(aTree, l3PCharLen(thePathStr.S, l_Len), imOneLevel, Result);
  if l_Res = nil then
   Break
  else
   Result := l_Res;
  if l_End = l3NotFound then
   l3AssignNil(thePathStr)
  else
   thePathStr := l3Copy(thePathStr, l_End + l_LevSlash.SLen, MaxInt);
 end;//while (aPathStr <> nil)
end;

procedure l3GetFullPath(const aRootNode    : Il3SimpleNode;
                        const aNode        : Il3SimpleNode;
                        aPath              : PAnsiChar;
                        var MaxLen         : Cardinal;
                        const aLevelSlash  : AnsiString = '\';
                        const aLevelIndent : AnsiString = '';
                        aRootInclude       : Boolean = False;
                        aLevelNumerate     : Boolean = False);
var
 LN        : Integer;
 lSLen     : Integer;
 NewLen    : Integer;
 SlashLen  : Byte;
 IndLen    : Byte;
 N         : Integer;
 lOrdNum   : Integer;
 I         : Integer;
 lRootNode : Il3SimpleNode;
 l_Node    : Il3SimpleNode;
begin
 if aPath <> nil then
  aPath[0] := #0;
 if aNode = nil then
  Exit;
 l_Node := aNode;
 SlashLen := Length(aLevelSlash);
 IndLen := Length(aLevelIndent);
 NewLen := 0;
 N := l_Node.GetLevelFor(aRootNode);
 if aRootInclude then Inc(N);
 lRootNode := aRootNode;
 while (l_Node <> nil) and (aRootInclude or not lRootNode.IsSame(l_Node)) do
 begin
  lSLen := l_Node.Text.SLen;
  LN := lSLen;
  if NewLen > 0 then
  begin
   Inc(LN, SlashLen);
   Inc(LN, N * IndLen);
  end;
  Inc(LN, Ord(aLevelNumerate) * 4);
  if NewLen + LN > MaxLen then
   Break;
  if NewLen = 0 then
   StrMove( @aPath[Ord(aLevelNumerate) * 4], l_Node.Text.S, lSLen)
  else
  begin
   StrMove( @aPath[LN], aPath, NewLen);
   StrMove( @aPath[Ord(aLevelNumerate) * 4], l_Node.Text.S, lSLen {LN-SlashLen-Ord(aLevelNumerate)*4-N*IndLen});
   StrMove( @aPath[LN - SlashLen - N * IndLen], PAnsiChar(aLevelSlash), SlashLen);
   if IndLen > 0 then
    for I := 0 to Pred(N) do
     StrMove( PAnsiChar(@aPath[LN - SlashLen + (I - N) * IndLen + 1]), @aLevelIndent[1], IndLen);
  end;

  if aLevelNumerate then
  begin
   lOrdNum := l_Node.IndexInParent + 1;
   StrMove(aPath, PAnsiChar(Format('%.3d=', [lOrdNum])), 4);
  end;//aLevelNumerate

  Inc(NewLen, LN);
  Dec(N);
  l_Node := l_Node.Parent;
 end;
 MaxLen := NewLen;

 aPath[MaxLen] := #0;
end;

function l3GetFullPathLen(const aRootNode    : Il3SimpleNode;
                          const aNode        : Il3SimpleNode;
                          const aLevelSlash  : AnsiString = '\';
                          const aLevelIndent : AnsiString = '';
                          aRootInclude       : Boolean = False;
                          aLevelNumerate     : Boolean = False): Cardinal;
var
 LN        : Cardinal;
 MaxLen    : Cardinal;
 SlashLen  : Byte;
 CNode     : Il3SimpleNode;
 N         : Cardinal;
 lRootNode : Il3SimpleNode;
begin
 Result := 0;
 if aNode = nil then
  Exit;
 SlashLen := Length(aLevelSlash);
 MaxLen := High(Cardinal) - 20;
 CNode := aNode;

 lRootNode := aRootNode;

 while (CNode <> nil) and (aRootInclude or not lRootNode.IsSame(CNode)) do
 begin
  LN := CNode.Text.SLen;
  if Result > 0 then
   Inc(LN, SlashLen);
  Inc(LN, Ord(aLevelNumerate) * 4);
  if Result + LN > MaxLen then
   Break;
  Inc(Result, LN);
  CNode := CNode.Parent;
 end;//while (CNode <> nil)
 {If N > 0 then Dec(N);}
 //N:=GetLevel(aNode);
 if (Length(aLevelIndent) > 0) then
 begin
  N := aNode.GetLevelFor(aRootNode);
  if not aRootInclude then Dec(N);
  N := ((N + 1) * N div 2) * Length(aLevelIndent);
  Inc(Result, N);
 end;//Length(aLevelIndent) > 0
 //Inc(Result,100);
end;

function l3GetFullPathAlloc(const aRootNode: Il3Node;
                            const aNode: Il3Node;
                            const aLevelSlash: AnsiString = '\';
                            const aLevelIndent: AnsiString = '';
                            aRootInclude: Boolean = False;
                            aLevelNumerate: Boolean = False): PAnsiChar;
var
 lStrLen : Cardinal;
begin
 lStrLen := l3GetFullPathLen(aRootNode, aNode, aLevelSlash, aLevelIndent, aRootInclude, aLevelNumerate);
 Result := l3StrAlloc(Succ(lStrLen));
 l3GetFullPath(aRootNode, aNode, Result, lStrLen, aLevelSlash, aLevelIndent, aRootInclude, aLevelNumerate);
end;

function l3GetFullPathCStr(const aRootNode: Il3SimpleNode;
                            const aNode: Il3SimpleNode;
                            aCodePage :  Integer = CP_ANSI;
                            const aLevelSlash: AnsiString = '\';
                            const aLevelIndent: AnsiString = '';
                            aRootInclude: Boolean = False;
                            aLevelNumerate: Boolean = False): Il3CString;
var
 lStrLen : Cardinal;
 lStr : PAnsiChar;
 ll3String : Tl3InterfacedString;
begin
 lStrLen := l3GetFullPathLen(aRootNode, aNode, aLevelSlash, aLevelIndent, aRootInclude, aLevelNumerate);
 l3System.GetLocalMem(lStr, Succ(lStrLen));
 l3GetFullPath(aRootNode, aNode, lStr, lStrLen, aLevelSlash, aLevelIndent, aRootInclude, aLevelNumerate);
 ll3String := Tl3InterfacedString.Make(l3PCharLen(lStr, lStrLen),True);
 try
  ll3String.CodePage := aCodePage;
  Result := ll3String;
 finally
  l3Free(ll3String);
 end;//try..finally
end;

function l3GetFullPathStr(const aRootNode: Il3SimpleNode;
                          const aNode: Il3SimpleNode;
                          const aLevelSlash: AnsiString = '\';
                          const aLevelIndent: AnsiString = '';
                          aRootInclude: Boolean = False;
                          aLevelNumerate: Boolean = False): AnsiString;
var
 lStrLen : Cardinal;
begin
 lStrLen := l3GetFullPathLen(aRootNode, aNode, aLevelSlash, aLevelIndent, aRootInclude, aLevelNumerate);
 SetLength(Result, lStrLen);
 if lStrLen > 0 then
  l3GetFullPath(aRootNode, aNode, PAnsiChar(Result), lStrLen,
   aLevelSlash, aLevelIndent, aRootInclude, aLevelNumerate);
end;

function l3GetFullPathStr(const aRootNode: Il3Node;
                          aNodeHandle: Integer;
                          const aLevelSlash: AnsiString = '\';
                          const aLevelIndent: AnsiString = '';
                          aRootInclude: Boolean = False;
                          aLevelNumerate: Boolean = False): AnsiString;

var
 lNode : Il3Node;
begin
 lNode := l3FindNodeByHandle(aRootNode, aNodeHandle);
 if lNode <> nil then
  Result := l3GetFullPathStr(aRootNode, lNode, aLevelSlash, aLevelIndent,
   aRootInclude, aLevelNumerate)
 else
  Result := '';

end;

function l3GetNodeIndentString(const aRootNode: Il3Node;
                               const aNode: Il3Node;
                               const aLevelIndent: AnsiString = ''): AnsiString;
begin
 Result := l3StringOfString(aLevelIndent, Pred(aNode.GetLevelFor(aRootNode)));
end;

function l3GetLastPartOfName(const aName : AnsiString; const aLevelSlash: AnsiString = '\') : AnsiString;
var
 lPos  : Integer;
 lPos2 : Integer;
begin
 lPos := 0;
 repeat
  lPos2 := PosEx(aLevelSlash, aName, lPos + 1);
  if lPos2 > 0 then lPos := lPos2;
 until lPos2 <= 0;

 if lPos = 0 then
  Result := aName
 else
  Result := Trim(Copy(aName, lPos + 1, MaxInt));
end;

end.
