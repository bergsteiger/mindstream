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
  function ArrowHeadShapeMC: ImsShapeClass; override;
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

function TmsLineWithArrow.ArrowHeadShapeMC: ImsShapeClass;
begin
 Result := TmsShape.NamedMC('SmallTriangle');
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
 l_Angle := RotationAngle;
 Result := TPointF.Create(FinishPoint.X - ArrowHeadShapeMC.InitialHeight * Cos(l_Angle),
                          FinishPoint.Y - ArrowHeadShapeMC.InitialHeight * Sin(l_Angle));
end;

end.

