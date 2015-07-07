unit kwPopVtStatusPanelGetText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopVtStatusPanelGetText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::pop_vtStatusPanel_GetText
//
// *Описание:* Возвращает текст панели
// *Формат:*
// {code}
// aPanel pop:vtStatusPanel:GetText
// {code}
// aPanel - объект класса TvtStatusPanel, который можно получить с помощью pop:vtStatusPanel:GetText
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
  vtStatusBar,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\vtStatusPanelFromStack.imp.pas}
 TkwPopVtStatusPanelGetText = {final} class(_vtStatusPanelFromStack_)
  {* *Описание:* Возвращает текст панели
*Формат:* 
[code]
aPanel pop:vtStatusPanel:GetText
[code]
aPanel - объект класса TvtStatusPanel, который можно получить с помощью pop:vtStatusPanel:GetText }
 protected
 // realized methods
   procedure DoGetvtStatusPanel(aControl: TvtStatusPanel;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopVtStatusPanelGetText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopVtStatusPanelGetText;

{$Include ..\ScriptEngine\vtStatusPanelFromStack.imp.pas}

// start class TkwPopVtStatusPanelGetText

procedure TkwPopVtStatusPanelGetText.DoGetvtStatusPanel(aControl: TvtStatusPanel;
  const aCtx: TtfwContext);
//#UC START# *53F70383035F_53F702D40268_var*
//#UC END# *53F70383035F_53F702D40268_var*
begin
//#UC START# *53F70383035F_53F702D40268_impl*
 aCtx.rEngine.PushString(aControl.Text);
//#UC END# *53F70383035F_53F702D40268_impl*
end;//TkwPopVtStatusPanelGetText.DoGetvtStatusPanel

class function TkwPopVtStatusPanelGetText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:vtStatusPanel:GetText';
end;//TkwPopVtStatusPanelGetText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\vtStatusPanelFromStack.imp.pas}
{$IfEnd} //not NoScripts

end.