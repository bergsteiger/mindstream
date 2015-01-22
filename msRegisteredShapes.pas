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
  procedure RegisterMC(const aValue: MCmsShape); override;
  procedure IterateShapes(aLambda: TmsShapeClassLambda); override;
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

procedure TmsRegisteredShapes.IterateShapes(aLambda: TmsShapeClassLambda);
begin
 inherited;
end;

end.


