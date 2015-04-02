unit msMoveShapeDownLeft;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeDownLeft = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeDownLeft

implementation

// TmsMoveShapeDownLeft

function TmsMoveShapeDownLeft.Delta: TPointF;
begin
 Result := TPointF.Create(-1, +1);
end;

end.
