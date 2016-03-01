unit tfwUsedDictionariesIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwUsedDictionariesIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwUsedDictionariesIterator
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
 TtfwUsedDictionariesIterator = class(TtfwDictionaryPtrListIterator)
 protected
 // realized methods
   function ListToIterate: _ListType_; override;
 end;//TtfwUsedDictionariesIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwUsedDictionariesIterator

function TtfwUsedDictionariesIterator.ListToIterate: _ListType_;
//#UC START# *55AE64E00011_55AE651402AA_var*
//#UC END# *55AE64E00011_55AE651402AA_var*
begin
//#UC START# *55AE64E00011_55AE651402AA_impl*
 Result := Dictionary.UsedDictionaries;
//#UC END# *55AE64E00011_55AE651402AA_impl*
end;//TtfwUsedDictionariesIterator.ListToIterate

{$IfEnd} //not NoScripts

end.