unit kwCompiledClass;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledClass.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledClass
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
  kwCompiledProcedure,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledClass = class(TkwCompiledProcedure)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledClass
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledClass

procedure TkwCompiledClass.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3959CB005F_var*
//#UC END# *4DAEEDE10285_4F3959CB005F_var*
begin
//#UC START# *4DAEEDE10285_4F3959CB005F_impl*
 inherited;
 // - тут например можно просто положить в стек ссылку на себя
 //   ну или например объявлять переменную данного класса (тогда Immediate надо)
 //   в общем - как надумаю, пока я не понял - чего мне больше надо
//#UC END# *4DAEEDE10285_4F3959CB005F_impl*
end;//TkwCompiledClass.DoDoIt

{$IfEnd} //not NoScripts

end.