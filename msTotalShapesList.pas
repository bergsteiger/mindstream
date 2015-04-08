unit msTotalShapesList;

interface

uses
 Generics.Collections,

 msInterfaces
 ;

type
 TmsWeakShapeRefList = TList<TmsWeakShapeRef>;

 TmsTotalShapesList = class
 strict private
  class var f_ShapesPlainList : TmsWeakShapeRefList;
  class function ShapesPlainList: TmsWeakShapeRefList;
 public
  class destructor Fini;
  public
   class procedure ShapeAdded(const aShape: ImsShape);
   class procedure ShapeDestroyed(const aShape: ImsShape);
 end;//TmsTotalShapesList

implementation

uses
 System.SysUtils
 ;

// TmsTotalShapesList

class destructor TmsTotalShapesList.Fini;
begin
 FreeAndNil(f_ShapesPlainList);
end;

class function TmsTotalShapesList.ShapesPlainList: TmsWeakShapeRefList;
begin
 if (f_ShapesPlainList = nil) then
  f_ShapesPlainList := TmsWeakShapeRefList.Create;
 Result := f_ShapesPlainList;
end;

class procedure TmsTotalShapesList.ShapeAdded(const aShape: ImsShape);
begin
 with ShapesPlainList do
  if (IndexOf(aShape) < 0) then
   Add(aShape);
end;

class procedure TmsTotalShapesList.ShapeDestroyed(const aShape: ImsShape);
begin
 if (f_ShapesPlainList <> nil) then
  f_ShapesPlainList.Remove(aShape)
//  f_ShapesPlainList.Remove(TmsWeakShapeRef.Create(aShape))
end;

end.
