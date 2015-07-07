unit tfwCachedTokens;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwCachedTokens.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Parser::TtfwCachedTokens
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwCStringList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCachedTokens = class(TtfwCStringList)
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 end;//TtfwCachedTokens
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwCachedTokens

{$If not defined(DesignTimeLibrary)}
class function TtfwCachedTokens.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_52F1221701EB_var*
//#UC END# *47A6FEE600FC_52F1221701EB_var*
begin
//#UC START# *47A6FEE600FC_52F1221701EB_impl*
 Result := true;
//#UC END# *47A6FEE600FC_52F1221701EB_impl*
end;//TtfwCachedTokens.IsCacheable
{$IfEnd} //not DesignTimeLibrary

{$IfEnd} //not NoScripts

end.