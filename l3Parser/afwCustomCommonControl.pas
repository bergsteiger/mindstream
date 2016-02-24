unit afwCustomCommonControl;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwCustomCommonControlPrim,
  l3PrinterInterfaces
  ;

type
 TafwCustomCommonControl = class(TafwCustomCommonControlPrim)
 protected
 // property methods
   function pm_GetCanvas: TCanvas;
 protected
 // realized methods
   procedure DoPaint; override;
 protected
 // protected methods
   procedure Paint; virtual;
 protected
 // protected properties
   property Canvas: TCanvas
     read pm_GetCanvas;
 end;//TafwCustomCommonControl

implementation

uses
  Classes
  {$If not defined(NoScripts)}
  ,
  tfwClassRef
  {$IfEnd} //not NoScripts
  
  ;

// start class TafwCustomCommonControl

function TafwCustomCommonControl.pm_GetCanvas: TCanvas;
//#UC START# *48BBE3AD0304_48BBE37E00A2get_var*
//#UC END# *48BBE3AD0304_48BBE37E00A2get_var*
begin
//#UC START# *48BBE3AD0304_48BBE37E00A2get_impl*
 Result := inherited Canvas.Canvas;
//#UC END# *48BBE3AD0304_48BBE37E00A2get_impl*
end;//TafwCustomCommonControl.pm_GetCanvas

procedure TafwCustomCommonControl.Paint;
//#UC START# *48BBE3C40283_48BBE37E00A2_var*
//#UC END# *48BBE3C40283_48BBE37E00A2_var*
begin
//#UC START# *48BBE3C40283_48BBE37E00A2_impl*
//#UC END# *48BBE3C40283_48BBE37E00A2_impl*
end;//TafwCustomCommonControl.Paint

procedure TafwCustomCommonControl.DoPaint;
//#UC START# *48BBE38D0061_48BBE37E00A2_var*
//#UC END# *48BBE38D0061_48BBE37E00A2_var*
begin
//#UC START# *48BBE38D0061_48BBE37E00A2_impl*
 Paint;
//#UC END# *48BBE38D0061_48BBE37E00A2_impl*
end;//TafwCustomCommonControl.DoPaint

initialization
{$If not defined(NoScripts)}
// Регистрация TafwCustomCommonControl
 TtfwClassRef.Register(TafwCustomCommonControl);
{$IfEnd} //not NoScripts

end.