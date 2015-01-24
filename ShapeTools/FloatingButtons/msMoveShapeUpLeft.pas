unit msMoveShapeUpLeft;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeUpLeft = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeUpLeft

implementation

uses
 System.Types
 ;

// TmsMoveShapeUpLeft

procedure TmsMoveShapeUpLeft.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(-1, -1))
end;

end.
