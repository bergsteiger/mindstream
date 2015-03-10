unit msShapeClassPrim;

interface

uses
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsShapeClassPrim = class abstract(TmsInterfacedRefcounted, ImsShapeClassTuner)
 protected
  f_FillColor : TmsColorRec;
  f_InitialHeight : TmsPixelRec;
  f_StrokeThickness : TmsPixelRec;
  f_StrokeDash : TmsStrokeDash;
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
 end;//TmsShapeClassPrim

implementation

// TmsShapeClassPrim

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

end.
