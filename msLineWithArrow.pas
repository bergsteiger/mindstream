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
 System.Math,
 System.Math.Vectors
 ;

procedure TmsLineWithArrow.DoDrawTo(const aCanvas: TCanvas;
  const aOrigin: TPointF);
var
 l_Proxy : TmsShape;
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_Angle : Single;
 l_CenterPoint : TPointF;
begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  l_OriginalMatrix := aCanvas.Matrix;
  try
   l_Proxy := TmsSmallTriangle.Create(FinishPoint);
   try
    l_Angle := -(DegToRad(90));

    l_CenterPoint := TPointF.Create(FinishPoint.X{ + aCanvas.Matrix.m31}, FinishPoint.Y{ + aCanvas.Matrix.m32});

    l_Matrix := l_OriginalMatrix;
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X,-l_CenterPoint.Y);
    l_Matrix := l_Matrix * TMatrix.CreateRotation(l_Angle);
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_CenterPoint.X,l_CenterPoint.Y);
    aCanvas.SetMatrix(l_Matrix);

    l_Proxy.DrawTo(aCanvas, aOrigin);
   finally
    FreeAndNil(l_Proxy);
   end;//try..finally
  finally
    aCanvas.SetMatrix(l_OriginalMatrix);
  end;
 end;//(StartPoint <> FinishPoint)
end;

initialization
 TmsLineWithArrow.Register;

end.
