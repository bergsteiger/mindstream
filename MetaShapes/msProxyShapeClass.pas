unit msProxyShapeClass;

interface

uses
 msInterfaces,
 msShape,
 msInterfacedRefcounted
 ;

type
 TmsProxyShapeClass = class(TmsInterfacedRefcounted, ImsShapeClass)
 private
  f_ShapeClass : MCmsShape;
  f_Name : String;
 private
  constructor CreateInner(const aName : String; const aShapeClass: MCmsShape);
 protected
  function IsForToolbar: Boolean;
  function IsTool: Boolean;
  function IsLineLike: Boolean;
  function Creator: ImsShapeCreator;
  function Name: String;
  function Stereotype: String;
  procedure RegisterInMarshal(aMarshal: TmsJSONMarshal);
  procedure RegisterInUnMarshal(aMarshal: TmsJSONUnMarshal);
  function IsNullClick: Boolean;
  function ButtonShape: ImsShape;
  function IsOurInstance(const aShape: ImsShape): Boolean;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
 public
  class function Create(const aName : String; const aShapeClass: MCmsShape): ImsShapeClass; overload;
  class function Create(const aName : String; const aShapeClass: RmsShape): ImsShapeClass; overload;
 end;//TmsProxyShapeClass

implementation

uses
 msShapeCreator,
 msRegisteredShapes
 ;

// TmsProxyShapeClass

constructor TmsProxyShapeClass.CreateInner(const aName : String; const aShapeClass: MCmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
 f_Name := aName;
end;

class function TmsProxyShapeClass.Create(const aName : String; const aShapeClass: MCmsShape): ImsShapeClass;
begin
 Result := CreateInner(aName, aShapeClass);
end;

class function TmsProxyShapeClass.Create(const aName : String; const aShapeClass: RmsShape): ImsShapeClass;
begin
 Result := Create(aName, TmsRegisteredShapes.Instance.ByName(aShapeClass.ClassName));
end;

function TmsProxyShapeClass.IsForToolbar: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsForToolbar;
end;

function TmsProxyShapeClass.IsTool: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsTool;
end;

function TmsProxyShapeClass.IsLineLike: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsLineLike;
end;

function TmsProxyShapeClass.Creator: ImsShapeCreator;
begin
 Assert(f_ShapeClass <> nil);
 Assert(false, 'Не реализовано');
 Result := f_ShapeClass.Creator;
end;

function TmsProxyShapeClass.Name: String;
begin
 Assert(f_ShapeClass <> nil);
 Assert(false, 'Не реализовано');
 Result := f_ShapeClass.Name;
end;

function TmsProxyShapeClass.Stereotype: String;
begin
 Assert(f_ShapeClass <> nil);
 Assert(false, 'Не реализовано');
 Result := f_ShapeClass.Stereotype;
end;

procedure TmsProxyShapeClass.RegisterInMarshal(aMarshal: TmsJSONMarshal);
begin
 Assert(f_ShapeClass <> nil);
 f_ShapeClass.RegisterInMarshal(aMarshal);
end;

procedure TmsProxyShapeClass.RegisterInUnMarshal(aMarshal: TmsJSONUnMarshal);
begin
 Assert(f_ShapeClass <> nil);
 f_ShapeClass.RegisterInUnMarshal(aMarshal);
end;

function TmsProxyShapeClass.IsNullClick: Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.IsNullClick;
end;

function TmsProxyShapeClass.ButtonShape: ImsShape;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.ButtonShape;
end;

function TmsProxyShapeClass.IsOurInstance(const aShape: ImsShape): Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Assert(aShape.ShapeClass <> nil);
 Result := aShape.ShapeClass.Name = f_ShapeClass.Name;
end;

function TmsProxyShapeClass.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.NullClick(aHolder);
end;

end.
