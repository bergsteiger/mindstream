unit msDiagrammsMarshal;
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

interface

uses
 {$Include msMarshal.mixin.pas}
 ,
 msDiagramms
 ;

type
 TClassToSerialize = TmsDiagramms;
 {$Include msMarshal.mixin.pas}
 TmsDiagrammsMarshal = class(TmsMarshal)
 end;//TmsDiagrammMarshal

implementation

uses
 {$Include msMarshal.mixin.pas}
 ;

{$Include msMarshal.mixin.pas}

end.

