unit kwBeginImmediate;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBeginImmediate.pas"
// Начат: 15.12.2011 20:28
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::BeginImmediate
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
 TkwBeginImmediate = class(_tfwWordWorker_)
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBeginImmediate
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledImmediateExecute,
  kwTemporaryCompiledCode,
  l3Parser,
  kwCompiledWord,
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

type _Instance_R_ = TkwBeginImmediate;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwBeginImmediate

function TkwBeginImmediate.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4EEA200A02DB_var*
//#UC END# *4DCBD67C0362_4EEA200A02DB_var*
begin
//#UC START# *4DCBD67C0362_4EEA200A02DB_impl*
 Result := TkwCompiledImmediateExecute;
//#UC END# *4DCBD67C0362_4EEA200A02DB_impl*
end;//TkwBeginImmediate.CompiledWorkerClass

class function TkwBeginImmediate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '[EXECUTE]';
end;//TkwBeginImmediate.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.