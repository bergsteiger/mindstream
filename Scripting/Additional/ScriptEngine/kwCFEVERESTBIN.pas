unit kwCFEVERESTBIN;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwCFEVERESTBIN.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::CF_EVERESTBIN
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwClipboardFormatWord,
  evTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCFEVERESTBIN = {final scriptword} class(TtfwClipboardFormatWord)
 protected
 // realized methods
   function GetFormat: TevFormat; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFEVERESTBIN
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCFEVERESTBIN

function TkwCFEVERESTBIN.GetFormat: TevFormat;
//#UC START# *54D231000227_52E11B1F02E7_var*
//#UC END# *54D231000227_52E11B1F02E7_var*
begin
//#UC START# *54D231000227_52E11B1F02E7_impl*
 Result := CF_EverestBin;
//#UC END# *54D231000227_52E11B1F02E7_impl*
end;//TkwCFEVERESTBIN.GetFormat

class function TkwCFEVERESTBIN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_EVERESTBIN';
end;//TkwCFEVERESTBIN.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CF_EVERESTBIN
 TkwCFEVERESTBIN.RegisterInEngine;
{$IfEnd} //not NoScripts

end.