unit kwNIP;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNIP.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwNIP
//
// Удаляет первый элемент ниже вершины стека. ( x1 x2 -- x2 )
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
 TkwNIP = class(_tfwAutoregisteringWord_)
  {* Удаляет первый элемент ниже вершины стека. ( x1 x2 -- x2 ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNIP
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNIP;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwNIP

procedure TkwNIP.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DEF60AD017D_var*
//#UC END# *4DAEEDE10285_4DEF60AD017D_var*
begin
//#UC START# *4DAEEDE10285_4DEF60AD017D_impl*
 aCtx.rEngine.Nip;
//#UC END# *4DAEEDE10285_4DEF60AD017D_impl*
end;//TkwNIP.DoDoIt

class function TkwNIP.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DEF60AD017D_var*
//#UC END# *4DB0614603C8_4DEF60AD017D_var*
begin
//#UC START# *4DB0614603C8_4DEF60AD017D_impl*
 Result := 'NIP';
//#UC END# *4DB0614603C8_4DEF60AD017D_impl*
end;//TkwNIP.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.