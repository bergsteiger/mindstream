unit tfwScriptEngineExInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwScriptEngineExInterfaces.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: UtilityPack::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::tfwScriptEngineExInterfaces
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordRefList,
  tfwMainDictionary,
  tfwDictionaryList,
  tfwInitedDictionariesList
  ;

type
 ItfwScriptEngineEx = interface(IUnknown)
   ['{E6A6471F-967A-49B5-B0AB-E86FDFC44EB4}']
   function Get_Dictionaries: TtfwDictionaryList;
   function Get_InitedDictionaries: TtfwInitedDictionariesList;
   function Get_MainDictionary: TtfwMainDictionary;
   function Get_DisabledForHelp: TtfwWordRefList;
   property Dictionaries: TtfwDictionaryList
     read Get_Dictionaries;
   property InitedDictionaries: TtfwInitedDictionariesList
     read Get_InitedDictionaries;
   property MainDictionary: TtfwMainDictionary
     read Get_MainDictionary;
   property DisabledForHelp: TtfwWordRefList
     read Get_DisabledForHelp;
 end;//ItfwScriptEngineEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts
end.