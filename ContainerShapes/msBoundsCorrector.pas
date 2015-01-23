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
 end;//TmsBoundsCorrector

implementation

// TmsBoundsCorrector

function TmsBoundsCorrector.GetDrawBounds: TRectF;
begin
 Result := inherited GetDrawBounds;
end;

end.
