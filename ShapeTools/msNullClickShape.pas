unit msNullClickShape;

interface

uses
 msTool,
 msInterfaces
 ;

type
 TmsNullClickShape = class abstract(TmsTool)
 public
  class function IsNullClick: Boolean; override;
  //- примитив НЕ ТРЕБУЕТ кликов. ВООБЩЕ. Как TmsSwapParents или TmsUpToParent
  class function Create(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext): ImsShape; override; final;
 end;//TmsNullClickShape

implementation

// TmsNullClickShape

class function TmsNullClickShape.IsNullClick: Boolean;
begin
 Result := true;
end;

class function TmsNullClickShape.Create(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := nil;
 // раз НЕТ клика, значит НЕТ и ПРИМИТИВА
 DoNullClick(aCtx.rDiagrammsHolder);
 // - обрабатываем НУЛЕВОЙ клик
end;

end.
