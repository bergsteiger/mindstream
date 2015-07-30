unit tfwTypeRegistrator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwTypeRegistrator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::TypesRegistration::TtfwTypeRegistrator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwTypeRegistrator = class
 public
 // public methods
   class procedure RegisterType(aTypeInfo: PTypeInfo);
 end;//TtfwTypeRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwEnumRegistrator,
  tfwClassRef,
  tfwInterfaceRegistrator
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwTypeRegistrator

class procedure TtfwTypeRegistrator.RegisterType(aTypeInfo: PTypeInfo);
//#UC START# *5527F84D01B5_5527F8330362_var*
//#UC END# *5527F84D01B5_5527F8330362_var*
begin
//#UC START# *5527F84D01B5_5527F8330362_impl*
 if (aTypeInfo <> nil) then
  Case aTypeInfo.Kind of
   tkClass :
    TtfwClassRef.Register(GetTypeData(aTypeInfo).ClassType);
   tkEnumeration:
    TtfwEnumRegistrator.RegisterEnum(aTypeInfo);
   tkInterface:
    TtfwInterfaceRegistrator.RegisterInterface(aTypeInfo);
  end;//Case aTypeInfo.Kind
//#UC END# *5527F84D01B5_5527F8330362_impl*
end;//TtfwTypeRegistrator.RegisterType

{$IfEnd} //not NoScripts

end.