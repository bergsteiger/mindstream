unit msNotRegisteredShapes;

interface

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

type
 {$Include msShapeClassListSingleton.mixin.pas}

 TmsNotRegisteredShapes = class(TmsShapeClassListSingleton)
 // [Inversion of control (шаблон проектирования)|https://bitbucket.org/ingword/mindstream/src/5d11d8d3b3047a8200e02ca2d562679f425b5afd/msRegisteredShapes.pas?at=B57]
 public
  class function Instance: TmsNotRegisteredShapes;
 end;//TmsNotRegisteredShapes

implementation

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ,
 msShapesForToolbar,
 msUtilityShapes
 ;

{$Include msShapeClassListSingleton.mixin.pas}

class function TmsNotRegisteredShapes.Instance: TmsNotRegisteredShapes;
begin
 Result := inherited Instance As TmsNotRegisteredShapes;
end;

end.


