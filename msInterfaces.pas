unit msInterfaces;

interface

uses
 System.Types,
 System.Classes,
 FMX.Graphics,
 System.UITypes,
 msSerializeInterfaces,
 Generics.Collections,
 FMX.Objects,
 Data.DBXJSONReflect,
 msLineF
 ;

type
 Pixel = msLineF.Pixel;

 ImsShape = interface;

 TPointF = System.Types.TPointF;

 ImsShapeByPt = interface
  function ShapeByPt(const aPoint: TPointF): ImsShape;
 end;//ImsShapeByPt

 ImsShapesController = interface(ImsShapeByPt)
  procedure RemoveShape(const aShape: ImsShape);
  function AddShape(const aShape: ImsShape): ImsShape;
  procedure Invalidate;
  function ShapeCount: Integer;
 end;//ImsShapesController
 // - тут бы иметь МНОЖЕСТВЕННОЕ наследование интерфейсов, но Delphi его не поддерживает
 // А вот с UML - мы его ПОТОМ СГЕНЕРИРУЕМ

 TmsDrawContext  = record
 // [Состояние (шаблон проектирования)|https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D1%81%D1%82%D0%BE%D1%8F%D0%BD%D0%B8%D0%B5_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)]
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
   rOpacity: Single;
   rLineOpacity: Single;
   constructor Create(const aCanvas : TCanvas);
 end;//TmsDrawContext

 TAlphaColor = System.UITypes.TAlphaColor;
 TAlphaColorRec = System.UITypes.TAlphaColorRec;
 TStrokeDash = FMX.Graphics.TStrokeDash;

 TmsColorRec = record
  rIsSet : Boolean;
  rValue : TAlphaColor;
  class operator Implicit(aValue: TAlphaColor): TmsColorRec;
 end;//TmsColorRec

 TmsPixelRec = record
  rIsSet : Boolean;
  rValue : Pixel;
  class operator Implicit(aValue: Pixel): TmsPixelRec;
 end;//TmsPixelRec

 TmsRadiusRec = record
  rIsSet : Boolean;
  rValue : Pixel;
  class operator Implicit(aValue: Pixel): TmsRadiusRec;
 end;//TmsRadiusRec

 TmsStrokeDash = record
  rIsSet : Boolean;
  rValue : TStrokeDash;
  class operator Implicit(aValue: TStrokeDash): TmsStrokeDash;
 end;//TmsStrokeDash

 TmsDrawOptionsContext = record
  public
   rFillColor: TAlphaColor;
   rStrokeDash: TStrokeDash;
   rStrokeColor: TAlphaColor;
   rStrokeThickness: Single;
   rOpacity: Single;
   rLineOpacity: Single;
   constructor Create(const aCtx: TmsDrawContext);
 end;//TmsDrawOptionsContext

 ImsDiagrammsHolder = interface;

 TmsMakeShapeContext = record
  public
   rStartPoint: TPointF;
   rShapesController: ImsShapesController;
   rDiagrammsHolder: ImsDiagrammsHolder;
   constructor Create(aStartPoint: TPointF; const aShapesController: ImsShapesController; const aDiagrammsHolder: ImsDiagrammsHolder);
 end;//TmsMakeShapeContext

 TmsEndShapeContext = TmsMakeShapeContext;

 ImsDiagramm = interface;

 TmsDiagrammsEnumerator = TEnumerator<ImsDiagramm>;

 ImsShapesProvider = interface(ImsPersistent)
  procedure ShapesForToolbarToList(aList: TStrings);
 end;//ImsShapesProvider

 ImsDiagrammsList = interface(ImsShapesProvider)
  function GetEnumerator: TmsDiagrammsEnumerator;
  function IndexOf(const anItem: ImsDiagramm): Integer;
  function AddNewDiagramm: ImsDiagramm;
  procedure Add(const aDiagramm: ImsDiagramm);
  function  SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
  function FirstDiagramm: ImsDiagramm;
  procedure DiagrammsForToolbarToList(aList: TStrings);
  function pm_GetCount: Integer;
  property Count: Integer
   read pm_GetCount;
 end;//ImsDiagrammsList

 ImsShapeClass = interface;

 ImsShapeCreator = interface;

 TmsClickContext = record
  public
   rShapeCreator: ImsShapeCreator;
   rClickPoint: TPointF;
   rDiagrammsHolder : ImsDiagrammsHolder;
   rShift: TShiftState;
   constructor Create(const aShapeCreator: ImsShapeCreator; const aClickPoint: TPointF; const aDiagrammsHolder : ImsDiagrammsHolder; const aShift: TShiftState);
 end;//TmsClickContext

 TmsMoveContext = record
  public
   rStartPoint: TPointF;
   rDelta: TPointF;
   rShapesController: ImsShapesController;
   constructor Create(const aStartPoint: TPointF; const aDelta: TPointF; const aShapesController: ImsShapesController);
 end;//TmsMoveContext

 TRectF = System.Types.TRectF;

 TmsShapeUID = record
  rValue: Int64;
  public
   class operator Add(anUID: TmsShapeUID; aDelta: Int64): TmsShapeUID;
   class operator Implicit(aValue: Int64): TmsShapeUID;
 end;//TmsShapeUID

 ImsShape = interface(ImsDiagrammsList)
 ['{70D5F6A0-1025-418B-959B-0CF524D8E394}']
  procedure DrawTo(const aCtx: TmsDrawContext);
  function IsNeedsSecondClick : Boolean;
  function MouseUp(const aClickContext: TmsEndShapeContext): Boolean;
  function EndTo(const aCtx: TmsEndShapeContext): Boolean;
  function HitTest(const aPoint: TPointF; out theShape: ImsShape): Boolean;
  procedure MoveBy(const aCtx: TmsMoveContext);
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
  function ClickInDiagramm: Boolean;
  // - ткнули в примитив внутри диаграммы
  function DrawBounds: TRectF;
  procedure MouseMove(const aClickContext: TmsEndShapeContext);
  // - действите нажатии
  function UID: TmsShapeUID;
  function pm_GetStartPoint: TPointF;
  function pm_GetShapeClass: ImsShapeClass;
  property StartPoint: TPointF
   read pm_GetStartPoint;
  property ShapeClass: ImsShapeClass
   read pm_GetShapeClass;
  function Name: String;
 end;//ImsShape

 TmsWeakInterfaceRef<T{: IUnknown}> = record
 // Слабая ссылка на интерфейс
 private
  type PT = ^T;
 private
  rRef : Pointer;
  function AsRef: T; inline;
 public
  constructor Create(const aT: T);
  class operator Equal(const A: TmsWeakInterfaceRef<T>; const B: TmsWeakInterfaceRef<T>): Boolean;
  class operator Equal(const A: TmsWeakInterfaceRef<T>; const B: T): Boolean;
  class operator Implicit(const aValue: T): TmsWeakInterfaceRef<T>; inline;
  class operator Implicit(const aValue: TmsWeakInterfaceRef<T>): T; inline;
 end;//TmsWeakInterfaceRef

 TmsWeakShapeRef = TmsWeakInterfaceRef<ImsShape>;

 // Слабая ссылка на ImsShape
