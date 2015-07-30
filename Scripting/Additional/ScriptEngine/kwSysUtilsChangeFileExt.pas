unit kwSysUtilsChangeFileExt;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwSysUtilsChangeFileExt.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::SysUtils::TkwSysUtilsChangeFileExt
//
// Функция ChageFileExt из модуля SysUtils Delphi.
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
 TkwSysUtilsChangeFileExt = class(TtfwStrWord)
  {* Функция ChageFileExt из модуля SysUtils Delphi. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysUtilsChangeFileExt
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

// start class TkwSysUtilsChangeFileExt

procedure TkwSysUtilsChangeFileExt.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DDE4FEB02A7_var*
var
 l_N : AnsiString;
 l_E : AnsiString;
//#UC END# *4DD0CF6F0197_4DDE4FEB02A7_var*
begin
//#UC START# *4DD0CF6F0197_4DDE4FEB02A7_impl*
 l_E := l3Str(aStr);
 l_N := aCtx.rEngine.PopDelphiString;
 aCtx.rEngine.PushString(ChangeFileExt(l_N, l_E));
//#UC END# *4DD0CF6F0197_4DDE4FEB02A7_impl*
end;//TkwSysUtilsChangeFileExt.DoString

class function TkwSysUtilsChangeFileExt.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DDE4FEB02A7_var*
//#UC END# *4DB0614603C8_4DDE4FEB02A7_var*
begin
//#UC START# *4DB0614603C8_4DDE4FEB02A7_impl*
 Result := 'sysutils:ChangeFileExt';
//#UC END# *4DB0614603C8_4DDE4FEB02A7_impl*
end;//TkwSysUtilsChangeFileExt.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSysUtilsChangeFileExt
 TkwSysUtilsChangeFileExt.RegisterInEngine;
{$IfEnd} //not NoScripts

end.