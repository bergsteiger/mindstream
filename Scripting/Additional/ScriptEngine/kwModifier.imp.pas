{$IfNDef kwModifier_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwModifier.imp.pas"
// Начат: 11.05.2011 21:28
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::Modifier
//
// Поддержка модификаторов.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwModifier_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _kwModifier_ = {abstract} class(_tfwAutoregisteringWord_)
  {* Поддержка модификаторов. }
 protected
 // property methods
   function pm_GetModifier: TtfwWordModifier; virtual; abstract;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 protected
 // protected properties
   property Modifier: TtfwWordModifier
     read pm_GetModifier;
 end;//_kwModifier_
{$IfEnd} //not NoScripts

{$Else kwModifier_imp}

{$IfNDef kwModifier_imp_impl}
{$Define kwModifier_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class _kwModifier_

procedure _kwModifier_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCACE1201A3_var*
//#UC END# *4DAEEDE10285_4DCACE1201A3_var*
begin
//#UC START# *4DAEEDE10285_4DCACE1201A3_impl*
 aCtx.rTypeInfo.IncludeModifier(Self.Modifier);
//#UC END# *4DAEEDE10285_4DCACE1201A3_impl*
end;//_kwModifier_.DoDoIt

function _kwModifier_.IsImmediate: Boolean;
 {-}
begin
 Result := true;
end;//_kwModifier_.IsImmediate

{$IfEnd} //not NoScripts

{$Else  kwModifier_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwModifier_imp_impl}
{$EndIf kwModifier_imp}
