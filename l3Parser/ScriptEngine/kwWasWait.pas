unit kwWasWait;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWasWait.pas"
// Начат: 28.04.2011 15:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::Was_Wait
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCL)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts AND not NoVCL

{$If not defined(NoScripts) AND not defined(NoVCL)}
type
 _afwImpurity_Parent_ = TtfwRegisterableWord;
 {$Include ..\ScriptEngine\afwImpurity.imp.pas}
 TkwWasWait = {scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWasWait
{$IfEnd} //not NoScripts AND not NoVCL

implementation

{$If not defined(NoScripts) AND not defined(NoVCL)}
uses
  l3BatchService,
  Controls
  ;
{$IfEnd} //not NoScripts AND not NoVCL

{$If not defined(NoScripts) AND not defined(NoVCL)}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWasWait

procedure TkwWasWait.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB94B3103DB_var*
var
 l_WasWait : Boolean;
//#UC END# *4DAEEDE10285_4DB94B3103DB_var*
begin
//#UC START# *4DAEEDE10285_4DB94B3103DB_impl*
 l_WasWait := false;
 try
  l_WasWait := Tl3BatchService.Instance.CheckWasDialog;
 except
  aCtx.rEngine.PushBool(false);
  raise;
 end;//l_WasWait
 aCtx.rEngine.PushBool(l_WasWait);
//#UC END# *4DAEEDE10285_4DB94B3103DB_impl*
end;//TkwWasWait.DoDoIt

class function TkwWasWait.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'waited:?';
end;//TkwWasWait.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCL

initialization
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация Was_Wait
 TkwWasWait.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVCL

end.