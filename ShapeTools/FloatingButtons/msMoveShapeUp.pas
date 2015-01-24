unit msMoveShapeUp;

interface

uses
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeUp = class(TmsMoveShapeTool)
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
