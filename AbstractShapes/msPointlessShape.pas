unit msPointlessShape;

interface

uses
 System.Types,
 msShape
 ;

type
 TmsPointlessShape = class abstract(TmsShape)
 protected
  procedure SetStartPoint(const aStartPoint: TPointF); override;
 end;//TmsPointlessShape

implementation

// TmsPointlessShape

procedure TmsPointlessShape.SetStartPoint(const aStartPoint: TPointF);
begin
 // - ничего не делаем. СПЕЦИАЛЬНО.
end;

end.
