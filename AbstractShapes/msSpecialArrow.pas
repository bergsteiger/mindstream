unit msSpecialArrow;

interface

uses
 System.Types,
 msInterfaces,
 msLineWithArrow
 ;

type
 TmsSpecialArrow = class abstract(TmsLineWithArrow)
 protected
  class function InitialLength: Integer;
  class function CreateCompletedInternal(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape;
 public
  class procedure CreateCompleted;
 end;//TmsSpecialArrow

implementation

// TmsSpecialArrow

class function TmsSpecialArrow.CreateCompletedInternal(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape;
begin
 Result := inherited CreateCompleted(aStartPoint, aFinishPoint);
end;

class procedure TmsSpecialArrow.CreateCompleted;
begin
 Assert(false, 'Используйте фабрику Create');
end;

class function TmsSpecialArrow.InitialLength: Integer;
begin
 Result := 50;
end;

end.
