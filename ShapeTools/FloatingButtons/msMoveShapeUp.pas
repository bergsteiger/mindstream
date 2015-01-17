unit msMoveShapeUp;

interface

uses
 msShapeTool
 ;

type
 TmsMoveShapeUp = class(TmsShapeTool)
 protected
  procedure ProcessClickInDiagramm; override;
 end;//TmsMoveShapeUp

implementation

uses
 System.Types
 ;

// TmsMoveShapeUp

procedure TmsMoveShapeUp.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + TPointF.Create(0, -1))
end;

end.
