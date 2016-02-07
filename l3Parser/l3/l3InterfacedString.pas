unit l3InterfacedString;

{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3NCString
  ;

type
 Tl3InterfacedString = class(Tl3NCString, Il3CString)
  {* –еализаци€ интерфейса строки }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3InterfacedString

implementation

uses
  Classes
  {$If not defined(NoScripts)}
  ,
  tfwIl3CStringPack
  {$IfEnd} //not NoScripts
  
  ;

// start class Tl3InterfacedString

{$If not defined(DesignTimeLibrary)}
class function Tl3InterfacedString.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_47CC4CCC02FA_var*
//#UC END# *47A6FEE600FC_47CC4CCC02FA_var*
begin
//#UC START# *47A6FEE600FC_47CC4CCC02FA_impl*
 Result := true;
//#UC END# *47A6FEE600FC_47CC4CCC02FA_impl*
end;//Tl3InterfacedString.IsCacheable
{$IfEnd} //not DesignTimeLibrary

end.