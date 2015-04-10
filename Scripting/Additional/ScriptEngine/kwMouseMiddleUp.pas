unit kwMouseMiddleUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseMiddleUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_MiddleUp
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
 TkwMouseMiddleUp = {final} class(_kwMouseUpDownSupport_)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseMiddleUp
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

type _Instance_R_ = TkwMouseMiddleUp;

{$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}

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
 {$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}
{$IfEnd} //not NoScripts

end.