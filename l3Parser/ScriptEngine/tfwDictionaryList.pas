unit tfwDictionaryList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryList
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
 {$Include ..\ScriptEngine\tfwDictionaryList.imp.pas}
 _tfwNamedDictionaryList_Parent_ = _tfwDictionaryList_;
 {$Include ..\ScriptEngine\tfwNamedDictionaryList.imp.pas}
 TtfwDictionaryList = class(_tfwNamedDictionaryList_)
 end;//TtfwDictionaryList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TtfwDictionaryList;

{$Include ..\ScriptEngine\tfwDictionaryList.imp.pas}


{$Include ..\ScriptEngine\tfwNamedDictionaryList.imp.pas}


{$IfEnd} //not NoScripts
end.