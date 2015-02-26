﻿unit msShape;

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
 msDiagrammsList,
 Data.DBXJSONReflect
 ;

type
 TmsShape = class abstract(TmsDiagrammsList, ImsShape)
 strict private
  [JSONMarshalled(False)]
  f_ShapeClass : ImsShapeClass;
  f_ShapeClassName : String;
  // - тут дублирование данных, но исключительно из-за кривизны маршалинга
 private
  function DrawOptionsContext(const aCtx: TmsDrawContext): TmsDrawOptionsContext;
 strict protected
  function pm_GetStartPoint: TPointF; virtual;
  function pm_GetShapeClass: ImsShapeClass;
  property ShapeClass: ImsShapeClass
   read pm_GetShapeClass;
  constructor CreateInner(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext); virtual;
  procedure SetStartPoint(const aStartPoint: TPointF); virtual;
 protected
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); virtual;
  procedure DoDrawTo(const aCtx: TmsDrawContext); virtual; abstract;
  function IsNeedsSecondClick : Boolean; virtual;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean; virtual;
  procedure MoveBy(const aCtx: TmsMoveContext); virtual;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean; virtual;
  function ContainsPt(const aPoint: TPointF): Boolean; virtual;
  procedure SaveTo(const aFileName: String); override;
  procedure LoadFrom(const aFileName: String); override;
  function MouseUp(const aClickContext: TmsEndShapeContext): Boolean; virtual;
  procedure MouseMove(const aClickContext: TmsEndShapeContext); virtual;
  // - действие при MouseMove
  function Stereotype: String;
 protected
  class function Create(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext): ImsShape; overload; virtual;
 public
  class function Create(const aShapeClass : ImsShapeClass; const aStartPoint: TPointF): ImsShape; overload;
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
  class function Create(const aStartPoint: TPointF): ImsShape; overload;
 public
  class function DoNullClick(const aHolder: ImsDiagrammsHolder): Boolean; virtual;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean; virtual;
  // - обрабатывает "нулевой клик"
 protected
  function ClickInDiagramm: Boolean; virtual;
  // - ткнули в примитив внутри диаграммы
  function GetDrawBounds: TRectF; virtual;
  function DrawBounds: TRectF;
 public
  class function IsLineLike: Boolean; virtual;
  procedure DrawTo(const aCtx: TmsDrawContext); virtual;
  property StartPoint : TPointF
   read pm_GetStartPoint;
  class function IsTool: Boolean; virtual;
  class function IsForToolbar: Boolean; virtual;
  class function IsNullClick: Boolean; virtual;
  //- примитив НЕ ТРЕБУЕТ кликов. ВООБЩЕ. Как TmsSwapParents или TmsUpToParent
  procedure Assign(anOther : TmsShape);
  class function ButtonShape: ImsShape; virtual;
 end;//TmsShape

 RmsShape = class of TmsShape;

 MCmsShape = ImsShapeClass;
// MCmsShape = RmsShape;

implementation

uses
 System.SysUtils,
 msShapeMarshal,
 System.Math.Vectors,
 msRegisteredShapes,
 FMX.DUnit.msAppLog,

 msShapeClass
 ;

class function TmsShape.Create(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext): ImsShape;
begin
 Result := CreateInner(aShapeClass, aCtx);
 TmsAppLog.Instance.ToLog('Create object ' + self.ClassName);
end;

class function TmsShape.Create(const aShapeClass : ImsShapeClass; const aStartPoint: TPointF): ImsShape;
begin
 Result := CreateInner(aShapeClass, TmsMakeShapeContext.Create(aStartPoint, nil, nil));
end;

class function TmsShape.Create(const aStartPoint: TPointF): ImsShape;
begin
 Result := Create(TmsShapeClass.Create(Self), aStartPoint);
end;

function TmsShape.HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
begin
 Result := ContainsPt(aPoint);
 if Result then
  theShape := Self;
end;

function TmsShape.ContainsPt(const aPoint: TPointF): Boolean;
begin
 Result := False;
end;

constructor TmsShape.CreateInner(const aShapeClass : ImsShapeClass; const aCtx: TmsMakeShapeContext);
begin
 Assert(aShapeClass <> nil);
 f_ShapeClass := aShapeClass;
 f_ShapeClassName := f_ShapeClass.Name;
 inherited Create;
 SetStartPoint(aCtx.rStartPoint);
end;

function TmsShape.EndTo(const aCtx: TmsEndShapeContext): Boolean;
begin
 Result := true;
 Assert(false, 'Примитив ' + ClassName + ' не может быть завершён');
end;

procedure TmsShape.MouseMove(const aClickContext: TmsEndShapeContext);
begin
 // Ничего не делаем, специально
end;

function TmsShape.Stereotype: String;
begin
 Result := Self.ShapeClass.Stereotype;
 Result := '<< ' + Result + ' >>';
end;

procedure TmsShape.MoveBy(const aCtx: TmsMoveContext);
begin
 SetStartPoint(StartPoint + aCtx.rDelta);
end;

function TmsShape.MouseUp(const aClickContext: TmsEndShapeContext): Boolean;
begin
 Result := false;
 // - специально ничего не делаем
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
 Result := TPointF.Create(0, 0);
 Assert(false, 'Abstract method');
end;

function TmsShape.pm_GetShapeClass: ImsShapeClass;
begin
 if (f_ShapeClass = nil) then
  f_ShapeClass := TmsRegisteredShapes.Instance.ByName(f_ShapeClassName);
 Result := f_ShapeClass;
 Assert(Result <> nil);
end;

procedure TmsShape.SetStartPoint(const aStartPoint: TPointF);
begin
 Assert(false, 'Abstract method');
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

function TmsShape.ClickInDiagramm: Boolean;
begin
 Result := false;
end;

function TmsShape.GetDrawBounds: TRectF;
begin
 Result := TRectF.Create(StartPoint, StartPoint);
 Assert(false);
end;

function TmsShape.DrawBounds: TRectF;
var
 l_Tmp : Single;
begin
 Result := GetDrawBounds;
 if (Result.Top > Result.Bottom) then
 begin
  l_Tmp := Result.Bottom;
  Result.Bottom := Result.Top;
  Result.Top := l_Tmp;
 end;//Result.Top > Result.Bottom
 if (Result.Left > Result.Right) then
 begin
  l_Tmp := Result.Right;
  Result.Right := Result.Left;
  Result.Left := l_Tmp;
 end;//Result.Left > Result.Right
end;

procedure TmsShape.DrawTo(const aCtx: TmsDrawContext);
var
 l_Ctx : TmsDrawOptionsContext;
 l_DrawContext : TmsDrawContext;
begin
 l_Ctx := DrawOptionsContext(aCtx);
 aCtx.rCanvas.Fill.Color := l_Ctx.rFillColor;
 aCtx.rCanvas.Stroke.Dash := l_Ctx.rStrokeDash;
 aCtx.rCanvas.Stroke.Color := l_Ctx.rStrokeColor;
 aCtx.rCanvas.Stroke.Thickness := l_Ctx.rStrokeThickness;
 l_DrawContext := aCtx;
 l_DrawContext.rOpacity := l_Ctx.rOpacity;
 DoDrawTo(l_DrawContext);
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

class function TmsShape.ButtonShape: ImsShape;
begin
 Result := nil;
 Assert(false, 'Не реализовано');
end;

end.
