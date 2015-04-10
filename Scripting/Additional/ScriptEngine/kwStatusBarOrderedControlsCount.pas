unit kwStatusBarOrderedControlsCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStatusBarOrderedControlsCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::StatusBar_OrderedControlsCount
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
 TkwStatusBarOrderedControlsCount = {final} class(_kwStatusBarFromStackWord_)
 protected
 // realized methods
   procedure DoStatusBar(aControl: TnscStatusBar;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStatusBarOrderedControlsCount
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

type _Instance_R_ = TkwStatusBarOrderedControlsCount;

{$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}

// start class TkwStatusBarOrderedControlsCount

procedure TkwStatusBarOrderedControlsCount.DoStatusBar(aControl: TnscStatusBar;
  const aCtx: TtfwContext);
//#UC START# *505C850A03E5_505C859E026C_var*
//#UC END# *505C850A03E5_505C859E026C_var*
begin
//#UC START# *505C850A03E5_505C859E026C_impl*
 aCtx.rEngine.PushInt(aControl.OrderedControlsCount);
//#UC END# *505C850A03E5_505C859E026C_impl*
end;//TkwStatusBarOrderedControlsCount.DoStatusBar

class function TkwStatusBarOrderedControlsCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StatusBar:OrderedControlsCount';
end;//TkwStatusBarOrderedControlsCount.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.