unit kwApplicationActionIdle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwApplicationActionIdle.pas"
// Начат: 28.04.2011 17:53
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::application_ActionIdle
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 _SystemWord_Parent_ = TtfwRegisterableWord;
 {$Include ..\ScriptEngine\SystemWord.imp.pas}
 TkwApplicationActionIdle = {scriptword} class(_SystemWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwApplicationActionIdle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Classes,
  Windows,
  Controls,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\SystemWord.imp.pas}

// start class TkwApplicationActionIdle

procedure TkwApplicationActionIdle.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB9712B02AE_var*
//#UC END# *4DAEEDE10285_4DB9712B02AE_var*
begin
//#UC START# *4DAEEDE10285_4DB9712B02AE_impl*
 try
  {$IfDef l3HackedVCL}
  Application.CallActionIdle;
  {$EndIf l3HackedVCL}
 except
  on EListError do;  //541670158
 end;
//#UC END# *4DAEEDE10285_4DB9712B02AE_impl*
end;//TkwApplicationActionIdle.DoDoIt

class function TkwApplicationActionIdle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:ActionIdle';
end;//TkwApplicationActionIdle.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация application_ActionIdle
 TkwApplicationActionIdle.RegisterInEngine;
{$IfEnd} //not NoScripts

end.