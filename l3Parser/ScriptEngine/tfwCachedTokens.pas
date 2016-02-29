unit tfwCachedTokens;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Parsing"
// Модуль: "tfwCachedTokens.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Parsing::Parser::TtfwCachedTokens
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

uses
  tfwCStringList
  ;

type
 TtfwCachedTokens = class(TtfwCStringList)
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 end;//TtfwCachedTokens

implementation

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

end.