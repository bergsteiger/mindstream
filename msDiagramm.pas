unit msDiagramm;

interface

uses
 FMX.Graphics,
 Generics.Collections,
 System.SysUtils,
 System.Types,
 System.UITypes,
 msShape,
 msPointCircle,
 System.Classes,
 FMX.Objects,
 msRegisteredShapes,
 FMX.Dialogs,
 System.JSON,
 Data.DBXJSONReflect;

type
 TmsShapeList = class(TList<ImsShape>)
 public
  function ShapeByPt(const aPoint: TPointF): ImsShape;
 end; // TmsShapeList

 TmsDiagramm = class(TmsInterfacedNonRefcounted, ImsShapeByPt, ImsShapesController, IInvokable)
 private
  FShapeList: TmsShapeList;
  FCurrentClass: RmsShape;
  FCurrentAddedShape: ImsShape;
  FMovingShape: TmsShape;
  FCanvas: TCanvas;
  FOrigin: TPointF;
  f_Name: String;
 private
  procedure DrawTo(const aCanvas: TCanvas; const aOrigin: TPointF);
  function CurrentAddedShape: ImsShape;
  procedure BeginShape(const aStart: TPointF);
  procedure EndShape(const aFinish: TPointF);
  function ShapeIsEnded: Boolean;
  class function AllowedShapes: TmsRegisteredShapes;
  procedure CanvasChanged(aCanvas: TCanvas);
  function ShapeByPt(const aPoint: TPointF): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  property CurrentClass: RmsShape read FCurrentClass write FCurrentClass;
 public
  constructor Create(anImage: TImage; const aName: String);
  procedure ResizeTo(anImage: TImage);
  destructor Destroy; override;
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure Invalidate;
  procedure AllowedShapesToList(aList: TStrings);
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  property Name: String read f_Name;
  function CurrentShapeClassIndex: Integer;
  procedure Serialize;
  function DeSerialize: TmsShapeList;
 end; // TmsDiagramm

implementation

uses
 msMover;

class function TmsDiagramm.AllowedShapes: TmsRegisteredShapes;
begin
 Result := TmsRegisteredShapes.Instance;
end;

procedure TmsDiagramm.AllowedShapesToList(aList: TStrings);
var
 l_Class: RmsShape;
begin
 aList.Clear;
 for l_Class in AllowedShapes do
  aList.AddObject(l_Class.ClassName, TObject(l_Class));
end;

function TmsDiagramm.CurrentShapeClassIndex: Integer;
begin
 Result := AllowedShapes.IndexOf(FCurrentClass);
end;

procedure TmsDiagramm.SelectShape(aList: TStrings; anIndex: Integer);
begin
 CurrentClass := RmsShape(aList.Objects[anIndex]);
end;

procedure TmsDiagramm.Serialize;
var
 l_SaveDialog: TSaveDialog;
 l_Marshal: TJSONMarshal; // Serializer
 // l_UnMarshal: TJSONUnMarshal;  //UnSerializer
 l_SerializedKid: TJSONObject; // Serialized for of object
 l_Json: TJSONObject;
 l_JsonArray: TJSONArray;
 l_StringList: TStringList;
 l_msShape: ImsShape;
begin
 l_SaveDialog := TSaveDialog.Create(nil);
 if l_SaveDialog.Execute then
 begin
  try
   l_Marshal := TJSONMarshal.Create;

   { l_Marshal.RegisterConverter(TmsShapeList, 'FShapeList',
     function(Data: TObject; Field: String): TListOfObjects
     var
     l_msShapeList: TmsShapeList;
     i: integer;
     begin
     l_msShapeList := TmsShapeList.Create();
     SetLength(Result, l_msShapeList.Count);
     if l_msShapeList.Count <> 0
     then for i := 0 to l_msShapeList.Count - 1
     do Result[i] := TObject(l_msShapeList[i]);
     end); }
   l_StringList := TStringList.Create;
   l_JsonArray := TJSONArray.Create;
   for l_msShape in FShapeList do
   begin
    l_Json := l_Marshal.Marshal(TObject(l_msShape)) as TJSONObject;
    l_JsonArray.Add(l_Json);
   end;
   l_Json := TJSONObject.Create(TJSONPair.Create('MindStream', l_JsonArray));
   l_StringList.Add(l_Json.tostring);
   l_StringList.SaveToFile(l_SaveDialog.FileName);
  finally
   FreeAndNil(l_Json);
   FreeAndNil(l_StringList);
   FreeAndNil(l_Marshal);
  end;

 end
 else
  assert(false);

 FreeAndNil(l_SaveDialog);
