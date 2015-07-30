unit kwCFXML;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwCFXML.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::CF_XML
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
 TkwCFXML = {final scriptword} class(TtfwClipboardFormatWord)
 protected
 // realized methods
   function GetFormat: TevFormat; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFXML
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCFXML

function TkwCFXML.GetFormat: TevFormat;
//#UC START# *54D231000227_4FF436960135_var*
//#UC END# *54D231000227_4FF436960135_var*
begin
//#UC START# *54D231000227_4FF436960135_impl*
 Result := CF_XML;
//#UC END# *54D231000227_4FF436960135_impl*
end;//TkwCFXML.GetFormat

class function TkwCFXML.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_XML';
end;//TkwCFXML.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CF_XML
 TkwCFXML.RegisterInEngine;
{$IfEnd} //not NoScripts

end.