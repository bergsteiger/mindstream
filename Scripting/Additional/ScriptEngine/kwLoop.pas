unit kwLoop;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwLoop.pas"
// Начат: 12.05.2011 18:08
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwLoop
//
// Цикл LOOP.
// Пример:
// {code}
// 10 LOOP ( 'Hello' . )
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
 TkwLoop = class(_tfwWordWorker_)
  {* Цикл LOOP.
Пример:
[code]
 10 LOOP ( 'Hello' . )
[code] }
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwLoop
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledLoop,
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

type _Instance_R_ = TkwLoop;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwLoop

function TkwLoop.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4DCBE9B8022F_var*
//#UC END# *4DCBD67C0362_4DCBE9B8022F_var*
begin
//#UC START# *4DCBD67C0362_4DCBE9B8022F_impl*
 Result := TkwCompiledLoop;
//#UC END# *4DCBD67C0362_4DCBE9B8022F_impl*
end;//TkwLoop.CompiledWorkerClass

class function TkwLoop.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DCBE9B8022F_var*
//#UC END# *4DB0614603C8_4DCBE9B8022F_var*
begin
//#UC START# *4DB0614603C8_4DCBE9B8022F_impl*
 Result := 'LOOP';
//#UC END# *4DB0614603C8_4DCBE9B8022F_impl*
end;//TkwLoop.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.