unit kwAND;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwAND.pas"
// Начат: 29.04.2011 18:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwAND
//
// &&
// ( x1 x2 -- x3 )
// x3 поразрядное логическое "и" x1 и x2.
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
 TkwAND = class(_tfwAutoregisteringWord_)
  {* &&                                                             
( x1 x2 -- x3 )
            x3 поразрядное логическое "и" x1 и x2. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAND
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwAND;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwAND

procedure TkwAND.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBACC8C0151_var*
var
 l_V1 : Boolean;
 l_V2 : Boolean;
//#UC END# *4DAEEDE10285_4DBACC8C0151_var*
begin
//#UC START# *4DAEEDE10285_4DBACC8C0151_impl*
 l_V1 := aCtx.rEngine.PopBool;
 l_V2 := aCtx.rEngine.PopBool;
 aCtx.rEngine.PushBool(l_V1 AND l_V2);
//#UC END# *4DAEEDE10285_4DBACC8C0151_impl*
end;//TkwAND.DoDoIt

class function TkwAND.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DBACC8C0151_var*
//#UC END# *4DB0614603C8_4DBACC8C0151_var*
begin
//#UC START# *4DB0614603C8_4DBACC8C0151_impl*
 Result := '&&';
//#UC END# *4DB0614603C8_4DBACC8C0151_impl*
end;//TkwAND.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.