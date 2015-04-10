unit kwCallerWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCallerWorker.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::CallerWorker
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
  kwCompiledWordWorkerWord,
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwCallerAndWordWorker.imp.pas}
 TkwCallerWorker = {final} class(_kwCallerAndWordWorker_)
 protected
 // overridden protected methods
   function CompiledWordWorkerWordClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWord; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCallerWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  kwCompiledCallerWorkerWord,
  kwCompiledImmediateCallerWorkerWord,
  kwCompiledPopToVar,
  kwCompiledVar,
  kwLeftParam,
  kwCompiledFunction,
  kwCompiledProcedureWithStackChecking,
  kwCompiledImmediateWordWorkerWord,
  kwInlinedWord,
  kwStandardProcedureCloseBracket,
  kwCompiledProcedure,
  SysUtils,
  l3String,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCallerWorker;

{$Include ..\ScriptEngine\kwCallerAndWordWorker.imp.pas}

// start class TkwCallerWorker

class function TkwCallerWorker.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CallerWorker';
end;//TkwCallerWorker.GetWordNameForRegister

function TkwCallerWorker.CompiledWordWorkerWordClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWord;
//#UC START# *4F3FA9670261_4F41472B021E_var*
//#UC END# *4F3FA9670261_4F41472B021E_var*
begin
//#UC START# *4F3FA9670261_4F41472B021E_impl*
 if (tfw_wmImmediate in aCtx.rTypeInfo.Modifiers) then
  Result := TkwCompiledImmediateCallerWorkerWord
 else
  Result := TkwCompiledCallerWorkerWord;
//#UC END# *4F3FA9670261_4F41472B021E_impl*
end;//TkwCallerWorker.CompiledWordWorkerWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCallerAndWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.