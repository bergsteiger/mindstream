unit msPaletteShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types
 ;

type
 RmsPaletteShape = class of TmsPaletteShape;
 TmsPaletteShape = class(TmsShape)
 private
  f_OtherShapeClass : RmsShape;
 protected
  constructor CreateInner(anOtherShapeClass: RmsShape; const aStartPoint: TPointF);
  class function Create(anOtherShapeClass: RmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
  function IsClassTypeNamedAs(const aClassName: String): Boolean; override;
 public
  procedure DrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPaletteShape

implementation

// TmsPaletteShape

procedure TmsPaletteShape.DrawTo(const aCtx: TmsDrawContext);
begin
 // - ничего не рисуем.
 //   ПОКА!!
end;

constructor TmsPaletteShape.CreateInner(anOtherShapeClass: RmsShape; const aStartPoint: TPointF);
begin
 inherited CreateInner(aStartPoint);
 f_OtherShapeClass := anOtherShapeClass;
end;

class function TmsPaletteShape.Create(anOtherShapeClass: RmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := CreateInner(anOtherShapeClass, aCtx.rStartPoint);
end;

function TmsPaletteShape.IsClassTypeNamedAs(const aClassName: String): Boolean;
begin
 Result := (f_OtherShapeClass.ClassName = aClassName);
end;

end.