end;

procedure TmsDiagramm.ProcessClick(const aStart: TPointF);
begin
 if ShapeIsEnded then
  // - мы Ќ≈ ƒќЅј¬ЋяЋ» примитива - надо его ƒќЅј¬»“№
  BeginShape(aStart)
 else
  EndShape(aStart);
end;

procedure TmsDiagramm.BeginShape(const aStart: TPointF);
begin
 assert(CurrentClass <> nil);
 FCurrentAddedShape := CurrentClass.Create(TmsMakeShapeContext.Create(aStart, Self));
 if (FCurrentAddedShape <> nil) then
 begin
  FShapeList.Add(FCurrentAddedShape);
  if not FCurrentAddedShape.IsNeedsSecondClick then
   // - если не надо SecondClick, то наш примитив - завершЄн
   FCurrentAddedShape := nil;
  Invalidate;
 end; // FCurrentAddedShape <> nil
end;

procedure TmsDiagramm.Clear;
begin
 FShapeList.Clear;
 Invalidate;
end;

constructor TmsDiagramm.Create(anImage: TImage; const aName: String);
begin
 inherited Create;
 FShapeList := TmsShapeList.Create;
 FCurrentAddedShape := nil;
 FCanvas := nil;
 FOrigin := TPointF.Create(0, 0);
 ResizeTo(anImage);
 FCurrentClass := AllowedShapes.First;
 f_Name := aName;
end;

procedure TmsDiagramm.ResizeTo(anImage: TImage);
begin
 anImage.Bitmap := TBitmap.Create(Round(anImage.Width), Round(anImage.Height));
 CanvasChanged(anImage.Bitmap.Canvas);
end;

procedure TmsDiagramm.CanvasChanged(aCanvas: TCanvas);
begin
 FCanvas := aCanvas;
 Invalidate;
end;

function TmsDiagramm.CurrentAddedShape: ImsShape;
begin
 Result := FCurrentAddedShape;
end;

function TmsDiagramm.DeSerialize: TmsShapeList;
begin
 assert(false);
end;

destructor TmsDiagramm.Destroy;
begin
 FreeAndNil(FShapeList);
 inherited;
end;

procedure TmsDiagramm.DrawTo(const aCanvas: TCanvas; const aOrigin: TPointF);
var
 l_Shape: ImsShape;
begin
 aCanvas.BeginScene;
 try
  for l_Shape in FShapeList do
   l_Shape.DrawTo(TmsDrawContext.Create(aCanvas, aOrigin));
 finally
  aCanvas.EndScene;
 end; // try..finally
end;

procedure TmsDiagramm.EndShape(const aFinish: TPointF);
begin
 assert(CurrentAddedShape <> nil);
 CurrentAddedShape.EndTo(TmsEndShapeContext.Create(aFinish, Self));
 FCurrentAddedShape := nil;
 Invalidate;
end;

procedure TmsDiagramm.Invalidate;
begin
 FCanvas.BeginScene;
 try
  FCanvas.Clear(TAlphaColorRec.Null);
  DrawTo(FCanvas, FOrigin);
 finally
  FCanvas.EndScene;
 end; // try..finally
end;

function TmsDiagramm.ShapeIsEnded: Boolean;
begin
 Result := (CurrentAddedShape = nil);
end;

function TmsDiagramm.ShapeByPt(const aPoint: TPointF): ImsShape;

begin
 Result := FShapeList.ShapeByPt(aPoint);
end;

procedure TmsDiagramm.RemoveShape(const aShape: ImsShape);
begin
 FShapeList.Remove(aShape);
end;

function TmsShapeList.ShapeByPt(const aPoint: TPointF): ImsShape;
var
 l_Shape: ImsShape;
 l_Index: Integer;
begin
 Result := nil;
 for l_Index := Self.count - 1 downto 0 do
 begin
  l_Shape := Self.Items[l_Index];
  if l_Shape.ContainsPt(aPoint) then
  begin
   Result := l_Shape;
   Exit;
  end; // l_Shape.ContainsPt(aPoint)
 end; // for l_Index
end;

end.
