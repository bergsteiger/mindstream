unit msInterfaces;

interface

uses
 System.Types,
 System.Classes,
 FMX.Graphics,
 System.UITypes,
 msSerializeInterfaces,
 Generics.Collections,
 FMX.Objects
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

 ImsDiagrammsHolder = interface;

 TmsMakeShapeContext = record
  public
   rStartPoint: TPointF;
   rShapesController: ImsShapesController;
   rDiagrammsHolder: ImsDiagrammsHolder;
   constructor Create(aStartPoint: TPointF; const aShapesController: ImsShapesController; aDiagrammsHolder: ImsDiagrammsHolder);
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
  procedure AddDiagramm(const aDiagramm: ImsDiagramm);
  function  SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
  function FirstDiagramm: ImsDiagramm;
  procedure DiagrammsForToolbarToList(aList: TStrings);
  function pm_GetCount: Integer;
  property Count: Integer
   read pm_GetCount;
 end;//ImsDiagrammsList

 ImsShape = interface(ImsDiagrammsList)
 ['{70D5F6A0-1025-418B-959B-0CF524D8E394}']
  procedure DrawTo(const aCtx: TmsDrawContext);
  function IsNeedsSecondClick : Boolean;
  procedure EndTo(const aCtx: TmsEndShapeContext);
  function ContainsPt(const aPoint: TPointF): Boolean;
  procedure MoveTo(const aFinishPoint: TPointF);
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
  function pm_GetStartPoint: TPointF;
  property StartPoint: TPointF
   read pm_GetStartPoint;
 end;//ImsShape

 TmsShapesEnumerator = TEnumerator<ImsShape>;

 ImsShapeCreator = interface
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
 end;//ImsShapeCreator

 ImsDiagrammsHolder = interface
 ['{611ECC2D-3D5B-4297-8A2D-9154D4CF17E7}']
  procedure UpToParent;
  // - сигнализируем о том, что нам надо перейти к РОДИТЕЛЬСКОЙ диаграмме
  procedure SwapParents;
  // - сигнализируем о том, что надо ПОМЕНЯТЬ местами РОДИТЕЛЬСКИЕ диаграммы
  function pm_GetCurrentDiagramms: ImsDiagrammsList;
  procedure pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
  property CurrentDiagramms : ImsDiagrammsList
   read pm_GetCurrentDiagramms
   write pm_SetCurrentDiagramms;
 end;//ImsDiagrammsHolder

 TmsClickContext = record
  public
   rShapeCreator: ImsShapeCreator;
   rClickPoint: TPointF;
   rDiagrammsHolder : ImsDiagrammsHolder;
   constructor Create(const aShapeCreator: ImsShapeCreator; const aClickPoint: TPointF; const aDiagrammsHolder : ImsDiagrammsHolder);
 end;//TmsClickContext

 ImsDiagramm = interface(ImsShapesProvider)
 ['{59F2D068-F06F-4378-9ED4-888DFE8DFAF2}']
  function Get_Name: String;
  procedure Invalidate;
  procedure ProcessClick(const aClickContext: TmsClickContext);
  procedure Clear;
  procedure DrawTo(const aCanvas: TCanvas);
  procedure SaveToPng(const aFileName: String);
  function AddShape(const aShape: ImsShape): ImsShape;
  function GetEnumerator: TmsShapesEnumerator;
  function ItemsCount: Integer;
  property Name: String
  read Get_Name;
 end;//ImsDiagramm

 ImsDiagramms = interface(ImsDiagrammsList)
 ['{819BEEBA-97BB-48F1-906E-107E67706D19}']
  procedure Serialize;
  procedure DeSerialize;
 end;//ImsDiagramms

 ImsIvalidator = interface
  procedure InvalidateDiagramm(const aDiagramm: ImsDiagramm);
  procedure DiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
 end;//ImsIvalidator

 ImsDiagrammsController = interface
  procedure Clear;
  procedure DrawTo(const aCanvas: TCanvas);
 end;//ImsDiagrammsController

implementation

// TmsDrawContext

constructor TmsDrawContext.Create(const aCanvas : TCanvas);
begin
 rCanvas := aCanvas;
 rMoving := false;
end;

// TmsMakeShapeContext

constructor TmsMakeShapeContext.Create(aStartPoint: TPointF; const aShapesController: ImsShapesController; aDiagrammsHolder: ImsDiagrammsHolder);
begin
 rStartPoint := aStartPoint;
 rShapesController := aShapesController;
 rDiagrammsHolder := aDiagrammsHolder;
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

// TmsClickContext

constructor TmsClickContext.Create(const aShapeCreator: ImsShapeCreator; const aClickPoint: TPointF; const aDiagrammsHolder : ImsDiagrammsHolder);
begin
 rShapeCreator := aShapeCreator;
 rClickPoint := aClickPoint;
 rDiagrammsHolder := aDiagrammsHolder;
end;

end.
