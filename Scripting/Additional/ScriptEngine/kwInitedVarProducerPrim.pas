unit kwInitedVarProducerPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwInitedVarProducerPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::VarProducing::TkwInitedVarProducerPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordProducer,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwInitedVarProducerPrim = {abstract} class(TtfwWordProducer)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TkwInitedVarProducerPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledInitedVarProducer,
  kwCompiledInitableVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwInitedVarProducerPrim

function TkwInitedVarProducerPrim.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3E187500E9_var*
//#UC END# *4DBAEE0D028D_4F3E187500E9_var*
begin
//#UC START# *4DBAEE0D028D_4F3E187500E9_impl*
 Result := TkwCompiledInitableVar;
//#UC END# *4DBAEE0D028D_4F3E187500E9_impl*
end;//TkwInitedVarProducerPrim.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwInitedVarProducerPrim
 TkwInitedVarProducerPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.