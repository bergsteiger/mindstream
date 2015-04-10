unit kwBitAnd;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBitAnd.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwBitAnd
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
 TkwBitAnd = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBitAnd
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwBitAnd;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwBitAnd

procedure TkwBitAnd.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F27F9A10308_var*
var
 l_A : Integer;
 l_B : Integer;
//#UC END# *4DAEEDE10285_4F27F9A10308_var*
begin
//#UC START# *4DAEEDE10285_4F27F9A10308_impl*
 l_A := aCtx.rEngine.PopInt;
 l_B := aCtx.rEngine.PopInt;
 aCtx.rEngine.PushInt(l_A AND l_B);
//#UC END# *4DAEEDE10285_4F27F9A10308_impl*
end;//TkwBitAnd.DoDoIt

class function TkwBitAnd.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F27F9A10308_var*
//#UC END# *4DB0614603C8_4F27F9A10308_var*
begin
//#UC START# *4DB0614603C8_4F27F9A10308_impl*
 Result := '&';
//#UC END# *4DB0614603C8_4F27F9A10308_impl*
end;//TkwBitAnd.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.