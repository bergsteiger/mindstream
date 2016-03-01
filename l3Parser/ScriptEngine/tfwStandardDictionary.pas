unit tfwStandardDictionary;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStandardDictionary.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwStandardDictionary
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionaryEx
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStandardDictionary = class(TtfwDictionaryEx)
 protected
 // overridden protected methods
   function IsAxiom: Boolean; override;
 end;//TtfwStandardDictionary
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwStandardDictionary

function TtfwStandardDictionary.IsAxiom: Boolean;
//#UC START# *55A7ECD8020D_55B0EF37007C_var*
//#UC END# *55A7ECD8020D_55B0EF37007C_var*
begin
//#UC START# *55A7ECD8020D_55B0EF37007C_impl*
 Result := true;
//#UC END# *55A7ECD8020D_55B0EF37007C_impl*
end;//TtfwStandardDictionary.IsAxiom

{$IfEnd} //not NoScripts

end.