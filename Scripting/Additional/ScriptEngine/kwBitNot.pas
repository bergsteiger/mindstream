unit kwBitNot;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBitNot.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwBitNot
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
 TkwBitNot = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBitNot
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwBitNot;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwBitNot

procedure TkwBitNot.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F27FA2603BA_var*
var
 l_A : Integer;
 //l_B : Integer;
//#UC END# *4DAEEDE10285_4F27FA2603BA_var*
begin
//#UC START# *4DAEEDE10285_4F27FA2603BA_impl*
 l_A := aCtx.rEngine.PopInt;
 //l_B := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushInt(NOT l_A);
//#UC END# *4DAEEDE10285_4F27FA2603BA_impl*
end;//TkwBitNot.DoDoIt

class function TkwBitNot.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F27FA2603BA_var*
//#UC END# *4DB0614603C8_4F27FA2603BA_var*
begin
//#UC START# *4DB0614603C8_4F27FA2603BA_impl*
 Result := '~';
//#UC END# *4DB0614603C8_4F27FA2603BA_impl*
end;//TkwBitNot.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.