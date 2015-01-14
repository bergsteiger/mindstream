unit msUpToParent;

interface

uses
 msInterfaces,
 msTool,
 msNullClickShape,
 System.Types
 ;

type
 TmsUpToParent = class(TmsNullClickShape)
  // - утилитный класс дл€ "подъЄма" к ѕ–≈ƒџƒ”ў≈… диаграмме
 public
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
  class function ButtonShape: ImsShape; override;
 end;//TmsUpToParent

implementation

uses
 msUpToParentIcon
 ;

class function TmsUpToParent.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.UpToParent;
end;

class function TmsUpToParent.ButtonShape: ImsShape;
begin
 Result := TmsUpToParentIcon.Create;
end;

end.
