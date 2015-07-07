unit kwVcmFindForm;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmFindForm.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_FindForm
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
 TkwVcmFindForm = class(_VCMWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmFindForm
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  vcmInterfaces,
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

type _Instance_R_ = TkwVcmFindForm;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\VCMWord.imp.pas}

// start class TkwVcmFindForm

procedure TkwVcmFindForm.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F215ADB00AF_var*
var
 l_Res : Boolean;
 //l_N  : AnsiString;
 l_F  : AnsiString;
 l_ID : TvcmFormID;
 l_EF : IvcmEntityForm;
 l_UT : Integer;
//#UC END# *4DAEEDE10285_4F215ADB00AF_var*
begin
//#UC START# *4DAEEDE10285_4F215ADB00AF_impl*
 l_Res := false;
 try
  l_F := aCtx.rEngine.PopDelphiString;
  //l_N := aCtx.rEngine.PopDelphiString;
  l_UT := aCtx.rEngine.PopInt;
  l_ID.rName := l_F;
  l_ID.rID := 0;
  l_Res := vcmDispatcher.FormDispatcher.
   CurrentMainForm.AsContainer.HasForm(l_ID, vcm_ztAny, true,  @l_EF, l_UT);
 finally
  aCtx.rEngine.PushBool(l_Res);
 end;//try..finally
 if l_Res then
 begin
  aCtx.rEngine.PushObj(l_EF.VCLWinControl);
  aCtx.rEngine.Swap;
 end;//l_Res
//#UC END# *4DAEEDE10285_4F215ADB00AF_impl*
end;//TkwVcmFindForm.DoDoIt

class function TkwVcmFindForm.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:FindForm';
end;//TkwVcmFindForm.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.