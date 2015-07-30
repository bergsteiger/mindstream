unit tfwEnumRegistrator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwEnumRegistrator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ConstantsRegistration::TtfwEnumRegistrator
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
 TtfwEnumRegistrator = {final} class
 public
 // public methods
   class procedure RegisterEnum(aTypeInfo: PTypeInfo);
 end;//TtfwEnumRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwIntegerConstantRegistrator,
  tfwRegisteredEnums,
  tfwIntegerToEnumName
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwEnumRegistrator

class procedure TtfwEnumRegistrator.RegisterEnum(aTypeInfo: PTypeInfo);
//#UC START# *53C7E877024C_53C7E84E012D_var*
const
 cMax = 10000;
var
 l_TD : PTypeData;
 l_Index : Integer;
//#UC END# *53C7E877024C_53C7E84E012D_var*
begin
//#UC START# *53C7E877024C_53C7E84E012D_impl*
 if (TtfwRegisteredEnums.Instance.IndexOf(aTypeInfo) >= 0) then
  Exit;
 TtfwRegisteredEnums.Instance.Add(aTypeInfo); 
 Assert(aTypeInfo.Kind = tkEnumeration);
 if (aTypeInfo.Name <> 'Boolean') then
 begin
  l_TD := GetTypeData(aTypeInfo);
  Assert(l_TD <> nil);
  if (l_TD.MaxValue >= cMax) then
   Exit;
  if (l_TD.MinValue <= -cMax) then
   Exit;
  for l_Index := l_TD.MinValue to l_TD.MaxValue do
  begin
   TtfwIntegerConstantRegistrator.Register(aTypeInfo.Name + '::' + GetEnumName(aTypeInfo, l_Index), l_Index);
  end;//for l_Index
  TtfwIntegerToEnumName.Register(aTypeInfo);
 end;//aTypeInfo.Name <> 'Boolean'
//#UC END# *53C7E877024C_53C7E84E012D_impl*
end;//TtfwEnumRegistrator.RegisterEnum

{$IfEnd} //not NoScripts

end.