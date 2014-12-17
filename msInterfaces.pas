unit msInterfaces;

interface

uses
 System.Types,
 System.Classes,
 FMX.Graphics,
 System.UITypes,
 msSerializeInterfaces,
 Generics.Collections
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

 ImsDiagramm = interface;

 TmsDiagrammsEnumerator = TEnumerator<ImsDiagramm>;

 ImsShapesProvider = interface(ImsPersistent)
  procedure ShapesForToolbarToList(aList: TStrings);
 end;//ImsShapesProvider

 ImsDiagrammsList = interface(ImsShapesProvider)
  function GetEnumerator: TmsDiagrammsEnumerator;
  function IndexOf(const anItem: ImsDiagramm): Integer;
  function AddNewDiagramm: ImsDiagramm;
 end;//ImsDiagrammsList

 ImsShape = interface(ImsDiagrammsList)
 ['{70D5F6A0-1025-418B-959B-0CF524D8E394}']
  procedure DrawTo(const aCtx: TmsDrawContext);
  function IsNeedsSecondClick : Boolean;
  procedure EndTo(const aCtx: TmsEndShapeContext);
  function ContainsPt(const aPoint: TPointF): Boolean;
  procedure MoveTo(const aFinishPoint: TPointF);
  function pm_GetStartPoint: TPointF;
  property StartPoint: TPointF
   read pm_GetStartPoint;
 end;//ImsShape

 TmsShapesEnumerator = TEnumerator<ImsShape>;

 ImsDiagramm = interface(ImsShapesProvider)
 ['{59F2D068-F06F-4378-9ED4-888DFE8DFAF2}']
  function Get_Name: String;
  procedure Invalidate;
  procedure ProcessClick(const aStart: TPointF);
  procedure Clear;
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  function CurrentShapeClassIndex: Integer;
  procedure DrawTo(const aCanvas: TCanvas);
  function AddShape(const aShape: ImsShape): ImsShape;
  function GetEnumerator: TmsShapesEnumerator;
  function ItemsCount: Integer;
  property Name: String
   read Get_Name;
 end;//ImsDiagramm

 ImsDiagramms = interface(ImsDiagrammsList)
 ['{819BEEBA-97BB-48F1-906E-107E67706D19}']
  function CurrentShapeClassIndex: Integer;
  function CurrentDiagrammIndex: Integer;
  function pm_GetCurrentDiagramm: ImsDiagramm;
  procedure Serialize;
  procedure DeSerialize;
  procedure Clear;
  procedure SelectDiagramm(anIndex: Integer);
  procedure SelectShape(aList: TStrings; anIndex: Integer);
  procedure ProcessClick(const aStart: TPointF);
  procedure AddDiagramm(const aDiagramm: ImsDiagramm);
  property CurrentDiagramm: ImsDiagramm
   read pm_GetCurrentDiagramm;
 end;//ImsDiagramms

 ImsIvalidator = interface
  procedure InvalidateDiagramm(const aDiagramm: ImsDiagramm);
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm);
 end;//ImsIvalidator

implementation

// TmsDrawContext

constructor TmsDrawContext.Create(const aCanvas : TCanvas);
begin
 rCanvas := aCanvas;
 rMoving := false;
end;

// TmsMakeShapeContext

constructor TmsMakeShapeContext.Create(aStartPoint: TPointF; const aShapesController: ImsShapesController);
begin
 rStartPoint := aStartPoint;
 rShapesController := aShapesController;
end;

// TmsDrawOptionsContext

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
