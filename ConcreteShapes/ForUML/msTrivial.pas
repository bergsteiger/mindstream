unit msTrivial;

interface

uses
 msInterfaces,
 msRectangle
 ;

type
 TmsTrivial = class(TmsRectangle)
 protected
  class function InitialHeight: Single; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsTrivial

implementation


uses
 System.Types,
 FMX.Graphics,
 FMX.Types
 ;

class function TmsTrivial.InitialHeight: Single;
begin
 Result := inherited /3 * 2;
end;

procedure TmsTrivial.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_R : TRectF;
 l_R1 : TRectF;
begin
 inherited;
 l_R := DrawBounds;
(* aCtx.rCanvas.DrawLine(TPointF.Create(l_R.Left, l_R.Top + l_R.Height / 3),
                       TPointF.Create(l_R.Right, l_R.Top + l_R.Height / 3), 1);
 aCtx.rCanvas.DrawLine(TPointF.Create(l_R.Left, l_R.Top +  2 * l_R.Height / 3),
                       TPointF.Create(l_R.Right, l_R.Top + 2 * l_R.Height / 3), 1);
 l_R1 := TRectF.Create(l_R.Left, l_R.Top, l_R.Right, l_R.Top + l_R.Height / 3);*)

 l_R1 := l_R;

 aCtx.rCanvas.Fill.Color :=  aCtx.rCanvas.Stroke.Color;
 aCtx.rCanvas.FillText(l_R1,
                       Stereotype,
                       false,
                       1,
                       [],
                       TTextAlign.Center,
                       TTextAlign.Center);
end;

end.
