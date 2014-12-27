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
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
 end;//TmsUpToParent

implementation

class function TmsUpToParent.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.UpToParent;
end;

end.
