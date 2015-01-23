unit msMoveShapeDown;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeDown = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeDown

implementation

uses
 System.Types
 ;

// TmsMoveShapeDown

procedure TmsMoveShapeDown.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(0, +1))
end;

end.
