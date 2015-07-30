{$IfNDef Scripter_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "Scripter.imp.pas"
// Начат: 20.04.2011 18:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::Scripter
//
// Парень умеющий выполнять скрипты
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define Scripter_imp}
{$If not defined(NoScripts)}
 _Scripter_ = {abstract mixin} class(_Scripter_Parent_)
  {* Парень умеющий выполнять скрипты }
 protected
 // protected methods
   procedure Script(const aString: AnsiString);
   procedure ScriptFromFile(const aFileName: AnsiString);
   function ResolveScriptFilePath(const aFileName: AnsiString): AnsiString; virtual;
 end;//_Scripter_
{$Else}

 _Scripter_ = _Scripter_Parent_;

{$IfEnd} //not NoScripts

{$Else Scripter_imp}

{$If not defined(NoScripts)}

// start class _Scripter_

procedure _Scripter_.Script(const aString: AnsiString);
//#UC START# *4DAEEE87019A_4DAEEA2B029A_var*
//#UC END# *4DAEEE87019A_4DAEEA2B029A_var*
begin
//#UC START# *4DAEEE87019A_4DAEEA2B029A_impl*
 TtfwScriptEngine.Script(aString, _Instance_R_(Self));
//#UC END# *4DAEEE87019A_4DAEEA2B029A_impl*
end;//_Scripter_.Script

procedure _Scripter_.ScriptFromFile(const aFileName: AnsiString);
//#UC START# *4DB02B310185_4DAEEA2B029A_var*
//#UC END# *4DB02B310185_4DAEEA2B029A_var*
begin
//#UC START# *4DB02B310185_4DAEEA2B029A_impl*
 TtfwScriptEngine.ScriptFromFile(ResolveScriptFilePath(aFileName), _Instance_R_(Self));
//#UC END# *4DB02B310185_4DAEEA2B029A_impl*
end;//_Scripter_.ScriptFromFile

function _Scripter_.ResolveScriptFilePath(const aFileName: AnsiString): AnsiString;
//#UC START# *4DB03121022B_4DAEEA2B029A_var*
//#UC END# *4DB03121022B_4DAEEA2B029A_var*
begin
//#UC START# *4DB03121022B_4DAEEA2B029A_impl*
 Result := aFileName;
//#UC END# *4DB03121022B_4DAEEA2B029A_impl*
end;//_Scripter_.ResolveScriptFilePath

{$IfEnd} //not NoScripts

{$EndIf Scripter_imp}
