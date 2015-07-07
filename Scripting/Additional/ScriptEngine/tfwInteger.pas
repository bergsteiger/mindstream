unit tfwInteger;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwInteger.pas"
// Начат: 09.12.2011 13:58
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TtfwInteger
//
// Базовый предок для добавления слов в словарь.
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
 TtfwInteger = {abstract} class(TtfwRegisterableWord)
  {* Базовый предок для добавления слов в словарь. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   function GetInteger: Integer; virtual;
 end;//TtfwInteger
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptEngine,
  l3Except,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwInteger

function TtfwInteger.GetInteger: Integer;
//#UC START# *4EE1DC8903BB_4EE1DBBB013C_var*
//#UC END# *4EE1DC8903BB_4EE1DBBB013C_var*
begin
//#UC START# *4EE1DC8903BB_4EE1DBBB013C_impl*
 Result := 0;
 Assert(false);
//#UC END# *4EE1DC8903BB_4EE1DBBB013C_impl*
end;//TtfwInteger.GetInteger

procedure TtfwInteger.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EE1DBBB013C_var*
//#UC END# *4DAEEDE10285_4EE1DBBB013C_var*
begin
//#UC START# *4DAEEDE10285_4EE1DBBB013C_impl*
 aCtx.rEngine.PushInt(GetInteger);
//#UC END# *4DAEEDE10285_4EE1DBBB013C_impl*
end;//TtfwInteger.DoDoIt

{$IfEnd} //not NoScripts

end.