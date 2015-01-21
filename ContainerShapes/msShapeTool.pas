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
  function ClickInDiagramm: Boolean; override;
  procedure ProcessClickInDiagramm; virtual;
 public
  class function Create(const aShapeToDeal: ImsShape; const aShape: ImsShape): ImsShape;
  procedure Cleanup; override;
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

function TmsShapeTool.ClickInDiagramm: Boolean;
begin
 Result := true;
 ProcessClickInDiagramm
end;

procedure TmsShapeTool.ProcessClickInDiagramm;
begin
 // - ничего не делаем. ОСОЗНАННО. НО! И не падаем.
end;

procedure TmsShapeTool.Cleanup;
begin
 f_ShapeToDeal := nil;
 inherited;
end;

class function TmsShapeTool.IsTool: Boolean;
begin
 Result := true;
end;

end.
