unit msMoveShapeDown;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeDown = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeDown

implementation

// TmsMoveShapeDown

function TmsMoveShapeDown.Delta: TPointF;
begin
 Result := TPointF.Create(0, +1);
end;

end.
