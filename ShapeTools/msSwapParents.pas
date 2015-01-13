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
  class function ButtonShape: ImsShape; override;
 end;//TmsSwapParents

implementation

uses
 msLeftArrow,
 msRightArrow,
 msShapesGroup
 ;

class function TmsSwapParents.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.SwapParents;
end;

class function TmsSwapParents.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsLeftArrow.Create]);
end;

end.
