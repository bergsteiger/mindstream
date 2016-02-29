unit tfwEnumConstantRegistrator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwEnumConstantRegistrator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ConstantsRegistration::TtfwEnumConstantRegistrator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwIntegerConstantRegistrator,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwEnumConstantRegistrator = class(TtfwIntegerConstantRegistrator)
 private
 // private fields
   f_TypeInfo : PTypeInfo;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // public methods
   constructor Create(aValue: Integer;
     aTypeInfo: PTypeInfo); reintroduce;
   class procedure Register(const aName: AnsiString;
     aValue: Integer;
     aTypeInfo: PTypeInfo);
 end;//TtfwEnumConstantRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwEnumConstantRegistrator

constructor TtfwEnumConstantRegistrator.Create(aValue: Integer;
  aTypeInfo: PTypeInfo);
//#UC START# *55C0DA200397_55C0D99E0109_var*
//#UC END# *55C0DA200397_55C0D99E0109_var*
begin
//#UC START# *55C0DA200397_55C0D99E0109_impl*
 inherited Create(aValue);
 f_TypeInfo := aTypeInfo;
//#UC END# *55C0DA200397_55C0D99E0109_impl*
end;//TtfwEnumConstantRegistrator.Create

class procedure TtfwEnumConstantRegistrator.Register(const aName: AnsiString;
  aValue: Integer;
  aTypeInfo: PTypeInfo);
//#UC START# *55C0DA7C026A_55C0D99E0109_var*
var
 l_Inst : TtfwEnumConstantRegistrator;
//#UC END# *55C0DA7C026A_55C0D99E0109_var*
begin
//#UC START# *55C0DA7C026A_55C0D99E0109_impl*
 l_Inst := Create(aValue, aTypeInfo);
 try
  l_Inst.RegisterInstance(aName);
 finally
  FreeAndNil(l_Inst);
 end;//try..finally
//#UC END# *55C0DA7C026A_55C0D99E0109_impl*
end;//TtfwEnumConstantRegistrator.Register

function TtfwEnumConstantRegistrator.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_55C0D99E0109get_var*
//#UC END# *52CFC11603C8_55C0D99E0109get_var*
begin
//#UC START# *52CFC11603C8_55C0D99E0109get_impl*
 Result := TtfwWordInfo.Make(f_TypeInfo);
//#UC END# *52CFC11603C8_55C0D99E0109get_impl*
end;//TtfwEnumConstantRegistrator.pm_GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwEnumConstantRegistrator
 TtfwEnumConstantRegistrator.RegisterInEngine;
{$IfEnd} //not NoScripts

end.