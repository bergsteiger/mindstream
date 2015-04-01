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
  procedure EndShape(const aClickContext: TmsClickContext);
  function ShapeIsEnded: Boolean;
  function ShapeByPt(const aPoint: TPointF): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  function Get_Name: String;
  constructor CreatePrim(const aName: String);
  function AddShape(const aShape: ImsShape): ImsShape;
  function ShapeCount: Integer;
  function FirstShape: ImsShape;
  function ShapesController: ImsShapesController;
  function GetDrawBounds: TRectF;
 protected
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
  procedure Cleanup; override;
 public
  class function Create(const aName: String): ImsDiagramm;
  procedure DrawTo(const aCanvas: TCanvas);
  procedure MouseDown(const aClickContext: TmsClickContext);
  procedure MouseUp(const aClickContext: TmsClickContext);
  procedure MouseMove(const aClickContext: TmsClickContext);
  procedure Clear;
  procedure Invalidate;
  property Name: String read fName write fName;
  procedure Serialize;
  procedure DeSerialize;
  procedure SaveToPng(const aFileName: String);
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
 msDiagrammsController,
 System.Math.Vectors,
 System.Math,
 FMX.Types
 ;

{$Include msItemsHolder.mixin.pas}
{$Include msPersistent.mixin.pas}
{$Include msShapesProvider.mixin.pas}

// TmsDiagramm

procedure TmsDiagramm.Cleanup;
begin
 // - перекрыто чисто для отладки
 inherited;
end;

const
 c_FileName = '.json';

procedure TmsDiagramm.Serialize;
begin
 TmsDiagrammMarshal.Serialize(Self.Name + c_FileName, Self);
end;

procedure TmsDiagramm.MouseDown(const aClickContext: TmsClickContext);
begin
 if ShapeIsEnded then
 // - мы НЕ ДОБАВЛЯЛИ примитива - надо его ДОБАВИТЬ
  BeginShape(aClickContext)
 else
  EndShape(aClickContext);
end;

procedure TmsDiagramm.BeginShape(const aClickContext: TmsClickContext);
begin
 FCurrentAddedShape := aClickContext.rShapeCreator.CreateShape(TmsMakeShapeContext.Create(aClickContext.rClickPoint, Self, aClickContext.rDiagrammsHolder));
 if (FCurrentAddedShape <> nil) then
 begin
  Self.Add(FCurrentAddedShape);
  if (not FCurrentAddedShape.IsNeedsSecondClick) then
    // - если не надо SecondClick или MouseUp, то наш примитив - завершён
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

procedure TmsDiagramm.SaveToPng(const aFileName: string);
const
 cDelta = 10;
var
 l_Bitmap: TBitmap;
 l_SourceRect: TRectF;
 l_OriginalMatrix: TMatrix;
 l_Canvas: TCanvas;
 l_Matrix: TMatrix;
begin
 // Фиксируем размер снимаемой области
 l_SourceRect := GetDrawBounds;
 Assert(l_SourceRect.Width > 0);
 Assert(l_SourceRect.Height > 0);
 l_SourceRect.Inflate(cDelta, cDelta);
 // Создаем временный буфер для получения скриншота
 l_Bitmap := TBitmap.Create(Round(l_SourceRect.Width), Round(l_SourceRect.Height));
 try
  l_Canvas := l_Bitmap.Canvas;
  l_Canvas.BeginScene;
  try
   l_OriginalMatrix := l_Canvas.Matrix;
   try
    l_Matrix := TMatrix.Identity;
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_SourceRect.Left{ - cDelta}, -l_SourceRect.Top{ - cDelta});
    l_Matrix := l_Matrix * l_OriginalMatrix;
    l_Canvas.SetMatrix(l_Matrix);
    l_Canvas.Fill.Color := TAlphaColorRec.White;
    l_Canvas.FillRect(l_SourceRect,
                     0,
                     0,
                     AllCorners,
                     1.0,
                     TCornerType.Round);
    Self.DrawTo(l_Canvas);
   finally
    l_Canvas.SetMatrix(l_OriginalMatrix);
   end;//try..finally
  finally
   l_Canvas.EndScene;
  end;//try..finally
  l_Bitmap.SaveToFile(aFileName);
 finally
  FreeAndNil(l_Bitmap);
 end;//try..finally
