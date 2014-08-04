unit msSmallTriangle;

interface

uses
 msShape,
 msTriangle1,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsSmallTriangle = class(TmsTriangle1)
 protected
  function DrawOptionsContext: TmsDrawOptionsContext; override;
 public
  class function InitialHeight: Single; override;
 end;//TmsSmallTriangle

implementation

uses
 System.Math
 ;

{ TmsSmallTriangle }

function TmsSmallTriangle.DrawOptionsContext: TmsDrawOptionsContext;
begin
 Result.FillColor := TAlphaColorRec.Aquamarine;
end;

class function TmsSmallTriangle.InitialHeight: Single;
begin
 Result := 20;
end;

end.
