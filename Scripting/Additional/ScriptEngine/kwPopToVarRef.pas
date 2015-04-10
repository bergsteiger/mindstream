unit kwPopToVarRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopToVarRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VarWorkingWords::PopToVarRef
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
 TkwPopToVarRef = class(_tfwVarWorker_)
 protected
 // realized methods
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopToVarRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledPopToVarRef,
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

type _Instance_R_ = TkwPopToVarRef;

{$Include ..\ScriptEngine\tfwVarWorker.imp.pas}

// start class TkwPopToVarRef

function TkwPopToVarRef.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4F2269B20227_var*
//#UC END# *4DCC193801F1_4F2269B20227_var*
begin
//#UC START# *4DCC193801F1_4F2269B20227_impl*
 Result := TkwCompiledPopToVarRef;
//#UC END# *4DCC193801F1_4F2269B20227_impl*
end;//TkwPopToVarRef.CompiledVarWorkerClass

class function TkwPopToVarRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '>>>^';
end;//TkwPopToVarRef.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwVarWorker.imp.pas}
{$IfEnd} //not NoScripts

end.