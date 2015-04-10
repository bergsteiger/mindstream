unit kwWStringEndsText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringEndsText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_EndsText
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
 {$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}
 TkwWStringEndsText = {final} class(_tfwDualWStrWord_)
 protected
 // realized methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringEndsText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWStringEndsText;

{$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}

// start class TkwWStringEndsText

procedure TkwWStringEndsText.DoStrings(const aCtx: TtfwContext;
  const aStr1: Tl3WString;
  const aStr2: Tl3WString);
//#UC START# *4F4FE58702AD_4F4FE4930393_var*
//#UC END# *4F4FE58702AD_4F4FE4930393_var*
begin
//#UC START# *4F4FE58702AD_4F4FE4930393_impl*
 aCtx.rEngine.PushBool(l3Ends(aStr1, aStr2, true));
//#UC END# *4F4FE58702AD_4F4FE4930393_impl*
end;//TkwWStringEndsText.DoStrings

class function TkwWStringEndsText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:EndsText';
end;//TkwWStringEndsText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwDualWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.