unit msMoveShapeDownLeft;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeDownLeft = class(TmsMoveShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeDownLeft

implementation

uses
 System.Types
 ;

// TmsMoveShapeDownLeft

procedure TmsMoveShapeDownLeft.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(-1, +1))
end;

end.
