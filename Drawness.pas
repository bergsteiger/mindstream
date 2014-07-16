unit Drawness;

interface

uses
 FMX.Graphics, System.Types, FMX.Types, Generics.Collections, System.SysUtils;
type 
 TMyShape = class
 private
  FStartPoint, FFinalPoint: TPointF;
 public
  Constructor Create(aStartPoint, aFinalPoint: TPointF); overload;
  procedure DrawTo(aCanvas : TCanvas);
  procedure DrawShape(aCanvas : TCanvas); virtual; abstract;
 end;

 TLine = class(TMyShape)
 private
   procedure DrawShape(aCanvas : TCanvas); override;
 end;

 TRectangle = class(TMyShape)
 private
   procedure DrawShape(aCanvas : TCanvas); override;
 end;

 TDrawness = class
 private
  FShapeList : TObjectList<TMyShape>;
    function GetShapeList: TObjectList<TMyShape>;
 public
  constructor Create;
  destructor Destroy; override;
  procedure DrawTo(aCanvas : TCanvas);
 property ShapeList : TObjectList<TMyShape> read GetShapeList;
 end;

implementation

{ TDrawness }

constructor TMyShape.Create(aStartPoint, aFinalPoint: TPointF);
begin
 FStartPoint := aStartPoint;
 FFinalPoint := aFinalPoint;
end;

procedure TMyShape.DrawTo(aCanvas: TCanvas);
begin
  aCanvas.BeginScene;
  DrawShape(aCanvas);
  aCanvas.EndScene;
end;

{ TDrawness }

constructor TDrawness.Create;
begin
 FShapeList := TObjectList<TMyShape>.Create();
end;

destructor TDrawness.Destroy;
begin
 freeandnil(FShapeList);
 inherited;
end;

procedure TDrawness.DrawTo(aCanvas: TCanvas);
var
 i : Integer;
begin
 for i:= 0 to FShapeList.Count-1
  do FShapeList[i].DrawTo(aCanvas);
end;

function TDrawness.GetShapeList: TObjectList<TMyShape>;
begin
 Result := FShapeList;
end;

{ TLine }

procedure TLine.DrawShape(aCanvas : TCanvas);
begin
 aCanvas.DrawLine(FStartPoint, FFinalPoint, 1);
end;

{ TRectangle }

procedure TRectangle.DrawShape(aCanvas: TCanvas);
begin
 aCanvas.DrawRect(TRectF.Create(FStartPoint, FFinalPoint),
                                0, 0,
                                AllCorners, 1,
                                TCornerType.ctRound);
end;

end.
