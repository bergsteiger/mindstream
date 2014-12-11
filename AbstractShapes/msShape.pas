unit msShape;

interface
uses
 FMX.Graphics,
 System.Types,
 FMX.Types,
 System.UITypes,
 Generics.Collections,
 msCoreObjects,
 msSerializeInterfaces,
 msInterfacedRefcounted,
 msInterfacedNonRefcounted,
 msInterfaces,
 System.Classes
 ;

type
 TmsDiagrammsPrim = class abstract(TmsInterfacedRefcounted, ImsDiagramms)
  protected
   procedure AllowedShapesToList(aList: TStrings); virtual; abstract;
   function CurrentShapeClassIndex: Integer; virtual; abstract;
   function CurrentDiagrammIndex: Integer; virtual; abstract;
   function pm_GetCurrentDiagramm: ImsDiagramm; virtual; abstract;
   procedure AddDiagramm(aList: TStrings); virtual; abstract;
   procedure Serialize; virtual; abstract;
   procedure DeSerialize; virtual; abstract;
   property CurrentDiagramm: ImsDiagramm
    read pm_GetCurrentDiagramm;
 end;//TmsDiagrammsPrim

 TmsShape = class abstract(TmsInterfacedRefcounted, ImsShape)
 private
  FStartPoint: TPointF;
  function DrawOptionsContext(const aCtx: TmsDrawContext): TmsDrawOptionsContext;
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); virtual; abstract;
  constructor CreateInner(const aStartPoint: TPointF); virtual;
  function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aCtx: TmsEndShapeContext); virtual;
  procedure MoveTo(const aFinishPoint: TPointF); virtual;
  function ContainsPt(const aPoint: TPointF): Boolean; virtual;
 public
  class function Create(const aCtx: TmsMakeShapeContext): ImsShape; virtual;
  // - фабричный метод, который создаёт экземпляр класса как интерфейс
  //   про "фабричный метод вообще" - написано тут:
  //   - http://icoder.ucoz.ru/blog/factory_method/2013-04-30-24
  //   - http://ru.wikipedia.org/wiki/%D0%A4%D0%B0%D0%B1%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9_%D0%BC%D0%B5%D1%82%D0%BE%D0%B4_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
  //   - http://sergeyteplyakov.blogspot.ru/2014/07/blog-post.html
  //
  // Зачем НУЖЕН "наш конкретный" фабричный метод?
  // Во-первых - чтобы ПЕРЕОПРЕДЕЛИТЬ бизнес-логику. Как например в TmsMover.Make.
  // И это - ГЛАВНОЕ.
  // А во-вторых потому что:
  // - http://18delphi.blogspot.ru/2013/04/blog-post_7483.html
  // - http://www.gunsmoker.ru/2013/04/plugins-9.html
  //
  // И это "не так важно" как ВО_ПЕРВЫХ, но тоже - ОЧЕНЬ ВАЖНО.
  procedure DrawTo(const aCtx: TmsDrawContext);
  property StartPoint : TPointF read FStartPoint;
  class function IsTool: Boolean; virtual;
  class function IsForToolbar: Boolean; virtual;
 end;//TmsShape

 RmsShape = class of TmsShape;

implementation

class function TmsShape.Create(const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := CreateInner(aCtx.rStartPoint);
end;

function TmsShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := False;
end;

constructor TmsShape.CreateInner(const aStartPoint: TPointF);
begin
 inherited Create;
 FStartPoint := aStartPoint;
end;

procedure TmsShape.EndTo(const aCtx: TmsEndShapeContext);
begin
 Assert(false, 'Примитив ' + ClassName + ' не может быть завершён');
end;

procedure TmsShape.MoveTo(const aFinishPoint: TPointF);
begin
 FStartPoint := aFinishPoint;
end;

function TmsShape.IsNeedsSecondClick : Boolean;
begin
 Result := false;
end;

procedure TmsShape.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 // - тут ничего не делаем
end;

function TmsShape.DrawOptionsContext(const aCtx: TmsDrawContext): TmsDrawOptionsContext;
begin
 Result := TmsDrawOptionsContext.Create(aCtx);
 TransformDrawOptionsContext(Result);
end;

class function TmsShape.IsTool: Boolean;
begin
 Result := false;
end;

class function TmsShape.IsForToolbar: Boolean;
begin
 Result := true;
end;

procedure TmsShape.DrawTo(const aCtx: TmsDrawContext);
var
 l_Ctx : TmsDrawOptionsContext;
begin
 l_Ctx := DrawOptionsContext(aCtx);
 aCtx.rCanvas.Fill.Color := l_Ctx.rFillColor;
 aCtx.rCanvas.Stroke.Dash := l_Ctx.rStrokeDash;
 aCtx.rCanvas.Stroke.Color := l_Ctx.rStrokeColor;
 aCtx.rCanvas.Stroke.Thickness := l_Ctx.rStrokeThickness;
 DoDrawTo(aCtx);
end;

end.
