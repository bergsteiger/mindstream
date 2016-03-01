unit tfwDictionaryExPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryExPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryExPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionary
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDictionaryExPrim = {abstract} class(TtfwDictionary)
 public
 // public methods
   function UsesDictionary(anOther: TtfwDictionaryExPrim): Boolean; virtual;
   function IsValidCode: Boolean; virtual;
 end;//TtfwDictionaryExPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwDictionaryExPrim

function TtfwDictionaryExPrim.UsesDictionary(anOther: TtfwDictionaryExPrim): Boolean;
//#UC START# *55A4FD6401D3_55A4FCDC01B8_var*
//#UC END# *55A4FD6401D3_55A4FCDC01B8_var*
begin
//#UC START# *55A4FD6401D3_55A4FCDC01B8_impl*
 Result := false;
//#UC END# *55A4FD6401D3_55A4FCDC01B8_impl*
end;//TtfwDictionaryExPrim.UsesDictionary

function TtfwDictionaryExPrim.IsValidCode: Boolean;
//#UC START# *55A3E53A00A8_55A4FCDC01B8_var*
//#UC END# *55A3E53A00A8_55A4FCDC01B8_var*
begin
//#UC START# *55A3E53A00A8_55A4FCDC01B8_impl*
 Result := true;
//#UC END# *55A3E53A00A8_55A4FCDC01B8_impl*
end;//TtfwDictionaryExPrim.IsValidCode

{$IfEnd} //not NoScripts

end.