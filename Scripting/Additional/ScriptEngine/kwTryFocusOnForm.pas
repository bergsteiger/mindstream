unit kwTryFocusOnForm;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTryFocusOnForm.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::TryFocusOnForm
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _VCMWord_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\VCMWord.imp.pas}
 TkwTryFocusOnForm = {final} class(_VCMWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwTryFocusOnForm
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  vcmInterfaces,
  afwFacade,
  SysUtils,
  Forms,
  vcmEntityForm,
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  vcmForm,
  Controls,
  StdRes,
  vcmBase
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwTryFocusOnForm;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\VCMWord.imp.pas}

// start class TkwTryFocusOnForm

procedure TkwTryFocusOnForm.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_507BDC31028B_var*
var
 l_Res : Boolean;
 l_N  : AnsiString;
 l_F  : AnsiString;
 l_ID : TvcmFormID;
 l_EF : IvcmEntityForm;
 l_CF : IvcmEntityForm;
 l_CCF : IvcmContainer;
 l_C  : TWinControl;
 l_UT : Integer;
 l_Form  : TafwCustomForm;
 l_Force : Boolean;
 l_TryAgain : Boolean;
//#UC END# *4DAEEDE10285_507BDC31028B_var*
begin
//#UC START# *4DAEEDE10285_507BDC31028B_impl*
 l_Res := false;
 try
  l_F := aCtx.rEngine.PopDelphiString;
  l_N := aCtx.rEngine.PopDelphiString;
  l_UT := aCtx.rEngine.PopInt;
  l_Force := aCtx.rEngine.PopBool;
  l_ID.rName := l_F;
  l_ID.rID := 0;

  repeat
   l_TryAgain := false;
   l_Res := false;

   l_EF := nil;
   if not l_Res then
    l_Res := vcmDispatcher.FormDispatcher.
     CurrentMainForm.AsContainer.HasForm(l_ID, vcm_ztAny, true,  @l_EF, l_UT);

   if not l_Res then
   begin
    //это для модальных форм
    l_EF := nil;
    if Supports(Screen.ActiveForm, IvcmEntityForm, l_CF) then
    begin
     if l_CF.SameName(l_ID) then
      if (l_UT = vcm_utAny) OR
         ((l_CF.CurUsertypeDef <> nil) AND (l_CF.CurUsertypeDef.ID = l_UT)) then
      begin
       l_Res := true;
       l_EF := l_CF;
      end;//l_UT = vcm_utAny
     if not l_Res then
     begin
      l_EF := nil;
      if Supports(l_CF, IvcmContainer, l_CCF) then
       l_Res := l_CCF.HasForm(l_ID, vcm_ztAny, true,  @l_EF, l_UT);
     end;//not l_Res
    end;//Supports(Screen.ActiveForm, IvcmEntityForm, l_CF)
   end;//not l_Res

   if l_Res then
   begin
    l_C := l_EF.VCLWinControl.FindComponent(l_N) As TWinControl;
    RunnerAssert(l_C <> nil, '', aCtx);
    if l_C.CanFocus OR l_Force then
    begin
     l_Form := l_EF.VCLWinControl As TafwCustomForm;
     while (l_Form <> nil) do
     begin
      l_Form.Visible := true;
      // - иначе плавающее окно оглавления может быть скрыто, ну и огребаем
      if l_Force AND (l_Form Is TvcmEntityForm) then
      begin
       TvcmEntityForm(l_Form).SetActiveAndShowInParent;
       afw.ProcessMessages;
       if (l_EF.VCLWinControl = nil) then
       // - в результате afw.ProcessMessages - форма закрылась
       //   надо будет повторить процесс ещё раз
       // http://mdp.garant.ru/pages/viewpage.action?pageId=380623943&focusedCommentId=382411099#comment-382411099
       begin
        l_TryAgain := true;
        l_C := nil;
        l_Form := nil;
        l_EF := nil;
        l_Res := false;
        Sleep(300);
        afw.ProcessMessages;
        Sleep(300);
        break;
       end;//l_EF.VCLWinControl = nil
      end;//l_Force
      l_Form := afw.GetAnotherParentForm(l_Form);
     end;//while (l_F <> nil)
     if l_TryAgain then
      continue;
     if l_C.CanFocus then
      l_C.SetFocus;
     l_Res := l_C.Focused;
     if not l_Res then
      if l_C.CanFocus then
      begin
       Windows.SetFocus(l_C.Handle);
       //l_Res := l_C.Focused;
       l_Res := true;
       // http://mdp.garant.ru/pages/viewpage.action?pageId=342859090&focusedCommentId=342862607#comment-342862607
      end;//l_C.CanFocus
    end//l_C.CanFocus
    else
     l_Res := false;
   end;//l_Res
  until not l_TryAgain; 
 finally
  aCtx.rEngine.PushBool(l_Res);
 end;//try..finally
//#UC END# *4DAEEDE10285_507BDC31028B_impl*
end;//TkwTryFocusOnForm.DoDoIt

class function TkwTryFocusOnForm.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'TryFocusOnForm';
end;//TkwTryFocusOnForm.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.