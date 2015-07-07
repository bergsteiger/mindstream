{$IfNDef tfwConst_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwConst.imp.pas"
// Начат: 03.05.2011 12:57
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::VarWorkingWords::tfwConst
//
// Поддержка констант.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwConst_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwConstLike.imp.pas}
 _tfwConst_ = {abstract mixin} class(_tfwConstLike_)
  {* Поддержка констант. }
 protected
 // overridden protected methods
   function AcceptsKeyWordAfter: Boolean; override;
 end;//_tfwConst_
{$IfEnd} //not NoScripts

{$Else tfwConst_imp}

{$IfNDef tfwConst_imp_impl}
{$Define tfwConst_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwConstLike.imp.pas}

// start class _tfwConst_

function _tfwConst_.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4DBFC3520093_var*
//#UC END# *4DB9B502013D_4DBFC3520093_var*
begin
//#UC START# *4DB9B502013D_4DBFC3520093_impl*
 Result := false;
//#UC END# *4DB9B502013D_4DBFC3520093_impl*
end;//_tfwConst_.AcceptsKeyWordAfter

{$IfEnd} //not NoScripts

{$Else  tfwConst_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwConstLike.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwConst_imp_impl}
{$EndIf tfwConst_imp}
