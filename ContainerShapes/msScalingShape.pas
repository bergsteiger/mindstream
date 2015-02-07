unit msScalingShape;

interface

uses
 msInterfaces,
 msBoundsCorrector
 ;

type
 TmsScalingShape = class(TmsBoundsCorrector)
 private
  f_Scale : Extended;
 protected
  function ExtentCoeff: Extended; override;
  constructor CreateInner(const aShape: ImsShape; aScale : Extended);
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 public
  class function Create(const aShape: ImsShape; aScale : Extended): ImsShape;
 end;//TmsScalingShape

implementation

uses
 System.Types,
 System.Math.Vectors
 ;

// TmsScalingShape

constructor TmsScalingShape.CreateInner(const aShape: ImsShape; aScale : Extended);
begin
 inherited CreateInner(aShape);
 f_Scale := aScale;
end;

class function TmsScalingShape.Create(const aShape: ImsShape; aScale : Extended): ImsShape;
begin
 Result := CreateInner(aShape, aScale);
end;

function TmsScalingShape.ExtentCoeff: Extended;
begin
 Result := f_Scale;
end;

procedure TmsScalingShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_C : TPointF;
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
begin
 l_C := ShapeToShow.StartPoint;
 l_OriginalMatrix := aCtx.rCanvas.Matrix;
 try
  l_Matrix := TMatrix.Identity;
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_C.X, l_C.Y);
  l_Matrix := l_Matrix * TMatrix.CreateScaling(f_Scale, f_Scale);
  l_Matrix := l_Matrix * l_OriginalMatrix;
  aCtx.rCanvas.SetMatrix(l_Matrix);
  inherited;
 finally
   aCtx.rCanvas.SetMatrix(l_OriginalMatrix);
 // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
 end;//try..finally
end;

end.
