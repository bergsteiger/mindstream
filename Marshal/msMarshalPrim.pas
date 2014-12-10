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
  class destructor Destroy;
  class function Marshal: TJSONMarshal;
  class function UnMarshal: TJSONUnMarshal;
 end;//TmsMarshalPrim

implementation

uses
 SysUtils,
 msShape,
 msDiagramm,
 msDiagramms,
 msSerializeInterfaces,
 msRegisteredShapes
 ;

// TmsMarshalPrim

class destructor TmsMarshalPrim.Destroy;
begin
 FreeAndNil(f_Marshal);
 FreeAndNil(f_UnMarshal);
end;

class function TmsMarshalPrim.Marshal: TJSONMarshal;
begin
 if (f_Marshal = nil) then
 begin
  f_Marshal := TJSONMarshal.Create;
  TmsDiagramm.RegisterInMarshal(f_Marshal);
  TmsDiagramms.RegisterInMarshal(f_Marshal);
  TmsRegisteredShapes.IterateShapes(
   procedure (aShapeClass: RmsShape)
   begin
    f_Marshal.RegisterJSONMarshalled(aShapeClass, 'FRefCount', false);
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
  TmsDiagramm.RegisterInUnMarshal(f_UnMarshal);
  TmsDiagramms.RegisterInUnMarshal(f_UnMarshal);
 end;//f_UnMarshal = nil
 Result := f_UnMarshal;
end;

end.
