unit kwDROP2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDROP2.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwDROP2
//
// Удаляет пару-ячеек x1 x2 из стека. ( x1 x2 -- )
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
 TkwDROP2 = class(_tfwAutoregisteringWord_)
  {* Удаляет пару-ячеек x1 x2 из стека. ( x1 x2 -- ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDROP2
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDROP2;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDROP2

procedure TkwDROP2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DEF60A4017C_var*
//#UC END# *4DAEEDE10285_4DEF60A4017C_var*
begin
//#UC START# *4DAEEDE10285_4DEF60A4017C_impl*
 aCtx.rEngine.Drop2;
//#UC END# *4DAEEDE10285_4DEF60A4017C_impl*
end;//TkwDROP2.DoDoIt

class function TkwDROP2.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DEF60A4017C_var*
//#UC END# *4DB0614603C8_4DEF60A4017C_var*
begin
//#UC START# *4DB0614603C8_4DEF60A4017C_impl*
 Result := '2DROP';
//#UC END# *4DB0614603C8_4DEF60A4017C_impl*
end;//TkwDROP2.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.