unit kwCompiledStereotypeProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledStereotypeProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwCompiledStereotypeProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypeProducerPrim,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledStereotypeProducer = class(TkwCompiledStereotypeProducerPrim)
 protected
 // overridden protected methods
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
 end;//TkwCompiledStereotypeProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Base,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledStereotypeProducer

function TkwCompiledStereotypeProducer.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F39481702FA_var*
//#UC END# *4F37B3F10318_4F39481702FA_var*
begin
//#UC START# *4F37B3F10318_4F39481702FA_impl*
 Result := l3Cat([TtfwCStringFactory.C('<<'), inherited GetNewWordName(aContext), TtfwCStringFactory.C('>>')]);
 //Result := inherited GetNewWordName(aContext);
//#UC END# *4F37B3F10318_4F39481702FA_impl*
end;//TkwCompiledStereotypeProducer.GetNewWordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledStereotypeProducer
 TkwCompiledStereotypeProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.