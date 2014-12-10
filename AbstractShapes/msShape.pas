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
 msInterfacedRefcounted
 ;

type
 ImsShape = interface;

 ImsShapeByPt = interface
  function ShapeByPt(const aPoint: TPointF): ImsShape;
 end;//ImsShapeByPt

 ImsShapesController = interface(ImsShapeByPt)
  procedure RemoveShape(const aShape: ImsShape);
 end;//ImsShapesController
 // - тут бы иметь МНОЖЕСТВЕННОЕ наследование интерфейсов, но Delphi его не поддерживает
 // А вот с UML - мы его ПОТОМ СГЕНЕРИРУЕМ

 TmsDrawContext  = record
 // Контекст рисования.
 // "Лирика" - тут - http://habrahabr.ru/post/170125/
 // Ну и "связанное" - https://ru.wikipedia.org/wiki/%D0%A1%D1%82%D1%80%D0%B0%D1%82%D0%B5%D0%B3%D0%B8%D1%8F_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)
 //
 // Зачем же НАМ нужен "контекст"?
 //
 // Всё - БАНАЛЬНО. Чтобы НЕ ТРОГАТЬ сигнатуры методов. Мысль понятна?
  public
   rCanvas : TCanvas;
   rMoving : Boolean; // - определяем, что текущий рисуемый примитив - двигается
   constructor Create(const aCanvas : TCanvas);
 end;//TmsDrawContext

 TmsMakeShapeContext = record
  public
   rStartPoint: TPointF;
   rShapesController: ImsShapesController;
   constructor Create(aStartPoint: TPointF; const aShapesController: ImsShapesController);
 end;//TmsMakeShapeContext

 TmsEndShapeContext = TmsMakeShapeContext;

 TmsDrawOptionsContext = record
  public
   rFillColor: TAlphaColor;
   rStrokeDash: TStrokeDash;
   rStrokeColor: TAlphaColor;
   rStrokeThickness: Single;
   constructor Create(const aCtx: TmsDrawContext);
 end;//TmsDrawOptionsContext

 ImsShape = interface(ImsObjectWrap)
 ['{70D5F6A0-1025-418B-959B-0CF524D8E394}']
  procedure DrawTo(const aCtx: TmsDrawContext);
  function IsNeedsSecondClick : Boolean;
  procedure EndTo(const aCtx: TmsEndShapeContext);
  function ContainsPt(const aPoint: TPointF): Boolean;
  procedure MoveTo(const aFinishPoint: TPointF);
 end;//ImsShape

 ImsDiagrammsPrim = interface(ImsObjectWrap)
 ['{FC90884F-8A48-472C-8AB2-6E5EF0A6F6D6}']
 end;//ImsDiagrammsPrim

 ImsDiagrammPrim = interface(ImsObjectWrap)
 ['{F475D5E5-C4C9-4177-AC54-8E54CCB32935}']
 end;//ImsDiagrammPrim

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

constructor TmsDrawContext.Create(const aCanvas : TCanvas);
begin
 rCanvas := aCanvas;
 rMoving := false;
end;

constructor TmsMakeShapeContext.Create(aStartPoint: TPointF; const aShapesController: ImsShapesController);
begin
 rStartPoint := aStartPoint;
 rShapesController := aShapesController;
end;

constructor TmsDrawOptionsContext.Create(const aCtx: TmsDrawContext);
begin
 rFillColor :=  TAlphaColorRec.Null;
 if aCtx.rMoving then
 begin
  rStrokeDash := TStrokeDash.sdDashDot;
  rStrokeColor := TAlphaColors.Darkmagenta;
  rStrokeThickness := 4;
 end//aCtx.rMoving
 else
 begin
  rStrokeDash := TStrokeDash.sdSolid;
  rStrokeColor := TAlphaColorRec.Black;
  rStrokeThickness := 1;
 end;//aCtx.rMoving
end;

end.
