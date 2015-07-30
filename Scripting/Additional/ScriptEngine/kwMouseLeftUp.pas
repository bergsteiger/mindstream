unit kwMouseLeftUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseLeftUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_LeftUp
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
 TkwMouseLeftUp = {scriptword} class(TkwMouseUpDownSupport)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseLeftUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseLeftUp

function TkwMouseLeftUp.GetMouseEventFlag: Integer;
//#UC START# *4F967BED0186_4F71C14601E6_var*
//#UC END# *4F967BED0186_4F71C14601E6_var*
begin
//#UC START# *4F967BED0186_4F71C14601E6_impl*
 Result := MOUSEEVENTF_LEFTUP;
//#UC END# *4F967BED0186_4F71C14601E6_impl*
end;//TkwMouseLeftUp.GetMouseEventFlag

class function TkwMouseLeftUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:LeftUp';
end;//TkwMouseLeftUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_LeftUp
 TkwMouseLeftUp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.