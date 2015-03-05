unit msShapeClass;

interface

uses
 System.UITypes,

 msInterfaces,
 msShape,
 msInterfacedRefcounted,
 msShapeClassPrim
 ;

type
 TmsShapeClass = class(TmsShapeClassPrim, ImsShapeClass, ImsTunableShapeClass)
 private
  f_ShapeClass : RmsShape;
  f_ParentMC : ImsShapeClass;
 private
  constructor CreateInner(aShapeClass: RmsShape);
 protected
  function IsForToolbar: Boolean;
  function IsTool: Boolean;
  function IsLineLike: Boolean;
  function Creator: ImsShapeCreator;
  function Name: String;
  procedure RegisterInMarshal(aMarshal: TmsJSONMarshal);
  procedure RegisterInUnMarshal(aMarshal: TmsJSONUnMarshal);
  function IsNullClick: Boolean;
  function ButtonShape: ImsShape;
  function IsOurInstance(const aShape: ImsShape): Boolean;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
  function Stereotype: String;
  function ParentMC: ImsShapeClass; override;
  function SetFillColor(aColor: TAlphaColor): ImsTunableShapeClass;
  function SetStrokeThickness(aValue: Pixel): ImsTunableShapeClass;
  function SetInitialHeight(aValue: Pixel): ImsTunableShapeClass;
  function InitialHeight: Pixel;
 public
  class function Create(aShapeClass: RmsShape): ImsTunableShapeClass;
 end;//TmsShapeClass

implementation

uses
 msShapeCreator,
 msRegisteredShapes
 ;

type
 TmsShapeFriend = class(TmsShape)
 end;//TmsShapeFriend

 RmsShapeFriend = class of TmsShapeFriend;

// TmsShapeClass

constructor TmsShapeClass.CreateInner(aShapeClass: RmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
end;

class function TmsShapeClass.Create(aShapeClass: RmsShape): ImsTunableShapeClass;
begin
 Result := TmsRegisteredShapes.Instance.ByName(aShapeClass.ClassName) As ImsTunableShapeClass;
 if (Result = nil) then
  Result := CreateInner(aShapeClass);
 Assert(Result <> nil);
end;

function TmsShapeClass.IsForToolbar: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsForToolbar;
end;

function TmsShapeClass.IsTool: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsTool;
end;

function TmsShapeClass.IsLineLike: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsLineLike;
end;

function TmsShapeClass.Creator: ImsShapeCreator;
begin
 Assert(f_ShapeClass <> nil);
 Result := TmsShapeCreator.Create(Self, f_ShapeClass);
end;

function TmsShapeClass.Name: String;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.ClassName;
end;

function TmsShapeClass.Stereotype: String;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.ClassName;
 Result := Copy(Result, 4, Length(Result) - 3);
end;

function TmsShapeClass.ParentMC: ImsShapeClass;
begin
 if (f_ParentMC = nil) then
 begin
  Assert(f_ShapeClass <> nil);
  if (f_ShapeClass.ClassParent.InheritsFrom(TmsShape)) then
   f_ParentMC := RmsShape(f_ShapeClass.ClassParent).MC
  else
   f_ParentMC := nil;
 end;//f_ParentMC = nil
 Result := f_ParentMC;
end;

function TmsShapeClass.InitialHeight: Pixel;
var
 l_V : TmsPixelRec;
begin
 Assert(f_ShapeClass <> nil);
 l_V := f_InitialHeight;
 if l_V.rIsSet then
  Result := l_V.rValue
 else
  Result := RmsShapeFriend(f_ShapeClass).InitialHeight;
end;

function TmsShapeClass.SetFillColor(aColor: TAlphaColor): ImsTunableShapeClass;
begin
 Result := Self;
 f_FillColor := aColor;
end;

function TmsShapeClass.SetStrokeThickness(aValue: Pixel): ImsTunableShapeClass;
begin
 Result := Self;
 f_StrokeThickness := aValue;
end;

function TmsShapeClass.SetInitialHeight(aValue: Pixel): ImsTunableShapeClass;
begin
 Result := Self;
 f_InitialHeight := aValue;
end;

procedure TmsShapeClass.RegisterInMarshal(aMarshal: TmsJSONMarshal);
begin
 Assert(f_ShapeClass <> nil);
 f_ShapeClass.RegisterInMarshal(aMarshal);
end;

procedure TmsShapeClass.RegisterInUnMarshal(aMarshal: TmsJSONUnMarshal);
begin
 Assert(f_ShapeClass <> nil);
 f_ShapeClass.RegisterInUnMarshal(aMarshal);
end;

function TmsShapeClass.IsNullClick: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsNullClick;
end;

function TmsShapeClass.ButtonShape: ImsShape;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.ButtonShape;
end;

function TmsShapeClass.IsOurInstance(const aShape: ImsShape): Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := aShape.ClassType = f_ShapeClass;
end;

function TmsShapeClass.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.DoNullClick(aHolder);
end;

end.
