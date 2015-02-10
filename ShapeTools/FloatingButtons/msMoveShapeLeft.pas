unit msMoveShapeLeft;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeLeft = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeLeft

implementation

// TmsMoveShapeLeft

function TmsMoveShapeLeft.Delta: TPointF;
begin
 Result := TPointF.Create(-1, 0);
end;

end.
