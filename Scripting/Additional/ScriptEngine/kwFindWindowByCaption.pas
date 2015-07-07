unit kwFindWindowByCaption;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFindWindowByCaption.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::FindWindowByCaption
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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwFindWindowByCaption = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFindWindowByCaption
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFindWindowByCaption;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFindWindowByCaption

procedure TkwFindWindowByCaption.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_501A672A0155_var*
var
 l_Caption: AnsiString;
 l_Handle: THandle;
//#UC END# *4DAEEDE10285_501A672A0155_var*
begin
//#UC START# *4DAEEDE10285_501A672A0155_impl*
 l_Caption := aCtx.rEngine.PopDelphiString;
 l_Handle := FindWindowA(nil, PAnsiChar(l_Caption));
// RunnerAssert(l_Handle <> 0, 'Окно не найдено', aCtx);
 aCtx.rEngine.PushInt(Integer(l_Handle));
//#UC END# *4DAEEDE10285_501A672A0155_impl*
end;//TkwFindWindowByCaption.DoDoIt

class function TkwFindWindowByCaption.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FindWindowByCaption';
end;//TkwFindWindowByCaption.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.