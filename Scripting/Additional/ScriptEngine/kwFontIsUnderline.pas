unit kwFontIsUnderline;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFontIsUnderline.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::font_IsUnderline
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
  Graphics,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwFontWord.imp.pas}
 TkwFontIsUnderline = {final} class(_kwFontWord_)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsUnderline
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFontIsUnderline;

{$Include ..\ScriptEngine\kwFontWord.imp.pas}

// start class TkwFontIsUnderline

procedure TkwFontIsUnderline.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2F200F0_var*
//#UC END# *5190B11A0069_5190B2F200F0_var*
begin
//#UC START# *5190B11A0069_5190B2F200F0_impl*
 aCtx.rEngine.PushBool(fsUnderline in aFont.Style);
//#UC END# *5190B11A0069_5190B2F200F0_impl*
end;//TkwFontIsUnderline.DoFont

procedure TkwFontIsUnderline.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2F200F0_var*
//#UC END# *5190DDC60327_5190B2F200F0_var*
begin
//#UC START# *5190DDC60327_5190B2F200F0_impl*
 aCtx.rEngine.PushBool(aFont.Underline);
//#UC END# *5190DDC60327_5190B2F200F0_impl*
end;//TkwFontIsUnderline.DoIFont

class function TkwFontIsUnderline.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:IsUnderline';
end;//TkwFontIsUnderline.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwFontWord.imp.pas}
{$IfEnd} //not NoScripts

end.