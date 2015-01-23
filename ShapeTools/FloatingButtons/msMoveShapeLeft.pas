unit msMoveShapeLeft;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeLeft = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeLeft

implementation

uses
 System.Types
 ;

// TmsMoveShapeUp

procedure TmsMoveShapeLeft.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(-1, 0))
end;

end.
