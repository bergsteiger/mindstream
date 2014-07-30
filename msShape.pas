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
 TmsShape = class abstract (TObject)
 private
  FStartPoint,
  FFinishPoint: TPointF;
 protected
  class procedure Register;
  function FillColor: TAlphaColor; virtual;
  function StrokeDash: TStrokeDash; virtual;
  function StrokeColor: TAlphaColor; virtual;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
  procedure DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);

  property StartPoint : TPointF read FStartPoint;
  property FinishPoint : TPointF Read FFinishPoint write FFinishPoint;
 public
  constructor Create(const aStartPoint: TPointF); virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  class function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aFinishPoint: TPointF); virtual;
 end;

 RmsShape = class of TmsShape;

 RmsShapeList = TList<RmsShape>;

 TmsShapeList = TObjectList<TmsShape>;

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
 Result := TAlphaColorRec.Null;
end;

function TmsShape.StrokeDash: TStrokeDash;
begin
 Result := TStrokeDash.sdSolid;
end;

constructor TmsShape.Create(const aStartPoint: TPointF);
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

procedure TmsShape.DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);
var
 l_TextRect : TRectF;
begin
  ////// Debug
  aCanvas.Fill.Color := TAlphaColors.Black;
  l_TextRect := TRectF.Create(0, 0, 150, 150);

  aCanvas.ClearRect(l_TextRect);
  aCanvas.FillText(l_TextRect, aText, False, 1, [],
                   TTextAlign.taLeading,
                   TTextAlign.taTrailing);
end;

procedure TmsShape.DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 aCanvas.Fill.Color := FillColor;
 aCanvas.Stroke.Dash := StrokeDash;
 aCanvas.Stroke.Color := StrokeColor;
 DoDrawTo(aCanvas, aOrigin);
end;

end.
