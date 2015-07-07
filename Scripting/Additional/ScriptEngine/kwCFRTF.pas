unit kwCFRTF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCFRTF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::CF_RTF
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
 TkwCFRTF = {final} class(_tfwClipboardFormatWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFRTF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCFRTF;

{$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}

// start class TkwCFRTF

procedure TkwCFRTF.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5291E204016B_var*
//#UC END# *4DAEEDE10285_5291E204016B_var*
begin
//#UC START# *4DAEEDE10285_5291E204016B_impl*
 aCtx.rEngine.PushInt(CF_RTF);
//#UC END# *4DAEEDE10285_5291E204016B_impl*
end;//TkwCFRTF.DoDoIt

class function TkwCFRTF.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_RTF';
end;//TkwCFRTF.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
{$IfEnd} //not NoScripts

end.