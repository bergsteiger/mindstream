unit kwROLL;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwROLL.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwROLL
//
// Формат: u PICK.
// Убрать u. Повернуть u+1 элемент на вершине стека. ( xu xu-1 ... x0 u -- xu-1 ... x0 xu )
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
 TkwROLL = class(_tfwAutoregisteringWord_)
  {* Формат: u PICK. 
Убрать u. Повернуть u+1 элемент на вершине стека. ( xu xu-1 ... x0 u -- xu-1 ... x0 xu ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwROLL
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwROLL;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwROLL

procedure TkwROLL.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DF063DB01D6_var*
//#UC END# *4DAEEDE10285_4DF063DB01D6_var*
begin
//#UC START# *4DAEEDE10285_4DF063DB01D6_impl*
 aCtx.rEngine.Roll;
//#UC END# *4DAEEDE10285_4DF063DB01D6_impl*
end;//TkwROLL.DoDoIt

class function TkwROLL.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DF063DB01D6_var*
//#UC END# *4DB0614603C8_4DF063DB01D6_var*
begin
//#UC START# *4DB0614603C8_4DF063DB01D6_impl*
 Result := 'ROLL';
//#UC END# *4DB0614603C8_4DF063DB01D6_impl*
end;//TkwROLL.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.