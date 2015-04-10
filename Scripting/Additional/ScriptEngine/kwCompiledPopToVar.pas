unit kwCompiledPopToVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledPopToVar.pas"
// Начат: 29.04.2011 22:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledPopToVar
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
  kwCompiledVarWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledPopToVar = class(TkwCompiledVarWorker)
 protected
 // realized methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledPopToVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledPopToVar

procedure TkwCompiledPopToVar.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4DBB09750084_var*
//#UC END# *4DCBCD2200D2_4DBB09750084_var*
begin
//#UC START# *4DCBCD2200D2_4DBB09750084_impl*
 aVar.SetValue(aCtx.rEngine.Pop, aCtx);
//#UC END# *4DCBCD2200D2_4DBB09750084_impl*
end;//TkwCompiledPopToVar.DoVar

{$IfEnd} //not NoScripts

end.