unit kwStereotypeStereotypeProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStereotypeStereotypeProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::StereotypeStereotypeProducer
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
 TkwStereotypeStereotypeProducer = {final scriptword} class(TtfwWordProducer)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function AcceptsKeyWordAfter: Boolean; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
 end;//TkwStereotypeStereotypeProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypeStereotypeProducer,
  SysUtils,
  kwStandardProcedureCloseBracket,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStereotypeStereotypeProducer

class function TkwStereotypeStereotypeProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StereotypeStereotypeProducer';
end;//TkwStereotypeStereotypeProducer.GetWordNameForRegister

function TkwStereotypeStereotypeProducer.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F43B1450000_var*
//#UC END# *4DB6C99F026E_4F43B1450000_var*
begin
//#UC START# *4DB6C99F026E_4F43B1450000_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.EndBracket

function TkwStereotypeStereotypeProducer.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F43B1450000_var*
//#UC END# *4DB9B446039A_4F43B1450000_var*
begin
//#UC START# *4DB9B446039A_4F43B1450000_impl*
 Result := High(Result);
//#UC END# *4DB9B446039A_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.AfterWordMaxCount

function TkwStereotypeStereotypeProducer.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4F43B1450000_var*
//#UC END# *4DB9B502013D_4F43B1450000_var*
begin
//#UC START# *4DB9B502013D_4F43B1450000_impl*
 Result := true;
//#UC END# *4DB9B502013D_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.AcceptsKeyWordAfter

function TkwStereotypeStereotypeProducer.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F43B1450000_var*
//#UC END# *4DBAEE0D028D_4F43B1450000_var*
begin
//#UC START# *4DBAEE0D028D_4F43B1450000_impl*
 Result := TkwCompiledStereotypeStereotypeProducer;
//#UC END# *4DBAEE0D028D_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.CompiledWordClass

function TkwStereotypeStereotypeProducer.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F43B1450000_var*
//#UC END# *4F37B3F10318_4F43B1450000_var*
begin
//#UC START# *4F37B3F10318_4F43B1450000_impl*
 Result := l3Cat([TtfwCStringFactory.C('<<'), inherited GetNewWordName(aContext), TtfwCStringFactory.C('>>')]);
//#UC END# *4F37B3F10318_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.GetNewWordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StereotypeStereotypeProducer
 TkwStereotypeStereotypeProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.