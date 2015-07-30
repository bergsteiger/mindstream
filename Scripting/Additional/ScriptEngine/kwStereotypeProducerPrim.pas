unit kwStereotypeProducerPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStereotypeProducerPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwStereotypeProducerPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwStereotypeProducerPrimPrim,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStereotypeProducerPrim = {abstract} class(TkwStereotypeProducerPrimPrim)
 protected
 // overridden protected methods
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 end;//TkwStereotypeProducerPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypeProducer,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStereotypeProducerPrim

procedure TkwStereotypeProducerPrim.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F43B171006B_var*
var
 l_W : TkwCompiledStereotypeProducer;
//#UC END# *4F219629036A_4F43B171006B_var*
begin
//#UC START# *4F219629036A_4F43B171006B_impl*
 CompilerAssert(not aCompiled.HasCode, 'Слово не может иметь параметров', aContext);
 l_W := TkwCompiledStereotypeProducer.Create(GetWordProducerForCompiledClass);
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F43B171006B_impl*
end;//TkwStereotypeProducerPrim.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwStereotypeProducerPrim
 TkwStereotypeProducerPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.