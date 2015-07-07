unit msScrollShapeResetOrigin;

interface

uses
 msScrollShapePrim,
 msInterfaces,
 System.Types
 ;

type
 TmsScrollShapeResetOrigin = class(TmsScrollShapePrim)
 public
  class function ButtonShape: ImsShape; override;
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override; final;
 end;//TmsScrollShapeResetOrigin

implementation

uses
 msShapesGroup,
 msRemoveIcon,
 msRectangle
 ;

// TmsScrollShapeResetOrigin

class function TmsScrollShapeResetOrigin.ButtonShape: ImsShape;
begin
 Result := TmsShapesGroup.Create([TmsRectangle.Create, TmsRemoveIcon.Create]);
end;

class function TmsScrollShapeResetOrigin.DoNullClick(
  const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := True;
 aHolder.ResetOrigin;
end;
end.

