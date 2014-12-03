unit msSerializeController;

interface

uses
 JSON,
 msDiagramm,
 Data.DBXJSONReflect;

type
 TmsSerializeControllerXXX<TClassToSerialize : ImsSerializable> = class
 // - шаблонизируем, ибо мы скоро будем сериализовать и другие классы.
 strict private
  class var f_Marshal : TJSONMarshal;
  class var f_UnMarshal : TJSONUnMarshal;
  class function Marshal: TJSONMarshal;
  class function UnMarshal: TJSONUnMarshal;
 public
  class procedure Serialize(const aFileName: string; aDiagramm: TClassToSerialize);
  class procedure DeSerialize(const aFileName: string; aDiagramm: TClassToSerialize);
  class destructor Destroy;
 end;//TmsSerializeControllerXXX

 TmsDiagrammSerializeController = class(TmsSerializeControllerXXX<TmsDiagramm>)
 end;//TmsDiagrammSerializeController

implementation

uses
 System.Classes,
 msShape,
 FMX.Dialogs,
 System.SysUtils,
 msRegisteredShapes,
 msCoreObjects
 ;

 { TmsSerializeController }

class function TmsSerializeControllerXXX<TClassToSerialize>.UnMarshal: TJSONUnMarshal;
begin
 if (f_UnMarshal = nil) then
 begin
  f_UnMarshal := TJSONUnMarshal.Create;

  f_UnMarshal.RegisterReverter(TmsDiagramm, 'FShapeList',
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
     l_Diagramm.ShapeList.Add(l_msShape);
    end//for l_Object
   end
  );//f_UnMarshal.RegisterReverter
 end;//f_UnMarshal = nil
 Result := f_UnMarshal;
end;

class destructor TmsSerializeControllerXXX<TClassToSerialize>.Destroy;
begin
 FreeAndNil(f_Marshal);
 FreeAndNil(f_UnMarshal);
end;

class function TmsSerializeControllerXXX<TClassToSerialize>.Marshal: TJSONMarshal;
begin
 if (f_Marshal = nil) then
 begin
  f_Marshal := TJSONMarshal.Create;

  f_Marshal.RegisterConverter(TmsDiagramm, 'FShapeList',
   function (Data: TObject; Field: string): TListOfObjects
   var
    l_Shape: ImsShape;
    l_Index: Integer;
   begin
    Assert(Field = 'FShapeList');
    SetLength(Result, (Data As TmsDiagramm).ShapeList.Count);
    l_Index := 0;
    for l_Shape in (Data As TmsDiagramm).ShapeList do
    begin
     Result[l_Index] := l_Shape.HackInstance;
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

class procedure TmsSerializeControllerXXX<TClassToSerialize>.DeSerialize(const aFileName: string; aDiagramm: TClassToSerialize);
var
 l_StringList: TmsStringList;
 l_D : TObject;
 l_S : ImsSerializable;
begin
 l_StringList := TmsStringList.Create;
 try
  l_StringList.LoadFromFile(aFileName);
  l_D := UnMarshal.Unmarshal(TJSONObject.ParseJSONValue(l_StringList.Text));
  try
   if Supports(l_D, ImsSerializable, l_S) then
    aDiagramm.Assign(l_S)
   else
    Assert(false);
  finally
   FreeAndNil(l_D);
  end;//try..finally
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

class procedure TmsSerializeControllerXXX<TClassToSerialize>.Serialize(const aFileName: string;
                                                 aDiagramm: TClassToSerialize);
var
 l_Json: TJSONObject;
 l_StringList: TmsStringList;
begin
 l_StringList := TmsStringList.Create;
 try
  l_Json := nil;
  try
   try
    l_Json := Marshal.Marshal(aDiagramm.HackInstance) as TJSONObject;
   except
    on E: Exception do
     ShowMessage(E.ClassName + ' поднята ошибка, с сообщением : ' + E.Message);
   end;//try..except
   l_StringList.Add(l_Json.toString);
  finally
   FreeAndNil(l_Json);
  end;//try..finally
  l_StringList.SaveToFile(aFileName);
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

end.
