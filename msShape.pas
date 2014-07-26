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
 protected
  property StartPoint : TPointF read FStartPoint;
  class procedure Register;
  function FillColor: TAlphaColor; virtual;
  function StrokeDash: TStrokeDash; virtual;
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); virtual; abstract;
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

function TmsShape.StrokeDash: TStrokeDash;
begin
 Result := TStrokeDash.Solid;
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

procedure TmsShape.DrawTo(const aCanvas : TCanvas; const aOrigin : TPointF);
begin
 aCanvas.Fill.Color := FillColor;
 aCanvas.Stroke.Dash := StrokeDash;
 DoDrawTo(aCanvas, aOrigin);
end;

end.
