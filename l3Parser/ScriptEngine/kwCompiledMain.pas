unit kwCompiledMain;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwCompiledMain.pas"
// Начат: 12.02.2012 18:25
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledMain
//
// Скомпилированный основной код скрипта
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledMain = class(TkwCompiledWord)
  {* Скомпилированный основной код скрипта }
 protected
 // overridden property methods
   function pm_GetParentWord: TtfwWord; override;
 end;//TkwCompiledMain
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledMain

function TkwCompiledMain.pm_GetParentWord: TtfwWord;
//#UC START# *52CFCF4B02C6_4F37CBBE015Aget_var*
//#UC END# *52CFCF4B02C6_4F37CBBE015Aget_var*
begin
//#UC START# *52CFCF4B02C6_4F37CBBE015Aget_impl*
 Result := nil;
//#UC END# *52CFCF4B02C6_4F37CBBE015Aget_impl*
end;//TkwCompiledMain.pm_GetParentWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledMain
 TkwCompiledMain.RegisterClass;
{$IfEnd} //not NoScripts

end.