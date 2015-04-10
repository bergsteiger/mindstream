unit kwAutolinkProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwAutolinkProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::VarProducingPack::AutolinkProducer
//
// Как InitedVarProducer, но не может быть VOID
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
 TkwAutolinkProducer = {final} class(_kwInitedVarProducer_)
  {* Как InitedVarProducer, но не может быть VOID }
 protected
 // overridden protected methods
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAutolinkProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledAutolinkProducer,
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

type _Instance_R_ = TkwAutolinkProducer;

{$Include ..\ScriptEngine\kwInitedVarProducer.imp.pas}

// start class TkwAutolinkProducer

class function TkwAutolinkProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'AutolinkProducer';
end;//TkwAutolinkProducer.GetWordNameForRegister

procedure TkwAutolinkProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F44BB0601EC_var*
var
 l_W : TkwCompiledAutolinkProducer;
//#UC END# *4F219629036A_4F44BB0601EC_var*
begin
//#UC START# *4F219629036A_4F44BB0601EC_impl*
 CompilerAssert(not aCompiled.HasCode,
                'Слово не может иметь параметров',
                aContext
               );
 l_W := TkwCompiledAutolinkProducer.Create;
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F44BB0601EC_impl*
end;//TkwAutolinkProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwInitedVarProducer.imp.pas}
{$IfEnd} //not NoScripts

end.