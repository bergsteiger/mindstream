unit msShapeClassPrim;

interface

uses
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsShapeClassPrim = class abstract(TmsInterfacedRefcounted, ImsShapeClassTuner)
 private
  f_FillColor : TmsColorRec;
  f_InitialHeight : Pixel;
  f_InitialWidth : Pixel;
  f_StrokeThickness : TmsPixelRec;
  f_CornerRadius : Pixel;
  f_StrokeDash : TmsStrokeDash;
  f_IsForToolbar : Boolean;
  f_StereotypePlace: TmsStereotypePlace;
  f_SVGCode : String;
  f_AdditionalLinesH : TmsAdditionalLineCoeff;
 protected
  function ParentMC: ImsShapeClass; virtual;
  function AsMC: ImsShapeClass; virtual;
  function AsTuner: ImsShapeClassTuner;
  function Stereotype: String; virtual;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
  function SetFillColor(aColor: TAlphaColor): ImsShapeClassTuner;
  function SetStrokeThickness(aValue: Pixel): ImsShapeClassTuner;
  function SetStrokeDash(aValue: TStrokeDash): ImsShapeClassTuner;
  function SetInitialHeight(aValue: Pixel): ImsShapeClassTuner;
  function SetInitialHeightScale(aValue: Single): ImsShapeClassTuner;
  function SetCornerRadius(aValue: Single): ImsShapeClassTuner;
  function InitialHeight: Pixel;
  function InitialWidth: Pixel;
  function CornerRadius: Pixel;
  function SetInitialWidth(aValue: Pixel): ImsShapeClassTuner;
  function IsForToolbar: Boolean;
  function SetIsForToolbar(aValue: Boolean): ImsShapeClassTuner;
  function SetStereotypePlace(aValue: TmsStereotypePlace): ImsShapeClassTuner;
  function SetSVGCode(const aValue: String): ImsShapeClassTuner;
  function SetAdditionalLinesH(const aValue: TmsAdditionalLineCoeff): ImsShapeClassTuner;
  function StereotypePlace: TmsStereotypePlace;
  function SVGCode: String;
  function AdditionalLinesH: TmsAdditionalLineCoeff;
  function Specify(const aName: String): ImsShapeClassTuner;
  function Creator: ImsShapeCreator; virtual; abstract;
  function CreateShape(const aStartPoint: TPointF): ImsShape; overload;
  function CreateShape(const aContext: TmsMakeShapeContext): ImsShape; overload;
 public
  constructor Create;
 end;//TmsShapeClassPrim

implementation

uses
 msShape,
 msProxyShapeClass,
 msRegisteredShapes
 ;

// TmsShapeClassPrim

constructor TmsShapeClassPrim.Create;
var
 l_PMC : ImsShapeClass;
begin
 inherited Create;
 f_IsForToolbar := true;
 f_StereotypePlace := TmsStereotypePlace.None;
 l_PMC := ParentMC;
 if (l_PMC <> nil) then
 begin
  SetInitialHeight(l_PMC.InitialHeight);
  SetInitialWidth(l_PMC.InitialWidth);
  SetCornerRadius(l_PMC.CornerRadius);
  f_IsForToolbar := l_PMC.IsForToolbar;
  f_StereotypePlace := l_PMC.StereotypePlace;
  f_SVGCode := l_PMC.SVGCode;
  f_AdditionalLinesH := l_PMC.AdditionalLinesH;
 end;//l_PMC <> nil
end;

function TmsShapeClassPrim.ParentMC: ImsShapeClass;
begin
 Result := nil;
 Assert(false, 'Не реализовано');
end;

function TmsShapeClassPrim.AsMC: ImsShapeClass;
begin
 Result := nil;
 Assert(false, 'Не реализовано');
end;

function TmsShapeClassPrim.AsTuner: ImsShapeClassTuner;
begin
 Result := Self;
end;

function TmsShapeClassPrim.Stereotype: String;
begin
 Result := '';
 Assert(false, 'Не реализовано');
end;

