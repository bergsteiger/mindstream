unit msActor;

interface

uses
 System.Math.Vectors,
 System.SysUtils,
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msDiagramm,
 msInterfaces,
 msLine,
 msCircle,
 msCircleWithRadius
 ;

type
 TmsActor = class(TmsCircle)
 protected

  function InitialRadiusX: Integer; override;
  function ActorHeadRadius: Integer;
  function CreateActorHeadShape(const aStartPoint: TPointF): ImsShape;
  function ActorHeadShapeMC: ImsShapeClass;
  function GetDrawBounds: TRectF;
  function GetPolygon: TPolygon;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 public
 end;

implementation

{ TmsActor }
function TmsActor.InitialRadiusX: Integer;
begin
 Result := ActorHeadRadius;
end;

function TmsActor.ActorHeadRadius: Integer;
begin
 Result := 10;
end;

function TmsActor.CreateActorHeadShape(const aStartPoint: TPointF): ImsShape;
begin
  Result := ActorHeadShapeMC.Creator.CreateShape(aStartPoint);
end;

function TmsActor.ActorHeadShapeMC: ImsShapeClass;
begin
  result := TmsShape.NamedMC('PointCircle');
end;

function TmsActor.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(TPointF.Create(StartPoint.X - 0.5*ActorHeadRadius, StartPoint.Y - 2*ActorHeadRadius),
                         TPointF.Create(StartPoint.X + 0.5*ActorHeadRadius, StartPoint.Y - ActorHeadRadius));
end;

function TmsActor.GetPolygon: TPolygon;
begin
 SetLength(Result, 3);
 Result[0] := TPointF.Create(StartPoint.X - ActorHeadRadius,
                        StartPoint.Y + 3*ActorHeadRadius);
 Result[1] := TPointF.Create(StartPoint.X,
                        StartPoint.Y + ActorHeadRadius);
 Result[2] := TPointF.Create(StartPoint.X + ActorHeadRadius,
                        StartPoint.Y + 3*ActorHeadRadius);
end;


procedure TmsActor.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy: ImsShape;
 l_msCircleRect: TRectF;
 l_Rect : TRectF;
 l_Path: TPathData;
 l_P: TPolygon;
 i: integer;
 l_HeadCenterPoint,
 l_LineStartPoint,
 l_LineFinishPoint: TPointF;
begin
 l_msCircleRect := GetDrawBounds;
 l_Rect := DrawBounds;

 // Head of actor
 l_HeadCenterPoint := TPointF.Create(StartPoint.X,
                                StartPoint.Y - ActorHeadRadius);

 //l_Proxy := CreateActorHeadShape(l_HeadCenterPoint);
 //l_Proxy.DrawTo(aCtx);

 aCtx.rCanvas.DrawEllipse(l_msCircleRect, 1);


 //Hands of actor - manual paint
 l_LineStartPoint := PointF(StartPoint.X - 1.5*ActorHeadRadius ,
                        StartPoint.Y - 0.5*ActorHeadRadius);
 l_LineFinishPoint := PointF(StartPoint.X + 1.5*ActorHeadRadius ,
                        StartPoint.Y - 0.5*ActorHeadRadius);
 //l_Proxy := TmsLine.CreateCompleted(l_LineStartPoint, l_LineFinishPoint, ShapeController - ???);
 aCtx.rCanvas.DrawLine(l_LineStartPoint, l_LineFinishPoint, 1);

 //Body of actor
 l_LineStartPoint := PointF(StartPoint.X,
                        StartPoint.Y - ActorHeadRadius);
 l_LineFinishPoint := PointF(StartPoint.X,
                        StartPoint.Y + ActorHeadRadius);
 aCtx.rCanvas.DrawLine(l_LineStartPoint, l_LineFinishPoint, 1);

 l_P := GetPolygon;
 l_Path := TPathData.Create;
 try
  for I := 0 to High(l_P) do
   if I = 0
    then l_Path.MoveTo(l_P[I])
    else l_Path.LineTo(l_P[I]);
  aCtx.rCanvas.DrawPath(l_Path, 1);
 finally
  FreeAndNil(l_Path);
 end;
 //inherited;
end;

procedure TmsActor.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
end;

end.
