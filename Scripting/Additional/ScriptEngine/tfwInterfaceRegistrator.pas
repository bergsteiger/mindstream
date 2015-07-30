unit tfwInterfaceRegistrator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwInterfaceRegistrator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::TypesRegistration::TtfwInterfaceRegistrator
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
 TtfwInterfaceRegistrator = class
 public
 // public methods
   class procedure RegisterInterface(aTypeInfo: PTypeInfo);
 end;//TtfwInterfaceRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwStringConstantRegistrator,
  l3String,
  tfwScriptingInterfaces,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwInterfaceRegistrator

class procedure TtfwInterfaceRegistrator.RegisterInterface(aTypeInfo: PTypeInfo);
//#UC START# *55311CD00337_55311C9F022C_var*
var
 l_TD : PTypeData;
//#UC END# *55311CD00337_55311C9F022C_var*
begin
//#UC START# *55311CD00337_55311C9F022C_impl*
 Assert(aTypeInfo.Kind = tkInterface);
 l_TD := GetTypeData(aTypeInfo);
 Assert(l_TD <> nil);
 if (ifHasGuid in l_TD.IntfFlags) then
 begin
  TtfwStringConstantRegistrator.Register('guid::' + aTypeInfo.Name, TtfwCStringFactory.C(GUIDtoString(l_TD.GUID)));
 end;//ifHasGuid in l_TD.IntfFlags
//#UC END# *55311CD00337_55311C9F022C_impl*
end;//TtfwInterfaceRegistrator.RegisterInterface

{$IfEnd} //not NoScripts

end.