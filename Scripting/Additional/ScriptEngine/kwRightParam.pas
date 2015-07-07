unit kwRightParam;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRightParam.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwRightParam
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
 TkwRightParam = class(TkwLeftParam)
 public
 // overridden public methods
   function IsRightParam(const aCtx: TtfwContext): Boolean; override;
 end;//TkwRightParam
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwRightParam

function TkwRightParam.IsRightParam(const aCtx: TtfwContext): Boolean;
//#UC START# *52E91D9D0024_52E91D6202F4_var*
//#UC END# *52E91D9D0024_52E91D6202F4_var*
begin
//#UC START# *52E91D9D0024_52E91D6202F4_impl*
 Result := true;
//#UC END# *52E91D9D0024_52E91D6202F4_impl*
end;//TkwRightParam.IsRightParam

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53E38D8102D0*
 TkwRightParam.RegisterClass;
//#UC END# *53E38D8102D0*
{$IfEnd} //not NoScripts

end.