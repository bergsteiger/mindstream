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
 public
  function ContainsPt(const aPoint: TPointF): Boolean; override;
 end;//TmsRectangularShape

implementation

// TmsRectangularShape

function TmsRectangularShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := DrawBounds.Contains(aPoint);
end;

end.
