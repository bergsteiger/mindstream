unit kwNamedWordProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwNamedWordProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::NamedWordProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordProducer,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwNamedWordProducer = {final scriptword} class(TtfwWordProducer)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 end;//TkwNamedWordProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledNamedWordProducer,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwNamedWordProducer

class function TkwNamedWordProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NamedWordProducer';
end;//TkwNamedWordProducer.GetWordNameForRegister

procedure TkwNamedWordProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F39486A0307_var*
var
 l_W : TkwCompiledNamedWordProducer;
//#UC END# *4F219629036A_4F39486A0307_var*
begin
//#UC START# *4F219629036A_4F39486A0307_impl*
 CompilerAssert(not aCompiled.HasCode, 'Слово не может иметь параметры', aContext);
 aContext.rParser.NextToken;
 l_W := TkwCompiledNamedWordProducer.Create(Self, aContext.rParser.TokenLongString);
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F39486A0307_impl*
end;//TkwNamedWordProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация NamedWordProducer
 TkwNamedWordProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.