(* TmsWeakShapeRef = record
 // Слабая ссылка на ImsShape
  rShape : Pointer;
  constructor Create(const aShape: ImsShape);
  function AsShape: ImsShape;
  class operator Equal(const A: TmsWeakShapeRef; const B: TmsWeakShapeRef): Boolean;
  class operator Equal(const A: TmsWeakShapeRef; const B: ImsShape): Boolean;
  class operator Implicit(const aShape: ImsShape): TmsWeakShapeRef;
 end;//TmsWeakShapeRef*)

 TmsShapesEnumerator = TEnumerator<ImsShape>;

 ImsShapeCreator = interface
 // [Фабричный_метод_(шаблон_проектирования)|https://ru.wikipedia.org/wiki/%D0%A4%D0%B0%D0%B1%D1%80%D0%B8%D1%87%D0%BD%D1%8B%D0%B9_%D0%BC%D0%B5%D1%82%D0%BE%D0%B4_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)]
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; overload;
  function CreateShape(const aStartPoint: TPointF): ImsShape; overload;
 end;//ImsShapeCreator

 ImsShapeCreatorFriend = interface
 // - Это "затычка", но пока так. Чтобы не терять темп.
  ['{59C7ED7A-C4C7-4632-A59C-2CBF070FCA19}']
  function ShapeClassForCreate: TClass;
 end;//ImsShapeCreatorFriend

 TmsJSONMarshal = TJSONMarshal;
 TmsJSONUnMarshal = TJSONUnMarshal;

 ImsDiagrammsHolder = interface
  procedure UpToParent;
  // - сигнализируем о том, что нам надо перейти к РОДИТЕЛЬСКОЙ диаграмме
  procedure SwapParents;
  // - сигнализируем о том, что надо ПОМЕНЯТЬ местами РОДИТЕЛЬСКИЕ диаграммы
  procedure Scroll(const aDirection: TPointF);
                // ^ - не стесняйтесь ставить const перед записями.
                //  Точнее ставьте ОБЯЗАТЕЛЬНО !!!
  // - скроллинг диаграммы на дельту
  procedure ResetOrigin;
  // - восстанавливаем начальную систему координат
  function GenerateUID(const aShape: ImsShape): TmsShapeUID;
  // - создаёт UID для примитива aShape
  function pm_GetCurrentDiagramms: ImsDiagrammsList;
  procedure pm_SetCurrentDiagramms(const aValue: ImsDiagrammsList);
  property CurrentDiagramms : ImsDiagrammsList
   read pm_GetCurrentDiagramms
   write pm_SetCurrentDiagramms;
 end;//ImsDiagrammsHolder

 TmsStereotypePlace = (
  None,
  Center,
  Bottom,
  OneThirty
 );//TmsStereotypePlace

 TmsAdditionalLineCoeff = array of Single;

 ImsShapeClassTuner = interface
  function AsMC: ImsShapeClass;
  function SetFillColor(aColor: TAlphaColor): ImsShapeClassTuner;
  function SetInitialHeight(aValue: Pixel): ImsShapeClassTuner;
  function SetInitialHeightScale(aValue: Single): ImsShapeClassTuner;
  function SetCornerRadius(aValue: Single): ImsShapeClassTuner;
  function SetStrokeThickness(aValue: Pixel): ImsShapeClassTuner;
  function SetStrokeDash(aValue: TStrokeDash): ImsShapeClassTuner;
  function SetInitialWidth(aValue: Pixel): ImsShapeClassTuner;
  function SetIsForToolbar(aValue: Boolean): ImsShapeClassTuner;
  function SetStereotypePlace(aValue: TmsStereotypePlace): ImsShapeClassTuner;
  function SetSVGCode(const aValue: String): ImsShapeClassTuner;
  function SetAdditionalLinesH(const aValue: TmsAdditionalLineCoeff): ImsShapeClassTuner;
 end;//ImsShapeClassTuner

 TmsShapeClassName = record
  rValue : String;
  class operator Implicit(const aValue: String): TmsShapeClassName;
  class operator Implicit(const aSelf: TmsShapeClassName): String;
  class operator Equal(const A: TmsShapeClassName; const B: TmsShapeClassName): Boolean;
 end;//TmsShapeClassName

 TmsShapeStereotype = TmsShapeClassName;

 ImsShapeClass = interface
  function IsForToolbar: Boolean;
  function IsTool: Boolean;
  function IsLineLike: Boolean;
  function Creator: ImsShapeCreator;
  function Name: TmsShapeClassName;
  procedure RegisterInMarshal(aMarshal: TmsJSONMarshal);
  procedure RegisterInUnMarshal(aMarshal: TmsJSONUnMarshal);
  function IsNullClick: Boolean;
  function ButtonShape: ImsShape;
  function IsOurInstance(const aShape: ImsShape): Boolean;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
  function Stereotype: TmsShapeStereotype;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
  function InitialHeight: Pixel;
  function InitialWidth: Pixel;
  function CornerRadius: Pixel;
  function ParentMC: ImsShapeClass;
  function AsTuner: ImsShapeClassTuner;
  function StereotypePlace: TmsStereotypePlace;
  function SVGCode: String;
  function AdditionalLinesH: TmsAdditionalLineCoeff;
  function Specify(const aName: String): ImsShapeClassTuner;
  function CreateShape(const aStartPoint: TPointF): ImsShape; overload;
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; overload;
 end;//ImsShapeClass

 ImsDiagramm = interface(ImsShapesProvider)
 ['{59F2D068-F06F-4378-9ED4-888DFE8DFAF2}']
  function Get_Name: String;
  procedure Invalidate;
  procedure MouseDown(const aClickContext: TmsClickContext);
  procedure MouseUp(const aClickContex: TmsClickContext);
  procedure MouseMove(const aClickContex: TmsClickContext);
  procedure Clear;
  procedure DrawTo(const aCanvas: TCanvas);
  procedure SaveToPng(const aFileName: String);
  function AddShape(const aShape: ImsShape): ImsShape;
  procedure RemoveShape(const aShape: ImsShape);
  function GetEnumerator: TmsShapesEnumerator;
  function ItemsCount: Integer;
  function FirstShape: ImsShape;
  function ShapesController: ImsShapesController;
  property Name: String
  read Get_Name;
 end;//ImsDiagramm

 ImsDiagramms = interface(ImsDiagrammsList)
  procedure Serialize;
  procedure DeSerialize;
 end;//ImsDiagramms

 ImsInvalidator = interface
  procedure InvalidateDiagramm(const aDiagramm: ImsDiagramm);
  procedure DiagrammAdded(const aDiagramms: ImsDiagrammsList; const aDiagramm: ImsDiagramm);
 end;//ImsInvalidator

 ImsDiagrammsController = interface
  procedure Clear;
  procedure DrawTo(const aCanvas: TCanvas);
  function As_ImsDiagrammsHolder: ImsDiagrammsHolder;
 end;//ImsDiagrammsController

 TmsWeakInvalidatorRef = TmsWeakInterfaceRef<ImsInvalidator>;

 TmsWeakShapeClassRef = TmsWeakInterfaceRef<ImsShapeClass>;

implementation

uses
 Math,
 System.StrUtils
 ;

// TmsDrawContext

constructor TmsDrawContext.Create(const aCanvas : TCanvas);
begin
 rCanvas := aCanvas;
 rMoving := false;
 rOpacity := 0.5;
 rLineOpacity := 1.0;
end;

// TmsMakeShapeContext

constructor TmsMakeShapeContext.Create(aStartPoint: TPointF; const aShapesController: ImsShapesController; const aDiagrammsHolder: ImsDiagrammsHolder);
begin
 rStartPoint := aStartPoint;
 rShapesController := aShapesController;
 rDiagrammsHolder := aDiagrammsHolder;
end;

// TmsDrawOptionsContext

constructor TmsDrawOptionsContext.Create(const aCtx: TmsDrawContext);
begin
 rFillColor :=  TAlphaColorRec.Null;
 rOpacity := 0.5;
 rLineOpacity := 1.0;
 if aCtx.rMoving then
 begin
  rStrokeDash := TStrokeDash.DashDot;
  rStrokeColor := TAlphaColors.Darkmagenta;
  rStrokeThickness := 4;
 end//aCtx.rMoving
 else
 begin
  rStrokeDash := TStrokeDash.Solid;
  rStrokeColor := TAlphaColorRec.Black;
  rStrokeThickness := 1;
 end;//aCtx.rMoving
end;

// TmsClickContext

constructor TmsClickContext.Create(const aShapeCreator: ImsShapeCreator; const aClickPoint: TPointF; const aDiagrammsHolder : ImsDiagrammsHolder; const aShift: TShiftState);
begin
 rShapeCreator := aShapeCreator;
 rClickPoint := aClickPoint;
 rDiagrammsHolder := aDiagrammsHolder;
 rShift := aShift;
end;

// TmsMoveContext

constructor TmsMoveContext.Create(const aStartPoint: TPointF; const aDelta: TPointF; const aShapesController: ImsShapesController);
begin
 rStartPoint := aStartPoint;
 rDelta := aDelta;
 rShapesController := aShapesController;
end;

// TmsColorRec

class operator TmsColorRec.Implicit(aValue: TAlphaColor): TmsColorRec;
begin
 Result.rIsSet := true;
 Result.rValue := aValue;
end;

// TmsPixelRec

class operator TmsPixelRec.Implicit(aValue: Pixel): TmsPixelRec;
begin
 if IsZero(aValue) OR (aValue < 0) then
  Result.rIsSet := false
 else
 begin
  Result.rIsSet := true;
  Result.rValue := aValue;
 end;//IsZero(aValue) OR (aValue < 0)
end;

// TmsRadiusRec

class operator TmsRadiusRec.Implicit(aValue: Pixel): TmsRadiusRec;
begin
 if (aValue < 0) then
  Result.rIsSet := false
 else
 begin
  Result.rIsSet := true;
  Result.rValue := aValue;
 end;//(aValue < 0)
end;

// TmsStrokeDash

class operator TmsStrokeDash.Implicit(aValue: TStrokeDash): TmsStrokeDash;
begin
 Result.rIsSet := true;
 Result.rValue := aValue;
end;

// TmsShapeClassName

class operator TmsShapeClassName.Implicit(const aValue: String): TmsShapeClassName;
const
 cPref = 'Tms';
begin
 Result.rValue := aValue;
 if ANSIStartsText(cPref, Result.rValue) then
  Result.rValue := Copy(Result.rValue, Length(cPref) + 1, Length(Result.rValue) - Length(cPref));
end;

class operator TmsShapeClassName.Implicit(const aSelf: TmsShapeClassName): String;
begin
 Result := aSelf.rValue;
end;

class operator TmsShapeClassName.Equal(const A: TmsShapeClassName; const B: TmsShapeClassName): Boolean;
begin
 Result := (A.rValue = B.rValue);
end;

// TmsShapeUID

class operator TmsShapeUID.Add(anUID: TmsShapeUID; aDelta: Int64): TmsShapeUID;
begin
 Result.rValue := anUID.rValue + aDelta;
end;

class operator TmsShapeUID.Implicit(aValue: Int64): TmsShapeUID;
begin
 Result.rValue := aValue;
end;

// TmsWeakInterfaceRef<T>

constructor TmsWeakInterfaceRef<T>.Create(const aT: T);
begin
 Assert(SizeOf(aT) = SizeOf(Self.rRef));
 Self.rRef := PPointer(@aT)^;
 //Move(aT, Self.rRef, SizeOf(T));
end;

function TmsWeakInterfaceRef<T>.AsRef: T;
begin
 Assert(SizeOf(Self.rRef) = SizeOf(Result));
 Result := PT(@Self.rRef)^;
(* Result := nil;
 Move(Self.rRef, Result, SizeOf(T));
 Result._AddRef;*)
end;

class operator TmsWeakInterfaceRef<T>.Implicit(const aValue: TmsWeakInterfaceRef<T>): T;
begin
 Result := aValue.AsRef;
end;

class operator TmsWeakInterfaceRef<T>.Equal(const A: TmsWeakInterfaceRef<T>; const B: TmsWeakInterfaceRef<T>): Boolean;
begin
 Result := (A.rRef = B.rRef);
end;

class operator TmsWeakInterfaceRef<T>.Equal(const A: TmsWeakInterfaceRef<T>; const B: T): Boolean;
(*var
 l_P : Pointer;*)
begin
 Assert(SizeOf(B) = SizeOf(A));
 Result := (A.rRef = PPointer(@B)^);
(* Move(B, l_P, SizeOf(T));
 Result := (A.rRef = l_P);*)
end;

class operator TmsWeakInterfaceRef<T>.Implicit(const aValue: T): TmsWeakInterfaceRef<T>;
begin
 Result := TmsWeakInterfaceRef<T>.Create(aValue);
end;

end.
