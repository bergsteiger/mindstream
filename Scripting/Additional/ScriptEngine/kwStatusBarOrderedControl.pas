unit kwStatusBarOrderedControl;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStatusBarOrderedControl.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::StatusBar_OrderedControl
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  nscStatusBar,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}
 TkwStatusBarOrderedControl = {final} class(_kwStatusBarFromStackWord_)
 protected
 // realized methods
   procedure DoStatusBar(aControl: TnscStatusBar;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStatusBarOrderedControl
{$IfEnd} //Nemesis AND not NoScripts

implementation

{$If defined(Nemesis) AND not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //Nemesis AND not NoScripts

{$If defined(Nemesis) AND not defined(NoScripts)}

type _Instance_R_ = TkwStatusBarOrderedControl;

{$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}

// start class TkwStatusBarOrderedControl

procedure TkwStatusBarOrderedControl.DoStatusBar(aControl: TnscStatusBar;
  const aCtx: TtfwContext);
//#UC START# *505C850A03E5_505C85B30020_var*
//#UC END# *505C850A03E5_505C85B30020_var*
begin
//#UC START# *505C850A03E5_505C85B30020_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан номер контрола', aCtx);
 aCtx.rEngine.PushObj(aControl.OrderedControls[aCtx.rEngine.PopInt]);
//#UC END# *505C850A03E5_505C85B30020_impl*
end;//TkwStatusBarOrderedControl.DoStatusBar

class function TkwStatusBarOrderedControl.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StatusBar:OrderedControl';
end;//TkwStatusBarOrderedControl.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.