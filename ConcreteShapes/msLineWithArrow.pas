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
  function CreateArrowHeadShape(const aStartPoint: TPointF): ImsShape;
  function ArrowHeadShapeMC: ImsShapeClass; virtual;
  function GetFinishPointForDraw: TPointF; override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetArrowAngleRotation : Single;
  function GetDrawBounds: TRectF; override;
 end;//TmsLineWithArrow

implementation

uses
 SysUtils,
 System.Math,
 System.UITypes,
 FMX.Types
 ;

 // TmsLineWithArrow

function TmsLineWithArrow.CreateArrowHeadShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := ArrowHeadShapeMC.Creator.CreateShape(aStartPoint);
end;

function TmsLineWithArrow.ArrowHeadShapeMC: ImsShapeClass;
begin
 Result := TmsShape.NamedMC('SmallTriangle');
end;

procedure TmsLineWithArrow.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_Proxy : ImsShape;
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_Angle : Single;
 l_CenterPoint,
 l_LineFinishPoint : TPointF;
begin
 inherited;
 if (StartPoint <> FinishPoint) then
 begin
  l_OriginalMatrix := aCtx.rCanvas.Matrix;
  try
   l_LineFinishPoint := TPointF.Create(FinishPoint.X - ArrowHeadShapeMC.InitialHeight / 2,
                                       FinishPoint.Y);
   l_Proxy := CreateArrowHeadShape(l_LineFinishPoint);
   try
    // in Radian
    l_Angle := GetArrowAngleRotation;

    l_CenterPoint := FinishPoint;

    l_Matrix := TMatrix.Identity;
    // - СНИМАЕМ оригинальную матрицу, точнее берём ЕДИНИЧНУЮ матрицу
    // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X, -l_CenterPoint.Y);

    // - задаём точку, вокруг которой вертим
    l_Matrix := l_Matrix * TMatrix.CreateRotation(l_Angle);

    // - задаём угол поворота
    l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_CenterPoint.X, l_CenterPoint.Y);

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
    l_Proxy := nil;
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

 l_Invert := 1;

 if (FinishPoint.X > StartPoint.X) then
 begin
  l_RotationAngle := Pi / 2 * 3;
  if FinishPoint.Y > StartPoint.Y then
   l_Invert := -1;
 end//FinishPoint.X > StartPoint.X
 else
 begin
  l_RotationAngle := Pi / 2;
  if FinishPoint.Y < StartPoint.Y then
   l_Invert := -1;
 end;//FinishPoint.X > StartPoint.X

 Result := l_Invert * (l_AlphaAngle + l_RotationAngle);
end;

function TmsLineWithArrow.GetDrawBounds: TRectF;
begin
 Result := inherited GetDrawBounds;
 if SameValue(Result.Left, Result.Right) then
 begin
  Result.Right := Result.Left + ArrowHeadShapeMC.InitialHeight;
  Result.Left := Result.Left - ArrowHeadShapeMC.InitialHeight;
 end;//SameValue(Result.Left, Result.Right)
 if SameValue(Result.Top, Result.Bottom) then
 begin
  Result.Bottom := Result.Top + ArrowHeadShapeMC.InitialHeight;
  Result.Top := Result.Top - ArrowHeadShapeMC.InitialHeight;
 end;//SameValue(Result.Top, Result.Bottom)
end;

function TmsLineWithArrow.GetFinishPointForDraw: TPointF;
var
 l_Angle : Single;
begin
 l_Angle := GetArrowAngleRotation;
 Result := TPointF.Create(FinishPoint.X - ArrowHeadShapeMC.InitialHeight * Cos(l_Angle),
                          FinishPoint.Y - ArrowHeadShapeMC.InitialHeight * Sin(l_Angle));
end;

end.

