{$IfNDef kwVGComboboxWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVGComboboxWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::VGSceneWords::kwVGComboboxWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwVGComboboxWord_imp}
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwVGControlWord.imp.pas}
 _kwVGComboboxWord_ = {final mixin} class(_kwVGControlWord_)
 protected
 // realized methods
   procedure DoVGControl(anObject: TvgControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoVGComboBox(aCombo: TvgComboBox;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwVGComboboxWord_
{$IfEnd} //not NoScripts AND not NoVGScene

{$Else kwVGComboboxWord_imp}

{$IfNDef kwVGComboboxWord_imp_impl}
{$Define kwVGComboboxWord_imp_impl}

{$If not defined(NoScripts) AND not defined(NoVGScene)}


{$Include ..\ScriptEngine\kwVGControlWord.imp.pas}

// start class _kwVGComboboxWord_

procedure _kwVGComboboxWord_.DoVGControl(anObject: TvgControl;
  const aCtx: TtfwContext);
//#UC START# *538DA11B0163_538DC04F021A_var*
//#UC END# *538DA11B0163_538DC04F021A_var*
begin
//#UC START# *538DA11B0163_538DC04F021A_impl*
 RunnerAssert(Assigned(anObject), 'Передан nil', aCtx);
 RunnerAssert(anObject is TvgComboBox, 'Это не TvgComboBox, а ' + anObject.ClassName, aCtx);
 DoVGComboBox(anObject as TvgComboBox, aCtx);
//#UC END# *538DA11B0163_538DC04F021A_impl*
end;//_kwVGComboboxWord_.DoVGControl

{$IfEnd} //not NoScripts AND not NoVGScene

{$Else  kwVGComboboxWord_imp_impl}
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwVGControlWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

{$EndIf kwVGComboboxWord_imp_impl}
{$EndIf kwVGComboboxWord_imp}
