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
  FStartPoint: TPointF;
  FFinishPoint: TPointF;
 protected
  property StartPoint : TPointF read FStartPoint;
  property FinishPoint : TPointF read FFinishPoint;
  class procedure Register;
  function FillColor: TAlphaColor; virtual;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
 public
  constructor Create(const aStartPoint, aFinishPoint: TPointF); virtual;
  procedure DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
  class function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aFinishPoint: TPointF);
 end;

 RmsShape = class of TmsShape;

 RmsShapeList = TList<RmsShape>;

 TmsShapeList = TObjectList<TmsShape>;

implementation

uses
  msRegisteredPrimitives
  ;

class procedure TmsShape.Register;
begin
 TmsRegisteredPrimitives.Instance.AddPrimitive(Self);
end;

function TmsShape.FillColor: TAlphaColor;
begin
 Result := TAlphaColorRec.Null;
end;

constructor TmsShape.Create(const aStartPoint, aFinishPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinishPoint := aFinishPoint;
end;

procedure TmsShape.EndTo(const aFinishPoint: TPointF);
begin
 FFinishPoint := aFinishPoint;
end;

class function TmsShape.IsNeedsSecondClick : Boolean;
begin
 Result := false;
end;

procedure TmsShape.DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 aCanvas.Fill.Color := FillColor;
 DoDrawTo(aCanvas, aOrigin);
end;

end.
