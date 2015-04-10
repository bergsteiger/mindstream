unit kwPICK;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPICK.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwPICK
//
// Формат: u PICK.
// Удаляет u. Копирует xu на вершину стека. ( xu ... x1 x0 u -- xu ... x1 x0 xu )
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwPICK = class(_tfwAutoregisteringWord_)
  {* Формат: u PICK. 
Удаляет u. Копирует xu на вершину стека. ( xu ... x1 x0 u -- xu ... x1 x0 xu ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPICK
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPICK;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwPICK

procedure TkwPICK.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DEF5D310087_var*
//#UC END# *4DAEEDE10285_4DEF5D310087_var*
begin
//#UC START# *4DAEEDE10285_4DEF5D310087_impl*
 aCtx.rEngine.Pick;
//#UC END# *4DAEEDE10285_4DEF5D310087_impl*
end;//TkwPICK.DoDoIt

class function TkwPICK.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DEF5D310087_var*
//#UC END# *4DB0614603C8_4DEF5D310087_var*
begin
//#UC START# *4DB0614603C8_4DEF5D310087_impl*
 Result := 'PICK';
//#UC END# *4DB0614603C8_4DEF5D310087_impl*
end;//TkwPICK.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.