unit msUtilityShapes;

interface

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

type
 {$Include msShapeClassListSingleton.mixin.pas}

 TmsUtilityShapes = class(TmsShapeClassListSingleton)
 public
  class function Instance: TmsUtilityShapes;
  procedure RegisterMC(const aValue: MCmsShape); override;
 end;//TmsUtilityShapes

implementation

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

{$Include msShapeClassListSingleton.mixin.pas}

class function TmsUtilityShapes.Instance: TmsUtilityShapes;
begin
 Result := inherited Instance As TmsUtilityShapes;
end;

procedure TmsUtilityShapes.RegisterMC(const aValue: MCmsShape);
begin
 if aValue.IsTool then
  inherited;
end;

end.


