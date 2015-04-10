unit kwSysutilsFileExists;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSysutilsFileExists.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::sysutils_FileExists
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
 TkwSysutilsFileExists = {final} class(_tfwStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysutilsFileExists
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

type _Instance_R_ = TkwSysutilsFileExists;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwSysutilsFileExists

procedure TkwSysutilsFileExists.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_501FD63F01EE_var*
//#UC END# *4DD0CF6F0197_501FD63F01EE_var*
begin
//#UC START# *4DD0CF6F0197_501FD63F01EE_impl*
 aCtx.rEngine.PushBool(FileExists(l3Str(aStr)));
//#UC END# *4DD0CF6F0197_501FD63F01EE_impl*
end;//TkwSysutilsFileExists.DoString

class function TkwSysutilsFileExists.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:FileExists';
end;//TkwSysutilsFileExists.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.