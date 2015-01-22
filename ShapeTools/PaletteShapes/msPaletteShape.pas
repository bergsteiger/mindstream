unit msPaletteShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 msRectangle,
 msPointlessShape
 ;

type
 RmsPaletteShape = class of TmsPaletteShape;
 TmsPaletteShape = class(TmsPointlessShape)
 private
  f_OtherShapeClass : MCmsShape;
  f_Proxy : ImsShape;
 protected
  constructor CreateInner(const anOtherShapeClass: MCmsShape; const aStartPoint: TPointF);
  class function Create(const anOtherShapeClass: MCmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
  function IsClassTypeNamedAs(const aClassName: String): Boolean; override;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
  function GetDrawBounds: TRectF; override;
 public
  procedure DrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPaletteShape

type
 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend

implementation

uses
 msGreenCircle,
 msMover
 ;

// TmsPaletteShape

function TmsPaletteShape.GetDrawBounds: TRectF;
begin
 Result := f_Proxy.DrawBounds;
end;

procedure TmsPaletteShape.DrawTo(const aCtx: TmsDrawContext);
begin
 f_Proxy.DrawTo(aCtx);
end;

constructor TmsPaletteShape.CreateInner(const anOtherShapeClass: MCmsShape; const aStartPoint: TPointF);
begin
 inherited CreateInner(aStartPoint);
 f_OtherShapeClass := anOtherShapeClass;
 f_Proxy := f_OtherShapeClass.ButtonShape;
end;

class function TmsPaletteShape.Create(const anOtherShapeClass: MCmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := CreateInner(anOtherShapeClass, aCtx.rStartPoint);
end;

function TmsPaletteShape.IsClassTypeNamedAs(const aClassName: String): Boolean;
begin
 Result := (f_OtherShapeClass.Name = aClassName);
end;

function TmsPaletteShape.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := f_OtherShapeClass.NullClick(aHolder);
end;

end.
