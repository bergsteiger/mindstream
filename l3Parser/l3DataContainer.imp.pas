{$IfNDef l3DataContainer_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/L3/l3DataContainer.imp.pas"
// Начат: 08.07.2009 22:05
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Low Level::L3::l3CoreObjects::l3DataContainer
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define l3DataContainer_imp}
 _l3DataContainer_ = {abstract mixin} class(_l3DataContainer_Parent_)
 protected
 // property methods
   function pm_GetEmpty: Boolean;
 protected
 // protected methods
   function GetEmpty: Boolean; virtual;
 public
 // public properties
   property Empty: Boolean
     read pm_GetEmpty;
 end;//_l3DataContainer_

{$Else l3DataContainer_imp}

// start class _l3DataContainer_

function _l3DataContainer_.pm_GetEmpty: Boolean;
//#UC START# *4A54E02500D2_4A54DFCC0370get_var*
//#UC END# *4A54E02500D2_4A54DFCC0370get_var*
begin
//#UC START# *4A54E02500D2_4A54DFCC0370get_impl*
 Result := (Self = nil) OR GetEmpty;
//#UC END# *4A54E02500D2_4A54DFCC0370get_impl*
end;//_l3DataContainer_.pm_GetEmpty

function _l3DataContainer_.GetEmpty: Boolean;
//#UC START# *4A54E03B009A_4A54DFCC0370_var*
//#UC END# *4A54E03B009A_4A54DFCC0370_var*
begin
//#UC START# *4A54E03B009A_4A54DFCC0370_impl*
 Result := false;
//#UC END# *4A54E03B009A_4A54DFCC0370_impl*
end;//_l3DataContainer_.GetEmpty

{$EndIf l3DataContainer_imp}
