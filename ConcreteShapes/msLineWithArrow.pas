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
  function GetFinishPointForDraw: TPointF; override;
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

function TmsLineWithArrow.GetDrawBounds: TRectF;
begin
 Result := inherited GetDrawBounds;
 if SameValue(Result.Left, Result.Right) then
 begin
  Result.Right := Result.Left + Self.ShapeClass.ArrowHeadShapeMC.InitialHeight;
  Result.Left := Result.Left - Self.ShapeClass.ArrowHeadShapeMC.InitialHeight;
 end;//SameValue(Result.Left, Result.Right)
 if SameValue(Result.Top, Result.Bottom) then
 begin
  Result.Bottom := Result.Top + Self.ShapeClass.ArrowHeadShapeMC.InitialHeight;
  Result.Top := Result.Top - Self.ShapeClass.ArrowHeadShapeMC.InitialHeight;
 end;//SameValue(Result.Top, Result.Bottom)
end;

function TmsLineWithArrow.GetFinishPointForDraw: TPointF;
var
 l_Angle : Single;
begin
 l_Angle := TmsShape.AngleBetween(StartPoint, FinishPoint);
 Result := TPointF.Create(FinishPoint.X - Self.ShapeClass.ArrowHeadShapeMC.InitialHeight * Cos(l_Angle),
                          FinishPoint.Y - Self.ShapeClass.ArrowHeadShapeMC.InitialHeight * Sin(l_Angle));
end;

end.

