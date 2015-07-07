{$IfNDef kwVCMFormFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVCMFormFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::kwVCMFormFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwVCMFormFromStackWord_imp}
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\kwFormFromStackWord.imp.pas}
 _kwVCMFormFromStackWord_ = {abstract mixin} class(_kwFormFromStackWord_)
 protected
 // realized methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoVCMForm(aForm: TvcmEntityForm;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwVCMFormFromStackWord_
{$IfEnd} //not NoScripts AND not NoVCM

{$Else kwVCMFormFromStackWord_imp}

{$IfNDef kwVCMFormFromStackWord_imp_impl}
{$Define kwVCMFormFromStackWord_imp_impl}

{$If not defined(NoScripts) AND not defined(NoVCM)}


{$Include ..\ScriptEngine\kwFormFromStackWord.imp.pas}

// start class _kwVCMFormFromStackWord_

procedure _kwVCMFormFromStackWord_.DoForm(aForm: TForm;
  const aCtx: TtfwContext);
//#UC START# *4F2145550317_4F2145C3024A_var*
//#UC END# *4F2145550317_4F2145C3024A_var*
begin
//#UC START# *4F2145550317_4F2145C3024A_impl*
 DoVCMForm(aForm As TvcmEntityForm, aCtx);
//#UC END# *4F2145550317_4F2145C3024A_impl*
end;//_kwVCMFormFromStackWord_.DoForm

{$IfEnd} //not NoScripts AND not NoVCM

{$Else  kwVCMFormFromStackWord_imp_impl}
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\kwFormFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

{$EndIf kwVCMFormFromStackWord_imp_impl}
{$EndIf kwVCMFormFromStackWord_imp}
