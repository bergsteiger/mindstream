unit msMarshalPrim;

interface

uses
 Data.DBXJSONReflect
 ;

type
 TmsMarshalPrim = class
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

  f_Marshal.RegisterConverter(TmsDiagramm, 'f_Items',
   function (Data: TObject; Field: string): TListOfObjects
   var
    l_Shape: ImsShape;
    l_Index: Integer;
   begin
    Assert(Field = 'f_Items');
    SetLength(Result, (Data As TmsDiagramm).Items.Count);
    l_Index := 0;
    for l_Shape in (Data As TmsDiagramm).Items do
    begin
     Result[l_Index] := (l_Shape As ImsObjectWrap).HackInstance;
     Inc(l_Index);
    end; // for l_Shape
   end
  );//f_Marshal.RegisterConverter

  f_Marshal.RegisterConverter(TmsDiagramms, 'f_Diagramms',
   function (Data: TObject; Field: string): TListOfObjects
   var
    l_D: TmsDiagramm;
    l_Index: Integer;
   begin
    Assert(Field = 'FShapeList');
    SetLength(Result, (Data As TmsDiagramms).Diagramms.Count);
    l_Index := 0;
    for l_D in (Data As TmsDiagramms).Diagramms do
    begin
     Result[l_Index] := l_D;
     Inc(l_Index);
    end; // for l_Shape
   end
  );//f_Marshal.RegisterConverter

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

  f_UnMarshal.RegisterReverter(TmsDiagramm, 'f_Items',
   procedure (Data: TObject; Field: String; Args: TListOfObjects)
   var
    l_Object: TObject;
    l_Diagramm : TmsDiagramm;
    l_msShape: TmsShape;
   begin
    Assert(Data Is TmsDiagramm);
    l_Diagramm := TmsDiagramm(Data);
    assert(l_Diagramm <> nil);

    for l_Object in Args do
    begin
     l_msShape := l_Object as TmsShape;
     l_Diagramm.Items.Add(l_msShape);
    end//for l_Object
   end
  );//f_UnMarshal.RegisterReverter

  f_UnMarshal.RegisterReverter(TmsDiagramms, 'f_Diagramms',
   procedure (Data: TObject; Field: String; Args: TListOfObjects)
   var
    l_Object: TObject;
    l_Diagramms : TmsDiagramms;
    l_D: TmsDiagramm;
   begin
    Assert(Data Is TmsDiagramms);
    l_Diagramms := TmsDiagramms(Data);
    assert(l_Diagramms <> nil);

    for l_Object in Args do
    begin
     l_D := l_Object as TmsDiagramm;
     l_Diagramms.Diagramms.Add(l_D);
    end//for l_Object
   end
  );//f_UnMarshal.RegisterReverter
 end;//f_UnMarshal = nil
 Result := f_UnMarshal;
end;

end.
