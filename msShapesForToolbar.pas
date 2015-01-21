unit msShapesForToolbar;

interface

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

type
 {$Include msShapeClassListSingleton.mixin.pas}

 TmsShapesForToolbar = class(TmsShapeClassListSingleton)
 public
  class function Instance: TmsShapesForToolbar;
  procedure RegisterMC(const aValue: MCmsShape); override;
 end;//TmsShapesForToolbar

implementation

uses
 {$Include msShapeClassListSingleton.mixin.pas}
 ;

{$Include msShapeClassListSingleton.mixin.pas}

class function TmsShapesForToolbar.Instance: TmsShapesForToolbar;
begin
 Result := inherited Instance As TmsShapesForToolbar;
end;

procedure TmsShapesForToolbar.RegisterMC(const aValue: MCmsShape);
begin
 if aValue.IsForToolbar then
  inherited;
end;

end.


