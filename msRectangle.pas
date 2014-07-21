unit msRectangle;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types;

type
 TmsRectangle = class(TmsShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

implementation

{ TmsRectangle }

procedure TmsRectangle.DrawShape(const aCanvas: TCanvas);
begin
 aCanvas.DrawRect(TRectF.Create(FStartPoint, FFinalPoint),
                                0, 0,
                                AllCorners, 1,
                                TCornerType.ctRound);
end;

end.
