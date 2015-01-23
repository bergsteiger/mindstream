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
begin
 l_StartPoint := aStartPoint;
 l_FinishPoint := aFinishPoint;
 Result := inherited CreateCompletedInternal(l_StartPoint, l_FinishPoint);
end;

class function TmsSpecialDiagonalArrow.ExtentCoeff: Extended;
begin
// Result := Sqrt(2);
 Result := 1.0;
end;

class function TmsSpecialDiagonalArrow.InitialLength: Extended;
begin
 Result := inherited InitialLength / ExtentCoeff;
 // - вспоминаем теорему Пифагора и делим длину на квадратный корень из двух
end;

end.
