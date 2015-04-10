unit kwWaitChoice;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWaitChoice.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ModalDialogs::wait_Choice
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
 _afwImpurity_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\afwImpurity.imp.pas}
 TkwWaitChoice = {final} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitChoice
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWaitChoice;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWaitChoice

procedure TkwWaitChoice.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FFFF8520204_var*
//#UC END# *4DAEEDE10285_4FFFF8520204_var*
begin
//#UC START# *4DAEEDE10285_4FFFF8520204_impl*
 {$If defined(nsTest)}
 AfwSetAnswer(-aCtx.rEngine.PopInt);
 {$IfEnd} //nsTest
//#UC END# *4DAEEDE10285_4FFFF8520204_impl*
end;//TkwWaitChoice.DoDoIt

class function TkwWaitChoice.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Choice';
end;//TkwWaitChoice.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.