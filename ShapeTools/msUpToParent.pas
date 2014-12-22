unit msUpToParent;

interface

uses
 msInterfaces,
 msTool
 ;

type
 TmsUpToParent = class(TmsTool)
  // - утилитный класс дл€ "подъЄма" к ѕ–≈ƒџƒ”ў≈… диаграмме
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; override;
 end;//TmsUpToParent

implementation

class function TmsUpToParent.Create(const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := nil;
 aCtx.rDiagrammsHolder.UpToParent;
end;

end.
