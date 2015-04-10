unit kwCompiledStereotypeProducerPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledStereotypeProducerPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::TkwCompiledStereotypeProducerPrim
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
  kwCompiledWordProducer,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledStereotypeProducerPrim = class(TkwCompiledWordProducer)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//TkwCompiledStereotypeProducerPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwClassCompiler
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledStereotypeProducerPrim

function TkwCompiledStereotypeProducerPrim.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F396A2B030E_var*
//#UC END# *4DB6D7F70155_4F396A2B030E_var*
begin
//#UC START# *4DB6D7F70155_4F396A2B030E_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F396A2B030E_impl*
end;//TkwCompiledStereotypeProducerPrim.IsImmediate

function TkwCompiledStereotypeProducerPrim.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F396A2B030E_var*
//#UC END# *4DBAEE0D028D_4F396A2B030E_var*
begin
//#UC START# *4DBAEE0D028D_4F396A2B030E_impl*
 Result := TkwClassCompiler;
//#UC END# *4DBAEE0D028D_4F396A2B030E_impl*
end;//TkwCompiledStereotypeProducerPrim.CompiledWordClass

{$IfEnd} //not NoScripts

end.