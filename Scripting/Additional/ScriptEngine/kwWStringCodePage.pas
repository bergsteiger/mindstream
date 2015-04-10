unit kwWStringCodePage;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringCodePage.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_CodePage
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
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
 TkwWStringCodePage = {final} class(_tfwWStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringCodePage
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

type _Instance_R_ = TkwWStringCodePage;

{$Include ..\ScriptEngine\tfwWStrWord.imp.pas}

// start class TkwWStringCodePage

procedure TkwWStringCodePage.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FE3970052_var*
//#UC END# *4F4FE51201BD_4F4FE3970052_var*
begin
//#UC START# *4F4FE51201BD_4F4FE3970052_impl*
 aCtx.rEngine.PushInt(aStr.SCodePage);
//#UC END# *4F4FE51201BD_4F4FE3970052_impl*
end;//TkwWStringCodePage.DoString

class function TkwWStringCodePage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:CodePage';
end;//TkwWStringCodePage.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.