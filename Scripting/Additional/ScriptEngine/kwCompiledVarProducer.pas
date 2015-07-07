unit kwCompiledVarProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledVarProducer.pas"
// Начат: 06.02.2012 18:41
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::TkwCompiledVarProducer
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
  l3Interfaces,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwVar.imp.pas}
 TkwCompiledVarProducer = class(_tfwVar_)
 protected
 // overridden protected methods
   class function ReallyNeedRegister: Boolean; override;
 end;//TkwCompiledVarProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVar,
  SysUtils,
  l3String,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCompiledVarProducer;

{$Include ..\ScriptEngine\tfwVar.imp.pas}

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
 {$Include ..\ScriptEngine\tfwVar.imp.pas}
{$IfEnd} //not NoScripts

end.