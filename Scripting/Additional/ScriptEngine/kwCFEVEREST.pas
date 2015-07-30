unit kwCFEVEREST;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwCFEVEREST.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::CF_EVEREST
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
 TkwCFEVEREST = {final scriptword} class(TtfwClipboardFormatWord)
 protected
 // realized methods
   function GetFormat: TevFormat; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFEVEREST
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCFEVEREST

function TkwCFEVEREST.GetFormat: TevFormat;
//#UC START# *54D231000227_5052EB1003B3_var*
//#UC END# *54D231000227_5052EB1003B3_var*
begin
//#UC START# *54D231000227_5052EB1003B3_impl*
 Result := CF_EverestTxt;
//#UC END# *54D231000227_5052EB1003B3_impl*
end;//TkwCFEVEREST.GetFormat

class function TkwCFEVEREST.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_EVEREST';
end;//TkwCFEVEREST.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CF_EVEREST
 TkwCFEVEREST.RegisterInEngine;
{$IfEnd} //not NoScripts

end.