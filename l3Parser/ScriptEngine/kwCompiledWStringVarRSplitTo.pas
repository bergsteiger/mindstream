unit kwCompiledWStringVarRSplitTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledWStringVarRSplitTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledWStringVarRSplitTo
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
 TkwCompiledWStringVarRSplitTo = class(TkwCompiledVarAsStringWorker)
 protected
 // overridden protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledWStringVarRSplitTo
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

// start class TkwCompiledWStringVarRSplitTo

procedure TkwCompiledWStringVarRSplitTo.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F62D74F0021_var*
//#UC END# *4DCBCD2200D2_4F62D74F0021_var*
begin
//#UC START# *4DCBCD2200D2_4F62D74F0021_impl*
 Assert(false, 'Пока не реализовано');
//#UC END# *4DCBCD2200D2_4F62D74F0021_impl*
end;//TkwCompiledWStringVarRSplitTo.DoVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWStringVarRSplitTo
 TkwCompiledWStringVarRSplitTo.RegisterClass;
{$IfEnd} //not NoScripts

end.