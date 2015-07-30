unit kwCompiledVarProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompiledVarProducer.pas"
// Начат: 06.02.2012 18:41
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::VarProducing::TkwCompiledVarProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledVarProducer = class(TtfwVar)
 protected
 // overridden protected methods
   class function ReallyNeedRegister: Boolean; override;
 end;//TkwCompiledVarProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledVarProducer

class function TkwCompiledVarProducer.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4F367DEA0271_var*
//#UC END# *4DC2E05B03DD_4F367DEA0271_var*
begin
//#UC START# *4DC2E05B03DD_4F367DEA0271_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4F367DEA0271_impl*
end;//TkwCompiledVarProducer.ReallyNeedRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledVarProducer
 TkwCompiledVarProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.