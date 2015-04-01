unit msGarbageCollector;

interface

uses
 Generics.Collections
 ;

type
 TmsGarbageCollector = class(TList<IUnknown>)
  //  ласс позвол€ющий боротьс€ с http://programmingmindstream.blogspot.com/2015/04/json-unmarshal-tinterfacedobject.html
  // ѕутЄм отложенного удалени€ объектов, которым был взведЄн лишний AddRef.
 end;//TmsGarbageCollector

implementation

end.
