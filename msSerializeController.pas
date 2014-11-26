unit msSerializeController;

interface

uses
 JSON,
 msDiagramm,
 Data.DBXJSONReflect;

type
 TmsSerializeController = class(TObject)
 public
  class procedure Serialize(aDiagramm: TmsDiagramm);
  class function DeSerialize: TmsDiagramm;
 end; // TmsDiagrammsController

implementation

uses
 System.Classes,
 msShape,
 FMX.Dialogs,
 System.SysUtils;

const
 c_FileName = 'Serialize.json';
 { TmsSerializeController }

class function TmsSerializeController.DeSerialize: TmsDiagramm;
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
  l_StringList.LoadFromFile(c_FileName);

  Result := l_UnMarshal.Unmarshal(TJSONObject.ParseJSONValue(l_StringList.Text)) as TmsDiagramm;

 finally
  FreeAndNil(l_UnMarshal);
  FreeAndNil(l_StringList);
 end;
end;

class procedure TmsSerializeController.Serialize(aDiagramm: TmsDiagramm);
var
 // l_SaveDialog: TSaveDialog;
 l_Marshal: TJSONMarshal; // Serializer
 l_Json: TJSONObject;
 l_StringList: TStringList;
begin
 // l_SaveDialog := TSaveDialog.Create(nil);
 // if l_SaveDialog.Execute then
 // begin
 try
  l_Marshal := TJSONMarshal.Create;

  l_Marshal.RegisterConverter(TmsDiagramm, 'FShapeList',
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
   end);

  l_StringList := TStringList.Create;
  try
   l_Json := l_Marshal.Marshal(aDiagramm) as TJSONObject;
  except
   on E: Exception do
    ShowMessage(E.ClassName + ' поднята ошибка, с сообщением : ' + E.Message);
  end;

  l_StringList.Add(l_Json.tostring);
  // l_StringList.SaveToFile(l_SaveDialog.FileName);
  l_StringList.SaveToFile(c_FileName);
 finally
  FreeAndNil(l_Json);
  FreeAndNil(l_StringList);
  FreeAndNil(l_Marshal);
 end;
 // end
 // else
 // assert(false);

 // FreeAndNil(l_SaveDialog);
end;

end.
