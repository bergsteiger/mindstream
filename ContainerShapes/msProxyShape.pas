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
 private
  f_Shape : ImsShape;
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function GetDrawBounds: TRectF; override;
  function ContainsPt(const aPoint: TPointF): Boolean; override;
  constructor CreateInner(const aShape: ImsShape);
  property ShapeToShow : ImsShape
   read f_Shape;
 public
  class function Create(const aShape: ImsShape): ImsShape;
  destructor Destroy; override;
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

destructor TmsProxyShape.Destroy;
begin
 f_Shape := nil;
 inherited;
end;

procedure TmsProxyShape.DoDrawTo(const aCtx: TmsDrawContext);
begin
 Assert(f_Shape <> nil);
 f_Shape.DrawTo(aCtx);
end;

function TmsProxyShape.GetDrawBounds: TRectF;
begin
 Assert(f_Shape <> nil);
 Result := f_Shape.DrawBounds;
end;

function TmsProxyShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Assert(f_Shape <> nil);
 Result := f_Shape.ContainsPt(aPoint);
end;

end.
