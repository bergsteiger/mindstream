unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msRectangularShape
 ;

type
 TmsRectangle = class(TmsRectangularShape)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
 end;//TmsRectangle

implementation

{ TmsRectangle }

procedure TmsRectangle.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_msPointContext: TRectF;
begin
 l_msPointContext := DrawBounds;
 aCtx.rCanvas.DrawRect(l_msPointContext,
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  1,
                  TCornerType.Round);
 aCtx.rCanvas.FillRect(l_msPointContext,
                  CornerRadius,
                  CornerRadius,
                  AllCorners,
                  0.5,
                  TCornerType.Round);
end;

procedure TmsRectangle.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.White;
end;

end.


