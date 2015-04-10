unit kwStringCodePage;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStringCodePage.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::string_CodePage
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
 TkwStringCodePage = {final} class(_tfwStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Il3CString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStringCodePage
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

type _Instance_R_ = TkwStringCodePage;

{$Include ..\ScriptEngine\tfwStrWord.imp.pas}

// start class TkwStringCodePage

procedure TkwStringCodePage.DoString(const aCtx: TtfwContext;
  const aStr: Il3CString);
//#UC START# *4DD0CF6F0197_4F4FDA9E0345_var*
//#UC END# *4DD0CF6F0197_4F4FDA9E0345_var*
begin
//#UC START# *4DD0CF6F0197_4F4FDA9E0345_impl*
 aCtx.rEngine.PushInt(aStr.AsWStr.SCodePage);
//#UC END# *4DD0CF6F0197_4F4FDA9E0345_impl*
end;//TkwStringCodePage.DoString

class function TkwStringCodePage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:CodePage';
end;//TkwStringCodePage.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.