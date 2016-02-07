unit l3CustomControlCanvas;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  l3WinControlCanvas
  ;

type
 Tl3CustomControlCanvas = class(Tl3WinControlCanvas)
 public
 // public methods
   constructor Create(aControl: TCustomControl;
    const aCaret: Il3Caret = nil); reintroduce;
 end;//Tl3CustomControlCanvas

implementation

type
  THackControl = class(TCustomControl)
  end;//THackControl

// start class Tl3CustomControlCanvas

constructor Tl3CustomControlCanvas.Create(aControl: TCustomControl;
  const aCaret: Il3Caret = nil);
//#UC START# *4FAE803503C7_4FAE801F00D4_var*
//#UC END# *4FAE803503C7_4FAE801F00D4_var*
begin
//#UC START# *4FAE803503C7_4FAE801F00D4_impl*
 inherited Create(aControl, aCaret);
 Canvas := THackControl(aControl).Canvas;
//#UC END# *4FAE803503C7_4FAE801F00D4_impl*
end;//Tl3CustomControlCanvas.Create

end.