unit msDiagramm;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 FMX.Graphics,
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
 msCoreObjects,
 msSerializeInterfaces,
 msInterfacedNonRefcounted,
 msInterfacedRefcounted
 ;

type
 TmsItemsHolderParent = TmsInterfacedRefcounted{TmsInterfacedNonRefcounted};
 TmsItem = ImsShape;
 {$Include msItemsHolder.mixin.pas}
 TmsDiagramm = class(TmsItemsHolder, ImsDiagramm, ImsShapeByPt, ImsShapesController)
 // - ¬ыдел€ем интерфейс ImsObjectWrap.
 //   —мешно - если TmsDiagramm его реализет Ќјѕ–яћ”ё, то всЄ хорошо.
 //   ј если через ImsSerializable, то - AV.
 //   ѕро это можно писать отдельную статью.
 private
  [JSONMarshalled(False)]
  FCurrentClass: RmsShape;
  [JSONMarshalled(False)]
  FCurrentAddedShape: ImsShape;
  [JSONMarshalled(True)]
  fName: String;
 private
  function CurrentAddedShape: ImsShape;
  procedure BeginShape(const aStart: TPointF);
  procedure EndShape(const aFinish: TPointF);
  function ShapeIsEnded: Boolean;
  class function AllowedShapes: TmsRegisteredShapes;
  function ShapeByPt(const aPoint: TPointF): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  function Get_Name: String;
  constructor CreatePrim(const aName: String);
 public
  class function Create(const aName: String): ImsDiagramm;
  procedure DrawTo(const aCanvas: TCanvas);
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure Invalidate;
  procedure AllowedShapesToList(aList: TStrings);
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  property Name: String read fName write fName;
  function CurrentShapeClassIndex: Integer;
  procedure Serialize;
  procedure DeSerialize;
  procedure Assign(const anOther : TmsDiagramm);
  property CurrentClass: RmsShape read FCurrentClass write FCurrentClass;
 end;//TmsDiagramm

 ImsIvalidator = interface
  procedure InvalidateDiagramm(aDiagramm: TmsDiagramm);
 end;//ImsIvalidator

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 msMover,
 msCircle,
 msDiagrammMarshal,
 msInvalidators
 ;

{$Include msItemsHolder.mixin.pas}

const
 c_FileName = '.json';

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
  if l_Class.IsForToolbar then
   aList.AddObject(l_Class.ClassName, TObject(l_Class));
end;

function TmsDiagramm.CurrentShapeClassIndex: Integer;
begin
 Result := AllowedShapes.IndexOf(FCurrentClass);
end;

procedure TmsDiagramm.SelectShape(aList: TStrings; anIndex: Integer);
begin
 if (anIndex < 0) then
  CurrentClass :=  TmsRegisteredShapes.Instance.First
 else
  CurrentClass := RmsShape(aList.Objects[anIndex]);
end;

procedure TmsDiagramm.Serialize;
begin
 TmsDiagrammMarshal.Serialize(Self.Name + c_FileName, self);
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
  Items.Add(FCurrentAddedShape);
  if not FCurrentAddedShape.IsNeedsSecondClick then
   // - если не надо SecondClick, то наш примитив - завершЄн
   FCurrentAddedShape := nil;
  Invalidate;
 end; // FCurrentAddedShape <> nil
end;

procedure TmsDiagramm.Clear;
begin
 if (f_Items <> nil) then
  f_Items.Clear;
 Invalidate;
end;

class function TmsDiagramm.Create(const aName: String): ImsDiagramm;
begin
 Result := CreatePrim(aName);
end;

constructor TmsDiagramm.CreatePrim(const aName: String);
begin
 inherited Create;
 FCurrentAddedShape := nil;
 FCurrentClass := AllowedShapes.First;
 fName := aName;
end;

function TmsDiagramm.Get_Name: String;
begin
 Result := FName;
end;

function TmsDiagramm.CurrentAddedShape: ImsShape;
begin
 Result := FCurrentAddedShape;
end;

procedure TmsDiagramm.Assign(const anOther : TmsDiagramm);
begin
 inherited Assign(anOther);
 Self.Name := anOther.Name;
 Self.Invalidate;
end;

procedure TmsDiagramm.DeSerialize;
begin
 Clear;
 try
  TmsDiagrammMarshal.DeSerialize(Self.Name + c_FileName, Self);
 except
  on EFOpenError do
   Exit;
 end;//try..except
end;

procedure TmsDiagramm.DrawTo(const aCanvas: TCanvas);
var
 l_Shape: ImsShape;
begin
 aCanvas.BeginScene;
 try
  Assert(f_Items <> nil);
  for l_Shape in f_Items do
   l_Shape.DrawTo(TmsDrawContext.Create(aCanvas));
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
 TmsInvalidators.InvalidateDiagramm(Self);
end;

function TmsDiagramm.ShapeIsEnded: Boolean;
begin
 Result := (CurrentAddedShape = nil);
end;

function TmsDiagramm.ShapeByPt(const aPoint: TPointF): ImsShape;
var
 l_Shape: ImsShape;
 l_Index: Integer;
begin
 Result := nil;
 for l_Index := f_Items.Count - 1 downto 0 do
 begin
  l_Shape := f_Items.Items[l_Index];
  if l_Shape.ContainsPt(aPoint) then
  begin
   Result := l_Shape;
   Exit;
  end; // l_Shape.ContainsPt(aPoint)
 end; // for l_Index
end;

procedure TmsDiagramm.RemoveShape(const aShape: ImsShape);
begin
 Assert(f_Items <> nil);
 f_Items.Remove(aShape);
end;

end.
