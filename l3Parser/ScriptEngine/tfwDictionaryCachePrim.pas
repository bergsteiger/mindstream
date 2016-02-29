unit tfwDictionaryCachePrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryCachePrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryCachePrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionaryEx,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes,
  tfwDictionaryExPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = TtfwDictionaryEx;
 {$Include ..\ScriptEngine\tfwSortedDictionaryList.imp.pas}
 _tfwNamedDictionaryList_Parent_ = _tfwSortedDictionaryList_;
 {$Include ..\ScriptEngine\tfwNamedDictionaryList.imp.pas}
 TtfwDictionaryCachePrim = class(_tfwNamedDictionaryList_)
 end;//TtfwDictionaryCachePrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TtfwDictionaryCachePrim;

{$Include ..\ScriptEngine\tfwSortedDictionaryList.imp.pas}


{$Include ..\ScriptEngine\tfwNamedDictionaryList.imp.pas}


{$IfEnd} //not NoScripts
end.