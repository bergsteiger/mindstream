unit msRectangularShape;

interface

uses
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msPointedShape
 ;

type
 TmsRectangularShape = class abstract(TmsPointedShape)
 protected
  function GetDrawBounds: TRectF; override;

  class function CornerRadius: Single; virtual;
  class function InitialWidth: Single; virtual;
  class function InitialHeight: Single; virtual;
 public
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end; // TmsRectangularShape

implementation

{ TmsRectangularShape }

function TmsRectangularShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := DrawBounds.Contains(aPoint);
end;

class function TmsRectangularShape.CornerRadius: Single;
begin
 Result := 0;
end;

function TmsRectangularShape.GetDrawBounds: TRectF;
var
 l_StartPoint, l_FinalPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(StartPoint.X - InitialWidth / 2,
                               StartPoint.Y - InitialHeight / 2);
 l_FinalPoint := TPointF.Create(StartPoint.X + InitialWidth / 2,
                            StartPoint.Y + InitialHeight / 2);
 Result := TRectF.Create(l_StartPoint, l_FinalPoint);
end;

class function TmsRectangularShape.InitialHeight: Single;
begin
 Result := 90;
end;

class function TmsRectangularShape.InitialWidth: Single;
begin
 Result := 100;
end;

end.
