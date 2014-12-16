unit msDiagrammMarshal;
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

interface

uses
 {$Include msMarshal.mixin.pas}
 ,
 msDiagramm
 ;

type
 TClassToSerialize = TmsDiagramm;
 {$Include msMarshal.mixin.pas}
 TmsDiagrammMarshal = class(TmsMarshal)
 end;//TmsDiagrammMarshal

implementation

uses
 {$Include msMarshal.mixin.pas}
 ;

{$Include msMarshal.mixin.pas}

end.

