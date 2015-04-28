unit msRectangle;

interface

uses
 msInterfaces,
 msShape
 ;

type
 TmsRectangle = class
  public
   class function Create: ImsShape;
   class function MC: ImsShapeClass;
 end;//TmsRectangle

implementation

uses
 msPredefinedShapes
 ;

// TmsRectangle

class function TmsRectangle.MC: ImsShapeClass;
begin
 Result := MCmsRectangle;
end;

class function TmsRectangle.Create: ImsShape;
begin
 Result := MC.Creator.CreateShape(TPointF.Create(0, 0));
end;

end.
