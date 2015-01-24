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
  class function InitialLength: Extended; override;
  class function ExtentCoeff: Extended;
 end;//TmsSpecialDiagonalArrow

implementation

uses
 Math
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
 l_Diff.Y := inherited InitialLength / (ExtentCoeff * 2);
 l_StartPoint := l_Mid - l_Diff;
 l_FinishPoint := l_Mid + l_Diff;
 Result := inherited CreateCompletedInternal(l_StartPoint, l_FinishPoint);
end;

class function TmsSpecialDiagonalArrow.ExtentCoeff: Extended;
begin
 Result := Sqrt(2);
// Result := 1.0;
end;

class function TmsSpecialDiagonalArrow.InitialLength: Extended;
begin
 Result := inherited InitialLength;
 //Result := inherited InitialLength / ExtentCoeff;
 // - вспоминаем теорему Пифагора и делим длину на квадратный корень из двух
end;

end.
