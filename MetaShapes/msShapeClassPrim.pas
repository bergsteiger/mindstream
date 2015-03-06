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
  function AsTMC: ImsTunableShapeClass; virtual;
  function Stereotype: String; virtual;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
  function SetFillColor(aColor: TAlphaColor): ImsTunableShapeClass;
  function SetStrokeThickness(aValue: Pixel): ImsTunableShapeClass;
  function SetInitialHeight(aValue: Pixel): ImsTunableShapeClass;
 end;//TmsShapeClassPrim

implementation

// TmsShapeClassPrim

function TmsShapeClassPrim.ParentMC: ImsShapeClass;
begin
 Result := nil;
 Assert(false, 'Не реализовано');
end;

function TmsShapeClassPrim.AsTMC: ImsTunableShapeClass;
begin
 Result := nil;
 Assert(false, 'Не реализовано');
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

function TmsShapeClassPrim.SetFillColor(aColor: TAlphaColor): ImsTunableShapeClass;
begin
 Result := Self.AsTMC;
 f_FillColor := aColor;
end;

function TmsShapeClassPrim.SetStrokeThickness(aValue: Pixel): ImsTunableShapeClass;
begin
 Result := Self.AsTMC;
 f_StrokeThickness := aValue;
end;

function TmsShapeClassPrim.SetInitialHeight(aValue: Pixel): ImsTunableShapeClass;
begin
 Result := Self.AsTMC;
 f_InitialHeight := aValue;
end;

end.
