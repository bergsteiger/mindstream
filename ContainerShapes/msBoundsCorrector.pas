unit msBoundsCorrector;

interface

uses
 System.Types,
 msProxyShape
 ;

type
 TmsBoundsCorrector = class abstract(TmsProxyShape)
 protected
  function GetDrawBounds: TRectF; override;
  class function ExtentCoeff: Extended; virtual;
 end;//TmsBoundsCorrector

implementation

// TmsBoundsCorrector

class function TmsBoundsCorrector.ExtentCoeff: Extended;
begin
 Result := 1.0;
 Assert(false, 'Надо перекрыть метод');
end;

function TmsBoundsCorrector.GetDrawBounds: TRectF;
begin
 Result := inherited GetDrawBounds;
end;

end.
