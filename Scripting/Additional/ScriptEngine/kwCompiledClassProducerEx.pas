unit kwCompiledClassProducerEx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledClassProducerEx.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::TkwCompiledClassProducerEx
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
  tfwScriptingInterfaces,
  kwCompiledClassProducer
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledClassProducerEx = class(TkwCompiledClassProducer)
 private
 // private fields
   f_WordProducerForCompiledClass : TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetWordProducerForCompiledClass: TtfwWord; override;
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord;
     aWordProducerForCompiledClass: TtfwWord); reintroduce;
 end;//TkwCompiledClassProducerEx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledClassProducerEx

constructor TkwCompiledClassProducerEx.Create(aWordProducer: TtfwWord;
  aWordProducerForCompiledClass: TtfwWord);
//#UC START# *4F395B5702D9_4F39599400F4_var*
//#UC END# *4F395B5702D9_4F39599400F4_var*
begin
//#UC START# *4F395B5702D9_4F39599400F4_impl*
 inherited Create(aWordProducer);
 f_WordProducerForCompiledClass := aWordProducerForCompiledClass;
//#UC END# *4F395B5702D9_4F39599400F4_impl*
end;//TkwCompiledClassProducerEx.Create

procedure TkwCompiledClassProducerEx.Cleanup;
//#UC START# *479731C50290_4F39599400F4_var*
//#UC END# *479731C50290_4F39599400F4_var*
begin
//#UC START# *479731C50290_4F39599400F4_impl*
 f_WordProducerForCompiledClass := nil;
 inherited;
//#UC END# *479731C50290_4F39599400F4_impl*
end;//TkwCompiledClassProducerEx.Cleanup

function TkwCompiledClassProducerEx.GetWordProducerForCompiledClass: TtfwWord;
//#UC START# *4F395A6902D2_4F39599400F4_var*
//#UC END# *4F395A6902D2_4F39599400F4_var*
begin
//#UC START# *4F395A6902D2_4F39599400F4_impl*
 if (f_WordProducerForCompiledClass = nil) then
  Result := Self
 else
  Result := f_WordProducerForCompiledClass;
//#UC END# *4F395A6902D2_4F39599400F4_impl*
end;//TkwCompiledClassProducerEx.GetWordProducerForCompiledClass

{$IfEnd} //not NoScripts

end.