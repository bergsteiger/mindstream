unit msMoveShapeDownRight;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeDownRight = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeDownRight

implementation

uses
 System.Types
 ;

// TmsMoveShapeDownRight

procedure TmsMoveShapeDownRight.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(+1, +1))
end;

end.
