unit InterfacedNodeWords;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$L3"
// Модуль: "InterfacedNodeWords.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$L3::l3NodeWords::InterfacedNodeWords
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Tree_TLB,
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  l3TreeInterfaces
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwNodeCaption = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Node:Caption
*Тип результата:* Tl3WString
*Пример:*
[code]
 aNode Node:Caption
[code]  }
 private
 // private methods
   function Caption(const aCtx: TtfwContext;
    const aNode: Il3Node): Tl3WString;
     {* Реализация слова скрипта Node:Caption }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNodeCaption

// start class TkwNodeCaption

function TkwNodeCaption.Caption(const aCtx: TtfwContext;
  const aNode: Il3Node): Tl3WString;
//#UC START# *EB2FE05C3FD8_925538F9D93F_var*
//#UC END# *EB2FE05C3FD8_925538F9D93F_var*
begin
//#UC START# *EB2FE05C3FD8_925538F9D93F_impl*
 Result := aNode.Text;
//#UC END# *EB2FE05C3FD8_925538F9D93F_impl*
end;//TkwNodeCaption.Caption

procedure TkwNodeCaption.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aNode : Il3Node;
begin
 try
  l_aNode := Il3Node(aCtx.rEngine.PopIntf(Il3Node));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aNode: Il3Node : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Caption(aCtx, l_aNode)));
end;//TkwNodeCaption.DoDoIt

class function TkwNodeCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Node:Caption';
end;//TkwNodeCaption.GetWordNameForRegister

function TkwNodeCaption.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwNodeCaption.GetResultTypeInfo

type
 TkwNodeIndex = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Node:Index
*Тип результата:* Integer
*Пример:*
[code]
 aNode Node:Index
[code]  }
 private
 // private methods
   function Index(const aCtx: TtfwContext;
    const aNode: Il3Node): Integer;
     {* Реализация слова скрипта Node:Index }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNodeIndex

// start class TkwNodeIndex

function TkwNodeIndex.Index(const aCtx: TtfwContext;
  const aNode: Il3Node): Integer;
//#UC START# *5069AAF05422_34FBBF0F2ACD_var*
//#UC END# *5069AAF05422_34FBBF0F2ACD_var*
begin
//#UC START# *5069AAF05422_34FBBF0F2ACD_impl*
 Result := aNode.GetNumInParent;
//#UC END# *5069AAF05422_34FBBF0F2ACD_impl*
end;//TkwNodeIndex.Index

procedure TkwNodeIndex.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aNode : Il3Node;
begin
 try
  l_aNode := Il3Node(aCtx.rEngine.PopIntf(Il3Node));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aNode: Il3Node : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Index(aCtx, l_aNode)));
end;//TkwNodeIndex.DoDoIt

class function TkwNodeIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Node:Index';
end;//TkwNodeIndex.GetWordNameForRegister

function TkwNodeIndex.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwNodeIndex.GetResultTypeInfo

type
 TkwNodeIndexInTree = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Node:IndexInTree
*Тип результата:* Integer
*Пример:*
[code]
 aNode Node:IndexInTree
[code]  }
 private
 // private methods
   function IndexInTree(const aCtx: TtfwContext;
    const aNode: Il3Node): Integer;
     {* Реализация слова скрипта Node:IndexInTree }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNodeIndexInTree

// start class TkwNodeIndexInTree

function TkwNodeIndexInTree.IndexInTree(const aCtx: TtfwContext;
  const aNode: Il3Node): Integer;
//#UC START# *376583B5266F_1B9E11EA21FB_var*
var
 l_Index: Integer;
 l_P: Il3Node;
//#UC END# *376583B5266F_1B9E11EA21FB_var*
begin
//#UC START# *376583B5266F_1B9E11EA21FB_impl*
 l_Index := aNode.GetNumInParent;
 l_P := aNode.ParentNode;
 try
  while Assigned(l_P) do
  begin
   l_Index := l_Index + l_P.GetNumInParent;
   l_P := l_P.ParentNode;
  end;//while Assigned(l_P)
 finally
  l_P := nil;
 end;//try..finally
 Result := l_Index;
//#UC END# *376583B5266F_1B9E11EA21FB_impl*
end;//TkwNodeIndexInTree.IndexInTree

procedure TkwNodeIndexInTree.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aNode : Il3Node;
begin
 try
  l_aNode := Il3Node(aCtx.rEngine.PopIntf(Il3Node));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aNode: Il3Node : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((IndexInTree(aCtx, l_aNode)));
end;//TkwNodeIndexInTree.DoDoIt

class function TkwNodeIndexInTree.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Node:IndexInTree';
end;//TkwNodeIndexInTree.GetWordNameForRegister

function TkwNodeIndexInTree.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwNodeIndexInTree.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Node_Caption
 TkwNodeCaption.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Node_Index
 TkwNodeIndex.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Node_IndexInTree
 TkwNodeIndexInTree.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3Node
 TtfwTypeRegistrator.RegisterType(TypeInfo(Il3Node));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Tl3WString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts

end.