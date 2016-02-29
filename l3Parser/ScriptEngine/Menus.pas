unit Menus;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "Vcl"
// Модуль: "w:/common/components/rtl/external/NotFinished/Borland/Delphi/Vcl/Menus.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Core::Vcl::Implementation::Menus
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

interface

{$If not defined(NoVCL)}
uses
  Messages,
  Classes
  ;

type
 TMenuItem = class(TComponent)
  {* TMenuItem describes the properties of an item in a menu. }
 end;//TMenuItem

 TMenu = class(TComponent)
  {* TMenu is the base type for menu components such as TMainMenu and TPopupMenu. }
 public
 // public methods
   function IsShortCut(var Message: TWMKey): Boolean; virtual;
 end;//TMenu

 TPopupMenu = class(TMenu)
  {* TPopupMenu encapsulates the properties, methods, and events of a pop-up menu. }
 public
 // public methods
   procedure Popup(X: Integer;
     Y: Integer); virtual;
 end;//TPopupMenu

 TMenuKeyCap = (
   
 );//TMenuKeyCap

const
  { MenuKeyCaps }
 MenuKeyCaps : array [0..-1] of  = (
  
 );//MenuKeyCaps

type
 TMainMenu = class(TMenu)
 end;//TMainMenu
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  SysUtils
  {$If not defined(NoScripts) AND not defined(NoVCL)}
  ,
  MenuWordsPack
  {$IfEnd} //not NoScripts AND not NoVCL
  
  ;

// start class TMenu

function TMenu.IsShortCut(var Message: TWMKey): Boolean;
//#UC START# *52A0905E002D_49A3EC9F01DC_var*
//#UC END# *52A0905E002D_49A3EC9F01DC_var*
begin
//#UC START# *52A0905E002D_49A3EC9F01DC_impl*
 !!! Needs to be implemented !!!
//#UC END# *52A0905E002D_49A3EC9F01DC_impl*
end;//TMenu.IsShortCut
// start class TPopupMenu

procedure TPopupMenu.Popup(X: Integer;
  Y: Integer);
//#UC START# *52A090A90317_49A5750A01E8_var*
//#UC END# *52A090A90317_49A5750A01E8_var*
begin
//#UC START# *52A090A90317_49A5750A01E8_impl*
 !!! Needs to be implemented !!!
//#UC END# *52A090A90317_49A5750A01E8_impl*
end;//TPopupMenu.Popup
{$IfEnd} //not NoVCL
end.