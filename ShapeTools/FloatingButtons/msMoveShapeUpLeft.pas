unit msMoveShapeUpLeft;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeUpLeft = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeUpLeft

implementation

// TmsMoveShapeUpLeft

function TmsMoveShapeUpLeft.Delta: TPointF;
begin
 Result := TPointF.Create(-1, -1);
end;

end.
