unit kwCompiledNamedAutolinkProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledNamedAutolinkProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::TkwCompiledNamedAutolinkProducer
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
  kwCompiledNamedInitedVarProducer
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledNamedAutolinkProducer = class(TkwCompiledNamedInitedVarProducer)
 protected
 // overridden protected methods
   function CanBeVoid: Boolean; override;
 end;//TkwCompiledNamedAutolinkProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledNamedAutolinkProducer

function TkwCompiledNamedAutolinkProducer.CanBeVoid: Boolean;
//#UC START# *4F44BBD400AC_4F44BBB1023C_var*
//#UC END# *4F44BBD400AC_4F44BBB1023C_var*
begin
//#UC START# *4F44BBD400AC_4F44BBB1023C_impl*
 Result := false;
//#UC END# *4F44BBD400AC_4F44BBB1023C_impl*
end;//TkwCompiledNamedAutolinkProducer.CanBeVoid

{$IfEnd} //not NoScripts

end.