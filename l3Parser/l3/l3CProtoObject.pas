unit l3CProtoObject;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

type
 Tl3CProtoObject = {abstract} class(Tl3ProtoObject)
  {*  ешируемый Tl3ProtoObject }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функци€ класса, определ€юща€ могут ли объекты данного класса попадать в кэш повторного использовани€. }
   {$IfEnd} //not DesignTimeLibrary
   function NeedCleanupFields: Boolean; override;
 end;//Tl3CProtoObject

implementation

// start class Tl3CProtoObject

{$If not defined(DesignTimeLibrary)}
class function Tl3CProtoObject.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4AE5CA2D0034_var*
//#UC END# *47A6FEE600FC_4AE5CA2D0034_var*
begin
//#UC START# *47A6FEE600FC_4AE5CA2D0034_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4AE5CA2D0034_impl*
end;//Tl3CProtoObject.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function Tl3CProtoObject.NeedCleanupFields: Boolean;
//#UC START# *4AF44EC401EE_4AE5CA2D0034_var*
//#UC END# *4AF44EC401EE_4AE5CA2D0034_var*
begin
//#UC START# *4AF44EC401EE_4AE5CA2D0034_impl*
 Result := false;
//#UC END# *4AF44EC401EE_4AE5CA2D0034_impl*
end;//Tl3CProtoObject.NeedCleanupFields

end.