unit kwPopControlControlCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopControlControlCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_control_ControlCount
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
  Controls,
  tfwScriptingInterfaces,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 TkwPopControlControlCount = class(_kwWinControlFromStackWord_)
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopControlControlCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopControlControlCount;

{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class TkwPopControlControlCount

procedure TkwPopControlControlCount.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_4F2151410059_var*
//#UC END# *4F212C930149_4F2151410059_var*
begin
//#UC START# *4F212C930149_4F2151410059_impl*
 aCtx.rEngine.PushInt(aControl.ControlCount);
//#UC END# *4F212C930149_4F2151410059_impl*
end;//TkwPopControlControlCount.DoWinControl

class function TkwPopControlControlCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:control:ControlCount';
end;//TkwPopControlControlCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.