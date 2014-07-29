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

  Angle: Single;
  R: TRectF;
  S: String;
  H: Single;
  Matrix: TMatrix;

  TranslateMatrix, ScaleMatrix, RotMatrix: TMatrix;
  M1, M2: TMatrix;
begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  l_Old := aCanvas.Matrix;
  try
   l_Proxy := TmsSmallTriangle.Create(FinishPoint);
   try
    Angle := -(DegToRad(30));
    Matrix := TMatrix.CreateRotation(Angle);
    Matrix.m31 :=  TmsSmallTriangle.InitialHeight * (1 - Cos(Angle)) + Sin(Angle);
    Matrix.m32 := -Sin(Angle) * TmsSmallTriangle.InitialHeight;
    aCanvas.SetMatrix(Matrix);

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
