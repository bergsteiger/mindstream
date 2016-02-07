unit l3NCString;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3_String
  ;

type
 Tl3NCString = class(Tl3_String)
  {* √арантированно некешируема€ строка. }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3NCString

implementation

// start class Tl3NCString

{$If not defined(DesignTimeLibrary)}
class function Tl3NCString.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_47BC50F5038E_var*
//#UC END# *47A6FEE600FC_47BC50F5038E_var*
begin
//#UC START# *47A6FEE600FC_47BC50F5038E_impl*
 Result := false;
//#UC END# *47A6FEE600FC_47BC50F5038E_impl*
end;//Tl3NCString.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.