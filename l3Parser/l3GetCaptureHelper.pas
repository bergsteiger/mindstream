unit l3GetCaptureHelper;
 
{$Include l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  Classes,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
(*
 Ml3GetCaptureHelper = PureMixIn
  {* Контракт сервиса Tl3GetCaptureHelper }
   function GetCapture: TComponent;
 end;//Ml3GetCaptureHelper
*)

type
 Il3GetCaptureHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3GetCaptureHelper }
   ['{37325DBC-4527-4860-8B30-E4FA121B0FC5}']
  // Ml3GetCaptureHelper
   function GetCapture: TComponent;
 end;//Il3GetCaptureHelper

 Tl3GetCaptureHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3GetCaptureHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3GetCaptureHelper);
 public
 // realized methods
   function GetCapture: TComponent;
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
   property Alien: Il3GetCaptureHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3GetCaptureHelper }
 public
 // singleton factory method
   class function Instance: Tl3GetCaptureHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3GetCaptureHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a},
  Controls
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3GetCaptureHelper

var g_Tl3GetCaptureHelper : Tl3GetCaptureHelper = nil;

procedure Tl3GetCaptureHelperFree;
begin
 l3Free(g_Tl3GetCaptureHelper);
end;

class function Tl3GetCaptureHelper.Instance: Tl3GetCaptureHelper;
begin
 if (g_Tl3GetCaptureHelper = nil) then
 begin
  l3System.AddExitProc(Tl3GetCaptureHelperFree);
  g_Tl3GetCaptureHelper := Create;
 end;
 Result := g_Tl3GetCaptureHelper;
end;


procedure Tl3GetCaptureHelper.pm_SetAlien(const aValue: Il3GetCaptureHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3GetCaptureHelper.pm_SetAlien

class function Tl3GetCaptureHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3GetCaptureHelper <> nil;
end;//Tl3GetCaptureHelper.Exists

function Tl3GetCaptureHelper.GetCapture: TComponent;
//#UC START# *FC96CEF34C46_55226C5F035A_var*
//#UC END# *FC96CEF34C46_55226C5F035A_var*
begin
//#UC START# *FC96CEF34C46_55226C5F035A_impl*
 if Assigned(f_Alien) then
  Result := f_Alien.GetCapture
 else
  Result := GetCaptureControl;
//#UC END# *FC96CEF34C46_55226C5F035A_impl*
end;//Tl3GetCaptureHelper.GetCapture

procedure Tl3GetCaptureHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3GetCaptureHelper.ClearFields

{$IfEnd} //not NoVCL

end.