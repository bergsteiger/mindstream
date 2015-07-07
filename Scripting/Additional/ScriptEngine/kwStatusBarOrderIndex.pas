unit kwStatusBarOrderIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStatusBarOrderIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StatusBarWords::StatusBar_OrderIndex
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
 TkwStatusBarOrderIndex = {final} class(_kwStatusBarFromStackWord_)
 protected
 // realized methods
   procedure DoStatusBar(aControl: TnscStatusBar;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStatusBarOrderIndex
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

type _Instance_R_ = TkwStatusBarOrderIndex;

{$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}

// start class TkwStatusBarOrderIndex

procedure TkwStatusBarOrderIndex.DoStatusBar(aControl: TnscStatusBar;
  const aCtx: TtfwContext);
//#UC START# *505C850A03E5_505C85C50286_var*
var
 aPanel: TObject;
//#UC END# *505C850A03E5_505C85C50286_var*
begin
//#UC START# *505C850A03E5_505C85C50286_impl*
 RunnerAssert(aCtx.rEngine.IsTopObj, 'Не задан контрол для определения индекса', aCtx);
 aPanel := aCtx.rEngine.PopObj;
 RunnerAssert(aPanel is TControl, 'Не задан контрол для определения индекса', aCtx);
 aCtx.rEngine.PushInt(aControl.OrderIndex[aPanel as TControl]);
//#UC END# *505C850A03E5_505C85C50286_impl*
end;//TkwStatusBarOrderIndex.DoStatusBar

class function TkwStatusBarOrderIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StatusBar:OrderIndex';
end;//TkwStatusBarOrderIndex.GetWordNameForRegister

{$IfEnd} //Nemesis AND not NoScripts

initialization
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwStatusBarFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

end.