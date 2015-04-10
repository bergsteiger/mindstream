unit kwAskWindowToCloseItself;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwAskWindowToCloseItself.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::AskWindowToCloseItself
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwAskWindowToCloseItself = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAskWindowToCloseItself
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  Messages,
  Controls,
  Forms
  {$If not defined(NoVCM)}
  ,
  vcmForm
  {$IfEnd} //not NoVCM
  ,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwAskWindowToCloseItself;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwAskWindowToCloseItself

procedure TkwAskWindowToCloseItself.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_501A7A1F01E3_var*
var
 l_Window: TObject;
 l_Handle: THandle;
//#UC END# *4DAEEDE10285_501A7A1F01E3_var*
begin
//#UC START# *4DAEEDE10285_501A7A1F01E3_impl*
 if aCtx.rEngine.IsTopInt then
 begin
  l_Handle := THandle(aCtx.rEngine.PopInt);
  l_Window := FindControl(l_Handle);
 end else
  l_Handle := 0;

 if Assigned(l_Window) or
  aCtx.rEngine.IsTopObj then
 begin
  if not Assigned(l_Window) then
   l_Window := aCtx.rEngine.PopObj;
  RunnerAssert(l_Window is TWinControl, 'Где окно?!', aCtx);
  {$IfNDef NoVCM}
  if l_Window is TvcmInterfacedForm then
  begin
   TvcmInterfacedForm(l_Window).SafeClose;
   Exit;
  end else
  {$EndIf  NoVCM}
  if l_Window is TCustomForm then
  begin
   TCustomForm(l_Window).Close;
   Exit;
  end;

  if l_Handle <> 0 then
   l_Handle := TWinControl(l_Window).Handle;
 end;
 RunnerAssert(l_Handle <> 0, 'Где окно?!', aCtx);
 PostMessage(l_Handle, WM_CLOSE, 0, 0);
//#UC END# *4DAEEDE10285_501A7A1F01E3_impl*
end;//TkwAskWindowToCloseItself.DoDoIt

class function TkwAskWindowToCloseItself.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'AskWindowToCloseItself';
end;//TkwAskWindowToCloseItself.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.