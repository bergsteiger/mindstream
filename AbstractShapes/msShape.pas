unit msShape;

interface

uses
 FMX.Graphics,
 System.Types,
 FMX.Types,
 System.UITypes,
 msCoreObjects,
 msSerializeInterfaces,
 msInterfacedRefcounted,
 msInterfaces,
 System.Classes,
 msDiagrammsList
 ;

type
 TmsShape = class abstract(TmsDiagrammsList, ImsShape)
 private
  FStartPoint: TPointF;
  function DrawOptionsContext(const aCtx: TmsDrawContext): TmsDrawOptionsContext;
  function pm_GetStartPoint: TPointF;
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); virtual; abstract;
  constructor CreateInner(const aStartPoint: TPointF); virtual;
  function IsNeedsSecondClick : Boolean; virtual;
  procedure EndTo(const aCtx: TmsEndShapeContext); virtual;
  procedure MoveTo(const aFinishPoint: TPointF); virtual;
  function ContainsPt(const aPoint: TPointF): Boolean; virtual;
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
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
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; virtual;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean; virtual;
  // - обрабатывает "нулевой клик"
  function DrawBounds: TRectF; virtual;
 public
  // В радианах
  procedure Rotate(const aCtx: TmsDrawContext; const aAngle: Single);

  procedure DrawTo(const aCtx: TmsDrawContext); virtual;
  property StartPoint : TPointF
   read pm_GetStartPoint;
  class function IsTool: Boolean; virtual;
  class function IsForToolbar: Boolean; virtual;
  class function IsLineLike: Boolean; virtual;
  class function IsNullClick: Boolean; virtual;
  //- примитив НЕ ТРЕБУЕТ кликов. ВООБЩЕ. Как TmsSwapParents или TmsUpToParent
  procedure Assign(anOther : TmsShape);
  class function ButtonShape(const aStartPoint: TPointF): ImsShape; virtual;
 end;//TmsShape

 RmsShape = class of TmsShape;

implementation

uses
 System.SysUtils,
 msShapeMarshal,
 System.Math.Vectors
 ;

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

function TmsShape.pm_GetStartPoint: TPointF;
begin
 Result := FStartPoint;
end;

procedure TmsShape.Rotate(const aCtx: TmsDrawContext; const aAngle: Single);
var
 l_OriginalMatrix: TMatrix;
 l_Matrix: TMatrix;
 l_CenterPoint : TPointF;
begin
 l_OriginalMatrix := aCtx.rCanvas.Matrix;
 try
  l_CenterPoint := StartPoint;

  l_Matrix := TMatrix.Identity;
  // - СНИМАЕМ оригинальную матрицу, точнее берём ЕДИНИЧНУЮ матрицу
  // https://ru.wikipedia.org/wiki/%D0%95%D0%B4%D0%B8%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%82%D1%80%D0%B8%D1%86%D0%B0
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(-l_CenterPoint.X,-l_CenterPoint.Y);
  // - задаём точку, вокруг которой вертим
  l_Matrix := l_Matrix * TMatrix.CreateRotation(aAngle);
  // - задаём угол поворота
  l_Matrix := l_Matrix * TMatrix.CreateTranslation(l_CenterPoint.X,l_CenterPoint.Y);
  // - задаём начало координат
  l_Matrix := l_Matrix * l_OriginalMatrix;
  // - ПРИМЕНЯЕМ оригинальную матрицу
  // Иначе например ОРИГИНАЛЬНЫЙ параллельный перенос - не будет работать.
  // https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D1%80%D0%B0%D0%BB%D0%BB%D0%B5%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%BF%D0%B5%D1%80%D0%B5%D0%BD%D0%BE%D1%81

  aCtx.rCanvas.SetMatrix(l_Matrix);
  // - применяем нашу "комплексную" матрицу

  Self.DrawTo(aCtx);
  // - отрисовываем примитив с учётом матрицы преобразований
 finally
  aCtx.rCanvas.SetMatrix(l_OriginalMatrix);
  // - восстанавливаем ОРИГИНАЛЬНУЮ матрицу
 end;//try..finally
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

class function TmsShape.IsLineLike: Boolean;
begin
 Result := false;
end;

class function TmsShape.IsNullClick: Boolean;
begin
 Result := false;
end;

class function TmsShape.DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean;
// - обрабатывает "нулевой клик"
begin
 Result := false;
end;

function TmsShape.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Result := DoNullClick(aHolder);
end;

function TmsShape.DrawBounds: TRectF;
begin
 Result := TRectF.Create(FStartPoint, FStartPoint);
 Assert(false);
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

procedure TmsShape.SaveTo(const aFileName: String);
begin
 TmsShapeMarshal.Serialize(aFileName, Self);
end;

procedure TmsShape.LoadFrom(const aFileName: String);
begin
 TmsShapeMarshal.DeSerialize(aFileName, Self);
end;

procedure TmsShape.Assign(anOther : TmsShape);
begin
 inherited Assign(anOther);
 Assert(false, 'Не реализовано');
end;

class function TmsShape.ButtonShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := nil;
end;

end.
