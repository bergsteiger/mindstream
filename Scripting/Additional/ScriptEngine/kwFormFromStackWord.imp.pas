{$IfNDef kwFormFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFormFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::kwFormFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwFormFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCustomFormFromStackWord.imp.pas}
 _kwFormFromStackWord_ = {abstract mixin} class(_kwCustomFormFromStackWord_)
 protected
 // realized methods
   procedure DoCustomForm(aForm: TCustomForm;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwFormFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwFormFromStackWord_imp}

{$IfNDef kwFormFromStackWord_imp_impl}
{$Define kwFormFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwCustomFormFromStackWord.imp.pas}

type
  TFormHack = {abstract} class(TForm)
  end;//TFormHack

// start class _kwFormFromStackWord_

procedure _kwFormFromStackWord_.DoCustomForm(aForm: TCustomForm;
  const aCtx: TtfwContext);
//#UC START# *4F2A69ED0387_4F2145340223_var*
//#UC END# *4F2A69ED0387_4F2145340223_var*
begin
//#UC START# *4F2A69ED0387_4F2145340223_impl*
 DoForm(aForm As TForm, aCtx);
//#UC END# *4F2A69ED0387_4F2145340223_impl*
end;//_kwFormFromStackWord_.DoCustomForm

{$IfEnd} //not NoScripts

{$Else  kwFormFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCustomFormFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwFormFromStackWord_imp_impl}
{$EndIf kwFormFromStackWord_imp}
