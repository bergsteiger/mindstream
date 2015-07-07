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
  procedure IterateShapes(aLambda: TmsShapeClassLambda); override;
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

procedure TmsShapesForToolbar.IterateShapes(aLambda: TmsShapeClassLambda);
begin
 inherited IterateShapes(
  procedure (const aShapeClass : MCmsShape)
  begin
   if aShapeClass.IsForToolbar then
    aLambda(aShapeClass);
  end
 );
end;

end.


