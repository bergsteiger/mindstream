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
 TmsInterfacedNonRefcounted = class abstract(TObject)
 protected
  function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
  function _AddRef: Integer; stdcall;
  function _Release: Integer; stdcall;
 end;//TmsInterfacedNonRefcounted

 TmsShape = class;

 ImsShapeByPt = interface
  function ShapeByPt(const aPoint: TPointF): TmsShape;
 end;//ImsShapeByPt

 ImsShapeRemover = interface
  procedure RemoveShape(aShape: TmsShape);
 end;//ImsShapeRemover

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
   rShapeByPt: ImsShapeByPt;
   constructor Create(aStartPoint: TPointF; const aShapeByPt: ImsShapeByPt);
 end;//TmsMakeShapeContext

 TmsDrawOptionsContext = record
  public
   rFillColor: TAlphaColor;
   rStrokeDash: TStrokeDash;
   rStrokeColor: TAlphaColor;
   rStrokeThickness: Single;
   constructor Create(const aCtx: TmsDrawContext);
 end;//TmsDrawOptionsContext

 TmsShape = class abstract (TObject)
 private
  FStartPoint: TPointF;
 protected
  class procedure Register;

  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); virtual;
  function DrawOptionsContext(const aCtx: TmsDrawContext): TmsDrawOptionsContext;

  procedure DoDrawTo(const aCtx: TmsDrawContext); virtual; abstract;
//  class procedure DoDrawDebugInfo(const aCanvas : TCanvas; const aText: string);

  property StartPoint : TPointF read FStartPoint;
  constructor Create(const aStartPoint: TPointF); virtual;
 public
  procedure DrawTo(const aCtx: TmsDrawContext);
  function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aFinishPoint: TPointF; const aRemover: ImsShapeRemover); virtual;
  // - тут ќѕя“№ Ќјѕ–јЎ»¬ј≈“—я "котекст"
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

function TmsShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := False;
end;

constructor TmsShape.Create(const aStartPoint: TPointF);
begin
 inherited Create;
 FStartPoint := aStartPoint;
end;

procedure TmsShape.EndTo(const aFinishPoint: TPointF; const aRemover: ImsShapeRemover);
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

procedure TmsShape.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 // - тут ничего не делаем
end;

function TmsShape.DrawOptionsContext(const aCtx: TmsDrawContext): TmsDrawOptionsContext;
begin
 Result := TmsDrawOptionsContext.Create(aCtx);
 TransformDrawOptionsContext(Result);
end;

procedure TmsShape.DrawTo(const aCtx: TmsDrawContext);
var
 l_Ctx : TmsDrawOptionsContext;
begin
 l_Ctx :=  DrawOptionsContext(aCtx);
 aCtx.rCanvas.Fill.Color := l_Ctx.rFillColor;
 aCtx.rCanvas.Stroke.Dash := l_Ctx.rStrokeDash;
 aCtx.rCanvas.Stroke.Color := l_Ctx.rStrokeColor;
 aCtx.rCanvas.Stroke.Thickness := l_Ctx.rStrokeThickness;
 DoDrawTo(aCtx);
end;

constructor TmsDrawContext.Create(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 rCanvas := aCanvas;
 rOrigin := aOrigin;
 rMoving := false;
end;

constructor TmsMakeShapeContext.Create(aStartPoint: TPointF; const aShapeByPt: ImsShapeByPt);
begin
 rStartPoint := aStartPoint;
 rShapeByPt := aShapeByPt;
end;

function TmsInterfacedNonRefcounted.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
 Result := E_NoInterface;
end;

function TmsInterfacedNonRefcounted._AddRef: Integer;
begin
 Result := -1;
end;

function TmsInterfacedNonRefcounted._Release: Integer;
begin
 Result := -1;
end;

constructor TmsDrawOptionsContext.Create(const aCtx: TmsDrawContext);
begin
 rFillColor :=  TAlphaColorRec.Null;
 if aCtx.rMoving then
 begin
  rStrokeDash := TStrokeDash.sdDashDot;
  rStrokeColor := TAlphaColors.Darkmagenta;
  rStrokeThickness := 4;
 end//aCtx.rMoving
 else
 begin
  rStrokeDash := TStrokeDash.sdSolid;
  rStrokeColor := TAlphaColorRec.Black;
  rStrokeThickness := 1;
 end;//aCtx.rMoving
end;

end.
