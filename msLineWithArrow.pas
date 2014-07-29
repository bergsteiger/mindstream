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
 System.Math
 ;

procedure TmsLineWithArrow.DoDrawTo(const aCanvas: TCanvas;
  const aOrigin: TPointF);
var
 l_Proxy : TmsShape;
 l_Old : TMatrix;

  OriginalMatrix: TMatrix;
  ShiftMatrix: TMatrix;
  RotationMatrix: TMatrix;
  ShiftBackMatrix: TMatrix;
  Matrix: TMatrix;

  Angle : Single;
 l_CenterPoint : TPointF;
begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  try
   l_Proxy := TmsSmallTriangle.Create(FinishPoint);
   try
    Angle := -(DegToRad(30));

    l_CenterPoint := TPointF.Create(FinishPoint.X + aCanvas.Matrix.m31, FinishPoint.Y + aCanvas.Matrix.m32);
    OriginalMatrix := aCanvas.Matrix;

    Matrix := aCanvas.Matrix;
    Matrix := Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X,-l_CenterPoint.Y);
    Matrix := Matrix * TMatrix.CreateRotation(Angle);
    Matrix := Matrix * TMatrix.CreateTranslation(l_CenterPoint.X,l_CenterPoint.Y);
    aCanvas.SetMatrix(Matrix);

    l_Proxy.DrawTo(aCanvas, aOrigin);
   finally
    FreeAndNil(l_Proxy);
   end;//try..finally
  finally
    aCanvas.SetMatrix(OriginalMatrix);
  end;
 end;//(StartPoint <> FinishPoint)
end;

initialization
 TmsLineWithArrow.Register;

end.
