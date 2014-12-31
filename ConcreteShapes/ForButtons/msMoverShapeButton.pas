unit msMoverShapeButton;

interface

uses
 System.SysUtils,
 System.UITypes,
 System.Types,
 msShape,
 msInterfaces
 ;

type
 TmsMoverShapeButton = class(TmsShape)
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function DrawBounds: TRectF; override;

  class function InitialWidth: Single; virtual;
  class function InitialHeight: Single; virtual;
 end;//TmsMoverShapeButton

implementation

{ TmsMoverShapeButton }

Uses
 msBlackRectangle,
 msBlackTriangle
 ;

procedure TmsMoverShapeButton.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : TmsShape;
 l_PointF : TPointF;
begin
 l_Proxy := TmsBlackRectangle.CreateInner(StartPoint);
 try
  l_Proxy.DrawTo(aCtx);
 finally
  FreeAndNil(l_Proxy);
 end;//try..finally

 l_Proxy := TmsBlackRectangle.CreateInner(StartPoint);
 try
  l_Proxy.DrawTo(aCtx);
 finally
  FreeAndNil(l_Proxy);
 end;//try..finally

 l_Proxy := TmsBlackRectangle.CreateInner(StartPoint);
 try
  l_Proxy.Rotate(aCtx, Pi / 2);
  l_Proxy.DrawTo(aCtx);
 finally
  FreeAndNil(l_Proxy);
 end;//try..finally

 l_PointF := StartPoint;
 l_PointF.X := StartPoint.X + InitialWidth / 2;

 l_Proxy := TmsBlackTriangle.CreateInner(l_PointF);
 try
  l_Proxy.DrawTo(aCtx);
 finally
  FreeAndNil(l_Proxy);
 end;//try..finally
end;

function TmsMoverShapeButton.DrawBounds: TRectF;
var
 l_StartPoint, l_FinalPoint : TPointF;
begin
 l_StartPoint := TPointF.Create(StartPoint.X - InitialWidth / 2,
                               StartPoint.Y - InitialHeight / 2);
 l_FinalPoint := TPointF.Create(StartPoint.X + InitialWidth / 2,
                            StartPoint.Y + InitialHeight / 2);
 Result := TRectF.Create(l_StartPoint, l_FinalPoint);
end;

class function TmsMoverShapeButton.InitialHeight: Single;
begin
 Result := 100;
end;

class function TmsMoverShapeButton.InitialWidth: Single;
begin
 Result := 100;
end;

procedure TmsMoverShapeButton.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
  inherited;
 theCtx.rFillColor := TAlphaColorRec.Black;
end;

end.
