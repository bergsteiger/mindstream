unit msShapesList;

interface

uses
 {$Include msWatchedObject.mixin.pas}
 ,
 Generics.Collections,
 msInterfaces
 ;

type
 TmsWatchedObjectParent = class(TList<ImsShape>);
 {$Include msWatchedObject.mixin.pas}
 TmsShapesList = class(TmsWatchedObject)
 public
  function AddShape(const aShape: ImsShape): ImsShape;
 end;//TmsShapesList

implementation

uses
 {$Include msWatchedObject.mixin.pas}
 ;

{$Include msWatchedObject.mixin.pas}

function TmsShapesList.AddShape(const aShape: ImsShape): ImsShape;
begin
 Add(aShape);
 Result := aShape;
end;

end.
