unit msMoveShapeUpRight;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeUpRight = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeUpRight

implementation

// TmsMoveShapeUpRight

function TmsMoveShapeUpRight.Delta: TPointF;
begin
 Result := TPointF.Create(+1, -1);
end;

end.
