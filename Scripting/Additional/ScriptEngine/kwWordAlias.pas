unit kwWordAlias;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWordAlias.pas"
// Начат: 15.02.2012 18:31
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::WordAlias
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
 {$Include ..\ScriptEngine\tfwConstLike.imp.pas}
 TkwWordAlias = {final} class(_tfwConstLike_)
 protected
 // overridden protected methods
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
   function SupressNextImmediate: TtfwSuppressNextImmediate; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWordAlias
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwRuntimeWordWithCodeExecution,
  SysUtils,
  l3String,
  l3Parser,
  kwCompiledWord,
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

type _Instance_R_ = TkwWordAlias;

{$Include ..\ScriptEngine\tfwConstLike.imp.pas}

// start class TkwWordAlias

class function TkwWordAlias.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WordAlias';
end;//TkwWordAlias.GetWordNameForRegister

procedure TkwWordAlias.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F3BC19A0061_var*
var
 l_W : TtfwWord;
 l_Key : TtfwKeyWord;
//#UC END# *4F219629036A_4F3BC19A0061_var*
begin
//#UC START# *4F219629036A_4F3BC19A0061_impl*
 CompilerAssert((aCompiled.CodeCount = 1),
                'Неверное число парамеров для слова WordAlias',
                aContext
                );
 l_W := aCompiled.GetCode(aContext)[0];
 l_Key := TtfwKeyWord(l_W.Key);
 try
  aWordToFinish.Word := l_W;
  // - регистрируем алиас слова в словаре 
 finally
  l_W.Key := l_Key;
  // - восстанавливаем слову предыдущее значение ключа
 end;//try..finally
//#UC END# *4F219629036A_4F3BC19A0061_impl*
end;//TkwWordAlias.FinishDefinitionOfNewWord

function TkwWordAlias.SupressNextImmediate: TtfwSuppressNextImmediate;
//#UC START# *4F3AB3B101FC_4F3BC19A0061_var*
//#UC END# *4F3AB3B101FC_4F3BC19A0061_var*
begin
//#UC START# *4F3AB3B101FC_4F3BC19A0061_impl*
 Result := tfw_sniForce;
//#UC END# *4F3AB3B101FC_4F3BC19A0061_impl*
end;//TkwWordAlias.SupressNextImmediate

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwConstLike.imp.pas}
{$IfEnd} //not NoScripts

end.