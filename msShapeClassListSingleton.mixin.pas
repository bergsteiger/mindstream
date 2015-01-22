{$IfNDef TmsShapeClassListSingleton_uses_intf}

// interface

{$Define TmsShapeClassListSingleton_uses_intf}

// uses
 msShapeClassList,
 msShape,
 Generics.Collections

{$Else TmsShapeClassListSingleton_uses_intf}

{$IfNDef TmsShapeClassListSingleton_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

 TmsShapeClassListSingleton = class(TmsShapeClassList)
 // [Одиночка (шаблон проектирования)|https://ru.wikipedia.org/wiki/%D0%9E%D0%B4%D0%B8%D0%BD%D0%BE%D1%87%D0%BA%D0%B0_(%D1%88%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD_%D0%BF%D1%80%D0%BE%D0%B5%D0%BA%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D1%8F)]
 strict private
  class var f_Instance: TmsShapeClassListSingleton;
  class destructor Fini;
 public
  class function Instance: TmsShapeClassListSingleton;
 end;//TmsShapeClassListSingleton

{$Define TmsShapeClassListSingleton_intf}

{$Else TmsShapeClassListSingleton_intf}

// implementation

{$IfNDef TmsShapeClassListSingleton_uses_impl}

// uses
 System.SysUtils

{$Define TmsShapeClassListSingleton_uses_impl}

{$Else TmsShapeClassListSingleton_uses_impl}

// TmsShapeClassListSingleton

class destructor TmsShapeClassListSingleton.Fini;
begin
 FreeAndNil(f_Instance);
end;

class function TmsShapeClassListSingleton.Instance: TmsShapeClassListSingleton;
begin
 if (f_Instance = nil) then
  f_Instance := Self.Create;
 Result := f_Instance;
end;

{$EndIf TmsShapeClassListSingleton_uses_impl}

{$EndIf TmsShapeClassListSingleton_intf}
{$EndIf TmsShapeClassListSingleton_uses_intf}
