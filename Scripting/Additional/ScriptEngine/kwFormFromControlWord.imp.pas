{$IfNDef kwFormFromControlWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFormFromControlWord.imp.pas"
// Начат: 03.11.2011 13:22
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::kwFormFromControlWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwFormFromControlWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlWord.imp.pas}
 _kwFormFromControlWord_ = {abstract mixin} class(_kwControlWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoForm(aForm: TForm;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwFormFromControlWord_
{$IfEnd} //not NoScripts

{$Else kwFormFromControlWord_imp}

{$IfNDef kwFormFromControlWord_imp_impl}
{$Define kwFormFromControlWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlWord.imp.pas}

// start class _kwFormFromControlWord_

procedure _kwFormFromControlWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4DB98B990054_4EB25D530395_var*
var
 l_F : TafwCustomForm;
//#UC END# *4DB98B990054_4EB25D530395_var*
begin
//#UC START# *4DB98B990054_4EB25D530395_impl*
 l_F := afw.GetParentForm(aControl);
 RunnerAssert(l_F <> nil, 'Не найдена родительская форма для ' + aControl.Name, aCtx);
 DoForm(TForm(l_F), aCtx);
//#UC END# *4DB98B990054_4EB25D530395_impl*
end;//_kwFormFromControlWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwFormFromControlWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwFormFromControlWord_imp_impl}
{$EndIf kwFormFromControlWord_imp}
