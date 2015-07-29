unit vtComboTreeWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "vtComboTreeWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::vtComboTreeWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3TreeInterfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  vtComboTree
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
 TkwPopComboTreeCurrentNode = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ComboTree:CurrentNode
*Тип результата:* Il3SimpleNode
*Пример:*
[code]
INTERFACE VAR l_Il3SimpleNode
 aComboTree pop:ComboTree:CurrentNode >>> l_Il3SimpleNode
[code]  }
 private
 // private methods
   function CurrentNode(const aCtx: TtfwContext;
    aComboTree: TvtComboTree): Il3SimpleNode;
     {* Реализация слова скрипта pop:ComboTree:CurrentNode }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComboTreeCurrentNode

// start class TkwPopComboTreeCurrentNode

function TkwPopComboTreeCurrentNode.CurrentNode(const aCtx: TtfwContext;
  aComboTree: TvtComboTree): Il3SimpleNode;
//#UC START# *E52B39199FD5_9F9FF0616B3E_var*
//#UC END# *E52B39199FD5_9F9FF0616B3E_var*
begin
//#UC START# *E52B39199FD5_9F9FF0616B3E_impl*
 Result := aComboTree.Tree.GetCurrentNode;
//#UC END# *E52B39199FD5_9F9FF0616B3E_impl*
end;//TkwPopComboTreeCurrentNode.CurrentNode

procedure TkwPopComboTreeCurrentNode.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComboTree : TvtComboTree;
begin
 try
  l_aComboTree := TvtComboTree(aCtx.rEngine.PopObjAs(TvtComboTree));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComboTree: TvtComboTree : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushIntf((CurrentNode(aCtx, l_aComboTree)));
end;//TkwPopComboTreeCurrentNode.DoDoIt

class function TkwPopComboTreeCurrentNode.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ComboTree:CurrentNode';
end;//TkwPopComboTreeCurrentNode.GetWordNameForRegister

function TkwPopComboTreeCurrentNode.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Il3SimpleNode);
end;//TkwPopComboTreeCurrentNode.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ComboTree_CurrentNode
 TkwPopComboTreeCurrentNode.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TvtComboTree
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtComboTree));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3SimpleNode
 TtfwTypeRegistrator.RegisterType(TypeInfo(Il3SimpleNode));
{$IfEnd} //not NoScripts

end.