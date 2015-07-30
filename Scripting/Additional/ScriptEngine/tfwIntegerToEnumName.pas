unit tfwIntegerToEnumName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwIntegerToEnumName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ConstantsRegistration::TtfwIntegerToEnumName
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwRegisterableWordPrim,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwIntegerToEnumName = class(TtfwRegisterableWordPrim)
 private
 // private fields
   f_TypeInfo : PTypeInfo;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 public
 // public methods
   class procedure Register(aTypeInfo: PTypeInfo);
 end;//TtfwIntegerToEnumName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwStringToEnumValue
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwIntegerToEnumName

class procedure TtfwIntegerToEnumName.Register(aTypeInfo: PTypeInfo);
//#UC START# *553129980377_553128CE018D_var*
var
 l_Inst : TtfwIntegerToEnumName;
//#UC END# *553129980377_553128CE018D_var*
begin
//#UC START# *553129980377_553128CE018D_impl*
 l_Inst := Create;
 try
  l_Inst.f_TypeInfo := aTypeInfo;
  l_Inst.RegisterInstance('Integer:To:' + aTypeInfo.Name + ':Name');
 finally
  FreeAndNil(l_Inst);
 end;//try..finally
 TtfwStringToEnumValue.Register(aTypeInfo);
//#UC END# *553129980377_553128CE018D_impl*
end;//TtfwIntegerToEnumName.Register

procedure TtfwIntegerToEnumName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_553128CE018D_var*
//#UC END# *4DAEEDE10285_553128CE018D_var*
begin
//#UC START# *4DAEEDE10285_553128CE018D_impl*
 aCtx.rEngine.PushString(GetEnumName(f_TypeInfo, aCtx.rEngine.PopInt));
//#UC END# *4DAEEDE10285_553128CE018D_impl*
end;//TtfwIntegerToEnumName.DoDoIt

function TtfwIntegerToEnumName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_553128CE018D_var*
//#UC END# *551544E2001A_553128CE018D_var*
begin
//#UC START# *551544E2001A_553128CE018D_impl*
 Result := TypeInfo(String); 
//#UC END# *551544E2001A_553128CE018D_impl*
end;//TtfwIntegerToEnumName.GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwIntegerToEnumName
 TtfwIntegerToEnumName.RegisterClass;
{$IfEnd} //not NoScripts

end.