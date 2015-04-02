unit msMoveShapeUp;

interface

uses
 System.Types,
 msShapeTool,
 msMoveShapeTool
 ;

type
 TmsMoveShapeUp = class(TmsMoveShapeTool)
 protected
  function Delta: TPointF; override;
 end;//TmsMoveShapeUp

implementation

// TmsMoveShapeUp

function TmsMoveShapeUp.Delta: TPointF;
begin
 Result := TPointF.Create(0, -1);
end;

end.
