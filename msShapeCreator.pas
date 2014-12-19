unit msShapeCreator;

interface

uses
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsShapeCreator = class(TmsInterfacedRefcounted, ImsShapeCreator)
 protected
  function Create(const aContext: TmsMakeShapeContext): ImsShape;
 end;//TmsShapeCreator

implementation

// TmsShapeCreator

function TmsShapeCreator.Create(const aContext: TmsMakeShapeContext): ImsShape;
begin
 Assert(false);
 Result := nil;
end;

end.
