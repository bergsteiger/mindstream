unit msNullClickShape;

interface

uses
 msTool
 ;

type
 TmsNullClickShape = class abstract(TmsTool)
 public
  class function IsNullClick: Boolean; override;
  //- примитив НЕ ТРЕБУЕТ кликов. ВООБЩЕ. Как TmsSwapParents или TmsUpToParent
 end;//TmsNullClickShape

implementation

// TmsNullClickShape

class function TmsNullClickShape.IsNullClick: Boolean;
begin
 Result := true;
end;

end.
