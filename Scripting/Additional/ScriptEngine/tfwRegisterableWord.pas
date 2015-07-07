unit tfwRegisterableWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwRegisterableWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::PrimitiveWords::TtfwRegisterableWord
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
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwRegisterableWord = {abstract} class(TtfwWord)
 protected
 // protected methods
   class function Register(const aName: AnsiString): Boolean;
 public
 // public methods
   function RegisterInstance(const aName: AnsiString): Boolean;
 end;//TtfwRegisterableWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwRegisterableWord

class function TtfwRegisterableWord.Register(const aName: AnsiString): Boolean;
//#UC START# *4DDFD69F00FE_53EDC0E701BC_var*
//#UC END# *4DDFD69F00FE_53EDC0E701BC_var*
begin
//#UC START# *4DDFD69F00FE_53EDC0E701BC_impl*
 Assert(aName <> '');
 Result := TtfwAutoregisteredDiction.Instance.AddWord(aName, Self);
 if Result then
  Self.RegisterClass;
//#UC END# *4DDFD69F00FE_53EDC0E701BC_impl*
end;//TtfwRegisterableWord.Register

function TtfwRegisterableWord.RegisterInstance(const aName: AnsiString): Boolean;
//#UC START# *53F1E3A4014D_53EDC0E701BC_var*
//#UC END# *53F1E3A4014D_53EDC0E701BC_var*
begin
//#UC START# *53F1E3A4014D_53EDC0E701BC_impl*
 Assert(aName <> '');
 Result := TtfwAutoregisteredDiction.Instance.AddWord(aName, Self);
 if Result then
  Self.RegisterClass;
//#UC END# *53F1E3A4014D_53EDC0E701BC_impl*
end;//TtfwRegisterableWord.RegisterInstance

{$IfEnd} //not NoScripts

end.