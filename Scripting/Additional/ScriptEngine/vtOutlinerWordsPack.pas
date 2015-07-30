unit vtOutlinerWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$VT"
// Модуль: "vtOutlinerWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$VT::vtOutlinerWords::vtOutlinerWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3TreeInterfaces,
  tfwScriptingInterfaces,
  vtOutliner,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TreeIterateNodesUtils,
  l3Nodes,
  l3String,
  l3Interfaces,
  l3Chars,
  l3Types,
  l3Base,
  l3Filer,
  SysUtils,
  l3Tree_TLB,
  l3Bits,
  ImgList,
  TypInfo,
  tfwTypeRegistrator
  ;

type
 TvtCustomOutlinerFriend = {abstract} class(TvtCustomOutliner)
  {* Друг для TvtCustomOutliner }
 end;//TvtCustomOutlinerFriend

 TkwTreeCheckFlag = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:CheckFlag
*Тип результата:* Boolean
*Пример:*
[code]
 aNodeID aFlag aTree tree:CheckFlag
[code]  }
 private
 // private methods
   function TreeCheckFlag(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    aFlag: Integer;
    aNodeID: Integer): Boolean;
     {* Реализация слова скрипта tree:CheckFlag }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeCheckFlag

// start class TkwTreeCheckFlag

function TkwTreeCheckFlag.TreeCheckFlag(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  aFlag: Integer;
  aNodeID: Integer): Boolean;
//#UC START# *A4D880DBCC97_3A8F612BD250_var*
//#UC END# *A4D880DBCC97_3A8F612BD250_var*
begin
//#UC START# *A4D880DBCC97_3A8F612BD250_impl*
 Result := l3TestMask(aTree.CTree.CNodes[aNodeID].Flags, aFlag);
//#UC END# *A4D880DBCC97_3A8F612BD250_impl*
end;//TkwTreeCheckFlag.TreeCheckFlag

procedure TkwTreeCheckFlag.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_aFlag : Integer;
 l_aNodeID : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFlag := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFlag: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aNodeID := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aNodeID: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((TreeCheckFlag(aCtx, l_aTree, l_aFlag, l_aNodeID)));
end;//TkwTreeCheckFlag.DoDoIt

class function TkwTreeCheckFlag.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CheckFlag';
end;//TkwTreeCheckFlag.GetWordNameForRegister

function TkwTreeCheckFlag.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwTreeCheckFlag.GetResultTypeInfo

type
 TkwTreeCollapseAll = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:CollapseAll
*Пример:*
[code]
 aTree tree:CollapseAll
[code]  }
 private
 // private methods
   procedure TreeCollapseAll(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner);
     {* Реализация слова скрипта tree:CollapseAll }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeCollapseAll

// start class TkwTreeCollapseAll

procedure TkwTreeCollapseAll.TreeCollapseAll(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner);
//#UC START# *53CF58CDEE72_DCC8D602858A_var*
//#UC END# *53CF58CDEE72_DCC8D602858A_var*
begin
//#UC START# *53CF58CDEE72_DCC8D602858A_impl*
 aTree.TreeStruct.RootNode.ExpandCollapseAll(False);
//#UC END# *53CF58CDEE72_DCC8D602858A_impl*
end;//TkwTreeCollapseAll.TreeCollapseAll

procedure TkwTreeCollapseAll.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeCollapseAll(aCtx, l_aTree);
end;//TkwTreeCollapseAll.DoDoIt

class function TkwTreeCollapseAll.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CollapseAll';
end;//TkwTreeCollapseAll.GetWordNameForRegister

function TkwTreeCollapseAll.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeCollapseAll.GetResultTypeInfo

type
 TkwTreeCurrentNodeIsExpanded = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:CurrentNode:IsExpanded
*Тип результата:* Boolean
*Пример:*
[code]
 aTree tree:CurrentNode:IsExpanded
[code]  }
 private
 // private methods
   function TreeCurrentNodeIsExpanded(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner): Boolean;
     {* Реализация слова скрипта tree:CurrentNode:IsExpanded }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeCurrentNodeIsExpanded

// start class TkwTreeCurrentNodeIsExpanded

