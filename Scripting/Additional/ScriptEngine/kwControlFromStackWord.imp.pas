{$IfNDef kwControlFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwControlFromStackWord.imp.pas"
// Начат: 26.01.2012 14:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::VCL bindings::kwControlFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwControlFromStackWord_imp}
{$If not defined(NoScripts)}
 _kwControlFromStackWord_ = {abstract mixin} class(TkwComponentFromStackWord)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwControlFromStackWord_
{$Else}

 _kwControlFromStackWord_ = TkwComponentFromStackWord;

{$IfEnd} //not NoScripts

{$Else kwControlFromStackWord_imp}

{$If not defined(NoScripts)}

type
  THackControl = {abstract} class(TControl)
  end;//THackControl

// start class _kwControlFromStackWord_

procedure _kwControlFromStackWord_.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_4F212C120371_var*
//#UC END# *4F21485E0184_4F212C120371_var*
begin
//#UC START# *4F21485E0184_4F212C120371_impl*
 RunnerAssert(aComponent Is TControl, aComponent.Name + ' не является контролом, а является компонентом класса ' + aComponent.ClassName, aCtx);
 DoControl(aComponent As TControl, aCtx);
//#UC END# *4F21485E0184_4F212C120371_impl*
end;//_kwControlFromStackWord_.DoComponent

{$IfEnd} //not NoScripts

{$EndIf kwControlFromStackWord_imp}
