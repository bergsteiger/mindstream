{$IfNDef kwMenuItemFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMenuItemFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::MenuWords::kwMenuItemFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwMenuItemFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
 _kwMenuItemFromStackWord_ = {abstract mixin} class(_kwComponentFromStackWord_)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoMenuItem(anItem: TMenuItem;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwMenuItemFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwMenuItemFromStackWord_imp}

{$IfNDef kwMenuItemFromStackWord_imp_impl}
{$Define kwMenuItemFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}

// start class _kwMenuItemFromStackWord_

procedure _kwMenuItemFromStackWord_.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_4FC7295B022C_var*
//#UC END# *4F21485E0184_4FC7295B022C_var*
begin
//#UC START# *4F21485E0184_4FC7295B022C_impl*
 DoMenuItem(aComponent As TMenuItem, aCtx);
//#UC END# *4F21485E0184_4FC7295B022C_impl*
end;//_kwMenuItemFromStackWord_.DoComponent

{$IfEnd} //not NoScripts

{$Else  kwMenuItemFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwMenuItemFromStackWord_imp_impl}
{$EndIf kwMenuItemFromStackWord_imp}
