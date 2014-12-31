unit msMoverShapeButton;

interface

uses
 System.SysUtils,
 System.UITypes,
 System.Types,
 msShape,
 msInterfaces,
 System.Math.Vectors
 ;

type
 TmsMoverShapeButton = class(TmsShape)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function DrawBounds: TRectF; override;
  function Polygon: TPolygon;

  class function InitialWidth: Single;
  class function InitialHeight: Single;
 end;//TmsMoverShapeButton

implementation

{ TmsMoverShapeButton }

Uses
 msBlackRectangle,
 msBlackTriangle,
 msPaletteShapeCreator
 ;

procedure TmsMoverShapeButton.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : ImsShape;
 l_PointF, l_Scale : TPointF;
 l_B : TRectF;
 l_Ctx : TmsDrawContext;
 l_Matrix: TMatrix;
begin
 l_Proxy := TmsBlackRectangle.CreateInner(StartPoint);
 try
  l_Proxy.DrawTo(aCtx);
 finally
  l_Proxy := nil;
 end;//try..finally

 l_Proxy := TmsBlackRectangle.CreateInner(StartPoint);
 try
//  l_Matrix := aCtx.rCanvas.Matrix; 
  l_Proxy.Rotate(aCtx, Pi / 2);
//  aCtx.rCanvas.SetMatrix(l_Ctx.rCanvas.Matrix);
//  l_Proxy.DrawTo(aCtx);
 finally
  l_Proxy := nil;
 end;//try..finally

 l_Proxy := TmsBlackTriangle.CreateInner(l_PointF);
 try
  l_Proxy.DrawTo(aCtx);
 finally
  l_Proxy := nil;
 end;//try..finally
end;

function TmsMoverShapeButton.DrawBounds: TRectF;
var
 l_StartPoint, l_FinalPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(StartPoint.X - 40, StartPoint.Y - 40);
 l_FinalPoint := TPointF.Create(StartPoint.X + 40, StartPoint.Y + 40);
 Result := TRectF.Create(l_StartPoint, l_FinalPoint);
end;

class function TmsMoverShapeButton.InitialHeight: Single;
begin
 Result := 40;
end;

class function TmsMoverShapeButton.InitialWidth: Single;
begin
 Result := 40;
end;

function TmsMoverShapeButton.Polygon: TPolygon;
begin
{ SetLength(Result, 4);
 Result[0] := TPointF.Create(StartPoint.X - InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[1] := TPointF.Create(StartPoint.X + InitialHeight / 2,
                        StartPoint.Y + InitialHeight / 2);
 Result[2] := TPointF.Create(StartPoint.X,
                        StartPoint.Y - InitialHeight / 2);
 Result[3] := Result[0];                                      }
end;

end.
