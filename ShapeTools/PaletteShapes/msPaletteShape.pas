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
  constructor CreateInner(const aShapeClass : ImsShapeClass; const anOtherShapeClass: MCmsShape; const aStartPoint: TPointF); reintroduce;
  class function Create(const anOtherShapeClass: MCmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
  //function IsClassTypeNamedAs(const aClassName: String): Boolean; override;
  function GetDrawBounds: TRectF; override;
 public
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
  procedure DrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPaletteShape

type
 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend

implementation

uses
 msMover,
 msShapeClass
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

constructor TmsPaletteShape.CreateInner(const aShapeClass : ImsShapeClass; const anOtherShapeClass: MCmsShape; const aStartPoint: TPointF);
begin
 inherited CreateInner(aShapeClass, TmsMakeShapeContext.Create(aStartPoint, nil, nil));
 f_OtherShapeClass := anOtherShapeClass;
 f_Proxy := f_OtherShapeClass.ButtonShape;
end;

class function TmsPaletteShape.Create(const anOtherShapeClass: MCmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := CreateInner(Self.MC, anOtherShapeClass, aCtx.rStartPoint);
end;

(*function TmsPaletteShape.IsClassTypeNamedAs(const aClassName: String): Boolean;
begin
 Result := (f_OtherShapeClass.Name = aClassName);
end;*)

function TmsPaletteShape.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := f_OtherShapeClass.NullClick(aHolder);
end;

end.
