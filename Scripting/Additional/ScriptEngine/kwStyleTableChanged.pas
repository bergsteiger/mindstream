unit kwStyleTableChanged;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwStyleTableChanged.pas"
// Начат: 08.09.2011 18:08
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::StyleTable_Changed
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
 TkwStyleTableChanged = {scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStyleTableChanged
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

// start class TkwStyleTableChanged

procedure TkwStyleTableChanged.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4E68CC460163_var*
//#UC END# *4DAEEDE10285_4E68CC460163_var*
begin
//#UC START# *4DAEEDE10285_4E68CC460163_impl*
 EvNotifyStyleTableChanged;
//#UC END# *4DAEEDE10285_4E68CC460163_impl*
end;//TkwStyleTableChanged.DoDoIt

class function TkwStyleTableChanged.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StyleTable:Changed';
end;//TkwStyleTableChanged.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StyleTable_Changed
 TkwStyleTableChanged.RegisterInEngine;
{$IfEnd} //not NoScripts

end.