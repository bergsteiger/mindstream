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
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; override;
 end;//TmsUpToParent

implementation

uses
 msUpArrow
 ;

class function TmsUpToParent.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := true;
 aHolder.UpToParent;
end;

class function TmsUpToParent.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := TmsUpArrow.Create;
end;

end.
