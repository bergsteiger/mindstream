unit kwDUPIfNotZero;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDUPIfNotZero.pas"
// Начат: 12.05.2011 16:23
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwDUPIfNotZero
//
// Дублирует x, если оно ненулевое. ( x -- 0 | x x )
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwDUPIfNotZero = class(_tfwAutoregisteringWord_)
  {* Дублирует x, если оно ненулевое. ( x -- 0 | x x ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDUPIfNotZero
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDUPIfNotZero;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDUPIfNotZero

procedure TkwDUPIfNotZero.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCBD118012D_var*
//#UC END# *4DAEEDE10285_4DCBD118012D_var*
begin
//#UC START# *4DAEEDE10285_4DCBD118012D_impl*
 aCtx.rEngine.DupIfNotZero;
//#UC END# *4DAEEDE10285_4DCBD118012D_impl*
end;//TkwDUPIfNotZero.DoDoIt

class function TkwDUPIfNotZero.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DCBD118012D_var*
//#UC END# *4DB0614603C8_4DCBD118012D_var*
begin
//#UC START# *4DB0614603C8_4DCBD118012D_impl*
 Result := '?DUP';
//#UC END# *4DB0614603C8_4DCBD118012D_impl*
end;//TkwDUPIfNotZero.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.