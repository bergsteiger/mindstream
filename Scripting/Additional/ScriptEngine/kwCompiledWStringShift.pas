unit kwCompiledWStringShift;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledWStringShift.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledWStringShift
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledVarAsStringWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledWStringShift = class(TkwCompiledVarAsStringWorker)
 protected
 // overridden protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledWStringShift
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3Interfaces,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWStringShift

procedure TkwCompiledWStringShift.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F5099100188_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4DCBCD2200D2_4F5099100188_var*
begin
//#UC START# *4DCBCD2200D2_4F5099100188_impl*
 Tl3WString(l_P) := aVar.GetValue(aCtx).AsWString;
 l_P.Shift(aCtx.rEngine.PopInt);
 aVar.SetValue(TtfwStackValue_C(l_P), aCtx);
//#UC END# *4DCBCD2200D2_4F5099100188_impl*
end;//TkwCompiledWStringShift.DoVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWStringShift
 TkwCompiledWStringShift.RegisterClass;
{$IfEnd} //not NoScripts

end.