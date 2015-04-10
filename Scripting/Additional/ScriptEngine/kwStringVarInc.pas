unit kwStringVarInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStringVarInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::StringVar_Inc
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
  kwCompiledVarWorker,
  tfwScriptingInterfaces,
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwVarWorker.imp.pas}
 TkwStringVarInc = {final} class(_tfwVarWorker_)
 protected
 // realized methods
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringVarInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStringVarInc,
  SysUtils,
  kwVarWorkerCompiledCode,
  kwBeginLikeCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
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

type _Instance_R_ = TkwStringVarInc;

{$Include ..\ScriptEngine\tfwVarWorker.imp.pas}

// start class TkwStringVarInc

function TkwStringVarInc.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F5F008401A6_var*
//#UC END# *4DCC193801F1_4F5F008401A6_var*
begin
//#UC START# *4DCC193801F1_4F5F008401A6_impl*
 Result := TkwCompiledStringVarInc;
//#UC END# *4DCC193801F1_4F5F008401A6_impl*
end;//TkwStringVarInc.CompiledVarWorkerClass

class function TkwStringVarInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:++!';
end;//TkwStringVarInc.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwVarWorker.imp.pas}
{$IfEnd} //not NoScripts

end.