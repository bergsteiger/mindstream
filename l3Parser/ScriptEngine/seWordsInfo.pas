unit seWordsInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "seWordsInfo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: UtilityPack::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::seWordsInfo
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces
  ;

function GetWordDirectives(const aCtx: TtfwContext;
  aWord: TtfwWord): Il3CString;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String
  ;

// unit methods

function GetWordDirectives(const aCtx: TtfwContext;
  aWord: TtfwWord): Il3CString;
//#UC START# *53E10704024E_53E107920007_var*
//#UC END# *53E10704024E_53E107920007_var*
begin
//#UC START# *53E10704024E_53E107920007_impl*
 Result := aWord.ResultTypeInfo[aCtx].ToString;
//#UC END# *53E10704024E_53E107920007_impl*
end;//GetWordDirectives
{$IfEnd} //not NoScripts

end.