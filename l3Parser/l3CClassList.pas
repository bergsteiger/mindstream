unit l3CClassList;
 
{$Include l3Define.inc}

interface

uses
  l3ClassList
  ;

type
 Tl3CClassList = class(Tl3ClassList)
  {*  ешируемый список классов. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3CClassList

implementation

// start class Tl3CClassList

{$If not defined(DesignTimeLibrary)}
class function Tl3CClassList.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4773DC3502A7_var*
//#UC END# *47A6FEE600FC_4773DC3502A7_var*
begin
//#UC START# *47A6FEE600FC_4773DC3502A7_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4773DC3502A7_impl*
end;//Tl3CClassList.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.