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
 private
  constructor CreateInner(const aShapeClass: MCmsShape);
 protected
  function IsForToolbar: Boolean;
  function IsTool: Boolean;
  function Creator: ImsShapeCreator;
  function Name: String;
  procedure RegisterInMarshal(aMarshal: TmsJSONMarshal);
  procedure RegisterInUnMarshal(aMarshal: TmsJSONUnMarshal);
  function IsNullClick: Boolean;
  function ButtonShape: ImsShape;
  function IsOurInstance(const aShape: ImsShape): Boolean;
  function NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
 public
  class function Create(const aShapeClass: MCmsShape): ImsShapeClass;
 end;//TmsProxyShapeClass

implementation

uses
 msShapeCreator
 ;

// TmsProxyShapeClass

constructor TmsProxyShapeClass.CreateInner(const aShapeClass: MCmsShape);
begin
 inherited Create;
 f_ShapeClass := aShapeClass;
end;

class function TmsProxyShapeClass.Create(const aShapeClass: MCmsShape): ImsShapeClass;
begin
 Result := CreateInner(aShapeClass);
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

function TmsProxyShapeClass.Creator: ImsShapeCreator;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.Creator;
end;

function TmsProxyShapeClass.Name: String;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.Name;
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
 Assert(false, 'Недоделано');
 //Result := aShape.ClassType = f_ShapeClass;
end;

function TmsProxyShapeClass.NullClick(const aHolder: ImsDiagrammsHolder): Boolean;
begin
 Assert(f_ShapeClass <> nil);
 Result := f_ShapeClass.NullClick(aHolder);
end;

end.
