unit kwMouseRightDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseRightDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_RightDown
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
 TkwMouseRightDown = {final} class(_kwMouseUpDownSupport_)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseRightDown
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

type _Instance_R_ = TkwMouseRightDown;

{$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}

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
 {$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}
{$IfEnd} //not NoScripts

end.