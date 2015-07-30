unit kwImmedCompiledStereotypedStereotypedWordRunner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwImmedCompiledStereotypedStereotypedWordRunner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwImmedCompiledStereotypedStereotypedWordRunner
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwStandardProcedure,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwImmedCompiledStereotypedStereotypedWordRunner = class(TtfwStandardProcedure)
 private
 // private fields
   f_WordProducerForCompiledClass : TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   class function ReallyNeedRegister: Boolean; override;
   function GetWordProducerForCompiledClass: TtfwWord; override;
 public
 // public methods
   constructor Create(aWordProducerForCompiledClass: TtfwWord); reintroduce;
 end;//TkwImmedCompiledStereotypedStereotypedWordRunner
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwClassCompiler
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwImmedCompiledStereotypedStereotypedWordRunner

constructor TkwImmedCompiledStereotypedStereotypedWordRunner.Create(aWordProducerForCompiledClass: TtfwWord);
//#UC START# *4F4448840176_4F44479B0242_var*
//#UC END# *4F4448840176_4F44479B0242_var*
begin
//#UC START# *4F4448840176_4F44479B0242_impl*
 inherited Create;
 f_WordProducerForCompiledClass := aWordProducerForCompiledClass
//#UC END# *4F4448840176_4F44479B0242_impl*
end;//TkwImmedCompiledStereotypedStereotypedWordRunner.Create

procedure TkwImmedCompiledStereotypedStereotypedWordRunner.Cleanup;
//#UC START# *479731C50290_4F44479B0242_var*
//#UC END# *479731C50290_4F44479B0242_var*
begin
//#UC START# *479731C50290_4F44479B0242_impl*
 f_WordProducerForCompiledClass := nil;
 inherited;
//#UC END# *479731C50290_4F44479B0242_impl*
end;//TkwImmedCompiledStereotypedStereotypedWordRunner.Cleanup

function TkwImmedCompiledStereotypedStereotypedWordRunner.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F44479B0242_var*
//#UC END# *4DBAEE0D028D_4F44479B0242_var*
begin
//#UC START# *4DBAEE0D028D_4F44479B0242_impl*
 //Result := TkwCompiledStereotypedWord;
 Result := TkwClassCompiler;
//#UC END# *4DBAEE0D028D_4F44479B0242_impl*
end;//TkwImmedCompiledStereotypedStereotypedWordRunner.CompiledWordClass

class function TkwImmedCompiledStereotypedStereotypedWordRunner.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4F44479B0242_var*
//#UC END# *4DC2E05B03DD_4F44479B0242_var*
begin
//#UC START# *4DC2E05B03DD_4F44479B0242_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4F44479B0242_impl*
end;//TkwImmedCompiledStereotypedStereotypedWordRunner.ReallyNeedRegister

function TkwImmedCompiledStereotypedStereotypedWordRunner.GetWordProducerForCompiledClass: TtfwWord;
//#UC START# *4F395A6902D2_4F44479B0242_var*
//#UC END# *4F395A6902D2_4F44479B0242_var*
begin
//#UC START# *4F395A6902D2_4F44479B0242_impl*
 Result := f_WordProducerForCompiledClass;
//#UC END# *4F395A6902D2_4F44479B0242_impl*
end;//TkwImmedCompiledStereotypedStereotypedWordRunner.GetWordProducerForCompiledClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwImmedCompiledStereotypedStereotypedWordRunner
 TkwImmedCompiledStereotypedStereotypedWordRunner.RegisterInEngine;
{$IfEnd} //not NoScripts

end.