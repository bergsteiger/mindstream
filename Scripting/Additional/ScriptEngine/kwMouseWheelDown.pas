unit kwMouseWheelDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseWheelDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::Mouse_WheelDown
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
  tfwScriptingInterfaces,
  Windows,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwMouseWheelSupport.imp.pas}
 TkwMouseWheelDown = {final} class(_kwMouseWheelSupport_)
 protected
 // realized methods
   function GetLineCount(const aCtx: TtfwContext): Integer; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMouseWheelDown
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

type _Instance_R_ = TkwMouseWheelDown;

{$Include ..\ScriptEngine\kwMouseWheelSupport.imp.pas}

// start class TkwMouseWheelDown

function TkwMouseWheelDown.GetLineCount(const aCtx: TtfwContext): Integer;
//#UC START# *50C861750031_50C8532700B0_var*
//#UC END# *50C861750031_50C8532700B0_var*
begin
//#UC START# *50C861750031_50C8532700B0_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задано количество линий для прокрутки', aCtx);
 Result := - aCtx.rEngine.PopInt;
//#UC END# *50C861750031_50C8532700B0_impl*
end;//TkwMouseWheelDown.GetLineCount

class function TkwMouseWheelDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Mouse:WheelDown';
end;//TkwMouseWheelDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMouseWheelSupport.imp.pas}
{$IfEnd} //not NoScripts

end.