function TkwTreeCurrentNodeIsExpanded.TreeCurrentNodeIsExpanded(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner): Boolean;
//#UC START# *5E6EA88E41A6_24EBB16818DB_var*
//#UC END# *5E6EA88E41A6_24EBB16818DB_var*
begin
//#UC START# *5E6EA88E41A6_24EBB16818DB_impl*
 Result := aTree.TreeStruct.IsExpanded(aTree.GetCurrentNode);
//#UC END# *5E6EA88E41A6_24EBB16818DB_impl*
end;//TkwTreeCurrentNodeIsExpanded.TreeCurrentNodeIsExpanded

procedure TkwTreeCurrentNodeIsExpanded.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((TreeCurrentNodeIsExpanded(aCtx, l_aTree)));
end;//TkwTreeCurrentNodeIsExpanded.DoDoIt

class function TkwTreeCurrentNodeIsExpanded.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CurrentNode:IsExpanded';
end;//TkwTreeCurrentNodeIsExpanded.GetWordNameForRegister

function TkwTreeCurrentNodeIsExpanded.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwTreeCurrentNodeIsExpanded.GetResultTypeInfo

type
 TkwTreeDeleteAllChildren = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:DeleteAllChildren
*Пример:*
[code]
 aTree tree:DeleteAllChildren
[code]  }
 private
 // private methods
   procedure TreeDeleteAllChildren(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner);
     {* Реализация слова скрипта tree:DeleteAllChildren }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeDeleteAllChildren

// start class TkwTreeDeleteAllChildren

procedure TkwTreeDeleteAllChildren.TreeDeleteAllChildren(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner);
//#UC START# *8767BA37432C_88EA9B4D8249_var*
var
 l_Node   : Il3SimpleNode;
 l_Current: Il3SimpleNode;
//#UC END# *8767BA37432C_88EA9B4D8249_var*
begin
//#UC START# *8767BA37432C_88EA9B4D8249_impl*
 l_Current := aTree.CurrentCNode;
 while l_Current.HasChild do
 begin
  l_Node := l_Current.Child;
  l_Node.Delete;
 end; // while l_Current.HasChld do
//#UC END# *8767BA37432C_88EA9B4D8249_impl*
end;//TkwTreeDeleteAllChildren.TreeDeleteAllChildren

procedure TkwTreeDeleteAllChildren.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeDeleteAllChildren(aCtx, l_aTree);
end;//TkwTreeDeleteAllChildren.DoDoIt

class function TkwTreeDeleteAllChildren.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:DeleteAllChildren';
end;//TkwTreeDeleteAllChildren.GetWordNameForRegister

function TkwTreeDeleteAllChildren.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeDeleteAllChildren.GetResultTypeInfo

type
 TkwTreeExpandAll = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:ExpandAll
*Пример:*
[code]
 aTree tree:ExpandAll
[code]  }
 private
 // private methods
   procedure TreeExpandAll(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner);
     {* Реализация слова скрипта tree:ExpandAll }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeExpandAll

// start class TkwTreeExpandAll

procedure TkwTreeExpandAll.TreeExpandAll(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner);
//#UC START# *04755E6E20F4_11D7E325A602_var*
//#UC END# *04755E6E20F4_11D7E325A602_var*
begin
//#UC START# *04755E6E20F4_11D7E325A602_impl*
 aTree.TreeStruct.RootNode.ExpandCollapseAll(True);
//#UC END# *04755E6E20F4_11D7E325A602_impl*
end;//TkwTreeExpandAll.TreeExpandAll

procedure TkwTreeExpandAll.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeExpandAll(aCtx, l_aTree);
end;//TkwTreeExpandAll.DoDoIt

class function TkwTreeExpandAll.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:ExpandAll';
end;//TkwTreeExpandAll.GetWordNameForRegister

function TkwTreeExpandAll.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeExpandAll.GetResultTypeInfo

type
 TkwTreeCurrentNode = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:CurrentNode
*Тип результата:* Il3SimpleNode
*Пример:*
[code]
 aTree tree:CurrentNode
[code]  }
 private
 // private methods
   function TreeCurrentNode(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner): Il3SimpleNode;
     {* Реализация слова скрипта tree:CurrentNode }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeCurrentNode

// start class TkwTreeCurrentNode

function TkwTreeCurrentNode.TreeCurrentNode(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner): Il3SimpleNode;
//#UC START# *7AB848282EE2_6EB6AE69700F_var*
//#UC END# *7AB848282EE2_6EB6AE69700F_var*
begin
//#UC START# *7AB848282EE2_6EB6AE69700F_impl*
 Result := aTree.GetCurrentNode;
