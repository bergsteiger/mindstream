unit l3FormCanvas;
 
{$Include l3Define.inc}

interface

uses
  Classes
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  l3WinControlCanvas
  ;

type
 Tl3FormCanvas = class(Tl3WinControlCanvas)
 public
 // public methods
   constructor Create(aForm: TForm); reintroduce;
 end;//Tl3FormCanvas

implementation

// start class Tl3FormCanvas

constructor Tl3FormCanvas.Create(aForm: TForm);
//#UC START# *4FAE57980326_4F916FD10199_var*
//#UC END# *4FAE57980326_4F916FD10199_var*
begin
//#UC START# *4FAE57980326_4F916FD10199_impl*
 inherited Create(aForm);
 Canvas := aForm.Canvas;
//#UC END# *4FAE57980326_4F916FD10199_impl*
end;//Tl3FormCanvas.Create

end.