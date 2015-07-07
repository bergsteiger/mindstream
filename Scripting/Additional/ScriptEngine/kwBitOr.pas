unit kwBitOr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBitOr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwBitOr
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
 TkwBitOr = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBitOr
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwBitOr;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwBitOr

procedure TkwBitOr.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F27F9C40252_var*
var
 l_A : Integer;
 l_B : Integer;
//#UC END# *4DAEEDE10285_4F27F9C40252_var*
begin
//#UC START# *4DAEEDE10285_4F27F9C40252_impl*
 l_A := aCtx.rEngine.PopInt;
 l_B := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushInt(l_A OR l_B);
//#UC END# *4DAEEDE10285_4F27F9C40252_impl*
end;//TkwBitOr.DoDoIt

class function TkwBitOr.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F27F9C40252_var*
//#UC END# *4DB0614603C8_4F27F9C40252_var*
begin
//#UC START# *4DB0614603C8_4F27F9C40252_impl*
 Result := '|';
//#UC END# *4DB0614603C8_4F27F9C40252_impl*
end;//TkwBitOr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.