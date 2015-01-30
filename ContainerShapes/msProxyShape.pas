unit msProxyShape;

interface

uses
 System.Types,
 Generics.Collections,
 msInterfaces,
 msShape,
 msPointlessShape,
 msShapesList
 ;

type
 TmsProxyShape = class(TmsPointlessShape)
 // [Декоратор (шаблон проектирования)|https://ru.wikipedia.org/wiki/%D0%94%D0%B5%D0%BA%D0%BE%D1%80%D0%B0%D1%82%D0%BE%D1%80_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)]
 private
  f_Shape : ImsShape;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; override;
  constructor CreateInner(const aShape: ImsShape);
  property ShapeToShow : ImsShape
   read f_Shape;
 public
  class function Create(const aShape: ImsShape): ImsShape;
  procedure Cleanup; override;
 end;//TmsProxyShape

implementation

uses
 System.SysUtils,
 System.Math
 ;

// TmsProxyShape

class function TmsProxyShape.Create(const aShape: ImsShape): ImsShape;
begin
 Result := CreateInner(aShape);
end;

constructor TmsProxyShape.CreateInner(const aShape: ImsShape);
begin
 Assert(aShape <> nil, 'Пустую группу примитивов глупо создавать');
 inherited CreateInner(TPointF.Create(0, 0));
 f_Shape := aShape;
end;

procedure TmsProxyShape.Cleanup;
begin
 f_Shape := nil;
 inherited;
end;

procedure TmsProxyShape.DoDrawTo(const aCtx: TmsDrawContext);
begin
 Assert(ShapeToShow <> nil);
 ShapeToShow.DrawTo(aCtx);
end;

function TmsProxyShape.GetDrawBounds: TRectF;
begin
 Assert(ShapeToShow <> nil);
 Result := ShapeToShow.DrawBounds;
end;

function TmsProxyShape.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
begin
 Assert(ShapeToShow <> nil);
 Result := ShapeToShow.HitTest(aPoint, theShape);
 if Result then
  theShape := Self;
end;

end.
