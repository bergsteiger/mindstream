unit msMoveShapeDownRight;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeDownRight = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeDownRight

implementation

// TmsMoveShapeDownRight

function TmsMoveShapeDownRight.Delta: TPointF;
begin
 Result := TPointF.Create(+1, +1);
end;

end.
