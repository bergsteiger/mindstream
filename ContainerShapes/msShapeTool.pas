unit msShapeTool;

interface

uses
 msInterfaces,
 msProxyShape
 ;

type
 TmsShapeTool = class(TmsProxyShape)
 private
  f_ShapeToDeal : ImsShape;
 protected
  constructor CreateInner(const aShapeToDeal: ImsShape; const aShape: ImsShape);
  property ShapeToDeal : ImsShape
   read f_ShapeToDeal;
 public
  class function Create(const aShapeToDeal: ImsShape; const aShape: ImsShape): ImsShape;
  destructor Destroy; override;
  class function IsTool: Boolean; override;
 end;//TmsShapeTool

 RmsShapeTool = class of TmsShapeTool;

implementation

// TmsProxyShape

class function TmsShapeTool.Create(const aShapeToDeal: ImsShape; const aShape: ImsShape): ImsShape;
begin
 Result := CreateInner(aShapeToDeal, aShape);
end;

constructor TmsShapeTool.CreateInner(const aShapeToDeal: ImsShape; const aShape: ImsShape);
begin
 Assert(aShapeToDeal <> nil);
 inherited CreateInner(aShape);
 f_ShapeToDeal := aShapeToDeal;
end;

destructor TmsShapeTool.Destroy;
begin
 f_ShapeToDeal := nil;
 inherited;
end;

class function TmsShapeTool.IsTool: Boolean;
begin
 Result := true;
end;

end.
