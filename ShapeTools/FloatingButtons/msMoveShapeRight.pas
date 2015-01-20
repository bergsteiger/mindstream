unit msMoveShapeRight;

interface

uses
 msShapeTool
 ;

type
 TmsMoveShapeRight = class(TmsShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeRight

implementation

uses
 System.Types
 ;

// TmsMoveShapeUp

procedure TmsMoveShapeRight.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(+1, 0))
end;

end.
