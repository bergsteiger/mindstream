unit msGarbageCollector;

interface

uses
 Generics.Collections
 ;

type
 TmsGarbageCollector = class(TList<IUnknown>)
  //  ласс позвол€ющий боротьс€ с http://programmingmindstream.blogspot.com/2015/04/json-unmarshal-tinterfacedobject.html
  // ѕутЄм отложенного удалени€ объектов, которым был взведЄн лишний AddRef.
 strict private
  class var f_Instance: TmsGarbageCollector;
  class destructor Fini;
 public
  class function Instance: TmsGarbageCollector;
 end;//TmsGarbageCollector

implementation

uses
 System.SysUtils
 ;

// TmsGarbageCollector

class destructor TmsGarbageCollector.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsGarbageCollector.Instance: TmsGarbageCollector;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create;
 Result := f_Instance;
end;

end.
