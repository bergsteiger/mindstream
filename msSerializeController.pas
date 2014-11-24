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
 c_FileName = 'E:\Serialize.json';
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

  l_Marshal.RegisterConverter(TmsShapeList, 'FShapeList',
   function(Data: TObject; Field: String): TListOfObjects
   var
    l_msShapeList: TmsShapeList;
    l_msShape: ImsShape;
    i: integer;
   begin
    l_msShapeList := TmsShapeList.Create();
    SetLength(Result, l_msShapeList.Count);
    if l_msShapeList.Count <> 0 then
     for l_msShape in l_msShapeList do
      Result[i] := l_msShape.InstanceOf;
   end);

  l_StringList := TStringList.Create;
  l_Json := l_Marshal.Marshal(aDiagramm.InstanceOf) as TJSONObject;

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
