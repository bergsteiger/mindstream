unit msShapeButton;

interface

uses
 msShape,
 FMX.StdCtrls,
 FMX.Controls,
 FMX.Graphics,
 System.Types,
 msInterfaces,
 System.Classes
 ;

type TmsShapeButton = class(TButton)
private
 f_Shape: ImsShape;
 function ScaleShapeToButton: TPointF;
protected
 procedure MyPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
public
 constructor Create(AOwner: TComponent; aShape: ImsShape);
end;

implementation
uses
 System.Math.Vectors
 ;
{ TmsShapeButton }
constructor TmsShapeButton.Create(AOwner: TComponent; aShape: ImsShape);
const
 c_Size = 40;
begin
 inherited Create(AOwner);

 Width := c_Size;
 Height := c_Size;

 f_Shape := aShape;
 OnPaint := MyPaint;
end;

procedure TmsShapeButton.MyPaint(Sender: TObject;
                               Canvas: TCanvas;
                               const ARect: TRectF);
var
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_CenterPoint: TPointF;
 l_Scale: TPointF;
begin
 l_OriginalMatrix := Canvas.Matrix;
 try
  l_CenterPoint := f_Shape.StartPoint;

  l_Matrix := TMatrix.Identity;
  // - СНИМАЕМ оригинальную матрицу, точнее берём ЕДИНИЧНУЮ матрицу
  // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X,-l_CenterPoint.Y);
  // - задаём точку, вокруг которой вертим

  l_Scale := ScaleShapeToButton;
  l_Matrix := l_Matrix * TMatrix.CreateScaling(l_Scale.X, l_Scale.Y);

  // - задаём угол поворота
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_CenterPoint.X,l_CenterPoint.Y);
  // - задаём начало координат
  l_Matrix := l_Matrix * l_OriginalMatrix;
  // - ПРИМЕНЯЕМ оригинальную матрицу
  // Иначе например ОРИГИНАЛЬНЫЙ параллельный перенос - не будет работать.
  // https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D1%80%D0%B0%D0%BB%D0%BB%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%B5%D1%80%D0%B5%D0%BD%D0%BE%D1%81

  Canvas.SetMatrix(l_Matrix);
  // - применяем нашу "комплексную" матрицу

  f_Shape.DrawTo(TmsDrawContext.Create(Canvas));
  // - отрисовываем примитив с учётом матрицы преобразований
 finally
  Canvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
 end;//try..finally
end;

function TmsShapeButton.ScaleShapeToButton: TPointF;
begin
 Result:= TPointF.Create(0.5, 0.5)
end;

end.
