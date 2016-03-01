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
 private
 // private methods
   class procedure RegisterColorValue(const aValue: String);
   class procedure RegisterCharsetValue(const aValue: String);
 public
 // public methods
   class function RegisterType(aTypeInfo: PTypeInfo): Boolean;
 end;//TtfwTypeRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Graphics,
  tfwEnumRegistrator,
  tfwClassRef,
  tfwInterfaceRegistrator,
  tfwTypeModifier,
  tfwEnumConstantRegistrator
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwTypeRegistrator

class procedure TtfwTypeRegistrator.RegisterColorValue(const aValue: String);
//#UC START# *55C361080119_5527F8330362_var*
var
 l_TI : PTypeInfo;
//#UC END# *55C361080119_5527F8330362_var*
begin
//#UC START# *55C361080119_5527F8330362_impl*
 l_TI := TypeInfo(TColor);
 TtfwEnumConstantRegistrator.Register(l_TI.Name + '::' + aValue, StringToColor(aValue), l_TI);
//#UC END# *55C361080119_5527F8330362_impl*
end;//TtfwTypeRegistrator.RegisterColorValue

class procedure TtfwTypeRegistrator.RegisterCharsetValue(const aValue: String);
//#UC START# *55C48B0D0230_5527F8330362_var*
var
 l_TI : PTypeInfo;
 l_Index : Integer;
//#UC END# *55C48B0D0230_5527F8330362_var*
begin
//#UC START# *55C48B0D0230_5527F8330362_impl*
 l_TI := TypeInfo(TFontCharset);
 IdentToCharset(aValue, l_Index);
 TtfwEnumConstantRegistrator.Register(l_TI.Name + '::' + aValue, l_Index, l_TI);
//#UC END# *55C48B0D0230_5527F8330362_impl*
end;//TtfwTypeRegistrator.RegisterCharsetValue

class function TtfwTypeRegistrator.RegisterType(aTypeInfo: PTypeInfo): Boolean;
//#UC START# *5527F84D01B5_5527F8330362_var*
//#UC END# *5527F84D01B5_5527F8330362_var*
begin
//#UC START# *5527F84D01B5_5527F8330362_impl*
 Result := false;
 if (aTypeInfo <> nil) then
 begin
  Case aTypeInfo.Kind of
   tkUnknown:
    // - ничего не регистрируем
    ;
   tkClass:
    Result := TtfwClassRef.Register(GetTypeData(aTypeInfo).ClassType);
   tkEnumeration:
    Result := TtfwEnumRegistrator.RegisterEnum(aTypeInfo);
   tkInterface:
    Result := TtfwInterfaceRegistrator.RegisterInterface(aTypeInfo);
   tkInteger:
    Result := TtfwTypeModifier.RegisterTypeModifier(aTypeInfo);
   tkString:
    Result := TtfwTypeModifier.RegisterTypeModifier(aTypeInfo);
   else
    Result := TtfwTypeModifier.RegisterTypeModifier(aTypeInfo);
  end;//Case aTypeInfo.Kind
  if Result then
  begin
   if (aTypeInfo = TypeInfo(TColor)) then
    GetColorValues(RegisterColorValue)
   else
   if (aTypeInfo = TypeInfo(TFontCharset)) then
    GetCharsetValues(RegisterCharsetValue);
  end;//Result
 end;//aTypeInfo <> nil
//#UC END# *5527F84D01B5_5527F8330362_impl*
end;//TtfwTypeRegistrator.RegisterType

{$IfEnd} //not NoScripts

end.