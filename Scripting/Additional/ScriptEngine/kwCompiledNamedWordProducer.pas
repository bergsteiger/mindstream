unit kwCompiledNamedWordProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledNamedWordProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledNamedWordProducer
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  kwCompiledWordProducer
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledNamedWordProducer = class(TkwCompiledWordProducer)
 private
 // private fields
   f_NameOfWordToCreate : Il3CString;
 protected
 // overridden protected methods
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord;
     const aNameOfWordToCreate: Il3CString); reintroduce;
 end;//TkwCompiledNamedWordProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledNamedWordProducer

constructor TkwCompiledNamedWordProducer.Create(aWordProducer: TtfwWord;
  const aNameOfWordToCreate: Il3CString);
//#UC START# *4F3949380142_4F39488A0041_var*
//#UC END# *4F3949380142_4F39488A0041_var*
begin
//#UC START# *4F3949380142_4F39488A0041_impl*
 inherited Create(aWordProducer);
 f_NameOfWordToCreate := aNameOfWordToCreate;
//#UC END# *4F3949380142_4F39488A0041_impl*
end;//TkwCompiledNamedWordProducer.Create

function TkwCompiledNamedWordProducer.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F39488A0041_var*
//#UC END# *4F37B3F10318_4F39488A0041_var*
begin
//#UC START# *4F37B3F10318_4F39488A0041_impl*
 Result := f_NameOfWordToCreate;
//#UC END# *4F37B3F10318_4F39488A0041_impl*
end;//TkwCompiledNamedWordProducer.GetNewWordName

procedure TkwCompiledNamedWordProducer.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_NameOfWordToCreate := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TkwCompiledNamedWordProducer.ClearFields

{$IfEnd} //not NoScripts

end.