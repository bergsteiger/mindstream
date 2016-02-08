unit l3CObjectList;

 
{$Include l3Define.inc}

interface

uses
  l3ObjectList
  ;

type
 Tl3CObjectList = class(Tl3ObjectList)
  {*  ешируемый список указателей на объекты. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3CObjectList

implementation

// start class Tl3CObjectList

{$If not defined(DesignTimeLibrary)}
class function Tl3CObjectList.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4773DBEA0260_var*
//#UC END# *47A6FEE600FC_4773DBEA0260_var*
begin
//#UC START# *47A6FEE600FC_4773DBEA0260_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4773DBEA0260_impl*
end;//Tl3CObjectList.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.