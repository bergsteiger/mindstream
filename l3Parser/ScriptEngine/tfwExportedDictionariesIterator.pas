unit tfwExportedDictionariesIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwExportedDictionariesIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwExportedDictionariesIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionaryPtrListIterator
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwExportedDictionariesIterator = class(TtfwDictionaryPtrListIterator)
 protected
 // realized methods
   function ListToIterate: _ListType_; override;
 end;//TtfwExportedDictionariesIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwExportedDictionariesIterator

function TtfwExportedDictionariesIterator.ListToIterate: _ListType_;
//#UC START# *55AE64E00011_55AE650002D8_var*
//#UC END# *55AE64E00011_55AE650002D8_var*
begin
//#UC START# *55AE64E00011_55AE650002D8_impl*
 Result := Dictionary.ExportedDictionaries;
//#UC END# *55AE64E00011_55AE650002D8_impl*
end;//TtfwExportedDictionariesIterator.ListToIterate

{$IfEnd} //not NoScripts

end.