unit msPointedShape;

interface

uses
 System.Types,
 msShape
 ;

type
 TmsPointedShape = class abstract(TmsShape)
 private
  FStartPoint: TPointF;
 protected
  procedure SetStartPoint(const aStartPoint: TPointF); override;
  function pm_GetStartPoint: TPointF; override;
 end;//TmsPointedShape

implementation

procedure TmsPointedShape.SetStartPoint(const aStartPoint: TPointF);
begin
 FStartPoint := aStartPoint;
end;

function TmsPointedShape.pm_GetStartPoint: TPointF;
begin
 Result := FStartPoint;
end;

end.
