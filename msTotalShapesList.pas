unit msTotalShapesList;

interface

uses
 Generics.Collections,

 msInterfaces
 ;

type
 TmsWeakShapeRefList = TList<TmsWeakShapeRef>;

 TmsTotalShapesList = class
  public
   class procedure ShapeAdded(const aShape: ImsShape);
   class procedure ShapeDestroyed(const aShape: ImsShape);
 end;//TmsTotalShapesList

implementation

// TmsTotalShapesList

class procedure TmsTotalShapesList.ShapeAdded(const aShape: ImsShape);
begin
end;

class procedure TmsTotalShapesList.ShapeDestroyed(const aShape: ImsShape);
begin
end;

end.
