unit msSmallTriangle;

interface

uses
 msTriangle1,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes
 ;

type
 TmsSmallTriangle = class(TmsTriangle1)
 protected
  function FillColor: TAlphaColor; override;
 public
  class function InitialHeight: Single; override;
 end;//TmsSmallTriangle

implementation

uses
 System.Math
 ;

{ TmsSmallTriangle }

function TmsSmallTriangle.FillColor: TAlphaColor;
begin
  Result := TAlphaColorRec.Aquamarine;
end;

class function TmsSmallTriangle.InitialHeight: Single;
begin
 Result := 20;
end;

end.
