unit msShapeMarshal;
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

interface

uses
 {$Include msMarshal.mixin.pas}
 ,
 msShape
 ;

type
 TClassToSerialize = TmsShape;
 {$Include msMarshal.mixin.pas}
 TmsShapeMarshal = class(TmsMarshal)
 end;//TmsDiagrammMarshal

implementation

uses
 {$Include msMarshal.mixin.pas}
 ;

{$Include msMarshal.mixin.pas}

end.
