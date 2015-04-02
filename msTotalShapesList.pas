unit msTotalShapesList;

interface

uses
 msInterfaces
 ;

type
 TmsTotalShapesList = class
  public
   class procedure ShapeAdded(const aShape: ImsShape);
 end;//TmsTotalShapesList

implementation

// TmsTotalShapesList

class procedure TmsTotalShapesList.ShapeAdded(const aShape: ImsShape);
begin
end;

end.
