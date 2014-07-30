unit msShape;

interface
uses
 FMX.Graphics,
 System.Types,
 FMX.Types,
 System.UITypes,
 Generics.Collections
 ;

type
 TmsShape = class;

 TmsShapeList = TObjectList<TmsShape>;
 // - Объявляем список примитивов заранее, чтобы его можно было принимать в конструктор

 TmsShape = class abstract (TObject)
 private
  FStartPoint,
  FFinishPoint: TPointF;
 protected
  class procedure Register;
  function FillColor: TAlphaColor; virtual;
  function StrokeDash: TStrokeDash; virtual;
  function StrokeColor: TAlphaColor; virtual;
  function StrokeThickness: Single; virtual;

  procedure DoFill(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;

  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
  class procedure DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);

  property StartPoint : TPointF read FStartPoint;
  property FinishPoint : TPointF Read FFinishPoint write FFinishPoint;
 public
  constructor Create(const aStartPoint: TPointF; aListWithOtherShapes: TmsShapeList); virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  class function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aFinishPoint: TPointF); virtual;
 end;

 RmsShape = class of TmsShape;

 RmsShapeList = TList<RmsShape>;

 //TmsShapeList = TObjectList<TmsShape>;

implementation

uses
  msRegisteredShapes
  ;

class procedure TmsShape.Register;
begin
 TmsRegisteredShapes.Instance.Register(Self);
end;

function TmsShape.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Null;
end;

function TmsShape.StrokeColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Black;
end;

function TmsShape.StrokeDash: TStrokeDash;
begin
 Result := TStrokeDash.sdSolid;
end;

function TmsShape.StrokeThickness: Single;
begin
Result := 1;
end;

constructor TmsShape.Create(const aStartPoint: TPointF; aListWithOtherShapes: TmsShapeList);
begin
 FStartPoint := aStartPoint;
end;

procedure TmsShape.EndTo(const aFinishPoint: TPointF);
begin
 Assert(false, 'Примитив ' + ClassName + ' не может быть завершён');
end;

class function TmsShape.IsNeedsSecondClick : Boolean;
begin
 Result := false;
end;

class procedure TmsShape.DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);
var
 l_TextRect : TRectF;
 l_OriginalColor : TAlphaColor;
begin
  ////// Debug
  l_OriginalColor := aCanvas.Fill.Color;
  aCanvas.Fill.Color := TAlphaColorRec.Black;
  l_TextRect := TRectF.Create(0, 0, 150, 150);

  aCanvas.ClearRect(l_TextRect);
  aCanvas.FillText(l_TextRect, aText, False, 1, [],
                   TTextAlign.taLeading,
                   TTextAlign.taTrailing);
  aCanvas.Fill.Color := l_OriginalColor;
end;

procedure TmsShape.DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 aCanvas.Fill.Color := FillColor;
 aCanvas.Stroke.Dash := StrokeDash;
 aCanvas.Stroke.Color := StrokeColor;
 aCanvas.Stroke.Thickness := StrokeThickness;
 DoDrawTo(aCanvas, aOrigin);
end;

end.
