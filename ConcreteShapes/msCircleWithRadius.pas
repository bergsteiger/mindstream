unit msCircleWithRadius;

interface

uses
 System.Types,
 msInterfaces,
 msCircle
 ;

type
 TmsCircleWithRadius = class(TmsCircle)
 private
  f_Rad : Single;
 protected
  function InitialRadiusX: Integer; override;
  constructor CreateInner(const aStartPoint: TPointF; aRad: Single);
 public
  class function Create(const aStartPoint: TPointF; aRad: Single): ImsShape;
 end;//TmsCircleWithRadius

implementation

// TmsCircleWithRadius

constructor TmsCircleWithRadius.CreateInner(const aStartPoint: TPointF; aRad: Single);
begin
 inherited CreateInner(aStartPoint);
 f_Rad := aRad;
end;

class function TmsCircleWithRadius.Create(const aStartPoint: TPointF; aRad: Single): ImsShape;
begin
 Result := CreateInner(aStartPoint, aRad);
end;

function TmsCircleWithRadius.InitialRadiusX: Integer;
begin
 Result := Round(f_Rad);
end;

end.
