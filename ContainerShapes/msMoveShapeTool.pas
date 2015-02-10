unit msMoveShapeTool;

interface

uses
 System.Types,
 msShapeTool
 ;

type
 TmsMoveShapeTool = class abstract(TmsShapeTool)
 protected
  procedure ProcessClickInDiagramm; override; final;
  function Delta: TPointF; virtual; abstract;
 end;//TmsMoveShapeTool

 RmsMoveShapeTool = class of TmsMoveShapeTool;

implementation

// TmsMoveShapeTool

procedure TmsMoveShapeTool.ProcessClickInDiagramm;
begin
 ShapeToDeal.MoveTo(ShapeToDeal.StartPoint + Delta);
end;

end.
