unit kwLeftWordRefParam;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwLeftWordRefParam.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwLeftWordRefParam
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
  kwLeftParam,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwLeftWordRefParam = class(TkwLeftParam)
 public
 // overridden public methods
   function IsLeftWordRefParam(const aCtx: TtfwContext): Boolean; override;
 end;//TkwLeftWordRefParam
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwLeftWordRefParam

function TkwLeftWordRefParam.IsLeftWordRefParam(const aCtx: TtfwContext): Boolean;
//#UC START# *53E389100169_53E377040339_var*
//#UC END# *53E389100169_53E377040339_var*
begin
//#UC START# *53E389100169_53E377040339_impl*
 Result := true;
//#UC END# *53E389100169_53E377040339_impl*
end;//TkwLeftWordRefParam.IsLeftWordRefParam

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53E38D920243*
 TkwLeftWordRefParam.RegisterClass;
//#UC END# *53E38D920243*
{$IfEnd} //not NoScripts

end.