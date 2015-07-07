unit kwSysutilsForceDirectories;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSysutilsForceDirectories.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::sysutils_ForceDirectories
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
 TkwSysutilsForceDirectories = {final} class(_tfwStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsForceDirectories
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSysutilsForceDirectories;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwSysutilsForceDirectories

procedure TkwSysutilsForceDirectories.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F5F005601E9_var*
var
 l_N : AnsiString;
//#UC END# *4DD0CF6F0197_4F5F005601E9_var*
begin
//#UC START# *4DD0CF6F0197_4F5F005601E9_impl*
 l_N := l3Str(aStr);
 aCtx.rEngine.PushBool(ForceDirectories(l_N));
//#UC END# *4DD0CF6F0197_4F5F005601E9_impl*
end;//TkwSysutilsForceDirectories.DoString

class function TkwSysutilsForceDirectories.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ForceDirectories';
end;//TkwSysutilsForceDirectories.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.