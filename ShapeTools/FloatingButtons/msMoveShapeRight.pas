unit msMoveShapeRight;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeRight = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeRight

implementation

// TmsMoveShapeRight

function TmsMoveShapeRight.Delta: TPointF;
begin
 Result := TPointF.Create(+1, 0);
end;

end.
