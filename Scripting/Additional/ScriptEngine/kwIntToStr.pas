unit kwIntToStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwIntToStr.pas"
// Начат: 16.05.2011 11:10
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::SysUtils::IntToStr
//
// Преобразование числа в строку.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwSysUtilsWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwIntToStr = {scriptword} class(TtfwSysUtilsWord)
  {* Преобразование числа в строку. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIntToStr
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  SysUtils,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwIntToStr

procedure TkwIntToStr.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DD0CDD00178_var*
//#UC END# *4DAEEDE10285_4DD0CDD00178_var*
begin
//#UC START# *4DAEEDE10285_4DD0CDD00178_impl*
 aCtx.rEngine.PushString(IntToStr(aCtx.rEngine.PopInt));
//#UC END# *4DAEEDE10285_4DD0CDD00178_impl*
end;//TkwIntToStr.DoDoIt

class function TkwIntToStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IntToStr';
end;//TkwIntToStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IntToStr
 TkwIntToStr.RegisterInEngine;
{$IfEnd} //not NoScripts

end.