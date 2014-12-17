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
  procedure Register(const aValue: RmsShape); override;
 end;//TmsRegisteredShapes

implementation

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ,
 msShapesForToolbar
 ;

{$Include msShapeClassListSingleton.mixin.pas}

class function TmsRegisteredShapes.Instance: TmsRegisteredShapes;
begin
 Result := inherited Instance As TmsRegisteredShapes;
end;

procedure TmsRegisteredShapes.Register(const aValue: RmsShape);
begin
 inherited;
 TmsShapesForToolbar.Instance.Register(aValue);
end;

end.


