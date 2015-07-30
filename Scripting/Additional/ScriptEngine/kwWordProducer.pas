unit kwWordProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWordProducer.pas"
// Начат: 11.02.2012 18:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::WordProducer
//
// Слово для создания заголовков новых слов (таких как : или PROCEDURE).
// Пример:
// {code}
// : TestWordProducer
// 
// WordProducer <<Facet>>
// WordProducer <<Interface>>
// 
// <<Facet>> A
// 'A' .
// ;
// 
// <<Facet>> B
// 'B' .
// ;
// 
// <<Interface>> C
// 'C' .
// ;
// 
// A B C
// 
// ;
// 
// TestWordProducer
// {code}
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
 TkwWordProducer = {final scriptword} class(TtfwWordProducer)
  {* Слово для создания заголовков новых слов (таких как : или PROCEDURE).
Пример:
[code]
: TestWordProducer

 WordProducer <<Facet>>
 WordProducer <<Interface>>

 <<Facet>> A
  'A' .
 ;
 
 <<Facet>> B
  'B' .
 ;
 
 <<Interface>> C
  'C' .
 ;
 
 A B C
 
;

TestWordProducer
[code] }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 end;//TkwWordProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWordProducer,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWordProducer

class function TkwWordProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WordProducer';
end;//TkwWordProducer.GetWordNameForRegister

procedure TkwWordProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F367C1002B3_var*
var
 l_W : TkwCompiledWordProducer;
//#UC END# *4F219629036A_4F367C1002B3_var*
begin
//#UC START# *4F219629036A_4F367C1002B3_impl*
 CompilerAssert(not aCompiled.HasCode, 'Слово не может иметь параметры', aContext);
 l_W := TkwCompiledWordProducer.Create(Self);
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F367C1002B3_impl*
end;//TkwWordProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WordProducer
 TkwWordProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.