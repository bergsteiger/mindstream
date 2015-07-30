unit kwNamedInitedVarProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwNamedInitedVarProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::VarProducing::VarProducingPack::NamedInitedVarProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwInitedVarProducerPrim,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwNamedInitedVarProducer = {final scriptword} class(TkwInitedVarProducerPrim)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 end;//TkwNamedInitedVarProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledNamedInitedVarProducer,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwNamedInitedVarProducer

class function TkwNamedInitedVarProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NamedInitedVarProducer';
end;//TkwNamedInitedVarProducer.GetWordNameForRegister

procedure TkwNamedInitedVarProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F3E18B3030A_var*
var
 l_W : TkwCompiledNamedInitedVarProducer;
//#UC END# *4F219629036A_4F3E18B3030A_var*
begin
//#UC START# *4F219629036A_4F3E18B3030A_impl*
 CompilerAssert(not aCompiled.HasCode,
                'Слово не может иметь параметров',
                aContext
               );
 aContext.rParser.NextToken;
 l_W := TkwCompiledNamedInitedVarProducer.Create(aContext.rParser.TokenLongString);
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F3E18B3030A_impl*
end;//TkwNamedInitedVarProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация NamedInitedVarProducer
 TkwNamedInitedVarProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.