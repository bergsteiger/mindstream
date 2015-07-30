unit kwCompiledAutolinkProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledAutolinkProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::VarProducing::TkwCompiledAutolinkProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledInitedVarProducer
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledAutolinkProducer = class(TkwCompiledInitedVarProducer)
 protected
 // overridden protected methods
   function CanBeVoid: Boolean; override;
 end;//TkwCompiledAutolinkProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledAutolinkProducer

function TkwCompiledAutolinkProducer.CanBeVoid: Boolean;
//#UC START# *4F44BBD400AC_4F44BB9500E7_var*
//#UC END# *4F44BBD400AC_4F44BB9500E7_var*
begin
//#UC START# *4F44BBD400AC_4F44BB9500E7_impl*
 Result := false;
//#UC END# *4F44BBD400AC_4F44BB9500E7_impl*
end;//TkwCompiledAutolinkProducer.CanBeVoid

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledAutolinkProducer
 TkwCompiledAutolinkProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.