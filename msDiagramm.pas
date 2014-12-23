unit msDiagramm;

interface

uses
{$INCLUDE msItemsHolder.mixin.pas}
 ,
{$Include msPersistent.mixin.pas}
,
{$Include msShapesProvider.mixin.pas}
 msInterfaces,
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
 msInterfacedRefcounted;

type
 TmsItemsHolderParent = TmsInterfacedRefcounted;
 TmsItem = ImsShape;
{$Include msItemsHolder.mixin.pas}
 TmsPersistentParent = TmsItemsHolder;
{$Include msPersistent.mixin.pas}
 TmsShapesProviderParent = TmsPersistent;
{$Include msShapesProvider.mixin.pas}

 TmsDiagramm = class(TmsShapesProvider, ImsDiagramm, ImsShapeByPt, ImsShapesController)
 // - Выделяем интерфейс ImsObjectWrap.
 //   Смешно - если TmsDiagramm его реализет НАПРЯМУЮ, то всё хорошо.
 //   А если через ImsSerializable, то - AV.
 //   Про это можно писать отдельную статью.
 private
  [JSONMarshalled(False)]
  FCurrentAddedShape: ImsShape;
  [JSONMarshalled(True)]
  fName: String;
 private
  function CurrentAddedShape: ImsShape;
  procedure BeginShape(const aClickContext: TmsClickContext);
  procedure EndShape(const aFinish: TPointF; aDiagrammsHolder: ImsDiagrammsHolder);
  function ShapeIsEnded: Boolean;
  function ShapeByPt(const aPoint: TPointF): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  function Get_Name: String;
  constructor CreatePrim(const aName: String);
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
  function AddShape(const aShape: ImsShape): ImsShape;
 public
  class function Create(const aName: String): ImsDiagramm;
  procedure DrawTo(const aCanvas: TCanvas);
  procedure ProcessClick(const aClickContext: TmsClickContext);
  procedure Clear;
  procedure Invalidate;
  property Name: String read fName write fName;
  procedure Serialize;
  procedure DeSerialize;
  procedure SaveToPng(const aFileName: String; const aImage: TPaintBox);
  procedure Assign(const anOther: TmsDiagramm);
 end; // TmsDiagramm

implementation

uses
{$Include msItemsHolder.mixin.pas}
{$Include msPersistent.mixin.pas}
  ,
{$Include msShapesProvider.mixin.pas}
 msMover,
 msCircle,
 msDiagrammMarshal,
 msInvalidators,
 msShapesForToolbar,
 msDiagrammsController;

{$Include msItemsHolder.mixin.pas}
{$Include msPersistent.mixin.pas}
{$Include msShapesProvider.mixin.pas}

const
 c_FileName = '.json';

procedure TmsDiagramm.Serialize;
begin
 TmsDiagrammMarshal.Serialize(Self.Name + c_FileName, Self);
end;

procedure TmsDiagramm.ProcessClick(const aClickContext: TmsClickContext);
begin
 if ShapeIsEnded then
 // - мы НЕ ДОБАВЛЯЛИ примитива - надо его ДОБАВИТЬ
  BeginShape(aClickContext)
 else
  EndShape(aClickContext.rClickPoint, aClickContext.rDiagrammsHolder);
end;

procedure TmsDiagramm.BeginShape(const aClickContext: TmsClickContext);
begin
 FCurrentAddedShape := aClickContext.rShapeCreator.CreateShape(TmsMakeShapeContext.Create(aClickContext.rClickPoint, Self, aClickContext.rDiagrammsHolder));
 if (FCurrentAddedShape <> nil) then
 begin
  Items.Add(FCurrentAddedShape);
  if not FCurrentAddedShape.IsNeedsSecondClick then
  // - если не надо SecondClick, то наш примитив - завершён
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
 fName := aName;
end;

procedure TmsDiagramm.SaveTo(const aFileName: String);
begin
 TmsDiagrammMarshal.Serialize(aFileName, Self);
end;

procedure TmsDiagramm.SaveToPng(const aFileName: String; const aImage: TPaintBox);
var
 l_BitmapBuffer: TBitmap;
 l_SourceRect: TRectF;
begin
 // Фиксируем размер снимаемой области
 l_SourceRect := TRectF.Create(0, 0, aImage.Width, aImage.Height);
 // Создаем временный буфер для получения скриншота
 l_BitmapBuffer := TBitmap.Create(Round(l_SourceRect.Width), Round(l_SourceRect.Height));
 try
  // Переводим канву в режим отрисовки - начинаем процесс отрисовки сцены
  if l_BitmapBuffer.Canvas.BeginScene then
   try
    // Говорим контролу отрисовать себя в канве нашего буфера в указанной области
    aImage.PaintTo(l_BitmapBuffer.Canvas, l_SourceRect);
   finally
    // Завершаем процесс отрисовки, заканчивая формируемую сцену
    l_BitmapBuffer.Canvas.EndScene;
   end;
  l_BitmapBuffer.SaveToFile(aFileName);
 finally
  FreeAndNil(l_BitmapBuffer);
 end;
end;

procedure TmsDiagramm.LoadFrom(const aFileName: String);
begin
 TmsDiagrammMarshal.DeSerialize(aFileName, Self);
end;

function TmsDiagramm.AddShape(const aShape: ImsShape): ImsShape;
begin
 Items.Add(aShape);
 Result := aShape;
end;

function TmsDiagramm.Get_Name: String;
begin
 Result := fName;
end;

function TmsDiagramm.CurrentAddedShape: ImsShape;
begin
 Result := FCurrentAddedShape;
end;

procedure TmsDiagramm.Assign(const anOther: TmsDiagramm);
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
 end; // try..except
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

procedure TmsDiagramm.EndShape(const aFinish: TPointF; aDiagrammsHolder: ImsDiagrammsHolder);
begin
 Assert(CurrentAddedShape <> nil);
 CurrentAddedShape.EndTo(TmsEndShapeContext.Create(aFinish, Self, aDiagrammsHolder));
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
