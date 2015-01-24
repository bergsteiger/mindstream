unit msSpecialDiagonalArrow;

interface

uses
 System.Types,
 msInterfaces,
 msSpecialArrow
 ;

type
 TmsSpecialDiagonalArrow = class abstract(TmsSpecialArrow)
 protected
  class function CreateCompletedInternal(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape; override;
 public
  class function ExtentCoeff: Extended;
 end;//TmsSpecialDiagonalArrow

implementation

uses
 Math,
 msCoreUtils
 ;

// TmsSpecialDiagonalArrow

class function TmsSpecialDiagonalArrow.CreateCompletedInternal(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape;
var
 l_StartPoint: TPointF;
 l_FinishPoint: TPointF;
 l_Diff : TPointF;
 l_Mid : TPointF;
begin
 l_Mid.X := (aStartPoint.X + aFinishPoint.X) / 2;
 l_Mid.Y := (aStartPoint.Y + aFinishPoint.Y) / 2;
 l_Diff.X := inherited InitialLength / (ExtentCoeff * 2);
 l_Diff.Y := l_Diff.X;
// l_Diff.Y := inherited InitialLength / (ExtentCoeff * 2);
 l_StartPoint := l_Mid - l_Diff;
 l_FinishPoint := l_Mid + l_Diff;
 if (aStartPoint.X > aFinishPoint.X) then
  msSwap(l_StartPoint.X, l_FinishPoint.X);
 if (aStartPoint.Y > aFinishPoint.Y) then
  msSwap(l_StartPoint.Y, l_FinishPoint.Y);
 Result := inherited CreateCompletedInternal(l_StartPoint, l_FinishPoint);
end;

class function TmsSpecialDiagonalArrow.ExtentCoeff: Extended;
begin
 Result := Sqrt(2);
 // - вспоминаем теорему Пифагора и делим длину на квадратный корень из двух
// Result := 1.0;
end;

end.