//#UC END# *7AB848282EE2_6EB6AE69700F_impl*
end;//TkwTreeCurrentNode.TreeCurrentNode

procedure TkwTreeCurrentNode.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushIntf((TreeCurrentNode(aCtx, l_aTree)));
end;//TkwTreeCurrentNode.DoDoIt

class function TkwTreeCurrentNode.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:CurrentNode';
end;//TkwTreeCurrentNode.GetWordNameForRegister

function TkwTreeCurrentNode.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Il3SimpleNode);
end;//TkwTreeCurrentNode.GetResultTypeInfo

type
 TkwTreeGetItem = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItem
*Тип результата:* Il3SimpleNode
*Пример:*
[code]
 anIndex aTree tree:GetItem
[code]  }
 private
 // private methods
   function TreeGetItem(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Il3SimpleNode;
     {* Реализация слова скрипта tree:GetItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItem

// start class TkwTreeGetItem

function TkwTreeGetItem.TreeGetItem(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Il3SimpleNode;
//#UC START# *7FAAC6D7CD3C_E66BB4447886_var*
//#UC END# *7FAAC6D7CD3C_E66BB4447886_var*
begin
//#UC START# *7FAAC6D7CD3C_E66BB4447886_impl*
 Result := aTree.TreeStruct.Nodes[anIndex];
//#UC END# *7FAAC6D7CD3C_E66BB4447886_impl*
end;//TkwTreeGetItem.TreeGetItem

procedure TkwTreeGetItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushIntf((TreeGetItem(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetItem.DoDoIt

class function TkwTreeGetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem';
end;//TkwTreeGetItem.GetWordNameForRegister

function TkwTreeGetItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Il3SimpleNode);
end;//TkwTreeGetItem.GetResultTypeInfo

type
 TkwTreeGetItemsCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItemsCount
*Тип результата:* Integer
*Пример:*
[code]
 aTree tree:GetItemsCount
[code]  }
 private
 // private methods
   function TreeGetItemsCount(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner): Integer;
     {* Реализация слова скрипта tree:GetItemsCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItemsCount

// start class TkwTreeGetItemsCount

function TkwTreeGetItemsCount.TreeGetItemsCount(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner): Integer;
//#UC START# *4336ED9E3EE1_6AA86FBC7A2F_var*
//#UC END# *4336ED9E3EE1_6AA86FBC7A2F_var*
begin
//#UC START# *4336ED9E3EE1_6AA86FBC7A2F_impl*
 Result := aTree.TreeStruct.CountView;
//#UC END# *4336ED9E3EE1_6AA86FBC7A2F_impl*
end;//TkwTreeGetItemsCount.TreeGetItemsCount

procedure TkwTreeGetItemsCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeGetItemsCount(aCtx, l_aTree)));
end;//TkwTreeGetItemsCount.DoDoIt

class function TkwTreeGetItemsCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItemsCount';
end;//TkwTreeGetItemsCount.GetWordNameForRegister

function TkwTreeGetItemsCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeGetItemsCount.GetResultTypeInfo

type
 TkwTreeIterateNodes = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:IterateNodes
*Пример:*
[code]
 aLambda aTree tree:IterateNodes
[code]  }
 private
 // private methods
   procedure TreeIterateNodes(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    aLambda: TtfwWord);
     {* Реализация слова скрипта tree:IterateNodes }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeIterateNodes

// start class TkwTreeIterateNodes

procedure TkwTreeIterateNodes.TreeIterateNodes(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  aLambda: TtfwWord);
//#UC START# *C2580701FE33_57DF7C56BA33_var*
//#UC END# *C2580701FE33_57DF7C56BA33_var*
begin
//#UC START# *C2580701FE33_57DF7C56BA33_impl*
 g_TreeIterateNodesWord := aLambda;
 g_TreeIterateNodesContext := aCtx;
 try
  try
   aTree.IterateF(l3L2NA(@TreeIterateNodesMethod), 0);
  except
   on EtfwBreakIterator do ;
  end;
 finally
  g_TreeIterateNodesWord := nil;
  Finalize(g_TreeIterateNodesContext);
 end;
//#UC END# *C2580701FE33_57DF7C56BA33_impl*
end;//TkwTreeIterateNodes.TreeIterateNodes

procedure TkwTreeIterateNodes.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_aLambda : TtfwWord;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeIterateNodes(aCtx, l_aTree, l_aLambda);
end;//TkwTreeIterateNodes.DoDoIt

class function TkwTreeIterateNodes.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:IterateNodes';
end;//TkwTreeIterateNodes.GetWordNameForRegister

function TkwTreeIterateNodes.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeIterateNodes.GetResultTypeInfo

type
 TkwTreeSaveState2File = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:SaveState2File
*Пример:*
[code]
 aFileName aTree tree:SaveState2File
[code]  }
 private
 // private methods
   procedure TreeSaveState2File(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    const aFileName: AnsiString);
     {* Реализация слова скрипта tree:SaveState2File }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeSaveState2File

// start class TkwTreeSaveState2File

procedure TkwTreeSaveState2File.TreeSaveState2File(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  const aFileName: AnsiString);
//#UC START# *60993335F29E_B4D43BCE4979_var*
var
 l_F : Tl3CustomDosFiler;
 
 function lp_IterateNode(const aCurNode : Il3Node) : Boolean;
 var
  i       : Integer;
  l_CStr  : Il3CString;
  l_Name  : AnsiString;
  l_Level : Integer;
 begin
  Result := false;
  l_Name  := '';
  with aTree.CTree do
  begin
   if not aTree.CTree.IsExpanded(aCurNode.ParentNode) then Exit;
   l_Level := GetLevel(aCurNode);
   if ShowRoot then Dec(l_Level);
  end; // with aTreeControl.CTree do
  for i := l_Level downto 2 do
   l_Name := l_Name + '  ';
  l_CStr := l3CStr(aCurNode.Text);
  l3DeleteChars(l_CStr, [cc_SoftEnter, cc_HardEnter, cc_SoftSpace]);
  l_Name := Format('%s%s - Flags: %d', [l_Name, l3Str(l_CStr), aCurNode.Flags]);
  l_F.WriteLn(l_Name);
 end;

var
 l_S : AnsiString;
//#UC END# *60993335F29E_B4D43BCE4979_var*
begin
//#UC START# *60993335F29E_B4D43BCE4979_impl*
 l_S := aCtx.rCaller.ResolveOutputFilePath(aFileName);
 l_S := ChangeFileExt(l_S, '.tree');
 l_F := Tl3CustomDosFiler.Make(l_S, l3_fmWrite, false);
 try
  l_F.Open;
  aTree.CTree.CRootNode.IterateF(l3L2NA(@lp_IterateNode), imExpandOnly);
  l_F.Close;
 finally
  FreeAndNil(l_F);
 end;//try..finally
//#UC END# *60993335F29E_B4D43BCE4979_impl*
end;//TkwTreeSaveState2File.TreeSaveState2File

procedure TkwTreeSaveState2File.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_aFileName : AnsiString;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFileName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFileName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeSaveState2File(aCtx, l_aTree, l_aFileName);
end;//TkwTreeSaveState2File.DoDoIt

class function TkwTreeSaveState2File.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:SaveState2File';
end;//TkwTreeSaveState2File.GetWordNameForRegister

function TkwTreeSaveState2File.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeSaveState2File.GetResultTypeInfo

type
 TkwTreeChildrenCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:ChildrenCount
*Тип результата:* Integer
*Пример:*
[code]
 anIndex aTree tree:ChildrenCount
[code]  }
 private
 // private methods
   function TreeChildrenCount(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта tree:ChildrenCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeChildrenCount

// start class TkwTreeChildrenCount

function TkwTreeChildrenCount.TreeChildrenCount(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Integer;
//#UC START# *AE43F50BC9AF_015D1248A6CF_var*
//#UC END# *AE43F50BC9AF_015D1248A6CF_var*
begin
//#UC START# *AE43F50BC9AF_015D1248A6CF_impl*
 Result := aTree.GetNode(anIndex).ThisChildrenCount;
//#UC END# *AE43F50BC9AF_015D1248A6CF_impl*
end;//TkwTreeChildrenCount.TreeChildrenCount

procedure TkwTreeChildrenCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeChildrenCount(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeChildrenCount.DoDoIt

class function TkwTreeChildrenCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:ChildrenCount';
end;//TkwTreeChildrenCount.GetWordNameForRegister

function TkwTreeChildrenCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeChildrenCount.GetResultTypeInfo

type
 TkwTreeExpand = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:развернуть
*Пример:*
[code]
 anIndex aTree tree:развернуть
[code]  }
 private
 // private methods
   procedure TreeExpand(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer);
     {* Реализация слова скрипта tree:развернуть }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeExpand

// start class TkwTreeExpand

procedure TkwTreeExpand.TreeExpand(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer);
//#UC START# *2E30DC700B4D_B776D637E7D3_var*
//#UC END# *2E30DC700B4D_B776D637E7D3_var*
begin
//#UC START# *2E30DC700B4D_B776D637E7D3_impl*
 aTree.ExpandNode(aTree.GetNode(anIndex), True);
//#UC END# *2E30DC700B4D_B776D637E7D3_impl*
end;//TkwTreeExpand.TreeExpand

procedure TkwTreeExpand.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeExpand(aCtx, l_aTree, l_anIndex);
end;//TkwTreeExpand.DoDoIt

class function TkwTreeExpand.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:развернуть';
end;//TkwTreeExpand.GetWordNameForRegister

function TkwTreeExpand.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeExpand.GetResultTypeInfo

type
 TkwTreeGetItemHeight = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItem:Height
*Тип результата:* Integer
*Пример:*
[code]
 anIndex aTree tree:GetItem:Height
[code]  }
 private
 // private methods
   function TreeGetItemHeight(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта tree:GetItem:Height }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItemHeight

// start class TkwTreeGetItemHeight

function TkwTreeGetItemHeight.TreeGetItemHeight(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Integer;
//#UC START# *6A1F8BF29A15_62AE36AC72B7_var*
//#UC END# *6A1F8BF29A15_62AE36AC72B7_var*
begin
//#UC START# *6A1F8BF29A15_62AE36AC72B7_impl*
 with TvtCustomOutlinerFriend(aTree).GetDrawRect(anIndex) do
  Result := (Bottom - Top);
//#UC END# *6A1F8BF29A15_62AE36AC72B7_impl*
end;//TkwTreeGetItemHeight.TreeGetItemHeight

procedure TkwTreeGetItemHeight.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeGetItemHeight(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetItemHeight.DoDoIt

class function TkwTreeGetItemHeight.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem:Height';
end;//TkwTreeGetItemHeight.GetWordNameForRegister

function TkwTreeGetItemHeight.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeGetItemHeight.GetResultTypeInfo

type
 TkwTreeGetItemImageIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItemImageIndex
*Тип результата:* Integer
*Пример:*
[code]
 anIndex aTree tree:GetItemImageIndex
[code]  }
 private
 // private methods
   function TreeGetItemImageIndex(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта tree:GetItemImageIndex }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItemImageIndex

// start class TkwTreeGetItemImageIndex

function TkwTreeGetItemImageIndex.TreeGetItemImageIndex(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Integer;
//#UC START# *8973BBC94034_A8F9DB23E07A_var*
var
 l_IL: TCustomImageList;
//#UC END# *8973BBC94034_A8F9DB23E07A_var*
begin
//#UC START# *8973BBC94034_A8F9DB23E07A_impl*
 if Assigned(aTree.OnGetItemImage) then
  Result := aTree.OnGetItemImage(aTree, anIndex, l_IL)
 else
  Result := vtItemWithoutImage;
//#UC END# *8973BBC94034_A8F9DB23E07A_impl*
end;//TkwTreeGetItemImageIndex.TreeGetItemImageIndex

procedure TkwTreeGetItemImageIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeGetItemImageIndex(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetItemImageIndex.DoDoIt

class function TkwTreeGetItemImageIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItemImageIndex';
end;//TkwTreeGetItemImageIndex.GetWordNameForRegister

function TkwTreeGetItemImageIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeGetItemImageIndex.GetResultTypeInfo

type
 TkwTreeGetItemLeft = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItem:Left
*Тип результата:* Integer
*Пример:*
[code]
 anIndex aTree tree:GetItem:Left
[code]  }
 private
 // private methods
   function TreeGetItemLeft(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта tree:GetItem:Left }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItemLeft

// start class TkwTreeGetItemLeft

function TkwTreeGetItemLeft.TreeGetItemLeft(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Integer;
//#UC START# *B8F482D3E058_6CAA56491F95_var*
//#UC END# *B8F482D3E058_6CAA56491F95_var*
begin
//#UC START# *B8F482D3E058_6CAA56491F95_impl*
 with TvtCustomOutlinerFriend(aTree).GetDrawRect(anIndex) do
  Result := Left;
//#UC END# *B8F482D3E058_6CAA56491F95_impl*
end;//TkwTreeGetItemLeft.TreeGetItemLeft

procedure TkwTreeGetItemLeft.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeGetItemLeft(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetItemLeft.DoDoIt

class function TkwTreeGetItemLeft.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem:Left';
end;//TkwTreeGetItemLeft.GetWordNameForRegister

function TkwTreeGetItemLeft.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeGetItemLeft.GetResultTypeInfo

type
 TkwTreeGetItemTop = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItem:Top
*Тип результата:* Integer
*Пример:*
[code]
 anIndex aTree tree:GetItem:Top
[code]  }
 private
 // private methods
   function TreeGetItemTop(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта tree:GetItem:Top }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItemTop

// start class TkwTreeGetItemTop

function TkwTreeGetItemTop.TreeGetItemTop(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Integer;
//#UC START# *BB0EA75B28A4_5F6D76A66CAD_var*
//#UC END# *BB0EA75B28A4_5F6D76A66CAD_var*
begin
//#UC START# *BB0EA75B28A4_5F6D76A66CAD_impl*
 with TvtCustomOutlinerFriend(aTree).GetDrawRect(anIndex) do
  Result := Top;
//#UC END# *BB0EA75B28A4_5F6D76A66CAD_impl*
end;//TkwTreeGetItemTop.TreeGetItemTop

procedure TkwTreeGetItemTop.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeGetItemTop(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetItemTop.DoDoIt

class function TkwTreeGetItemTop.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem:Top';
end;//TkwTreeGetItemTop.GetWordNameForRegister

function TkwTreeGetItemTop.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeGetItemTop.GetResultTypeInfo

type
 TkwTreeGetItemWidth = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetItem:Width
*Тип результата:* Integer
*Пример:*
[code]
 anIndex aTree tree:GetItem:Width
[code]  }
 private
 // private methods
   function TreeGetItemWidth(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Integer;
     {* Реализация слова скрипта tree:GetItem:Width }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetItemWidth

// start class TkwTreeGetItemWidth

function TkwTreeGetItemWidth.TreeGetItemWidth(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Integer;
//#UC START# *C87D76FDB760_645DA96C0332_var*
//#UC END# *C87D76FDB760_645DA96C0332_var*
begin
//#UC START# *C87D76FDB760_645DA96C0332_impl*
 with TvtCustomOutlinerFriend(aTree).GetDrawRect(anIndex) do
  Result := (Right - Left);
//#UC END# *C87D76FDB760_645DA96C0332_impl*
end;//TkwTreeGetItemWidth.TreeGetItemWidth

procedure TkwTreeGetItemWidth.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TreeGetItemWidth(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetItemWidth.DoDoIt

class function TkwTreeGetItemWidth.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetItem:Width';
end;//TkwTreeGetItemWidth.GetWordNameForRegister

function TkwTreeGetItemWidth.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwTreeGetItemWidth.GetResultTypeInfo

type
 TkwTreeGetSelected = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:GetSelected
*Тип результата:* Boolean
*Пример:*
[code]
 anIndex aTree tree:GetSelected
[code]  }
 private
 // private methods
   function TreeGetSelected(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer): Boolean;
     {* Реализация слова скрипта tree:GetSelected }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeGetSelected

// start class TkwTreeGetSelected

function TkwTreeGetSelected.TreeGetSelected(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer): Boolean;
//#UC START# *9B0DC054C6CC_5AEA5F2D19AB_var*
//#UC END# *9B0DC054C6CC_5AEA5F2D19AB_var*
begin
//#UC START# *9B0DC054C6CC_5AEA5F2D19AB_impl*
 Result := aTree.Selected[anIndex];
//#UC END# *9B0DC054C6CC_5AEA5F2D19AB_impl*
end;//TkwTreeGetSelected.TreeGetSelected

procedure TkwTreeGetSelected.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((TreeGetSelected(aCtx, l_aTree, l_anIndex)));
end;//TkwTreeGetSelected.DoDoIt

class function TkwTreeGetSelected.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:GetSelected';
end;//TkwTreeGetSelected.GetWordNameForRegister

function TkwTreeGetSelected.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwTreeGetSelected.GetResultTypeInfo

type
 TkwTreeSetSelected = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:SetSelected
*Пример:*
[code]
 aValue anIndex aTree tree:SetSelected
[code]  }
 private
 // private methods
   procedure TreeSetSelected(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer;
    aValue: Boolean);
     {* Реализация слова скрипта tree:SetSelected }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeSetSelected

// start class TkwTreeSetSelected

procedure TkwTreeSetSelected.TreeSetSelected(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer;
  aValue: Boolean);
//#UC START# *FB5CACE1D73C_017A97801F00_var*
//#UC END# *FB5CACE1D73C_017A97801F00_var*
begin
//#UC START# *FB5CACE1D73C_017A97801F00_impl*
 aTree.Selected[anIndex] := aValue;
//#UC END# *FB5CACE1D73C_017A97801F00_impl*
end;//TkwTreeSetSelected.TreeSetSelected

procedure TkwTreeSetSelected.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
 l_aValue : Boolean;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := (aCtx.rEngine.PopBool);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeSetSelected(aCtx, l_aTree, l_anIndex, l_aValue);
end;//TkwTreeSetSelected.DoDoIt

class function TkwTreeSetSelected.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:SetSelected';
end;//TkwTreeSetSelected.GetWordNameForRegister

function TkwTreeSetSelected.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeSetSelected.GetResultTypeInfo

type
 TkwTreeCollapse = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта tree:свернуть
*Пример:*
[code]
 anIndex aTree tree:свернуть
[code]  }
 private
 // private methods
   procedure TreeCollapse(const aCtx: TtfwContext;
    aTree: TvtCustomOutliner;
    anIndex: Integer);
     {* Реализация слова скрипта tree:свернуть }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTreeCollapse

// start class TkwTreeCollapse

procedure TkwTreeCollapse.TreeCollapse(const aCtx: TtfwContext;
  aTree: TvtCustomOutliner;
  anIndex: Integer);
//#UC START# *CEBD033C9914_9749EACE054F_var*
//#UC END# *CEBD033C9914_9749EACE054F_var*
begin
//#UC START# *CEBD033C9914_9749EACE054F_impl*
 aTree.ExpandNode(aTree.GetNode(anIndex), false);
//#UC END# *CEBD033C9914_9749EACE054F_impl*
end;//TkwTreeCollapse.TreeCollapse

procedure TkwTreeCollapse.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aTree : TvtCustomOutliner;
 l_anIndex : Integer;
begin
 try
  l_aTree := TvtCustomOutliner(aCtx.rEngine.PopObjAs(TvtCustomOutliner));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aTree: TvtCustomOutliner : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TreeCollapse(aCtx, l_aTree, l_anIndex);
end;//TkwTreeCollapse.DoDoIt

class function TkwTreeCollapse.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'tree:свернуть';
end;//TkwTreeCollapse.GetWordNameForRegister

function TkwTreeCollapse.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTreeCollapse.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация tree_CheckFlag
 TkwTreeCheckFlag.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_CollapseAll
 TkwTreeCollapseAll.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_CurrentNode_IsExpanded
 TkwTreeCurrentNodeIsExpanded.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_DeleteAllChildren
 TkwTreeDeleteAllChildren.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_ExpandAll
 TkwTreeExpandAll.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_CurrentNode
 TkwTreeCurrentNode.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItem
 TkwTreeGetItem.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItemsCount
 TkwTreeGetItemsCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_IterateNodes
 TkwTreeIterateNodes.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_SaveState2File
 TkwTreeSaveState2File.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_ChildrenCount
 TkwTreeChildrenCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_expand
 TkwTreeExpand.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItem_Height
 TkwTreeGetItemHeight.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItemImageIndex
 TkwTreeGetItemImageIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItem_Left
 TkwTreeGetItemLeft.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItem_Top
 TkwTreeGetItemTop.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetItem_Width
 TkwTreeGetItemWidth.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_GetSelected
 TkwTreeGetSelected.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_SetSelected
 TkwTreeSetSelected.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация tree_collapse
 TkwTreeCollapse.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TvtCustomOutliner
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtCustomOutliner));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3SimpleNode
 TtfwTypeRegistrator.RegisterType(TypeInfo(Il3SimpleNode));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts

end.