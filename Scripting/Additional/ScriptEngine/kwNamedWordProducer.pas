unit kwNamedWordProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNamedWordProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::NamedWordProducer
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
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
 TkwNamedWordProducer = {final} class(_tfwWordProducer_)
 protected
 // overridden protected methods
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNamedWordProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledNamedWordProducer,
  kwCompiledWord,
  kwCompiledVar,
  SysUtils,
  l3String,
  l3Parser,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwNamedWordProducer;

{$Include ..\ScriptEngine\tfwWordProducer.imp.pas}

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
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
{$IfEnd} //not NoScripts

end.