unit msLineWithArrow;

interface

uses
 msShape,
 msLine,
 FMX.Graphics,
 System.Types
 ;

type
 TmsLineWithArrow = class(TmsLine)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetArrowAngleRotation : Single;
 end;//TmsLineWithArrow

implementation

uses
 msSmallTriangle,
 SysUtils,
 System.Math,
 System.UITypes,
 FMX.Types
 {$IF DEFined(VER270) OR DEFined(VER280)}
 ,
 System.Math.Vectors
 {$ENDIF}
 ;


procedure TmsLineWithArrow.DoDrawTo(const aCtx: TmsDrawContext);
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
  l_OriginalMatrix := aCtx.rCanvas.Matrix;
  try
   l_Proxy := TmsSmallTriangle.CreateInner(FinishPoint);
   try
    // in Radian
    l_Angle := GetArrowAngleRotation;

    l_CenterPoint := FinishPoint;

    l_Matrix := TMatrix.Identity;
    // - —Ќ»ћј≈ћ оригинальную матрицу, точнее берЄм ≈ƒ»Ќ»„Ќ”ё матрицу
    // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X,-l_CenterPoint.Y);
    // - задаЄм точку, вокруг которой вертим
    l_Matrix := l_Matrix * TMatrix.CreateRotation(l_Angle);
    // - задаЄм угол поворота
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_CenterPoint.X,l_CenterPoint.Y);
    // - задаЄм начало координат
    l_Matrix := l_Matrix * l_OriginalMatrix;
    // - ѕ–»ћ≈Ќя≈ћ оригинальную матрицу
    // »наче например ќ–»√»ЌјЋ№Ќџ… параллельный перенос - не будет работать.
    // https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D1%80%D0%B0%D0%BB%D0%BB%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%B5%D1%80%D0%B5%D0%BD%D0%BE%D1%81

    aCtx.rCanvas.SetMatrix(l_Matrix);
    // - примен€ем нашу "комплексную" матрицу

    l_Proxy.DrawTo(aCtx);
    // - отрисовываем примитив с учЄтом матрицы преобразований
   finally
    FreeAndNil(l_Proxy);
   end;//try..finally
  finally
    aCtx.rCanvas.SetMatrix(l_OriginalMatrix);
    // - восстанавливаем ќ–»√»ЌјЋ№Ќ”ё матрицу
  end;//try..finally
 end;//(StartPoint <> FinishPoint)
end;

function TmsLineWithArrow.GetArrowAngleRotation: single;
var
 l_ALength, l_CLength,
 l_AlphaAngle,
 l_X, l_Y, l_RotationAngle : Single;
 l_PointC : TPointF;
 l_Invert : SmallInt;
begin
 // ‘ормула расчета расто€ний между двум€ точками
 l_X := (FinishPoint.X - StartPoint.X) * (FinishPoint.X - StartPoint.X);
 l_Y := (FinishPoint.Y - StartPoint.Y) * (FinishPoint.Y - StartPoint.Y);
 l_CLength := sqrt( l_X + l_Y);

 l_PointC := TPointF.Create(FinishPoint.X, StartPoint.Y);

 // ‘ормула расчета расто€ний между двум€ точками
 l_X := (l_PointC.X - StartPoint.X) * (l_PointC.X - StartPoint.X); l_Y := (l_PointC.Y - StartPoint.Y) * (l_PointC.Y - StartPoint.Y);
 l_ALength := sqrt( l_X + l_Y);

 // In Radian
 l_AlphaAngle := ArcSin(l_ALength / l_CLength);

 l_RotationAngle := 0;
 l_Invert := 1;

 if FinishPoint.X > StartPoint.X then
 begin
  l_RotationAngle := Pi / 2 * 3;
  if FinishPoint.Y > StartPoint.Y then
   l_Invert := -1;
 end
 else
 begin
  l_RotationAngle := Pi / 2;
  if FinishPoint.Y < StartPoint.Y then
   l_Invert := -1;
 end;

 Result := l_Invert * (l_AlphaAngle + l_RotationAngle);
end;

end.

