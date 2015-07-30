unit kwStrToInt;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwStrToInt.pas"
// Начат: 16.05.2011 11:13
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwStrToInt
//
// Преобразование строки в число.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStrToInt = class(TtfwStrWord)
  {* Преобразование строки в число. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStrToInt
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwStrToInt

procedure TkwStrToInt.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DD0CE7C031D_var*
//#UC END# *4DD0CF6F0197_4DD0CE7C031D_var*
begin
//#UC START# *4DD0CF6F0197_4DD0CE7C031D_impl*
 aCtx.rEngine.PushInt(StrToInt(l3Str(aStr)));
//#UC END# *4DD0CF6F0197_4DD0CE7C031D_impl*
end;//TkwStrToInt.DoString

class function TkwStrToInt.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DD0CE7C031D_var*
//#UC END# *4DB0614603C8_4DD0CE7C031D_var*
begin
//#UC START# *4DB0614603C8_4DD0CE7C031D_impl*
 Result := 'StrToInt';
//#UC END# *4DB0614603C8_4DD0CE7C031D_impl*
end;//TkwStrToInt.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwStrToInt
 TkwStrToInt.RegisterInEngine;
{$IfEnd} //not NoScripts

end.