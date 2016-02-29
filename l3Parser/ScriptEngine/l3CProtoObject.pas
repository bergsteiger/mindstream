unit l3CProtoObject;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/L3/l3CProtoObject.pas"
// Начат: 26.10.2009 19:11
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Low Level::L3::l3CoreObjects::Tl3CProtoObject
//
// Кешируемый Tl3ProtoObject
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObject
  ;

type
 Tl3CProtoObject = {abstract} class(Tl3ProtoObject)
  {* Кешируемый Tl3ProtoObject }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
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