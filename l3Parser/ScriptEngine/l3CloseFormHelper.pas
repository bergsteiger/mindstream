unit l3CloseFormHelper;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3$AFW"
// Модуль: "w:/common/components/rtl/Garant/L3/l3CloseFormHelper.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Service::Class>> Shared Delphi Low Level::L3$AFW::VCLHelpers::Tl3CloseFormHelper
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Controls,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
(*
 Ml3CloseFormHelper = PureMixIn
  {* Контракт сервиса Tl3CloseFormHelper }
   function Close(aControl: TWinControl): Boolean;
 end;//Ml3CloseFormHelper
*)

type
 Il3CloseFormHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3CloseFormHelper }
   ['{A031440F-1B01-4D9B-A86B-5F4E065BE1E9}']
  // Ml3CloseFormHelper
   function Close(aControl: TWinControl): Boolean;
 end;//Il3CloseFormHelper

 Tl3CloseFormHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3CloseFormHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3CloseFormHelper);
 public
 // realized methods
   function Close(aControl: TWinControl): Boolean;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // public properties
   property Alien: Il3CloseFormHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3CloseFormHelper }
 public
 // singleton factory method
   class function Instance: Tl3CloseFormHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3CloseFormHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a},
  Forms
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3CloseFormHelper

var g_Tl3CloseFormHelper : Tl3CloseFormHelper = nil;

procedure Tl3CloseFormHelperFree;
begin
 l3Free(g_Tl3CloseFormHelper);
end;

class function Tl3CloseFormHelper.Instance: Tl3CloseFormHelper;
begin
 if (g_Tl3CloseFormHelper = nil) then
 begin
  l3System.AddExitProc(Tl3CloseFormHelperFree);
  g_Tl3CloseFormHelper := Create;
 end;
 Result := g_Tl3CloseFormHelper;
end;


procedure Tl3CloseFormHelper.pm_SetAlien(const aValue: Il3CloseFormHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3CloseFormHelper.pm_SetAlien

class function Tl3CloseFormHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3CloseFormHelper <> nil;
end;//Tl3CloseFormHelper.Exists

function Tl3CloseFormHelper.Close(aControl: TWinControl): Boolean;
//#UC START# *A1E64DB467E3_55014D810077_var*
//#UC END# *A1E64DB467E3_55014D810077_var*
begin
//#UC START# *A1E64DB467E3_55014D810077_impl*
 Result := false;
 if (f_Alien <> nil) then
  Result := f_Alien.Close(aControl);
 if not Result then
  if (aControl Is TCustomForm) then
  begin
   TCustomForm(aControl).Close;
   Result := true;
  end;//aControl Is TCustomForm
//#UC END# *A1E64DB467E3_55014D810077_impl*
end;//Tl3CloseFormHelper.Close

procedure Tl3CloseFormHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3CloseFormHelper.ClearFields

{$IfEnd} //not NoVCL

end.