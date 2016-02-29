unit kwCompiledWStringVarInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledWStringVarInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledWStringVarInc
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
 TkwCompiledWStringVarInc = class(TkwCompiledVarAsStringWorker)
 protected
 // overridden protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledWStringVarInc
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

// start class TkwCompiledWStringVarInc

procedure TkwCompiledWStringVarInc.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F5098B2036F_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4DCBCD2200D2_4F5098B2036F_var*
begin
//#UC START# *4DCBCD2200D2_4F5098B2036F_impl*
 Tl3WString(l_P) := aVar.GetValue(aCtx).AsWString;
 l_P.Shift(+1);
 aVar.SetValue(TtfwStackValue_C(l_P), aCtx);
//#UC END# *4DCBCD2200D2_4F5098B2036F_impl*
end;//TkwCompiledWStringVarInc.DoVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWStringVarInc
 TkwCompiledWStringVarInc.RegisterClass;
{$IfEnd} //not NoScripts

end.