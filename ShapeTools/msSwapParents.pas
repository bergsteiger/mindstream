unit msSwapParents;

interface

uses
 msInterfaces,
 msTool,
 msNullClickShape,
 System.Types
 ;

type
 TmsSwapParents = class(TmsNullClickShape)
  // - утилитный класс ОБМЕНА диаграмм МЕСТАМИ
 protected
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; override;
 end;//TmsSwapParents

implementation

uses
 msLeftArrow
 ;

class function TmsSwapParents.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.SwapParents;
end;

class function TmsSwapParents.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := TmsLeftArrow.Create;
end;

end.
