unit kwNamedAutolinkProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwNamedAutolinkProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::VarProducingPack::NamedAutolinkProducer
//
// Как NamedInitedVarProducer, но не может быть VOID
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
 {$Include ..\ScriptEngine\kwInitedVarProducer.imp.pas}
 TkwNamedAutolinkProducer = {final} class(_kwInitedVarProducer_)
  {* Как NamedInitedVarProducer, но не может быть VOID }
 protected
 // overridden protected methods
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwNamedAutolinkProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledNamedAutolinkProducer,
  kwCompiledInitedVarProducer,
  kwCompiledInitableVar,
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

type _Instance_R_ = TkwNamedAutolinkProducer;

{$Include ..\ScriptEngine\kwInitedVarProducer.imp.pas}

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
 {$Include ..\ScriptEngine\kwInitedVarProducer.imp.pas}
{$IfEnd} //not NoScripts

end.