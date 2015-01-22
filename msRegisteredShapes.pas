unit msRegisteredShapes;

interface

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

type
 {$Include msShapeClassListSingleton.mixin.pas}

 TmsRegisteredShapes = class(TmsShapeClassListSingleton)
 // [Inversion of control (шаблон проектирования)|https://bitbucket.org/ingword/mindstream/src/5d11d8d3b3047a8200e02ca2d562679f425b5afd/msRegisteredShapes.pas?at=B57]
 public
  class function Instance: TmsRegisteredShapes;
  procedure RegisterMC(const aValue: MCmsShape); override;
 end;//TmsRegisteredShapes

implementation

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ,
 msShapesForToolbar,
 msUtilityShapes
 ;

{$Include msShapeClassListSingleton.mixin.pas}

class function TmsRegisteredShapes.Instance: TmsRegisteredShapes;
begin
 Result := inherited Instance As TmsRegisteredShapes;
end;

procedure TmsRegisteredShapes.RegisterMC(const aValue: MCmsShape);
begin
 inherited;
 TmsShapesForToolbar.Instance.RegisterMC(aValue);
 TmsUtilityShapes.Instance.RegisterMC(aValue);
end;

end.


