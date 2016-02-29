unit kwWaitNo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWaitNo.pas"
// Начат: 28.04.2011 15:10
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::ModalDialogs::wait_No
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
 TkwWaitNo = {scriptword} class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitNo
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

// start class TkwWaitNo

procedure TkwWaitNo.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB94AE60059_var*
//#UC END# *4DAEEDE10285_4DB94AE60059_var*
begin
//#UC START# *4DAEEDE10285_4DB94AE60059_impl*
 {$IfNDef NoVCL}
 Tl3BatchService.Instance.PushAnswer(mrNo);
 {$Else  NoVCL}
 Assert(false);
 {$EndIf NoVCL}
//#UC END# *4DAEEDE10285_4DB94AE60059_impl*
end;//TkwWaitNo.DoDoIt

class function TkwWaitNo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:No';
end;//TkwWaitNo.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCL

initialization
{$If not defined(NoScripts) AND not defined(NoVCL)}
// Регистрация wait_No
 TkwWaitNo.RegisterInEngine;
{$IfEnd} //not NoScripts AND not NoVCL

end.