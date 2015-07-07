unit msRemoveIcon;

interface

uses
 msInterfaces
 ;

type
 TmsRemoveIcon = class
 // - "Иконка для удаления фигур"
 public
  class function Create(const aPoint: TPointF): ImsShape; overload;
  class function Create: ImsShape; overload;
 end;//TmsRemoveIcon

implementation

uses
 msPredefinedShapes
 ;

// TmsRemoveIcon

class function TmsRemoveIcon.Create(const aPoint: TPointF): ImsShape;
begin
 Result := MCmsRemoveIcon.AsRef.CreateShape(aPoint);
end;

class function TmsRemoveIcon.Create: ImsShape;
begin
 Result := Create(TPointF.Create(0, 0));
end;

end.
