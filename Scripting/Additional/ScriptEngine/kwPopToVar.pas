unit kwPopToVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopToVar.pas"
// Начат: 29.04.2011 22:54
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwPopToVar
//
// '>>>' Помещает значение переменной со стека в ранее объявленную переменную.
// Пример:
// {code}
// VAR A
// 2 >>> A
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
 TkwPopToVar = class(_tfwVarWorker_)
  {* '>>>' Помещает значение переменной со стека в ранее объявленную переменную.
Пример:
[code]
 VAR A
 2 >>> A
[code] }
 protected
 // realized methods
   function CompiledVarWorkerClass: RkwCompiledVarWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopToVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledPopToVar,
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

type _Instance_R_ = TkwPopToVar;

{$Include ..\ScriptEngine\tfwVarWorker.imp.pas}

// start class TkwPopToVar

function TkwPopToVar.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4DBB093603A7_var*
//#UC END# *4DCC193801F1_4DBB093603A7_var*
begin
//#UC START# *4DCC193801F1_4DBB093603A7_impl*
 Result := TkwCompiledPopToVar;
//#UC END# *4DCC193801F1_4DBB093603A7_impl*
end;//TkwPopToVar.CompiledVarWorkerClass

class function TkwPopToVar.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DBB093603A7_var*
//#UC END# *4DB0614603C8_4DBB093603A7_var*
begin
//#UC START# *4DB0614603C8_4DBB093603A7_impl*
 Result := '>>>';
//#UC END# *4DB0614603C8_4DBB093603A7_impl*
end;//TkwPopToVar.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwVarWorker.imp.pas}
{$IfEnd} //not NoScripts

end.