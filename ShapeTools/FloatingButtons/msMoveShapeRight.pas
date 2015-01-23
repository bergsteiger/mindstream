unit msMoveShapeRight;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeRight = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeRight

implementation

uses
 System.Types
 ;

// TmsMoveShapeRight

procedure TmsMoveShapeRight.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(+1, 0))
end;

end.
