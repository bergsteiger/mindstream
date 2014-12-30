unit msPaletteShape;

interface

uses
 msInterfaces,
 msShape,
 System.Types,
 msRectangle
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
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean; override;
  function DrawBounds: TRectF; override;
 public
  procedure DrawTo(const aCtx: TmsDrawContext); override;
 end;//TmsPaletteShape

implementation

// TmsPaletteShape

function TmsPaletteShape.DrawBounds: TRectF;
var
 l_StartRectPoint, l_FinishRectPoint : TPointF;
begin
 l_StartRectPoint := TPointF.Create(StartPoint.X - 50, StartPoint.Y - 50);
 l_FinishRectPoint := TPointF.Create(StartPoint.X + 50, StartPoint.Y + 50);
 Result := TRectF.Create(l_StartRectPoint, l_FinishRectPoint);
end;

procedure TmsPaletteShape.DrawTo(const aCtx: TmsDrawContext);
var
 l_Rect : TRectF;
begin
 l_Rect := DrawBounds;

 aCtx.rCanvas.DrawEllipse(l_Rect, 1);
 aCtx.rCanvas.FillEllipse(l_Rect, 0.5);
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

type
 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend
 RmsShapeFriend = class of TmsShapeFriend;

function TmsPaletteShape.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := RmsShapeFriend(f_OtherShapeClass).DoNullClick(aHolder);
end;

end.
