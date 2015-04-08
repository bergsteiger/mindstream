unit msTextShape;

interface

uses
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msRectangularShape
 ;

type
 TmsTextShape = class(TmsRectangularShape)
 protected
  function Text: string; virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsTextShape

implementation

{ TmsTextShape }

procedure TmsTextShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_msPointContext: TRectF;
begin
 l_msPointContext := DrawBounds;
 aCtx.rCanvas.FillText(l_msPointContext,
                       Text,
                       false,
                       1,
                       [],
                       TTextAlign.Center,
                       TTextAlign.Center);
 if aCtx.rMoving then
 begin
  aCtx.rCanvas.DrawRect(l_msPointContext,
                   0{CornerRadius},
                   0{CornerRadius},
                   AllCorners,
                   1,
                   TCornerType.Round);
 end;//aCtx.rMoving
end;

function TmsTextShape.Text: string;
begin
 Result := 'ABC';
end;

end.

