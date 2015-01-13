unit msRemoverIcon;

interface

uses
 msInterfaces
 ;

type
 TmsRemoverIcon = class
 public
  class function Create: ImsShape;
 end;//TmsRemoverIcon

implementation

uses
 System.Types,
 msLine,
 msShapesGroup
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.Create: ImsShape;
begin
 Result := TmsShapesGroup.Create([
  TmsLine.CreateCompleted(TPointF.Create(0, 0), TPointF.Create(50, 50)),
  TmsLine.CreateCompleted(TPointF.Create(50, 0), TPointF.Create(0, 50))
  ]);
end;

end.
