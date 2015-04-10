unit kwOR;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwOR.pas"
// Начат: 29.04.2011 18:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwOR
//
// ||
// ( x1 x2 -- x3 )
// x3 - поразрядное включающее или x1 и x2.
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
 TkwOR = class(_tfwAutoregisteringWord_)
  {* ||
( x1 x2 -- x3 )
            x3 - поразрядное включающее или x1 и x2. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwOR
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwOR;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwOR

procedure TkwOR.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DBACCBB0140_var*
var
 l_V1 : Boolean;
 l_V2 : Boolean;
//#UC END# *4DAEEDE10285_4DBACCBB0140_var*
begin
//#UC START# *4DAEEDE10285_4DBACCBB0140_impl*
 l_V1 := aCtx.rEngine.PopBool;
 l_V2 := aCtx.rEngine.PopBool;
 aCtx.rEngine.PushBool(l_V1 OR l_V2);
//#UC END# *4DAEEDE10285_4DBACCBB0140_impl*
end;//TkwOR.DoDoIt

class function TkwOR.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DBACCBB0140_var*
//#UC END# *4DB0614603C8_4DBACCBB0140_var*
begin
//#UC START# *4DB0614603C8_4DBACCBB0140_impl*
 Result := '||';
//#UC END# *4DB0614603C8_4DBACCBB0140_impl*
end;//TkwOR.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.