unit msCircleWithRadius;

interface

uses
 System.Types,
 msInterfaces,
 msPointedShape
 ;

type
 TmsCircleWithRadius = class(TmsPointedShape)
 private
  f_Rad : Single;
 protected
  function pm_GetShapeClass: ImsShapeClass; override;
  constructor CreateInner(const aShapeClass : ImsShapeClass; const aStartPoint: TPointF; aRad: Single); reintroduce;
  function GetDrawBounds: TRectF; override;
 public
  class function Create(const aStartPoint: TPointF; aRad: Single): ImsShape;
 end;//TmsCircleWithRadius

implementation

uses
 msShape,
 msShapeClass,
 msPredefinedShapes
 ;

// TmsCircleWithRadius

constructor TmsCircleWithRadius.CreateInner(const aShapeClass : ImsShapeClass; const aStartPoint: TPointF; aRad: Single);
begin
 inherited CreateInner(aShapeClass, TmsMakeShapeContext.Create(aStartPoint, nil, nil));
 f_Rad := aRad;
end;

function TmsCircleWithRadius.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(TPointF.Create(StartPoint.X - f_Rad, StartPoint.Y - f_Rad),
                         TPointF.Create(StartPoint.X + f_Rad, StartPoint.Y + f_Rad));
end;

function TmsCircleWithRadius.pm_GetShapeClass: ImsShapeClass;
begin
 Result := MCmsCircle;
end;

class function TmsCircleWithRadius.Create(const aStartPoint: TPointF; aRad: Single): ImsShape;
begin
 Result := CreateInner(Self.MC, aStartPoint, aRad);
end;

end.
