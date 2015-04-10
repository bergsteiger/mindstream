unit kwElse;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwElse.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CodeBranchingWords::else
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
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
 TkwElse = {final} class(_tfwWordWorker_)
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   procedure DoCompiledWord(aWord: TtfwWord;
     const aContext: TtfwContext); override;
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim): TtfwWord; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwElse
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledWord,
  kwCompiledIfElse,
  kwTemporaryCompiledCode,
  l3Parser,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwElse;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwElse

function TkwElse.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_5284F739012F_var*
//#UC END# *4DCBD67C0362_5284F739012F_var*
begin
//#UC START# *4DCBD67C0362_5284F739012F_impl*
 Assert(false, 'Не должны сюда попадать');
 Result := nil;
//#UC END# *4DCBD67C0362_5284F739012F_impl*
end;//TkwElse.CompiledWorkerClass

class function TkwElse.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'else';
end;//TkwElse.GetWordNameForRegister

function TkwElse.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_5284F739012F_var*
//#UC END# *4DB9B446039A_5284F739012F_var*
begin
//#UC START# *4DB9B446039A_5284F739012F_impl*
 Result := 1;
//#UC END# *4DB9B446039A_5284F739012F_impl*
end;//TkwElse.AfterWordMaxCount

procedure TkwElse.DoCompiledWord(aWord: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4DB9BBD6024F_5284F739012F_var*
//#UC END# *4DB9BBD6024F_5284F739012F_var*
begin
//#UC START# *4DB9BBD6024F_5284F739012F_impl*
 CompilerAssert(not aWord.IsRunner, 'По-моему такого быть не должно', aContext);
 CompilerAssert(not aWord.IsForwardDeclaration, 'Недоделано', aContext);
 CompilerAssert(aContext.rWordCompilingNow Is TkwCompiledWordPrim, 'Нужно компилируемое слово', aContext);
 CompilerAssert(TkwCompiledWordPrim(aContext.rWordCompilingNow).GetCode(aContext).Last Is TkwCompiledIfElse, 'Нужен if перед else', aContext);
 TkwCompiledIfElse(TkwCompiledWordPrim(aContext.rWordCompilingNow).GetCode(aContext).Last).SetElse(aWord);
 //inherited;
//#UC END# *4DB9BBD6024F_5284F739012F_impl*
end;//TkwElse.DoCompiledWord

function TkwElse.MakeCompiledWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_5284F739012F_var*
//#UC END# *5284D8180211_5284F739012F_var*
begin
//#UC START# *5284D8180211_5284F739012F_impl*
 CompilerAssert((aCompiled.CodeCount = 1),
                'Допустим только один параметр после слова',
                aContext);
 Result := aCompiled.GetCode(aContext)[0].Use;
//#UC END# *5284D8180211_5284F739012F_impl*
end;//TkwElse.MakeCompiledWordWorker

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.