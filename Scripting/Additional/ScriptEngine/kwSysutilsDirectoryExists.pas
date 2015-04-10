unit kwSysutilsDirectoryExists;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSysutilsDirectoryExists.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::sysutils_DirectoryExists
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
 TkwSysutilsDirectoryExists = {final} class(_tfwStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsDirectoryExists
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

type _Instance_R_ = TkwSysutilsDirectoryExists;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwSysutilsDirectoryExists

procedure TkwSysutilsDirectoryExists.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_502380B6032B_var*
//#UC END# *4DD0CF6F0197_502380B6032B_var*
begin
//#UC START# *4DD0CF6F0197_502380B6032B_impl*
 aCtx.rEngine.PushBool(DirectoryExists(l3Str(aStr)));
//#UC END# *4DD0CF6F0197_502380B6032B_impl*
end;//TkwSysutilsDirectoryExists.DoString

class function TkwSysutilsDirectoryExists.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:DirectoryExists';
end;//TkwSysutilsDirectoryExists.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.