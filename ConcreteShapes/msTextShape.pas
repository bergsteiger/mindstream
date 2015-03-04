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
  class function InitialWidth: Single; override;
  class function InitialHeight: Single; override;
  function Text: string; virtual;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
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

class function TmsTextShape.InitialHeight: Single;
begin
 Result := 14
end;

class function TmsTextShape.InitialWidth: Single;
begin
 Result := 21;
end;

function TmsTextShape.Text: string;
begin
 Result := 'ABC';
end;

procedure TmsTextShape.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
end;

end.

