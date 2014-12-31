unit msLineWithArrow;

interface

uses
 msShape,
 msLine,
 FMX.Graphics,
 System.Types,
 msInterfaces,
 System.Math.Vectors
 ;

type
 TmsLineWithArrow = class(TmsLine)
 protected
  function GetFinishPoint: TPointF; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetArrowAngleRotation : Single;
  function GetDrawBounds: TRectF; override;
 end;//TmsLineWithArrow

implementation

uses
 msSmallTriangle,
 SysUtils,
 System.Math,
 System.UITypes,
 FMX.Types
 ;


procedure TmsLineWithArrow.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : TmsShape;
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_Angle : Single;
 l_CenterPoint,
 l_LineFinishPoint : TPointF;
 l_Polygon : TPolygon;

begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  l_OriginalMatrix := aCtx.rCanvas.Matrix;
  try
   l_LineFinishPoint := TPointF.Create(FinishPoint.X - TmsSmallTriangle.InitialHeight / 2,
                                       FinishPoint.Y);
   l_Proxy := TmsSmallTriangle.CreateInner(l_LineFinishPoint);

   // Координаты треугольника мы получить можем, но вот как их обработать ?
   l_Polygon := (l_Proxy as TmsSmallTriangle).GetPolygon;
   try
    // in Radian
    l_Angle := GetArrowAngleRotation;

    l_CenterPoint := FinishPoint;

    l_Matrix := TMatrix.Identity;
    // - СНИМАЕМ оригинальную матрицу, точнее берём ЕДИНИЧНУЮ матрицу
    // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X,-l_CenterPoint.Y);

    // - задаём точку, вокруг которой вертим
    l_Matrix := l_Matrix * TMatrix.CreateRotation(l_Angle);

    // - задаём угол поворота
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_CenterPoint.X,l_CenterPoint.Y);

    // - задаём начало координат
    l_Matrix := l_Matrix * l_OriginalMatrix;

    // - ПРИМЕНЯЕМ оригинальную матрицу
    // Иначе например ОРИГИНАЛЬНЫЙ параллельный перенос - не будет работать.
    // https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D1%80%D0%B0%D0%BB%D0%BB%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%B5%D1%80%D0%B5%D0%BD%D0%BE%D1%81

    aCtx.rCanvas.SetMatrix(l_Matrix);
    // - применяем нашу "комплексную" матрицу

    l_Proxy.DrawTo(aCtx);
    // - отрисовываем примитив с учётом матрицы преобразований
   finally
    FreeAndNil(l_Proxy);
   end;//try..finally
  finally
    aCtx.rCanvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
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
 // Формула расчета растояний между двумя точками
 l_X := (FinishPoint.X - StartPoint.X) * (FinishPoint.X - StartPoint.X);
 l_Y := (FinishPoint.Y - StartPoint.Y) * (FinishPoint.Y - StartPoint.Y);

 l_CLength := sqrt( l_X + l_Y);

 l_PointC := TPointF.Create(FinishPoint.X, StartPoint.Y);

 // Формула расчета растояний между двумя точками
 l_X := (l_PointC.X - StartPoint.X) * (l_PointC.X - StartPoint.X);
 l_Y := (l_PointC.Y - StartPoint.Y) * (l_PointC.Y - StartPoint.Y);

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

function TmsLineWithArrow.GetDrawBounds: TRectF;
begin
 Result := inherited GetDrawBounds;
 if SameValue(Result.Left, Result.Right) then
 begin
  Result.Right := Result.Left + TmsSmallTriangle.InitialHeight;
  Result.Left := Result.Left - TmsSmallTriangle.InitialHeight;
 end;//SameValue(Result.Left, Result.Right)
 if SameValue(Result.Top, Result.Bottom) then
 begin
  Result.Bottom := Result.Top + TmsSmallTriangle.InitialHeight;
  Result.Top := Result.Top - TmsSmallTriangle.InitialHeight;
 end;//SameValue(Result.Top, Result.Bottom)
end;

function TmsLineWithArrow.GetFinishPoint: TPointF;
begin
 // Вот тут, по идее, надо возвращать координату середины стороны,
 //  через которую прходит линия.
 // Сделать я это не смог, потому что не знаю как правильно после поворота треугольника
 // получить новые координаты вершин.
 Result := inherited;
end;

end.

