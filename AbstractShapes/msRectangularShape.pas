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

  class function CornerRadius: Single; virtual; abstract;
 public
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end; // TmsRectangularShape

implementation

{ TmsRectangularShape }

function TmsRectangularShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := DrawBounds.Contains(aPoint);
end;

function TmsRectangularShape.GetDrawBounds: TRectF;
var
 l_StartPoint, l_FinalPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(StartPoint.X - ShapeClass.InitialWidth / 2,
                               StartPoint.Y - ShapeClass.InitialHeight / 2);
 l_FinalPoint := TPointF.Create(StartPoint.X + ShapeClass.InitialWidth / 2,
                            StartPoint.Y + ShapeClass.InitialHeight / 2);
 Result := TRectF.Create(l_StartPoint, l_FinalPoint);
end;

end.
