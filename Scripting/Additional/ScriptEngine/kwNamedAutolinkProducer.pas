unit kwNamedAutolinkProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwNamedAutolinkProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::VarProducing::VarProducingPack::NamedAutolinkProducer
//
// Как NamedInitedVarProducer, но не может быть VOID
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
 TkwNamedAutolinkProducer = {final scriptword} class(TkwInitedVarProducerPrim)
  {* Как NamedInitedVarProducer, но не может быть VOID }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 end;//TkwNamedAutolinkProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledNamedAutolinkProducer,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwNamedAutolinkProducer

class function TkwNamedAutolinkProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NamedAutolinkProducer';
end;//TkwNamedAutolinkProducer.GetWordNameForRegister

procedure TkwNamedAutolinkProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F44BB2A0097_var*
var
 l_W : TkwCompiledNamedAutolinkProducer;
//#UC END# *4F219629036A_4F44BB2A0097_var*
begin
//#UC START# *4F219629036A_4F44BB2A0097_impl*
 CompilerAssert(not aCompiled.HasCode,
                'Слово не может иметь параметров',
                aContext
               );
 aContext.rParser.NextToken;
 l_W := TkwCompiledNamedAutolinkProducer.Create(aContext.rParser.TokenLongString);
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F44BB2A0097_impl*
end;//TkwNamedAutolinkProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация NamedAutolinkProducer
 TkwNamedAutolinkProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.