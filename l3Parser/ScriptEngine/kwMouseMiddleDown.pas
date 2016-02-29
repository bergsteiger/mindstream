unit kwMouseMiddleDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseMiddleDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_MiddleDown
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
 TkwMouseMiddleDown = {final scriptword} class(TkwMouseUpDownSupport)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseMiddleDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseMiddleDown

function TkwMouseMiddleDown.GetMouseEventFlag: Integer;
//#UC START# *4F967BED0186_4F967CF70162_var*
//#UC END# *4F967BED0186_4F967CF70162_var*
begin
//#UC START# *4F967BED0186_4F967CF70162_impl*
 Result := MOUSEEVENTF_MIDDLEDOWN;
//#UC END# *4F967BED0186_4F967CF70162_impl*
end;//TkwMouseMiddleDown.GetMouseEventFlag

class function TkwMouseMiddleDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:MiddleDown';
end;//TkwMouseMiddleDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_MiddleDown
 TkwMouseMiddleDown.RegisterInEngine;
{$IfEnd} //not NoScripts

end.