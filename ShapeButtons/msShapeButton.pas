unit msShapeButton;

interface

uses
 msShape,
 FMX.StdCtrls,
 FMX.Controls,
 FMX.Graphics,
 System.Types,
 msInterfaces,
 System.Classes,
 FMX.ListBox
 ;

type
 TmsShapeButton = class(TButton)
  private
   f_ShapeClass : MCmsShape;
   f_Shape: ImsShape;
   f_Shapes: TComboBox;
   f_Holder : ImsDiagrammsHolder;
   procedure MyPaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
   procedure MyClick(Sender: TObject);
  public
   constructor Create(AOwner: TComponent;
                      const aShape: MCmsShape;
                      aShapes: TComboBox;
                      aColumn: Integer;
                      aRow: Integer;
                      const aHolder: ImsDiagrammsHolder);
  destructor Destroy; override;
 end;

implementation

uses
 System.Math.Vectors,
 FMX.Dialogs,
 System.SysUtils,
 msPaletteShapeCreator,
 msShapesForToolbar,
 Math,
 System.UITypes,
 FMX.Types
 ;

// TmsShapeButton

constructor TmsShapeButton.Create(AOwner: TComponent;
                                  const aShape: MCmsShape;
                                  aShapes: TComboBox;
                                  aColumn: Integer;
                                  aRow: Integer;
                                  const aHolder: ImsDiagrammsHolder);
begin
 Assert(aShapes <> nil);
 Assert(aShape <> nil);
 Assert(aHolder <> nil);
 inherited Create(AOwner);
 f_Holder := aHolder;

 Width := TmsPaletteShapeCreator.ButtonSize;
 Height := TmsPaletteShapeCreator.ButtonSize;

 f_ShapeClass := aShape;
 f_Shape := TmsPaletteShapeCreator.Create(aShape).CreateShape
                                     (TmsMakeShapeContext.Create
                                      (TPointF.Create
                                       (0{TmsPaletteShapeCreator.ButtonSize / 2},
                                        0{TmsPaletteShapeCreator.ButtonSize / 2}),
                                        nil,
                                        nil)
                                      );
 f_Shapes := aShapes;
 OnPaint := MyPaint;
 OnClick := MyClick;

 Assert(f_Shape <> nil);

 Self.Position.X := aColumn * TmsPaletteShapeCreator.ButtonSize;
 Self.Position.Y := aRow * TmsPaletteShapeCreator.ButtonSize;

end;

destructor TmsShapeButton.Destroy;
begin
 f_Shape := nil;
 f_ShapeClass := nil;
 inherited;
end;

procedure TmsShapeButton.MyPaint(Sender: TObject;
                                 Canvas: TCanvas;
                                 const ARect: TRectF);
const
 cBorder = 10;
 // - отступ от края кнопки до фигуры
 cButtonSize = 40;

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
begin
 if (f_Shape = nil) then
 begin
  Exit;
 end;//f_Shape = nil
 l_OriginalMatrix := Canvas.Matrix;
 try
//  l_CenterPoint := f_Shape.StartPoint;
  l_B := f_Shape.DrawBounds;

  if f_ShapeClass.IsNullClick then
   Canvas.Fill.Color := TAlphaColorRec.Lightblue
  else
   if f_ShapeClass.IsTool then
    Canvas.Fill.Color := TAlphaColorRec.Bisque
  else
   Canvas.Fill.Color := TAlphaColorRec.Null;

  Canvas.FillRect(TRectF.Create(0, 0, cButtonSize, cButtonSize), 0, 0, AllCorners, 0.3);

  l_CenterPoint := l_B.TopLeft;

  l_Matrix := TMatrix.Identity;
  // - СНИМАЕМ оригинальную матрицу, точнее берём ЕДИНИЧНУЮ матрицу
  // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X, -l_CenterPoint.Y);
  // - сдвигаем начало координат для фигуры

  l_W := Abs(l_B.Right - l_B.Left);
  l_H := Abs(l_B.Bottom - l_B.Top);
  l_M := Max(l_H, l_W);
  l_Scale := TPointF.Create((Self.Width - cBorder * 2) / l_M,
                            (Self.Height - cBorder * 2) / l_M);

  l_Matrix := l_Matrix * TMatrix.CreateScaling(l_Scale.X, l_Scale.Y);
  // - задаём  шкалу
  l_DX := 0;
  l_DY := 0;
  l_D := (l_W * l_Scale.X) - (l_H * l_Scale.Y);
  if (l_D > 0) then
   l_DY := l_D / 2
  else
   l_DX := -l_D / 2;
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(cBorder + l_DX, cBorder + l_DY);
  // - задаём начало координат - относительно кнопки
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

procedure TmsShapeButton.MyClick(Sender: TObject);
begin
 if not f_Shape.NullClick(ImsDiagrammsHolder(f_Holder)) then
  f_Shapes.ItemIndex := f_Shapes.Items.IndexOf(f_ShapeClass.Name);
end;

end.
