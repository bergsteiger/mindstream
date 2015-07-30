unit kwCFHTML;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwCFHTML.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::CF_HTML
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
 TkwCFHTML = {final scriptword} class(TtfwClipboardFormatWord)
 protected
 // realized methods
   function GetFormat: TevFormat; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFHTML
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCFHTML

function TkwCFHTML.GetFormat: TevFormat;
//#UC START# *54D231000227_4FF436880055_var*
//#UC END# *54D231000227_4FF436880055_var*
begin
//#UC START# *54D231000227_4FF436880055_impl*
 Result := CF_HTML;
//#UC END# *54D231000227_4FF436880055_impl*
end;//TkwCFHTML.GetFormat

class function TkwCFHTML.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_HTML';
end;//TkwCFHTML.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CF_HTML
 TkwCFHTML.RegisterInEngine;
{$IfEnd} //not NoScripts

end.