unit kwStereotypeProducerPrimPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStereotypeProducerPrimPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwStereotypeProducerPrimPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordProducer,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStereotypeProducerPrimPrim = {abstract} class(TtfwWordProducer)
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
 end;//TkwStereotypeProducerPrimPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypedWord,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStereotypeProducerPrimPrim

function TkwStereotypeProducerPrimPrim.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F442FBE0300_var*
//#UC END# *4DBAEE0D028D_4F442FBE0300_var*
begin
//#UC START# *4DBAEE0D028D_4F442FBE0300_impl*
 Result := TkwCompiledStereotypedWord;
//#UC END# *4DBAEE0D028D_4F442FBE0300_impl*
end;//TkwStereotypeProducerPrimPrim.CompiledWordClass

function TkwStereotypeProducerPrimPrim.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F442FBE0300_var*
//#UC END# *4F37B3F10318_4F442FBE0300_var*
begin
//#UC START# *4F37B3F10318_4F442FBE0300_impl*
 Result := l3Cat([TtfwCStringFactory.C('<<'), inherited GetNewWordName(aContext), TtfwCStringFactory.C('>>')]);
//#UC END# *4F37B3F10318_4F442FBE0300_impl*
end;//TkwStereotypeProducerPrimPrim.GetNewWordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwStereotypeProducerPrimPrim
 TkwStereotypeProducerPrimPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.