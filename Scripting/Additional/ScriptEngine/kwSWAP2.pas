unit kwSWAP2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSWAP2.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwSWAP2
//
// Меняет местами две верхних пары-ячеек. ( x1 x2 x3 x4 -- x3 x4 x1 x2 )
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
 TkwSWAP2 = class(_tfwAutoregisteringWord_)
  {* Меняет местами две верхних пары-ячеек. ( x1 x2 x3 x4 -- x3 x4 x1 x2 ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSWAP2
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSWAP2;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwSWAP2

procedure TkwSWAP2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DEF60440255_var*
//#UC END# *4DAEEDE10285_4DEF60440255_var*
begin
//#UC START# *4DAEEDE10285_4DEF60440255_impl*
 aCtx.rEngine.Swap2;
//#UC END# *4DAEEDE10285_4DEF60440255_impl*
end;//TkwSWAP2.DoDoIt

class function TkwSWAP2.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DEF60440255_var*
//#UC END# *4DB0614603C8_4DEF60440255_var*
begin
//#UC START# *4DB0614603C8_4DEF60440255_impl*
 Result := '2SWAP';
 //Result := 'SWAP2';
//#UC END# *4DB0614603C8_4DEF60440255_impl*
end;//TkwSWAP2.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.