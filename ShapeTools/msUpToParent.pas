unit msUpToParent;

interface

uses
 msInterfaces,
 msTool,
 msNullClickShape
 ;

type
 TmsUpToParent = class(TmsNullClickShape)
  // - утилитный класс дл€ "подъЄма" к ѕ–≈ƒџƒ”ў≈… диаграмме
 public
  class function DoNullClick(const aCtx: TmsMakeShapeContext): Boolean; override;
 end;//TmsUpToParent

implementation

class function TmsUpToParent.DoNullClick(const aCtx: TmsMakeShapeContext): Boolean;
begin
 Result := true;
 aCtx.rDiagrammsHolder.UpToParent;
end;

end.
