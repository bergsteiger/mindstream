unit tfwDictionaryListPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryListPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryListPrim
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
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = TtfwDictionaryEx;
 {$Include ..\ScriptEngine\tfwDictionaryList.imp.pas}
 TtfwDictionaryListPrim = class(_tfwDictionaryList_)
 end;//TtfwDictionaryListPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TtfwDictionaryListPrim;

{$Include ..\ScriptEngine\tfwDictionaryList.imp.pas}


{$IfEnd} //not NoScripts
end.