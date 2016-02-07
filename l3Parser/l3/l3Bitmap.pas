unit l3Bitmap;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3InternalInterfaces,
  l3Canvas,
  Graphics,
  l3PureMixIns
  ;

type
 _l3Unknown_Parent_ = TBitmap;
 {$Include ..\L3\l3Unknown.imp.pas}
 Tl3Bitmap = class(_l3Unknown_)
 private
 // private fields
   f_Canvas : Tl3Canvas;
 protected
 // property methods
   function pm_GetCanvasEx: Il3Canvas;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public properties
   property CanvasEx: Il3Canvas
     read pm_GetCanvasEx;
 end;//Tl3Bitmap

implementation

uses
  SysUtils,
  l3Base,
  l3Core,
  Windows,
  Classes,
  l3MemUtils,
  l3Interlocked
  ;

{$Include ..\L3\l3Unknown.imp.pas}

type
  Tl3BitmapCanvas = class(Tl3Canvas)
  end;//Tl3BitmapCanvas

// start class Tl3Bitmap

function Tl3Bitmap.pm_GetCanvasEx: Il3Canvas;
//#UC START# *47D1587401BD_47D15062022Aget_var*
//#UC END# *47D1587401BD_47D15062022Aget_var*
begin
//#UC START# *47D1587401BD_47D15062022Aget_impl*
 if (f_Canvas = nil) then
 begin
  f_Canvas := Tl3BitmapCanvas.Create;
  f_Canvas.SetCanvas(Canvas, true);
 end;//f_Canvas = nil
 Assert(f_Canvas.Canvas = Self.Canvas);
 Result := f_Canvas;
//#UC END# *47D1587401BD_47D15062022Aget_impl*
end;//Tl3Bitmap.pm_GetCanvasEx

procedure Tl3Bitmap.Cleanup;
//#UC START# *479731C50290_47D15062022A_var*
//#UC END# *479731C50290_47D15062022A_var*
begin
//#UC START# *479731C50290_47D15062022A_impl*
 if Assigned(f_Canvas) then
  f_Canvas.SetCanvas(nil, true);
 l3Free(f_Canvas);
 inherited;
//#UC END# *479731C50290_47D15062022A_impl*
end;//Tl3Bitmap.Cleanup

end.