unit msLine;

interface

uses
 msShape, FMX.Graphics;

type
 TmsLine = class(TmsShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

implementation
{ TLine }

procedure TmsLine.DrawShape(const aCanvas : TCanvas);
begin
 aCanvas.DrawLine(FStartPoint, FFinalPoint, 1);
end;

end.
