unit kwVarProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVarProducer.pas"
// Начат: 11.02.2012 18:40
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VarProducing::VarProducingPack::VarProducer
//
// Слово для создания слов для определения переменных.
// Пример:
// {code}
// : TestVarProducer
// 
// VarProducer VarType
// 
// STRING VarType A
// 'Hello' =: A
// 
// INTEGER VarType B
// 23 =: B
// 
// A .
// B .
// 
// ;
// 
// TestVarProducer
// {code}
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
 TkwVarProducer = {final} class(_tfwWordProducer_)
  {* Слово для создания слов для определения переменных.
Пример:
[code]
: TestVarProducer

 VarProducer VarType
 
 STRING VarType A
 'Hello' =: A
 
 INTEGER VarType B
 23 =: B
 
 A .
 B .
 
;

TestVarProducer
[code] }
 protected
 // overridden protected methods
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVarProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVarProducer,
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

type _Instance_R_ = TkwVarProducer;

{$Include ..\ScriptEngine\tfwWordProducer.imp.pas}

// start class TkwVarProducer

class function TkwVarProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'VarProducer';
end;//TkwVarProducer.GetWordNameForRegister

procedure TkwVarProducer.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F367DC60289_var*
var
 l_W : TkwCompiledVarProducer;
//#UC END# *4F219629036A_4F367DC60289_var*
begin
//#UC START# *4F219629036A_4F367DC60289_impl*
 CompilerAssert(not aCompiled.HasCode,
                'Слово не может иметь параметров',
                aContext
               );
 l_W := TkwCompiledVarProducer.Create;
 try
  aWordToFinish.Word := l_W;
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4F219629036A_4F367DC60289_impl*
end;//TkwVarProducer.FinishDefinitionOfNewWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
{$IfEnd} //not NoScripts

end.