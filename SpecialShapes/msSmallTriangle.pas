unit msSmallTriangle;

interface

uses
 msShape,
 msTriangleDirectionRight,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 System.Math.Vectors
 ;

type
 TmsSmallTriangle = class(TmsTriangleDirectionRight)
 public
  class function InitialHeight: Single; override;
 end;//TmsSmallTriangle

implementation

// TmsSmallTriangle

class function TmsSmallTriangle.InitialHeight: Single;
begin
 Result := 20;
end;

end.
