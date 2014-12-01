unit msSerializeController;

interface

uses
 JSON,
 msDiagramm,
 Data.DBXJSONReflect;

type
 TmsSerializeController = class(TObject)
 strict private
  class var f_Marshal : TJSONMarshal;
  class function Marshal: TJSONMarshal;
 public
  class procedure Serialize(const aFileName: string; const aDiagramm: TmsDiagramm);
  class function DeSerialize(const aFileName: string): TmsDiagramm;
  class destructor Destroy;
 end; // TmsDiagrammsController

implementation

uses
 System.Classes,
 msShape,
 FMX.Dialogs,
 System.SysUtils,
 msRegisteredShapes
 ;

 { TmsSerializeController }

class function TmsSerializeController.DeSerialize(const aFileName: string): TmsDiagramm;
var
 l_UnMarshal: TJSONUnMarshal;
 l_StringList: TStringList;
begin
 try
  l_UnMarshal := TJSONUnMarshal.Create;

  l_UnMarshal.RegisterReverter(TmsDiagramm, 'FShapeList',
   procedure(Data: TObject; Field: String; Args: TListOfObjects)
   var
    l_Object: TObject;
    l_Diagramm : TmsDiagramm;
    l_msShape: TmsShape;
   begin
    l_Diagramm := TmsDiagramm(Data);
    l_Diagramm.ShapeList := TmsShapeList.Create;
    assert(l_Diagramm <> nil);

    for l_Object in Args do
    begin
     l_msShape := l_Object as TmsShape;
     l_Diagramm.ShapeList.Add(l_msShape);
    end
   end);

  l_StringList := TStringList.Create;
  l_StringList.LoadFromFile(aFileName);

  Result := l_UnMarshal.Unmarshal(TJSONObject.ParseJSONValue(l_StringList.Text)) as TmsDiagramm;

 finally
  FreeAndNil(l_UnMarshal);
  FreeAndNil(l_StringList);
 end;
end;

class destructor TmsSerializeController.Destroy;
begin
 FreeAndNil(f_Marshal);
end;

class function TmsSerializeController.Marshal: TJSONMarshal;
begin
 if (f_Marshal = nil) then
 begin
  f_Marshal := TJSONMarshal.Create;

  f_Marshal.RegisterConverter(TmsDiagramm, 'FShapeList',
   function(Data: TObject; Field: string): TListOfObjects
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
  );

  TmsRegisteredShapes.IterateShapes(
   procedure (aShapeClass: RmsShape)
   begin
    f_Marshal.RegisterJSONMarshalled(aShapeClass, 'FRefCount', false);
   end
  );
 end;//f_Marshal = nil
 Result := f_Marshal;
end;

class procedure TmsSerializeController.Serialize(const aFileName: string;
                                                 const aDiagramm: TmsDiagramm);
var
 l_Marshal: TJSONMarshal; // Serializer
 l_Json: TJSONObject;
 l_StringList: TStringList;
begin
 try
  l_Marshal := Marshal;

  l_StringList := TStringList.Create;
  try
   l_Json := l_Marshal.Marshal(aDiagramm) as TJSONObject;
  except
   on E: Exception do
    ShowMessage(E.ClassName + ' поднята ошибка, с сообщением : ' + E.Message);
  end;

  l_StringList.Add(l_Json.tostring);
  // l_StringList.SaveToFile(l_SaveDialog.FileName);
  l_StringList.SaveToFile(aFileName);
 finally
  FreeAndNil(l_Json);
  FreeAndNil(l_StringList);
 end;
end;

end.
