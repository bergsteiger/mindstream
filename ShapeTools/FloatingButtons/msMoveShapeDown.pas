unit msMoveShapeDown;

interface

uses
 msShapeTool
 ;

type
 TmsMoveShapeDown = class(TmsShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeDown

implementation

uses
 System.Types
 ;

// TmsMoveShapeUp

procedure TmsMoveShapeDown.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(0, +1))
end;

end.
