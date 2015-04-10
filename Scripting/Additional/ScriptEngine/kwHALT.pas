unit kwHALT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwHALT.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CodeFlowWords::HALT
//
// Прервать выполяемый скрипт
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
 TkwHALT = {final} class(_tfwAutoregisteringWord_)
  {* Прервать выполяемый скрипт }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwHALT
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwHALT;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwHALT

procedure TkwHALT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F2163A30300_var*
//#UC END# *4DAEEDE10285_4F2163A30300_var*
begin
//#UC START# *4DAEEDE10285_4F2163A30300_impl*
 raise EtfwHalt.Create('Выход из скрипта');
//#UC END# *4DAEEDE10285_4F2163A30300_impl*
end;//TkwHALT.DoDoIt

class function TkwHALT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'HALT';
end;//TkwHALT.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.