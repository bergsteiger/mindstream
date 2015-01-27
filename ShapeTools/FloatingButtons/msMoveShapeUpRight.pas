unit msMoveShapeUpRight;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeUpRight = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeUpRight

implementation

uses
 System.Types
 ;

// TmsMoveShapeUpRight

procedure TmsMoveShapeUpRight.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(+1, -1))
end;

end.
