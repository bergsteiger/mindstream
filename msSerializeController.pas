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

class procedure TmsSerializeController.Serialize(aDiagramm: TmsDiagramm);
var
 // l_SaveDialog: TSaveDialog;
 l_Marshal: TJSONMarshal; // Serializer
 l_Json: TJSONObject;
 l_JsonArray: TJSONArray;
 l_StringList: TStringList;
begin
 // l_SaveDialog := TSaveDialog.Create(nil);
 // if l_SaveDialog.Execute then
 // begin
 try
  l_Marshal := TJSONMarshal.Create;

   l_Marshal.RegisterConverter(TmsDiagramm, 'FShapeList',
      function(Data: TObject; Field: string): TListOfObjects
  //    var
  //    l_msShapeList: TmsShapeList;
  //    l_msShape: TmsShape;
  //    i: integer;
      var
       l_Shape : ImsShape;
        l_Index : Integer;
      begin
       Assert(Field = 'FShapeList');
       SetLength(Result, (Data As TmsDiagramm).ShapeList.Count);
       l_Index := 0;
       for l_Shape in (Data As TmsDiagramm).ShapeList do
       begin
         Result[l_Index] := l_Shape.HackInstance;
         Inc(l_Index);
       end;//for l_Shape

      //    l_msShapeList := TmsShapeList.Create();
      //    SetLength(Result, Data);
      {    if l_msShapeList.Count <> 0 then
      for l_msShape in l_msShapeList do
      Result := Result + l_msShapeList;}
      end
    );

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
