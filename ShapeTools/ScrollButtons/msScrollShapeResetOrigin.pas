unit msScrollShapeResetOrigin;

interface

uses
 msScrollShapePrim,
 msInterfaces,
 msTextShape,
 System.Types
 ;

type
 TmsScrollShapeResetOrigin = class(TmsScrollShapePrim)
 protected
  class function ButtonShape: ImsShape; override;
 public
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override; final;
 public
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

