unit tfwIntegerConstantRegistrator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwIntegerConstantRegistrator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ConstantsRegistration::TtfwIntegerConstantRegistrator
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
  tfwInteger
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwIntegerConstantRegistrator = class(TtfwInteger)
 private
 // private fields
   f_Value : Integer;
 protected
 // overridden protected methods
   function GetInteger: Integer; override;
 public
 // public methods
   class procedure Register(const aName: AnsiString;
     aValue: Integer);
 end;//TtfwIntegerConstantRegistrator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptEngine,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwIntegerConstantRegistrator

class procedure TtfwIntegerConstantRegistrator.Register(const aName: AnsiString;
  aValue: Integer);
//#UC START# *53C7C5F402F1_53C7C4BF03D9_var*
var
 l_Inst : TtfwIntegerConstantRegistrator;
//#UC END# *53C7C5F402F1_53C7C4BF03D9_var*
begin
//#UC START# *53C7C5F402F1_53C7C4BF03D9_impl*
 l_Inst := Create;
 try
  l_Inst.f_Value := aValue;
  l_Inst.RegisterInstance(aName);
 finally
  FreeAndNil(l_Inst);
 end;//try..finally
//#UC END# *53C7C5F402F1_53C7C4BF03D9_impl*
end;//TtfwIntegerConstantRegistrator.Register

function TtfwIntegerConstantRegistrator.GetInteger: Integer;
//#UC START# *4EE1DC8903BB_53C7C4BF03D9_var*
//#UC END# *4EE1DC8903BB_53C7C4BF03D9_var*
begin
//#UC START# *4EE1DC8903BB_53C7C4BF03D9_impl*
 Result := f_Value;
//#UC END# *4EE1DC8903BB_53C7C4BF03D9_impl*
end;//TtfwIntegerConstantRegistrator.GetInteger

{$IfEnd} //not NoScripts

end.