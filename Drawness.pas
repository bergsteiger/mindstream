unit Drawness;

interface

uses
 FMX.Graphics, System.Types, FMX.Types, Generics.Collections, System.SysUtils;
type 
 TMyShape = class
 private
  FStartPoint, FFinalPoint: TPointF;
 public
  Constructor Create(const aStartPoint, aFinalPoint: TPointF); overload;
  procedure DrawTo(const aCanvas : TCanvas);
  procedure DrawShape(const aCanvas : TCanvas); virtual; abstract;
 end;

 TLine = class(TMyShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

 TRectangle = class(TMyShape)
 private
   procedure DrawShape(const aCanvas : TCanvas); override;
 end;

type
 TShapeList = TObjectList<TMyShape>;

 TDrawness = class
 private
  FShapeList : TShapeList;
    function GetShapeList: TShapeList;
 public
  constructor Create;
  destructor Destroy; override;
  procedure DrawTo(const aCanvas : TCanvas);
 property ShapeList : TShapeList read GetShapeList;
 end;

implementation

{ TDrawness }

constructor TMyShape.Create(const aStartPoint, aFinalPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinalPoint := aFinalPoint;
end;

procedure TMyShape.DrawTo(const aCanvas: TCanvas);
begin
  aCanvas.BeginScene;
  DrawShape(aCanvas);
  aCanvas.EndScene;
end;

{ TDrawness }

constructor TDrawness.Create;
begin
 FShapeList := TShapeList.Create();
end;

destructor TDrawness.Destroy;
begin
 freeandnil(FShapeList);
 inherited;
end;

procedure TDrawness.DrawTo(const aCanvas: TCanvas);
var
 i : Integer;
begin
 for i:= 0 to FShapeList.Count-1
  do FShapeList[i].DrawTo(aCanvas);
end;

function TDrawness.GetShapeList: TShapeList;
begin
 Result := FShapeList;
end;

{ TLine }

procedure TLine.DrawShape(const aCanvas : TCanvas);
begin
 aCanvas.DrawLine(FStartPoint, FFinalPoint, 1);
end;

{ TRectangle }

procedure TRectangle.DrawShape(const aCanvas: TCanvas);
begin
 aCanvas.DrawRect(TRectF.Create(FStartPoint, FFinalPoint),
                                0, 0,
                                AllCorners, 1,
                                TCornerType.ctRound);
end;

end.
