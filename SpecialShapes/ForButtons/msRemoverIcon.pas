unit msRemoverIcon;

interface

uses
 System.Types,
 msInterfaces,
 msButtonIcon
 ;

type
 TmsRemoverIcon = class(TmsButtonIcon)
 public
  class function Create(const aCenter: TPointF): ImsShape; override;
 end;//TmsRemoverIcon

implementation

uses
 msLine,
 msShapesGroup
 ;

// TmsRemoverIcon

class function TmsRemoverIcon.Create(const aCenter: TPointF): ImsShape;
begin
 Result := TmsShapesGroup.Create([
  TmsLine.CreateCompleted(aCenter, aCenter + TPointF.Create(50, 50)),
  TmsLine.CreateCompleted(aCenter + TPointF.Create(50, 0), aCenter + TPointF.Create(0, 50))
  ]);
end;

end.
