unit kwCFRTF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwCFRTF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::CF_RTF
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
 TkwCFRTF = {final scriptword} class(TtfwClipboardFormatWord)
 protected
 // realized methods
   function GetFormat: TevFormat; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFRTF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCFRTF

function TkwCFRTF.GetFormat: TevFormat;
//#UC START# *54D231000227_5291E204016B_var*
//#UC END# *54D231000227_5291E204016B_var*
begin
//#UC START# *54D231000227_5291E204016B_impl*
 Result := CF_RTF;
//#UC END# *54D231000227_5291E204016B_impl*
end;//TkwCFRTF.GetFormat

class function TkwCFRTF.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_RTF';
end;//TkwCFRTF.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CF_RTF
 TkwCFRTF.RegisterInEngine;
{$IfEnd} //not NoScripts

end.