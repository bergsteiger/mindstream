unit kwSysUtilsExtractFileName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSysUtilsExtractFileName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::TkwSysUtilsExtractFileName
//
// Функция ExtractFileName из SysUtils Паскаля.
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
 TkwSysUtilsExtractFileName = class(_tfwStrWord_)
  {* Функция ExtractFileName из SysUtils Паскаля. }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSysUtilsExtractFileName
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

type _Instance_R_ = TkwSysUtilsExtractFileName;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwSysUtilsExtractFileName

procedure TkwSysUtilsExtractFileName.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4DDE50110333_var*
var
 l_N : AnsiString;
//#UC END# *4DD0CF6F0197_4DDE50110333_var*
begin
//#UC START# *4DD0CF6F0197_4DDE50110333_impl*
 l_N := l3Str(aStr);
 aCtx.rEngine.PushString(ExtractFileName(l_N));
//#UC END# *4DD0CF6F0197_4DDE50110333_impl*
end;//TkwSysUtilsExtractFileName.DoString

class function TkwSysUtilsExtractFileName.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DDE50110333_var*
//#UC END# *4DB0614603C8_4DDE50110333_var*
begin
//#UC START# *4DB0614603C8_4DDE50110333_impl*
 Result := 'sysutils:ExtractFileName';
//#UC END# *4DB0614603C8_4DDE50110333_impl*
end;//TkwSysUtilsExtractFileName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.