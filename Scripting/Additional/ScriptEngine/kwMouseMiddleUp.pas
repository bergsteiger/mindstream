unit kwMouseMiddleUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseMiddleUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_MiddleUp
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
 TkwMouseMiddleUp = {final scriptword} class(TkwMouseUpDownSupport)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseMiddleUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseMiddleUp

function TkwMouseMiddleUp.GetMouseEventFlag: Integer;
//#UC START# *4F967BED0186_4F967CDF0244_var*
//#UC END# *4F967BED0186_4F967CDF0244_var*
begin
//#UC START# *4F967BED0186_4F967CDF0244_impl*
 Result := MOUSEEVENTF_MIDDLEUP;
//#UC END# *4F967BED0186_4F967CDF0244_impl*
end;//TkwMouseMiddleUp.GetMouseEventFlag

class function TkwMouseMiddleUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:MiddleUp';
end;//TkwMouseMiddleUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_MiddleUp
 TkwMouseMiddleUp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.