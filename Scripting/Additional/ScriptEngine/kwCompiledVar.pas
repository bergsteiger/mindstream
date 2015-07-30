unit kwCompiledVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwCompiledVar.pas"
// Начат: 29.04.2011 22:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledVar
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWordPrim,
  tfwScriptingInterfaces,
  l3ParserInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwCompiledVar_Parent_ = TkwCompiledWordPrim;
 {$Include ..\ScriptEngine\kwCompiledVar.imp.pas}
 TkwCompiledVar = class(_kwCompiledVar_)
 public
 // overridden public methods
   constructor Create(aWordProducer: TtfwWord;
     const aPrevFinder: Il3KeywordFinder;
     const aTypeInfo: TtfwTypeInfo;
     const aCtx: TtfwContext;
     aKey: TtfwKeyWordPrim); override;
 end;//TkwCompiledVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwArray,
  l3Base,
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwCompiledVar.imp.pas}

// start class TkwCompiledVar

constructor TkwCompiledVar.Create(aWordProducer: TtfwWord;
  const aPrevFinder: Il3KeywordFinder;
  const aTypeInfo: TtfwTypeInfo;
  const aCtx: TtfwContext;
  aKey: TtfwKeyWordPrim);
//#UC START# *4DC9723702F5_4DBB04B6014C_var*
//#UC END# *4DC9723702F5_4DBB04B6014C_var*
begin
//#UC START# *4DC9723702F5_4DBB04B6014C_impl*
 inherited;
 if (tfw_wmList in aTypeInfo.Modifiers) then
  SetValue(TtfwStackValue_C(TtfwArray.Make), aCtx);
//#UC END# *4DC9723702F5_4DBB04B6014C_impl*
end;//TkwCompiledVar.Create

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledVar
 TkwCompiledVar.RegisterClass;
{$IfEnd} //not NoScripts

end.