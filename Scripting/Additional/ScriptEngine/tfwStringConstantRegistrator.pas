unit tfwStringConstantRegistrator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStringConstantRegistrator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TtfwStringConstantRegistrator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwString,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStringConstantRegistrator = class(TtfwString)
 private
 // private fields
   f_Value : Il3CString;
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function ReallyNeedRegister: Boolean; override;
   function GetString: AnsiString; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class procedure Register(const aName: AnsiString;
     const aValue: Il3CString);
 end;//TtfwStringConstantRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwStringConstantRegistrator

class procedure TtfwStringConstantRegistrator.Register(const aName: AnsiString;
  const aValue: Il3CString);
//#UC START# *55311BAA0306_55311B3903DC_var*
var
 l_Inst : TtfwStringConstantRegistrator;
//#UC END# *55311BAA0306_55311B3903DC_var*
begin
//#UC START# *55311BAA0306_55311B3903DC_impl*
 l_Inst := Create;
 try
  l_Inst.f_Value := aValue;
  l_Inst.RegisterInstance(aName);
 finally
  FreeAndNil(l_Inst);
 end;//try..finally
//#UC END# *55311BAA0306_55311B3903DC_impl*
end;//TtfwStringConstantRegistrator.Register

procedure TtfwStringConstantRegistrator.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55311B3903DC_var*
//#UC END# *4DAEEDE10285_55311B3903DC_var*
begin
//#UC START# *4DAEEDE10285_55311B3903DC_impl*
 aCtx.rEngine.PushString(f_Value);
//#UC END# *4DAEEDE10285_55311B3903DC_impl*
end;//TtfwStringConstantRegistrator.DoDoIt

class function TtfwStringConstantRegistrator.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_55311B3903DC_var*
//#UC END# *4DC2E05B03DD_55311B3903DC_var*
begin
//#UC START# *4DC2E05B03DD_55311B3903DC_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_55311B3903DC_impl*
end;//TtfwStringConstantRegistrator.ReallyNeedRegister

function TtfwStringConstantRegistrator.GetString: AnsiString;
//#UC START# *4DDFD2EA0116_55311B3903DC_var*
//#UC END# *4DDFD2EA0116_55311B3903DC_var*
begin
//#UC START# *4DDFD2EA0116_55311B3903DC_impl*
 Result := l3Str(f_Value);
//#UC END# *4DDFD2EA0116_55311B3903DC_impl*
end;//TtfwStringConstantRegistrator.GetString

procedure TtfwStringConstantRegistrator.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_Value := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwStringConstantRegistrator.ClearFields

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwStringConstantRegistrator
 TtfwStringConstantRegistrator.RegisterInEngine;
{$IfEnd} //not NoScripts

end.