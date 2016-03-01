unit kwMouseRightDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseRightDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_RightDown
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
 TkwMouseRightDown = {final scriptword} class(TkwMouseUpDownSupport)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseRightDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseRightDown

function TkwMouseRightDown.GetMouseEventFlag: Integer;
//#UC START# *4F967BED0186_4F967CAE02C4_var*
//#UC END# *4F967BED0186_4F967CAE02C4_var*
begin
//#UC START# *4F967BED0186_4F967CAE02C4_impl*
 Result := MOUSEEVENTF_RIGHTDOWN;
//#UC END# *4F967BED0186_4F967CAE02C4_impl*
end;//TkwMouseRightDown.GetMouseEventFlag

class function TkwMouseRightDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:RightDown';
end;//TkwMouseRightDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_RightDown
 TkwMouseRightDown.RegisterInEngine;
{$IfEnd} //not NoScripts

end.