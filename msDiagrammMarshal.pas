unit msDiagrammMarshal;
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

interface

uses
 JSON,
 Data.DBXJSONReflect,
 msDiagramm
 ;

type
 TClassToSerialize = TmsDiagramm;
 {$Include msMarshal.mixin.pas}
 TmsDiagrammMarshal = class(TmsMarshal)
 end;//TmsDiagrammMarshal

implementation

uses
 msShape,
 SysUtils,
 msSerializeInterfaces,
 msRegisteredShapes,
 msCoreObjects
 ;

{$Include msMarshal.mixin.pas}

end.
