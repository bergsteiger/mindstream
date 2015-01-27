unit msMarshalPrim;

interface

uses
 Data.DBXJSONReflect
 ;

type
 TmsMarshalPrim = class abstract
 strict private
  class var f_Marshal : TJSONMarshal;
  class var f_UnMarshal : TJSONUnMarshal;
 protected
  class destructor Fini;
  class function Marshal: TJSONMarshal;
  class function UnMarshal: TJSONUnMarshal;
 public
  class procedure Serialize(const aFileName: string;
                            const aDiagramm: TObject);
 end;//TmsMarshalPrim

implementation

uses
 SysUtils,
 msShape,
 msDiagramm,
 msDiagramms,
 msSerializeInterfaces,
 msRegisteredShapes,
 JSON,
 msStringList,
 msFormatter,
 msShapeClassList
 ;

// TmsMarshalPrim

class destructor TmsMarshalPrim.Fini;
begin
 FreeAndNil(f_Marshal);
 FreeAndNil(f_UnMarshal);
end;

class function TmsMarshalPrim.Marshal: TJSONMarshal;
begin
 if (f_Marshal = nil) then
 begin
  f_Marshal := TJSONMarshal.Create;
  TmsShape.RegisterInMarshal(f_Marshal);
  TmsDiagramm.RegisterInMarshal(f_Marshal);
  TmsDiagramms.RegisterInMarshal(f_Marshal);
  TmsRegisteredShapes.Instance.IterateShapes(
   procedure (const aShapeClass: MCmsShape)
   begin
    aShapeClass.RegisterInMarshal(f_Marshal);
//    f_Marshal.RegisterJSONMarshalled(aShapeClass, 'FRefCount', false);
   end
  );//TmsRegisteredShapes.IterateShapes
 end;//f_Marshal = nil
 Result := f_Marshal;
end;

class function TmsMarshalPrim.UnMarshal: TJSONUnMarshal;
begin
 if (f_UnMarshal = nil) then
 begin
  f_UnMarshal := TJSONUnMarshal.Create;
  TmsShape.RegisterInUnMarshal(f_UnMarshal);
  TmsDiagramm.RegisterInUnMarshal(f_UnMarshal);
  TmsDiagramms.RegisterInUnMarshal(f_UnMarshal);
  TmsRegisteredShapes.Instance.IterateShapes(
   procedure (const aShapeClass: MCmsShape)
   begin
    aShapeClass.RegisterInUnMarshal(f_UnMarshal);
   end
  );//TmsRegisteredShapes.IterateShapes
 end;//f_UnMarshal = nil
 Result := f_UnMarshal;
end;

class procedure TmsMarshalPrim.Serialize(const aFileName: string;
                                         const aDiagramm: TObject);
var
 l_Json: TJSONObject;
 l_StringList: TmsStringList;
begin
 l_StringList := TmsStringList.Create;
 try
  l_Json := nil;
  try
   l_Json := Marshal.Marshal(aDiagramm) as TJSONObject;
   l_StringList.Add(l_Json.toString);
   l_StringList.Text:= TmsFormatter.FormatJson(l_StringList.Text);
  finally
   FreeAndNil(l_Json);
  end;//try..finally
  l_StringList.SaveToFile(aFileName);
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

end.


