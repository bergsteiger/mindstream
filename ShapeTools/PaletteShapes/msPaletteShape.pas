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
  f_OtherShapeClass : RmsShape;
  f_Proxy : ImsShape;
 protected
  constructor CreateInner(anOtherShapeClass: RmsShape; const aStartPoint: TPointF);
  class function Create(anOtherShapeClass: RmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
  function IsClassTypeNamedAs(const aClassName: String): Boolean; override;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
  function GetDrawBounds: TRectF; override;
 public
  procedure DrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPaletteShape

type
 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend
 RmsShapeFriend = class of TmsShapeFriend;

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

constructor TmsPaletteShape.CreateInner(anOtherShapeClass: RmsShape; const aStartPoint: TPointF);
begin
 inherited CreateInner(aStartPoint);
 f_OtherShapeClass := anOtherShapeClass;
 f_Proxy := f_OtherShapeClass.ButtonShape;
end;

class function TmsPaletteShape.Create(anOtherShapeClass: RmsShape; const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := CreateInner(anOtherShapeClass, aCtx.rStartPoint);
end;

function TmsPaletteShape.IsClassTypeNamedAs(const aClassName: String): Boolean;
begin
 Result := (f_OtherShapeClass.ClassName = aClassName);
end;

function TmsPaletteShape.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := RmsShapeFriend(f_OtherShapeClass).DoNullClick(aHolder);
end;

end.
