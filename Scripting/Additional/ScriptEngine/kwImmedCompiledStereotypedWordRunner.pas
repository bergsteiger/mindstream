unit kwImmedCompiledStereotypedWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwImmedCompiledStereotypedWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwImmedCompiledStereotypedWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwStandardProcedure,
  kwCompiledWordPrim,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwImmedCompiledStereotypedWordRunner = class(TtfwStandardProcedure)
 private
 // private fields
   f_WordProducerForCompiledClass : TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   class function ReallyNeedRegister: Boolean; override;
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
   function GetWordProducerForCompiledClass: TtfwWord; override;
 public
 // public methods
   constructor Create(aWordProducerForCompiledClass: TtfwWord); reintroduce;
 end;//TkwImmedCompiledStereotypedWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwImmedCompiledStereotypedStereotypedWord,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwImmedCompiledStereotypedWordRunner

constructor TkwImmedCompiledStereotypedWordRunner.Create(aWordProducerForCompiledClass: TtfwWord);
//#UC START# *4F44394A03E6_4F4438730286_var*
//#UC END# *4F44394A03E6_4F4438730286_var*
begin
//#UC START# *4F44394A03E6_4F4438730286_impl*
 inherited Create;
 f_WordProducerForCompiledClass := aWordProducerForCompiledClass;
//#UC END# *4F44394A03E6_4F4438730286_impl*
end;//TkwImmedCompiledStereotypedWordRunner.Create

procedure TkwImmedCompiledStereotypedWordRunner.Cleanup;
//#UC START# *479731C50290_4F4438730286_var*
//#UC END# *479731C50290_4F4438730286_var*
begin
//#UC START# *479731C50290_4F4438730286_impl*
 f_WordProducerForCompiledClass := nil;
 inherited;
//#UC END# *479731C50290_4F4438730286_impl*
end;//TkwImmedCompiledStereotypedWordRunner.Cleanup

function TkwImmedCompiledStereotypedWordRunner.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F4438730286_var*
//#UC END# *4DBAEE0D028D_4F4438730286_var*
begin
//#UC START# *4DBAEE0D028D_4F4438730286_impl*
 Result := TkwImmedCompiledStereotypedStereotypedWord;
//#UC END# *4DBAEE0D028D_4F4438730286_impl*
end;//TkwImmedCompiledStereotypedWordRunner.CompiledWordClass

class function TkwImmedCompiledStereotypedWordRunner.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4F4438730286_var*
//#UC END# *4DC2E05B03DD_4F4438730286_var*
begin
//#UC START# *4DC2E05B03DD_4F4438730286_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4F4438730286_impl*
end;//TkwImmedCompiledStereotypedWordRunner.ReallyNeedRegister

function TkwImmedCompiledStereotypedWordRunner.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F4438730286_var*
//#UC END# *4F37B3F10318_4F4438730286_var*
begin
//#UC START# *4F37B3F10318_4F4438730286_impl*
 //Result := inherited GetNewWordName(aContext);
 Result := l3Cat([TtfwCStringFactory.C('<<'), inherited GetNewWordName(aContext), TtfwCStringFactory.C('>>')]);
//#UC END# *4F37B3F10318_4F4438730286_impl*
end;//TkwImmedCompiledStereotypedWordRunner.GetNewWordName

function TkwImmedCompiledStereotypedWordRunner.GetWordProducerForCompiledClass: TtfwWord;
//#UC START# *4F395A6902D2_4F4438730286_var*
//#UC END# *4F395A6902D2_4F4438730286_var*
begin
//#UC START# *4F395A6902D2_4F4438730286_impl*
 Result := f_WordProducerForCompiledClass
//#UC END# *4F395A6902D2_4F4438730286_impl*
end;//TkwImmedCompiledStereotypedWordRunner.GetWordProducerForCompiledClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwImmedCompiledStereotypedWordRunner
 TkwImmedCompiledStereotypedWordRunner.RegisterInEngine;
{$IfEnd} //not NoScripts

end.