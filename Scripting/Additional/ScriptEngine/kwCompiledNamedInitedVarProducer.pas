unit kwCompiledNamedInitedVarProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledNamedInitedVarProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::VarProducing::TkwCompiledNamedInitedVarProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  kwCompiledInitedVarProducer,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledNamedInitedVarProducer = class(TkwCompiledInitedVarProducer)
 private
 // private fields
   f_Name : Il3CString;
 protected
 // overridden protected methods
   function AcceptsKeyWordAfter: Boolean; override;
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(const aName: Il3CString); reintroduce;
 end;//TkwCompiledNamedInitedVarProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledNamedInitedVarProducer

constructor TkwCompiledNamedInitedVarProducer.Create(const aName: Il3CString);
//#UC START# *4F3E1B1F01FB_4F3E19EE0042_var*
//#UC END# *4F3E1B1F01FB_4F3E19EE0042_var*
begin
//#UC START# *4F3E1B1F01FB_4F3E19EE0042_impl*
 inherited Create;
 f_Name := aName;
//#UC END# *4F3E1B1F01FB_4F3E19EE0042_impl*
end;//TkwCompiledNamedInitedVarProducer.Create

function TkwCompiledNamedInitedVarProducer.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4F3E19EE0042_var*
//#UC END# *4DB9B502013D_4F3E19EE0042_var*
begin
//#UC START# *4DB9B502013D_4F3E19EE0042_impl*
 Result := true;
//#UC END# *4DB9B502013D_4F3E19EE0042_impl*
end;//TkwCompiledNamedInitedVarProducer.AcceptsKeyWordAfter

function TkwCompiledNamedInitedVarProducer.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F3E19EE0042_var*
//#UC END# *4F37B3F10318_4F3E19EE0042_var*
begin
//#UC START# *4F37B3F10318_4F3E19EE0042_impl*
 Result := f_Name;
//#UC END# *4F37B3F10318_4F3E19EE0042_impl*
end;//TkwCompiledNamedInitedVarProducer.GetNewWordName

procedure TkwCompiledNamedInitedVarProducer.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_Name := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TkwCompiledNamedInitedVarProducer.ClearFields

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledNamedInitedVarProducer
 TkwCompiledNamedInitedVarProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.