unit msRegisteredShapes;

interface

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

type
 {$Include msShapeClassListSingleton.mixin.pas}

 TmsRegisteredShapes = class(TmsShapeClassListSingleton)
 public
  class function Instance: TmsRegisteredShapes;
 end;//TmsRegisteredShapes

implementation

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

{$Include msShapeClassListSingleton.mixin.pas}

class function TmsRegisteredShapes.Instance: TmsRegisteredShapes;
begin
 Result := inherited Instance As TmsRegisteredShapes;
end;

end.


