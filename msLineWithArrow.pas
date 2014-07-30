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
  function GetArrowAngleRotation : Single;
 end;//TmsLineWithArrow

implementation

uses
 msSmallTriangle,
 SysUtils,
 System.Math,
 System.UITypes,
 FMX.Types
 ;

procedure TmsLineWithArrow.DoDrawTo(const aCanvas: TCanvas;
  const aOrigin: TPointF);
var
 l_Proxy : TmsShape;
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_Angle : Single;
 l_CenterPoint : TPointF;

 l_TextRect : TRectF;
begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  l_OriginalMatrix := aCanvas.Matrix;
  try
   l_Proxy := TmsSmallTriangle.Create(FinishPoint);
   try
    l_Angle := GetArrowAngleRotation;

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

  ////// Debug
  aCanvas.Fill.Color := TAlphaColors.Black;
  l_TextRect := TRectF.Create(0, 0, 150, 150);

  aCanvas.ClearRect(l_TextRect);
  aCanvas.FillText(l_TextRect, FloatToStr(RadToDeg(GetArrowAngleRotation)), False, 1, [],
                   TTextAlign.taLeading,
                   TTextAlign.taTrailing);
 end;//(StartPoint <> FinishPoint)
end;

function TmsLineWithArrow.GetArrowAngleRotation: single;
var
 l_ALength, l_CLength,
 l_AlphaAngle,
 l_X, l_Y, l_Angle : Single;
 l_PointC : TPointF;
 l_Minus : SmallInt;
begin
 Result := 0;
 l_X := ( FinishPoint.X - StartPoint.X ) * ( FinishPoint.X - StartPoint.X );
 l_Y := ( FinishPoint.Y - StartPoint.Y ) * ( FinishPoint.Y - StartPoint.Y );
 l_CLength := sqrt( l_X + l_Y);

 l_PointC := TPointF.Create(FinishPoint.X, StartPoint.Y);

 l_X := ( l_PointC.X - StartPoint.X ) * ( l_PointC.X - StartPoint.X ); l_Y := ( l_PointC.Y - StartPoint.Y ) * ( l_PointC.Y - StartPoint.Y );
 l_ALength := sqrt( l_X + l_Y);

 // In Radian
 l_AlphaAngle := ArcSin(l_ALength / l_CLength);

 l_Angle := 0;
 l_Minus := 1;

 if FinishPoint.X > StartPoint.X then
 begin
//  l_Angle := DegToRad(270);
  l_Angle := Pi / 2 * 3;
  if FinishPoint.Y > StartPoint.Y then
   l_Minus := -1;
 end
 else
 begin
//  l_Angle := DegToRad(90);
  l_Angle := Pi / 2;
  if FinishPoint.Y < StartPoint.Y then
   l_Minus := -1;
 end;

 Result := l_Minus * (l_AlphaAngle + l_Angle);
end;


initialization
 TmsLineWithArrow.Register;

end.

