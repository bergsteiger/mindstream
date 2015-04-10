unit kwWinExec;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWinExec.pas"
// Начат: 20.10.2011 18:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::WinExec
//
// Выполняет команду командной строки Windows
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
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
 TkwWinExec = class(_tfwStrWord_)
  {* Выполняет команду командной строки Windows }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWinExec
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWinExec;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwWinExec

procedure TkwWinExec.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4EA036540138_var*
var
 l_S : AnsiString;
//#UC END# *4DD0CF6F0197_4EA036540138_var*
begin
//#UC START# *4DD0CF6F0197_4EA036540138_impl*
 l_S := l3Str(aStr);
 if (ExtractFilePath(l_S) = '') then
  l_S := ExtractFilePath(ParamStr(0)) + l_S;
 WinExec(PAnsiChar(l_S), {SW_HIDE}SW_SHOWNORMAL);
//#UC END# *4DD0CF6F0197_4EA036540138_impl*
end;//TkwWinExec.DoString

class function TkwWinExec.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WinExec';
end;//TkwWinExec.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.