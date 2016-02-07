unit l3ControlCanvas;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3Canvas
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  l3Units
  ;

type
 Tl3ControlCanvas = class(Tl3Canvas)
 private
 // private fields
   f_Caret : Il3Caret;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetCaret: Il3Caret; override;
   procedure Invalidate; override;
 public
 // overridden public methods
   function DoGetClientRect: Tl3Rect; override;
 public
 // public methods
   constructor Create(aControl: TControl;
    const aCaret: Il3Caret = nil); reintroduce;
 end;//Tl3ControlCanvas

implementation

// start class Tl3ControlCanvas

constructor Tl3ControlCanvas.Create(aControl: TControl;
  const aCaret: Il3Caret = nil);
//#UC START# *4FAE47E60126_48C68AC60396_var*
//#UC END# *4FAE47E60126_48C68AC60396_var*
begin
//#UC START# *4FAE47E60126_48C68AC60396_impl*
 CreateOwned(aControl);
 f_Caret := aCaret;
//#UC END# *4FAE47E60126_48C68AC60396_impl*
end;//Tl3ControlCanvas.Create

procedure Tl3ControlCanvas.Cleanup;
//#UC START# *479731C50290_48C68AC60396_var*
//#UC END# *479731C50290_48C68AC60396_var*
begin
//#UC START# *479731C50290_48C68AC60396_impl*
 f_Caret := nil;
 inherited;
//#UC END# *479731C50290_48C68AC60396_impl*
end;//Tl3ControlCanvas.Cleanup

function Tl3ControlCanvas.GetCaret: Il3Caret;
//#UC START# *47DFB3CE02C5_48C68AC60396_var*
//#UC END# *47DFB3CE02C5_48C68AC60396_var*
begin
//#UC START# *47DFB3CE02C5_48C68AC60396_impl*
 Result := f_Caret;
//#UC END# *47DFB3CE02C5_48C68AC60396_impl*
end;//Tl3ControlCanvas.GetCaret

procedure Tl3ControlCanvas.Invalidate;
//#UC START# *4FAE47320103_48C68AC60396_var*
//#UC END# *4FAE47320103_48C68AC60396_var*
begin
//#UC START# *4FAE47320103_48C68AC60396_impl*
 inherited;
 TControl(Owner).Invalidate;
//#UC END# *4FAE47320103_48C68AC60396_impl*
end;//Tl3ControlCanvas.Invalidate

function Tl3ControlCanvas.DoGetClientRect: Tl3Rect;
//#UC START# *4FAE4C740135_48C68AC60396_var*
var
 R: Tl3SRect;
//#UC END# *4FAE4C740135_48C68AC60396_var*
begin
//#UC START# *4FAE4C740135_48C68AC60396_impl*
 R.R.WR := TControl(Owner).ClientRect;
 Result := DR2LR(R);
//#UC END# *4FAE4C740135_48C68AC60396_impl*
end;//Tl3ControlCanvas.DoGetClientRect

end.