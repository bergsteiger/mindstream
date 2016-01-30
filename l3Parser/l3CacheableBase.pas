unit l3CacheableBase;
{$Include ..\L3\l3Define.inc}

interface

uses
  l3SimpleObject
  ;

type
 Tl3CacheableBase = class(Tl3SimpleObject)
  {* Ѕазовый класс дл€ кешируемых объектов }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3CacheableBase

implementation

// start class Tl3CacheableBase

{$If not defined(DesignTimeLibrary)}
class function Tl3CacheableBase.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_46780E690001_var*
//#UC END# *47A6FEE600FC_46780E690001_var*
begin
//#UC START# *47A6FEE600FC_46780E690001_impl*
 Result := true;
//#UC END# *47A6FEE600FC_46780E690001_impl*
end;//Tl3CacheableBase.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.