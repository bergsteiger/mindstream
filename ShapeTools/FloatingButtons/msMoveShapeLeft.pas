unit msMoveShapeLeft;

interface

uses
 msShapeTool
 ;

type
 TmsMoveShapeLeft = class(TmsShapeTool)
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
