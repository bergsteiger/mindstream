unit kwABSTRACT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwABSTRACT.pas"
// Начат: 12.02.2012 16:31
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::ABSTRACT
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwModifier,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwABSTRACT = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwABSTRACT
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwABSTRACT

function TkwABSTRACT.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F37B11C0160get_var*
//#UC END# *4DCACED80361_4F37B11C0160get_var*
begin
//#UC START# *4DCACED80361_4F37B11C0160get_impl*
 Result := tfw_wmAbstract;
//#UC END# *4DCACED80361_4F37B11C0160get_impl*
end;//TkwABSTRACT.pm_GetModifier

class function TkwABSTRACT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ABSTRACT';
end;//TkwABSTRACT.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация ABSTRACT
 TkwABSTRACT.RegisterInEngine;
{$IfEnd} //not NoScripts

end.