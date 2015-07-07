unit kwMouseMiddleDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseMiddleDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_MiddleDown
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
 TkwMouseMiddleDown = {final} class(_kwMouseUpDownSupport_)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseMiddleDown
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

type _Instance_R_ = TkwMouseMiddleDown;

{$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}

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
 {$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}
{$IfEnd} //not NoScripts

end.