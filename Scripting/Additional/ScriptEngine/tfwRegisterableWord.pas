unit tfwRegisterableWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwRegisterableWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TtfwRegisterableWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwRegisterableWord = {abstract} class(TtfwRegisterableWordPrim)
 public
 // overridden public methods
   class function NameForRegister: AnsiString; override;
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

class function TtfwRegisterableWord.NameForRegister: AnsiString;
//#UC START# *52D7B67501CE_53EDC0E701BC_var*
//#UC END# *52D7B67501CE_53EDC0E701BC_var*
begin
//#UC START# *52D7B67501CE_53EDC0E701BC_impl*
 Result := GetWordNameForRegister;
//#UC END# *52D7B67501CE_53EDC0E701BC_impl*
end;//TtfwRegisterableWord.NameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwRegisterableWord
 TtfwRegisterableWord.RegisterClass;
{$IfEnd} //not NoScripts

end.