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
  class function CreateCompletedInternal(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape; virtual;
 public
  class function InitialLength: Extended;
  class procedure CreateCompleted;
  // - метод, который надо скрыть
  class function Create: ImsShape; overload;
  class function Create(const aPointedPoint: TPointF): ImsShape; overload; virtual; abstract;
  // - метод, который “≈ѕ≈–№ надо вызывать
 end;//TmsSpecialArrow

 RmsSpecialArrow = class of TmsSpecialArrow;

implementation

// TmsSpecialArrow

class function TmsSpecialArrow.Create: ImsShape;
begin
 Result := Create(TPointF.Create(0, 0));
end;

class function TmsSpecialArrow.CreateCompletedInternal(const aStartPoint: TPointF; const aFinishPoint: TPointF): ImsShape;
begin
 Result := inherited CreateCompleted(aStartPoint, aFinishPoint, nil, nil);
end;

class procedure TmsSpecialArrow.CreateCompleted;
begin
 Assert(false, '»спользуйте фабрику Create');
end;

class function TmsSpecialArrow.InitialLength: Extended;
begin
 Result := 50;
end;

end.
