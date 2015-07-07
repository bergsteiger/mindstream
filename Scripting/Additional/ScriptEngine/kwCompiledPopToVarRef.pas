unit kwCompiledPopToVarRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledPopToVarRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::VarWorkingWords::TkwCompiledPopToVarRef
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
 TkwCompiledPopToVarRef = class(TkwCompiledVarWorker)
 protected
 // realized methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledPopToVarRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledPopToVarRef

procedure TkwCompiledPopToVarRef.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F22698C00B8_var*
//#UC END# *4DCBCD2200D2_4F22698C00B8_var*
begin
//#UC START# *4DCBCD2200D2_4F22698C00B8_impl*
 (aVar.GetValue(aCtx).AsObject As TtfwWord).SetValue(aCtx.rEngine.Pop, aCtx);
//#UC END# *4DCBCD2200D2_4F22698C00B8_impl*
end;//TkwCompiledPopToVarRef.DoVar

{$IfEnd} //not NoScripts

end.