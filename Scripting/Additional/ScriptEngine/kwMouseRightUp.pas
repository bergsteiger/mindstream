unit kwMouseRightUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseRightUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_RightUp
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
 TkwMouseRightUp = {final} class(_kwMouseUpDownSupport_)
 protected
 // realized methods
   function GetMouseEventFlag: Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseRightUp
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

type _Instance_R_ = TkwMouseRightUp;

{$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}

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
 {$Include ..\ScriptEngine\kwMouseUpDownSupport.imp.pas}
{$IfEnd} //not NoScripts

end.