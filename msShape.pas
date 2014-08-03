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

 TmsShapeByPt = function (const aPoint: TPointF): TmsShape of object;

 TmsDrawContext  = record
  public
   rCanvas : TCanvas;
   rOrigin : TPointF;
   rMoving : Boolean; // - определ€ем, что текущий рисуемый примитив - двигаетс€
   constructor Create(const aCanvas : TCanvas; const aOrigin : TPointF);
 end;//TmsDrawContext

 TmsMakeShapeContext = record
  public
   rStartPoint: TPointF;
   rShapeByPt: TmsShapeByPt;
   constructor Create(aStartPoint: TPointF; aShapeByPt: TmsShapeByPt);
 end;//TmsMakeShapeContext

 TmsShape = class abstract (TObject)
 private
  FStartPoint: TPointF;
 protected
  class procedure Register;
  function FillColor: TAlphaColor; virtual;
  function StrokeDash: TStrokeDash; virtual;
  function StrokeColor: TAlphaColor; virtual;
  function StrokeThickness: Single; virtual;

  procedure DoDrawTo(const aCtx: TmsDrawContext); virtual; abstract;
//  class procedure DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);

  property StartPoint : TPointF read FStartPoint;
  constructor Create(const aStartPoint: TPointF); virtual;
 public
  procedure DrawTo(const aCtx: TmsDrawContext);
  function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aFinishPoint: TPointF; var NeedRemove: Boolean); virtual;
  procedure MoveTo(const aFinishPoint: TPointF); virtual;
  class function Make(const aCtx: TmsMakeShapeContext): TmsShape; virtual;
  function ContainsPt(const aPoint: TPointF): Boolean; virtual;
 end;//TmsShape

 RmsShape = class of TmsShape;

 RmsShapeList = TList<RmsShape>;

implementation

uses
  msRegisteredShapes
  ;

class function TmsShape.Make(const aCtx: TmsMakeShapeContext): TmsShape;
begin
 Result := Create(aCtx.rStartPoint);
end;

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

function TmsShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := False;
end;

constructor TmsShape.Create(const aStartPoint: TPointF);
begin
 inherited Create;
 FStartPoint := aStartPoint;
end;

procedure TmsShape.EndTo(const aFinishPoint: TPointF; var NeedRemove: Boolean);
begin
 Assert(false, 'ѕримитив ' + ClassName + ' не может быть завершЄн');
end;

procedure TmsShape.MoveTo(const aFinishPoint: TPointF);
begin
 FStartPoint := aFinishPoint;
end;

function TmsShape.IsNeedsSecondClick : Boolean;
begin
 Result := false;
end;

(*class procedure TmsShape.DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);
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
end;*)

procedure TmsShape.DrawTo(const aCtx: TmsDrawContext);
begin
 //DoDrawDebugInfo(aCtx.rCanvas, ClassName);

 aCtx.rCanvas.Fill.Color := FillColor;
 if aCtx.rMoving then
 begin
  aCtx.rCanvas.Stroke.Dash := TStrokeDash.sdDashDot;
  aCtx.rCanvas.Stroke.Color := TAlphaColors.Darkmagenta;
  aCtx.rCanvas.Stroke.Thickness := 4;
 end//aCtx.rMoving
 else
 begin
  aCtx.rCanvas.Stroke.Dash := StrokeDash;
  aCtx.rCanvas.Stroke.Color := StrokeColor;
  aCtx.rCanvas.Stroke.Thickness := StrokeThickness;
 end;//aCtx.rMoving
 DoDrawTo(aCtx);
end;

constructor TmsDrawContext.Create(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 rCanvas := aCanvas;
 rOrigin := aOrigin;
 rMoving := false;
end;

constructor TmsMakeShapeContext.Create(aStartPoint: TPointF; aShapeByPt: TmsShapeByPt);
begin
 rStartPoint := aStartPoint;
 rShapeByPt := aShapeByPt;
end;

end.