procedure TmsShapeClassPrim.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 if (ParentMC <> nil) then
  ParentMC.TransformDrawOptionsContext(theCtx);
 if f_FillColor.rIsSet then
  theCtx.rFillColor := f_FillColor.rValue;
 if f_StrokeThickness.rIsSet then
  theCtx.rStrokeThickness := f_StrokeThickness.rValue;
 if f_StrokeDash.rIsSet then
  theCtx.rStrokeDash := f_StrokeDash.rValue;
end;

function TmsShapeClassPrim.SetFillColor(aColor: TAlphaColor): ImsShapeClassTuner;
begin
 Result := Self;
 f_FillColor := aColor;
end;

function TmsShapeClassPrim.SetStrokeThickness(aValue: Pixel): ImsShapeClassTuner;
begin
 Result := Self;
 f_StrokeThickness := aValue;
end;

function TmsShapeClassPrim.SetStrokeDash(aValue: TStrokeDash): ImsShapeClassTuner;
begin
 Result := Self;
 f_StrokeDash := aValue;
end;

function TmsShapeClassPrim.SetInitialHeight(aValue: Pixel): ImsShapeClassTuner;
begin
 Result := Self;
 f_InitialHeight := aValue;
end;

function TmsShapeClassPrim.SetCornerRadius(aValue: Single): ImsShapeClassTuner;
begin
 Result := Self;
 f_CornerRadius := aValue;
end;

function TmsShapeClassPrim.SetInitialWidth(aValue: Pixel): ImsShapeClassTuner;
begin
 Result := Self;
 f_InitialWidth := aValue;
end;

function TmsShapeClassPrim.IsForToolbar: Boolean;
begin
 Result := f_IsForToolbar;
end;

function TmsShapeClassPrim.SetIsForToolbar(aValue: Boolean): ImsShapeClassTuner;
begin
 Result := Self;
 f_IsForToolbar := aValue;
end;

function TmsShapeClassPrim.SetStereotypePlace(aValue: TmsStereotypePlace): ImsShapeClassTuner;
begin
 Result := Self;
 f_StereotypePlace := aValue;
end;

function TmsShapeClassPrim.SetSVGCode(const aValue: String): ImsShapeClassTuner;
begin
 Result := Self;
 Assert(aValue <> '');
 f_SVGCode := aValue;
end;

function TmsShapeClassPrim.SetAdditionalLinesH(const aValue: TmsAdditionalLineCoeff): ImsShapeClassTuner;
begin
 Result := Self;
 f_AdditionalLinesH := aValue;
end;

function TmsShapeClassPrim.StereotypePlace: TmsStereotypePlace;
begin
 Result := f_StereotypePlace;
end;

function TmsShapeClassPrim.SVGCode: String;
begin
 Result := f_SVGCode;
end;

function TmsShapeClassPrim.AdditionalLinesH: TmsAdditionalLineCoeff;
begin
 Result := f_AdditionalLinesH;
end;

function TmsShapeClassPrim.Specify(const aName: String): ImsShapeClassTuner;
begin
 Result := TmsProxyShapeClass.Create(aName, Self.AsMC);
 TmsRegisteredShapes.Instance.RegisterMC(Result.AsMC);
end;

function TmsShapeClassPrim.CreateShape(const aStartPoint: TPointF): ImsShape;
begin
 Result := Creator.CreateShape(aStartPoint);
end;

function TmsShapeClassPrim.CreateShape(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Result := Creator.CreateShape(aContext);
end;

function TmsShapeClassPrim.SetInitialHeightScale(aValue: Single): ImsShapeClassTuner;
begin
 Result := Self.SetInitialHeight(Self.ParentMC.InitialHeight * aValue);
end;

function TmsShapeClassPrim.InitialHeight: Pixel;
begin
 Result := f_InitialHeight;
end;

function TmsShapeClassPrim.InitialWidth: Pixel;
begin
 Result := f_InitialWidth;
end;

function TmsShapeClassPrim.CornerRadius: Pixel;
begin
 Result := f_CornerRadius;
end;

end.