end;

procedure TmsDiagramm.LoadFrom(const aFileName: String);
begin
 TmsDiagrammMarshal.DeSerialize(aFileName, Self);
end;

procedure TmsDiagramm.MouseMove(const aClickContext: TmsClickContext);
begin
 if (FCurrentAddedShape <> nil) then
  FCurrentAddedShape.MouseMove(TmsEndShapeContext.Create(aClickContext.rClickPoint, Self, aClickContext.rDiagrammsHolder));
end;

procedure TmsDiagramm.MouseUp(const aClickContext: TmsClickContext);
begin
 if Assigned(FCurrentAddedShape) then
  if FCurrentAddedShape.MouseUp(TmsEndShapeContext.Create(aClickContext.rClickPoint, Self, aClickContext.rDiagrammsHolder)) then
   FCurrentAddedShape := nil;
end;

function TmsDiagramm.AddShape(const aShape: ImsShape): ImsShape;
begin
 Self.Add(aShape);
 Result := aShape;
end;

function TmsDiagramm.ShapeCount: Integer;
begin
 Result := Self.ItemsCount;
end;

function TmsDiagramm.FirstShape: ImsShape;
begin
 Result := _Items.First;
end;

function TmsDiagramm.ShapesController: ImsShapesController;
begin
 Result := Self;
end;

function TmsDiagramm.GetDrawBounds: TRectF;
var
 l_Shape : ImsShape;
 l_R : TRectF;
begin
 Result.Left := High(Integer);
 Result.Top := High(Integer);
 Result.Right := Low(Integer);
 Result.Bottom := Low(Integer);
 Assert(f_Items <> nil);
 for l_Shape in f_Items do
 begin
  l_R := l_Shape.DrawBounds;
  Result.Left := Min(Result.Left, l_R.Left);
  Result.Top := Min(Result.Top, l_R.Top);
  Result.Right := Max(Result.Right, l_R.Right);
  Result.Bottom := Max(Result.Bottom, l_R.Bottom);
 end;//for l_Shape
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
  if (f_Items = nil) then
  // - ���� ���������� ���������, � ����� ����������� �� N+1 ������� -
  //   �� ��� ��� ���� ������
   Exit;
  Assert(f_Items <> nil);
  for l_Shape in f_Items do
   l_Shape.DrawTo(TmsDrawContext.Create(aCanvas));
 finally
  aCanvas.EndScene;
 end; // try..finally
end;

procedure TmsDiagramm.EndShape(const aClickContext: TmsClickContext);
begin
 Assert(CurrentAddedShape <> nil);
 if CurrentAddedShape.EndTo(TmsEndShapeContext.Create(aClickContext.rClickPoint, Self, aClickContext.rDiagrammsHolder)) then
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
 l_HitShape: ImsShape;
 l_Index: Integer;
begin
 Result := nil;
  if (f_Items = nil) then
  // - ���� ���������� ���������, � ����� ����������� �� N+1 ������� -
  //   �� ��� ��� ���� ������
   Exit;
 for l_Index := ItemsCount - 1 downto 0 do
 begin
  l_Shape := _Items.Items[l_Index];
  if l_Shape.HitTest(aPoint, l_HitShape) then
  begin
   Result := l_HitShape;
   Exit;
  end; // l_Shape.HitTest(aPoint, l_HitShape)
 end; // for l_Index
end;

procedure TmsDiagramm.RemoveShape(const aShape: ImsShape);
begin
 Assert(f_Items <> nil);
 _Items.Remove(aShape);
 Invalidate;
end;

end.
