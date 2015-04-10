unit kwCompiledCheckVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledCheckVar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::TkwCompiledCheckVar
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledCheckVarByRef,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCheckVar = class(TkwCompiledCheckVarByRef)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledCheckVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledCheckVar

procedure TkwCompiledCheckVar.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53E235180147_var*
var
 l_W : TtfwWord;
//#UC END# *4DAEEDE10285_53E235180147_var*
begin
//#UC START# *4DAEEDE10285_53E235180147_impl*
 l_W := GetVar(aCtx);
 if (l_W <> nil) then
  aCtx.rEngine.Push(l_W.GetValue(aCtx))
 else
  aCtx.rEngine.Push(TtfwStackValue_E);
//#UC END# *4DAEEDE10285_53E235180147_impl*
end;//TkwCompiledCheckVar.DoDoIt

{$IfEnd} //not NoScripts

end.