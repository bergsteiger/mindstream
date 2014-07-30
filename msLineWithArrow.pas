<<<<<<< 1b4baf4ec592d6ae5d9c6e0adf44e5896e593cda
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
    if SameValue(StartPoint.X, FinishPoint.X) then
    begin
     if (StartPoint.Y < FinishPoint.Y) then
      l_Angle := pi / 2
     else
      l_Angle := - pi / 2;
    end
    else
    if SameValue(StartPoint.Y, FinishPoint.Y) then
    begin
     if (StartPoint.X < FinishPoint.X) then
      l_Angle := 0
     else
      l_Angle := pi;
    end
    else
     // - тут надо посчитать через теорему Пифагора
     l_Angle := -(DegToRad(45));

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
=======
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
type
 TWhereWeDraw = (wwdOne, wwdTwo, wwdThree, wwdFour);
var
 l_ALength, l_CLength,
 l_AlphaAngle,
 l_X, l_Y : Single;
 l_PointC : TPointF;

function WhereWeDraw : TWhereWeDraw;
begin
 if FinishPoint.X > StartPoint.X then
 begin
  if FinishPoint.Y < StartPoint.Y then
   Result := wwdOne
  else
   Result := wwdFour;
 end
 else
 begin
  if FinishPoint.Y < StartPoint.Y then
   Result := wwdTwo
  else
   Result := wwdThree;
 end;

end;

begin
 Result := 0;

 l_X := ( FinishPoint.X - StartPoint.X ) * ( FinishPoint.X - StartPoint.X ); l_Y := ( FinishPoint.Y - StartPoint.Y ) * ( FinishPoint.Y - StartPoint.Y );
 l_CLength := sqrt( l_X + l_Y);

 l_PointC := TPointF.Create(FinishPoint.X, StartPoint.Y);

 l_X := ( l_PointC.X - StartPoint.X ) * ( l_PointC.X - StartPoint.X ); l_Y := ( l_PointC.Y - StartPoint.Y ) * ( l_PointC.Y - StartPoint.Y );
 l_ALength := sqrt( l_X + l_Y);

 // In Radian
 l_AlphaAngle := ArcSin(l_ALength / l_CLength);

 case WhereWeDraw of
  wwdOne : begin
   Result := l_AlphaAngle + DegToRad(270);
   Result := Result;
  end;
  wwdTwo : begin
   Result := l_AlphaAngle + DegToRad(90);
   Result := - Result;
  end;
  wwdThree : begin
   Result := l_AlphaAngle + DegToRad(90);
   Result := Result;
  end;
  wwdFour : begin
   Result := l_AlphaAngle + DegToRad(270);
   Result := - Result;
  end;
 end;
end;


initialization
 TmsLineWithArrow.Register;

end.
>>>>>>> cbd183b95c37426d1943f8c448eff4804de2feb2
