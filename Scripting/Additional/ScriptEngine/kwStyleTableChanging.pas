unit kwStyleTableChanging;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwStyleTableChanging.pas"
// Начат: 08.09.2011 18:07
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::StyleTable_Changing
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwStyleTableChanging = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStyleTableChanging
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Classes
  {$If not defined(DesignTimeLibrary)}
  ,
  evStyleTableSpy
  {$IfEnd} //not DesignTimeLibrary
  
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStyleTableChanging

procedure TkwStyleTableChanging.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4E68CC1B01C9_var*
//#UC END# *4DAEEDE10285_4E68CC1B01C9_var*
begin
//#UC START# *4DAEEDE10285_4E68CC1B01C9_impl*
 EvNotifyStyleTableChanging;
//#UC END# *4DAEEDE10285_4E68CC1B01C9_impl*
end;//TkwStyleTableChanging.DoDoIt

class function TkwStyleTableChanging.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StyleTable:Changing';
end;//TkwStyleTableChanging.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StyleTable_Changing
 TkwStyleTableChanging.RegisterInEngine;
{$IfEnd} //not NoScripts

end.