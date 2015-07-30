unit kwCompiledStringVarShift;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledStringVarShift.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledStringVarShift
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
 TkwCompiledStringVarShift = class(TkwCompiledVarAsStringWorker)
 protected
 // overridden protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledStringVarShift
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

// start class TkwCompiledStringVarShift

procedure TkwCompiledStringVarShift.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F5F011E033F_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4DCBCD2200D2_4F5F011E033F_var*
begin
//#UC START# *4DCBCD2200D2_4F5F011E033F_impl*
 Tl3WString(l_P) := l3PCharLen(aVar.GetValue(aCtx).AsString);
 l_P.Shift(aCtx.rEngine.PopInt);
 aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l_P)), aCtx);
//#UC END# *4DCBCD2200D2_4F5F011E033F_impl*
end;//TkwCompiledStringVarShift.DoVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledStringVarShift
 TkwCompiledStringVarShift.RegisterClass;
{$IfEnd} //not NoScripts

end.