unit msShapeClassPrim;

interface

uses
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsShapeClassPrim = class(TmsInterfacedRefcounted)
 protected
  f_FillColor : TmsColorRec;
  f_InitialHeight : TmsPixelRec;
  f_StrokeThickness : TmsPixelRec;
 end;//TmsShapeClassPrim

implementation

end.
