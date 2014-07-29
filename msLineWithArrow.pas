unit msLineWithArrow;

interface

uses
 msShape,
 msLine,
 FMX.Graphics,
 System.Types;

type
 TmsLineWithArrow = class(TmsLine)
 protected
  procedure DoDrawTo(const aCanvas : TCanvas; const aOrigin : TPointF); override;
 end;//TmsLineWithArrow

implementation

uses
 msSmallTriangle,
 SysUtils,
 System.Math.Vectors
 ;

procedure TmsLineWithArrow.DoDrawTo(const aCanvas: TCanvas;
  const aOrigin: TPointF);
var
 l_Proxy : TmsShape;
 l_Old : TMatrix;
begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  l_Old := aCanvas.Matrix;
  try
   l_Proxy := TmsSmallTriangle.Create(FinishPoint);
   try
    l_Proxy.DrawTo(aCanvas, aOrigin);
   finally
    FreeAndNil(l_Proxy);
   end;//try..finally
  finally
   aCanvas.SetMatrix(l_Old);
  end;
 end;//(StartPoint <> FinishPoint)
end;

initialization
 TmsLineWithArrow.Register;

end.
