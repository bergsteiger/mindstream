unit kwMouseLeftDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseLeftDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_LeftDown
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwMouseUpDownSupport
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMouseLeftDown = {scriptword} class(TkwMouseUpDownSupport)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseLeftDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseLeftDown

function TkwMouseLeftDown.GetMouseEventFlag: Integer;
//#UC START# *4F967BED0186_4F71C11F02F2_var*
//#UC END# *4F967BED0186_4F71C11F02F2_var*
begin
//#UC START# *4F967BED0186_4F71C11F02F2_impl*
 Result := MOUSEEVENTF_LEFTDOWN;
//#UC END# *4F967BED0186_4F71C11F02F2_impl*
end;//TkwMouseLeftDown.GetMouseEventFlag

class function TkwMouseLeftDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:LeftDown';
end;//TkwMouseLeftDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_LeftDown
 TkwMouseLeftDown.RegisterInEngine;
{$IfEnd} //not NoScripts

end.