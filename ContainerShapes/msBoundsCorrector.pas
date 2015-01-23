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
var
 l_Mid : TPointF;
 l_W : Extended;
 l_H : Extended;
begin
 Result := inherited GetDrawBounds;
 l_Mid := (Result.BottomRight + Result.TopLeft) / 2;
 l_W := (Result.Right - Result.Left) * ExtentCoeff / 2;
 l_H := (Result.Bottom - Result.Top) * ExtentCoeff / 2;
// Result.Right := Result.Left + l_W * 2;
// Result.Bottom := Result.Top + l_H * 2;
 Result.Left := l_Mid.X - l_W;
 Result.Right := l_Mid.X + l_W;
 Result.Top := l_Mid.Y - l_H;
 Result.Bottom := l_Mid.Y + l_H;
end;

end.
