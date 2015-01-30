unit msShapeButtonPrim;

interface

uses
 FMX.StdCtrls,
 FMX.Graphics,
 System.Classes,
 System.Types,
 msShape,
 msInterfaces
 ;

type
 TmsShapeButtonPrim = class abstract (TButton)
 // јбстрактный класс дл€ кнопок с фигурами.
 protected
  f_ShapeClass : MCmsShape;
  f_Shape: ImsShape;
  f_Holder : ImsDiagrammsHolder;
  procedure MyPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF); virtual;
  procedure MyClick(Sender: TObject); virtual;
 public
  constructor Create(AOwner: TComponent;
                     const aShape: MCmsShape;
                     const aHolder: ImsDiagrammsHolder);
  destructor Destroy; override;
 end;// TmsShapeButtonPrim

implementation

uses
 System.Math.Vectors,
 System.UITypes,
 FMX.Types,
 Math,
 msPaletteShapeCreator
 ;
{ TmsShapeButtonPrim }

procedure TmsShapeButtonPrim.MyClick(Sender: TObject);
begin
 Assert(False, 'ƒолжны реализовывать потомки');
end;

procedure TmsShapeButtonPrim.MyPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
const
 cBorder = 10;
 // - отступ от кра€ кнопки до фигуры

var
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_CenterPoint: TPointF;
 l_Scale: TPointF;
 l_B : TRectF;
 l_D : Single;
 l_W : Single;
 l_H : Single;
 l_M : Single;
 l_DX, l_DY : Single;

 l_RectF: TRectF;
 l_StrokeThickness : Single;
begin
 // DrawBouns
 // ѕо идее можно вынести в отдельный метод.
 // a по хорошему сделать TmsBoundedShapeButton
 // в котором дергать метод и inherited.
 // не делал, потому что возможно и не придетс€, если с TButton получитс€
 // пока так.

 l_RectF := Self.LocalRect;
 l_StrokeThickness := Canvas.StrokeThickness;
 Canvas.StrokeThickness := 0.2;
 Canvas.DrawRect(l_RectF,0,0, AllCorners, 1, TCornerType.Round);
 Canvas.StrokeThickness := l_StrokeThickness;

 if (f_Shape = nil) then
 begin
  Exit;
 end;//f_Shape = nil
 l_OriginalMatrix := Canvas.Matrix;
 try
//  l_CenterPoint := f_Shape.StartPoint;
  if f_ShapeClass.IsNullClick then
   Canvas.Fill.Color := TAlphaColorRec.Lightblue
  else
   if f_ShapeClass.IsTool then
    Canvas.Fill.Color := TAlphaColorRec.Bisque
  else
   Canvas.Fill.Color := TAlphaColorRec.Null;

  Canvas.FillRect(l_RectF, 0, 0, AllCorners, 0.3);

  l_B := f_Shape.DrawBounds;
  l_CenterPoint := l_B.TopLeft;

  l_Matrix := TMatrix.Identity;
  // - —Ќ»ћј≈ћ оригинальную матрицу, точнее берЄм ≈ƒ»Ќ»„Ќ”ё матрицу
  // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X, -l_CenterPoint.Y);
  // - сдвигаем начало координат дл€ фигуры

  l_W := Abs(l_B.Right - l_B.Left);
  l_H := Abs(l_B.Bottom - l_B.Top);
  l_M := Max(l_H, l_W);
  l_Scale := TPointF.Create((Self.Width - cBorder * 2) / l_M,
                            (Self.Height - cBorder * 2) / l_M);

  l_Matrix := l_Matrix * TMatrix.CreateScaling(l_Scale.X, l_Scale.Y);
  // - задаЄм  шкалу
  l_DX := 0;
  l_DY := 0;
  l_D := (l_W * l_Scale.X) - (l_H * l_Scale.Y);
  if (l_D > 0) then
   l_DY := l_D / 2
  else
   l_DX := -l_D / 2;
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(cBorder + l_DX, cBorder + l_DY);
  // - задаЄм начало координат - относительно кнопки
  l_Matrix := l_Matrix * l_OriginalMatrix;
  // - ѕ–»ћ≈Ќя≈ћ оригинальную матрицу
  // »наче например ќ–»√»ЌјЋ№Ќџ… параллельный перенос - не будет работать.
  // https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D1%80%D0%B0%D0%BB%D0%BB%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%B5%D1%80%D0%B5%D0%BD%D0%BE%D1%81

  Canvas.SetMatrix(l_Matrix);
  // - примен€ем нашу "комплексную" матрицу

  f_Shape.DrawTo(TmsDrawContext.Create(Canvas));
  // - отрисовываем примитив с учЄтом матрицы преобразований
 finally
  Canvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ќ–»√»ЌјЋ№Ќ”ё матрицу
 end;//try..finally
end;

constructor TmsShapeButtonPrim.Create(AOwner: TComponent;
                                      const aShape: MCmsShape;
                                      const aHolder: ImsDiagrammsHolder);
begin
 Assert(aShape <> nil);
 Assert(aHolder <> nil);

 inherited Create(AOwner);
 f_Holder := aHolder;
 f_ShapeClass := aShape;
 f_Shape := TmsPaletteShapeCreator.Create(aShape).CreateShape
                                     (TmsMakeShapeContext.Create
                                      (TPointF.Create
                                       (0{TmsPaletteShapeCreator.ButtonSize / 2},
                                        0{TmsPaletteShapeCreator.ButtonSize / 2}),
                                        nil,
                                        nil)
                                      );
 Assert(f_Shape <> nil);
 OnPaint := MyPaint;
 OnClick := MyClick;
end;

destructor TmsShapeButtonPrim.Destroy;
begin
 f_Shape := nil;
 f_ShapeClass := nil;
 inherited;
end;

end.
