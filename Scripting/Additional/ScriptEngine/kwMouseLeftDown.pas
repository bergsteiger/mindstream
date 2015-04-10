unit kwMouseLeftDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseLeftDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_LeftDown
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
  Windows,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}
 TkwMouseLeftDown = class(_kwMouseUpDownSupport_)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseLeftDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMouseLeftDown;

{$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}

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
 {$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}
{$IfEnd} //not NoScripts

end.