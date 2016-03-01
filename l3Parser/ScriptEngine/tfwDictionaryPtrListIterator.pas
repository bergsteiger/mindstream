unit tfwDictionaryPtrListIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryPtrListIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryPtrListIterator
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwDictionaryEx,
  tfwDictionaryPtrList,
  tfwDictionaryDataIteratorPrim,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ListType_ = TtfwDictionaryPtrList;
 _tfwDictionaryListIteratorPrim_Parent_ = TtfwDictionaryDataIteratorPrim;
 {$Include ..\ScriptEngine\tfwDictionaryListIteratorPrim.imp.pas}
 TtfwDictionaryPtrListIterator = {abstract} class(_tfwDictionaryListIteratorPrim_)
 public
 // public methods
   class function Make(aDictionary: TtfwDictionaryEx): ItfwValueList; reintroduce;
     {* Сигнатура фабрики TtfwDictionaryPtrListIterator.Make }
 end;//TtfwDictionaryPtrListIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwDictionary
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwDictionaryListIteratorPrim.imp.pas}

// start class TtfwDictionaryPtrListIterator

class function TtfwDictionaryPtrListIterator.Make(aDictionary: TtfwDictionaryEx): ItfwValueList;
var
 l_Inst : TtfwDictionaryPtrListIterator;
begin
 l_Inst := Create(aDictionary);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

{$IfEnd} //not NoScripts

end.