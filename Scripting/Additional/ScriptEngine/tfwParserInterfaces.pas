unit tfwParserInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwParserInterfaces.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Interfaces::Category Shared Delphi Low Level::ScriptEngine$Core::tfwParserInterfaces
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Parser,
  l3ParserInterfaces
  ;

type
 ItfwKeywordFinder = l3ParserInterfaces.Il3KeywordFinder;

 ItfwParser = interface(IUnknown)
   ['{EA8354FC-1EAD-4724-8124-9D8B54CF0780}']
   procedure NextToken;
   function TokenLongString: Il3CString;
   function TokenInt: Integer;
   function FileName: AnsiString;
   function TokenType: Tl3TokenType;
   function SourceLine: Integer;
   function Get_KeyWords: ItfwKeywordFinder;
   procedure Set_KeyWords(const aValue: ItfwKeywordFinder);
   property KeyWords: ItfwKeywordFinder
     read Get_KeyWords
     write Set_KeyWords;
 end;//ItfwParser
{$IfEnd} //not NoScripts

implementation

end.