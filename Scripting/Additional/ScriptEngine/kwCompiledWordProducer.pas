unit kwCompiledWordProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompiledWordProducer.pas"
// Начат: 11.02.2012 18:35
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledWordProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwStandardProcedure
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledWordProducer = class(TtfwStandardProcedure)
 private
 // private fields
   f_WordProducer : TtfwWord;
 protected
 // overridden property methods
   function pm_GetWordProducer: TtfwWord; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function ReallyNeedRegister: Boolean; override;
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord); reintroduce;
 end;//TkwCompiledWordProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledWordProducer

constructor TkwCompiledWordProducer.Create(aWordProducer: TtfwWord);
//#UC START# *4F43CB010149_4F367CA400AA_var*
//#UC END# *4F43CB010149_4F367CA400AA_var*
begin
//#UC START# *4F43CB010149_4F367CA400AA_impl*
 inherited Create;
 f_WordProducer := aWordProducer;
//#UC END# *4F43CB010149_4F367CA400AA_impl*
end;//TkwCompiledWordProducer.Create

procedure TkwCompiledWordProducer.Cleanup;
//#UC START# *479731C50290_4F367CA400AA_var*
//#UC END# *479731C50290_4F367CA400AA_var*
begin
//#UC START# *479731C50290_4F367CA400AA_impl*
 f_WordProducer := nil;
 inherited;
//#UC END# *479731C50290_4F367CA400AA_impl*
end;//TkwCompiledWordProducer.Cleanup

procedure TkwCompiledWordProducer.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F367CA400AA_var*
//#UC END# *4DAEEDE10285_4F367CA400AA_var*
begin
//#UC START# *4DAEEDE10285_4F367CA400AA_impl*
 inherited;
//#UC END# *4DAEEDE10285_4F367CA400AA_impl*
end;//TkwCompiledWordProducer.DoDoIt

class function TkwCompiledWordProducer.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4F367CA400AA_var*
//#UC END# *4DC2E05B03DD_4F367CA400AA_var*
begin
//#UC START# *4DC2E05B03DD_4F367CA400AA_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4F367CA400AA_impl*
end;//TkwCompiledWordProducer.ReallyNeedRegister

function TkwCompiledWordProducer.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_4F367CA400AAget_var*
//#UC END# *4F43C9A10139_4F367CA400AAget_var*
begin
//#UC START# *4F43C9A10139_4F367CA400AAget_impl*
 Result := f_WordProducer;
//#UC END# *4F43C9A10139_4F367CA400AAget_impl*
end;//TkwCompiledWordProducer.pm_GetWordProducer

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordProducer
 TkwCompiledWordProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.