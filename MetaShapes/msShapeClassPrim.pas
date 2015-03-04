unit msShapeClassPrim;

interface

uses
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsShapeClassPrim = class abstract(TmsInterfacedRefcounted)
 protected
  f_FillColor : TmsColorRec;
  f_InitialHeight : TmsPixelRec;
  f_StrokeThickness : TmsPixelRec;
 protected
  function ParentMC: ImsShapeClass; virtual;
 end;//TmsShapeClassPrim

implementation

// TmsShapeClassPrim

function TmsShapeClassPrim.ParentMC: ImsShapeClass;
begin
 Result := nil;
 Assert(false, 'Не реализовано');
end;

end.
