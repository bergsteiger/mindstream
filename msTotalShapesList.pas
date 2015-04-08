unit msTotalShapesList;

interface

uses
 Generics.Collections,

 msInterfaces
 ;

type
 TmsWeakShapeRefList = TList<TmsWeakShapeRef>;
 TmsShapeByUIDMap = TDictionary<TmsShapeUID, TmsWeakShapeRef>;

 TmsTotalShapesList = class
 strict private
  class var f_ShapesPlainList : TmsWeakShapeRefList;
  class var f_Map : TmsShapeByUIDMap;
  class function ShapesPlainList: TmsWeakShapeRefList;
  class function Map: TmsShapeByUIDMap;
 public
  class destructor Fini;
  public
   class procedure ShapeAdded(const aShape: ImsShape);
   class procedure ShapeDestroyed(const aShape: ImsShape);
   class function GenerateUID(const aShape: ImsShape): TmsShapeUID;
   // - создаёт UID для примитива aShape
   class function ShapeByUID(const aUID: TmsShapeUID): ImsShape;
 end;//TmsTotalShapesList

implementation

uses
 System.SysUtils
 ;

// TmsTotalShapesList

class destructor TmsTotalShapesList.Fini;
begin
 FreeAndNil(f_ShapesPlainList);
 FreeAndNil(f_Map);
end;

class function TmsTotalShapesList.ShapesPlainList: TmsWeakShapeRefList;
begin
 if (f_ShapesPlainList = nil) then
  f_ShapesPlainList := TmsWeakShapeRefList.Create;
 Result := f_ShapesPlainList;
end;

class function TmsTotalShapesList.Map: TmsShapeByUIDMap;
begin
 if (f_Map = nil) then
  f_Map := TmsShapeByUIDMap.Create;
 Result := f_Map;
end;

class procedure TmsTotalShapesList.ShapeAdded(const aShape: ImsShape);
begin
 with ShapesPlainList do
  if (IndexOf(aShape) < 0) then
   Add(aShape);
 Map.Remove(aShape.UID);
 // - потому, что при ДЕСЕРИАЛИЗАЦИИ есть ДВЕ копии примитива
 //   одна - десериализуемая
 //   вторая - добавляемая
 Map.Add(aShape.UID, aShape);
end;

class procedure TmsTotalShapesList.ShapeDestroyed(const aShape: ImsShape);
begin
 if (f_ShapesPlainList <> nil) then
  f_ShapesPlainList.Remove(aShape);
 if (f_Map <> nil) then
  f_Map.Remove(aShape.UID);
end;

class function TmsTotalShapesList.GenerateUID(const aShape: ImsShape): TmsShapeUID;
begin
 Result := TmsShapeUID.CreateNew;
end;

class function TmsTotalShapesList.ShapeByUID(const aUID: TmsShapeUID): ImsShape;
begin
 Assert(f_Map <> nil);
 Result := f_Map[aUID];
end;

end.
