unit afwDockingInterfaces;
 
{$Include ..\AFW\afwDefine.inc}

interface

uses
  Classes
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  
  ;

type
 IafwDockableControl = interface(IUnknown)
   ['{A3986FC8-A811-4B72-BEBF-BD68FA7D6038}']
   function CanBeDockedInto(aControl: TWinControl): Boolean;
 end;//IafwDockableControl

 IafwControlDock = interface(IUnknown)
   ['{DD464262-1D9A-41AB-B85C-A0E351F0E9F1}']
   function GetDockControl(const aDockable: IafwDockableControl): TWinControl;
 end;//IafwControlDock

implementation

end.