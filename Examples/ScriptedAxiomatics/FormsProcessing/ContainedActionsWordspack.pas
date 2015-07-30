unit ContainedActionsWordspack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "ContainedActionsWordspack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::FormsProcessing::ContainedActionsWordspack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  ActnList,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopContainedActionExecute = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:ContainedAction:Execute
*Пример:*
[code]
 aContainedAction pop:ContainedAction:Execute
[code]  }
 private
 // private methods
   procedure Execute(const aCtx: TtfwContext;
    aContainedAction: TContainedAction);
     {* Реализация слова скрипта pop:ContainedAction:Execute }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopContainedActionExecute

// start class TkwPopContainedActionExecute

procedure TkwPopContainedActionExecute.Execute(const aCtx: TtfwContext;
  aContainedAction: TContainedAction);
//#UC START# *AFC4E3ACD81B_87D5D18D9F8E_var*
//#UC END# *AFC4E3ACD81B_87D5D18D9F8E_var*
begin
//#UC START# *AFC4E3ACD81B_87D5D18D9F8E_impl*
 aContainedAction.Execute;
//#UC END# *AFC4E3ACD81B_87D5D18D9F8E_impl*
end;//TkwPopContainedActionExecute.Execute

procedure TkwPopContainedActionExecute.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aContainedAction : TContainedAction;
begin
 try
  l_aContainedAction := TContainedAction(aCtx.rEngine.PopObjAs(TContainedAction));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aContainedAction: TContainedAction : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Execute(aCtx, l_aContainedAction);
end;//TkwPopContainedActionExecute.DoDoIt

class function TkwPopContainedActionExecute.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ContainedAction:Execute';
end;//TkwPopContainedActionExecute.GetWordNameForRegister

function TkwPopContainedActionExecute.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopContainedActionExecute.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ContainedAction_Execute
 TkwPopContainedActionExecute.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TContainedAction
 TtfwTypeRegistrator.RegisterType(TypeInfo(TContainedAction));
{$IfEnd} //not NoScripts

end.