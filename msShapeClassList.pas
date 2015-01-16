unit msShapeClassList;

interface

uses
 msShape,
 Generics.Collections
 ;

type
 RmsShapeList = TList<RmsShape>;

 TmsShapeClassLambda = reference to procedure (aShapeClass : RmsShape);

 TmsShapeClassList = class
 end;//TmsShapeClassList

implementation

end.
