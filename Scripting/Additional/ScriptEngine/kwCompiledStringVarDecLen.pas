unit kwCompiledStringVarDecLen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledStringVarDecLen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledStringVarDecLen
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
 TkwCompiledStringVarDecLen = class(TkwCompiledVarAsStringWorker)
 protected
 // overridden protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledStringVarDecLen
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

// start class TkwCompiledStringVarDecLen

procedure TkwCompiledStringVarDecLen.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F5F01AF034B_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4DCBCD2200D2_4F5F01AF034B_var*
begin
//#UC START# *4DCBCD2200D2_4F5F01AF034B_impl*
 Tl3WString(l_P) := l3PCharLen(aVar.GetValue(aCtx).AsString);
 Dec(l_P.SLen);
 Assert(l_P.SLen >= 0);
 aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l_P)), aCtx);
//#UC END# *4DCBCD2200D2_4F5F01AF034B_impl*
end;//TkwCompiledStringVarDecLen.DoVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledStringVarDecLen
 TkwCompiledStringVarDecLen.RegisterClass;
{$IfEnd} //not NoScripts

end.