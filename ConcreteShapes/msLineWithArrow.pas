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
 end;//TmsLineWithArrow

implementation

uses
 SysUtils,
 System.Math,
 System.UITypes,
 FMX.Types
 ;

// TmsLineWithArrow

function TmsLineWithArrow.GetFinishPointForDraw: TPointF;
var
 l_Angle : Single;
begin
 l_Angle := TmsShape.AngleBetween(StartPoint, FinishPoint);
 Result := TPointF.Create(FinishPoint.X - Self.ShapeClass.ArrowHeadShapeMC.InitialHeight * Cos(l_Angle),
                          FinishPoint.Y - Self.ShapeClass.ArrowHeadShapeMC.InitialHeight * Sin(l_Angle));
end;

end.

