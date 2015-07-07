unit kwPopVcmFormFormID;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopVcmFormFormID.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::pop_vcm_form_FormID
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
  vcmEntityForm,
  tfwScriptingInterfaces,
  Forms,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}
type
 {$Include ..\ScriptEngine\kwVCMFormFromStackWord.imp.pas}
 TkwPopVcmFormFormID = class(_kwVCMFormFromStackWord_)
 protected
 // realized methods
   procedure DoVCMForm(aForm: TvcmEntityForm;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopVcmFormFormID
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwPopVcmFormFormID;

{$Include ..\ScriptEngine\kwVCMFormFromStackWord.imp.pas}

// start class TkwPopVcmFormFormID

procedure TkwPopVcmFormFormID.DoVCMForm(aForm: TvcmEntityForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145DF03C7_4F21462001BB_var*
//#UC END# *4F2145DF03C7_4F21462001BB_var*
begin
//#UC START# *4F2145DF03C7_4F21462001BB_impl*
 aCtx.rEngine.PushString(aForm.FormID.rName);
//#UC END# *4F2145DF03C7_4F21462001BB_impl*
end;//TkwPopVcmFormFormID.DoVCMForm

class function TkwPopVcmFormFormID.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:vcm:form:FormID';
end;//TkwPopVcmFormFormID.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\kwVCMFormFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.