unit kwMouseRightUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMouseRightUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MouseInput::Mouse_RightUp
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
 TkwMouseRightUp = {final scriptword} class(TkwMouseUpDownSupport)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseRightUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMouseRightUp

function TkwMouseRightUp.GetMouseEventFlag: Integer;
//#UC START# *4F967BED0186_4F967CBF016D_var*
//#UC END# *4F967BED0186_4F967CBF016D_var*
begin
//#UC START# *4F967BED0186_4F967CBF016D_impl*
 Result := MOUSEEVENTF_RIGHTUP;
//#UC END# *4F967BED0186_4F967CBF016D_impl*
end;//TkwMouseRightUp.GetMouseEventFlag

class function TkwMouseRightUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:RightUp';
end;//TkwMouseRightUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Mouse_RightUp
 TkwMouseRightUp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.