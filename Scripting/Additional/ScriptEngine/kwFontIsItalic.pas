unit kwFontIsItalic;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFontIsItalic.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::font_IsItalic
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
 TkwFontIsItalic = {final} class(_kwFontWord_)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsItalic
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

type _Instance_R_ = TkwFontIsItalic;

{$Include ..\ScriptEngine\kwFontWord.imp.pas}

// start class TkwFontIsItalic

procedure TkwFontIsItalic.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2DE02D6_var*
//#UC END# *5190B11A0069_5190B2DE02D6_var*
begin
//#UC START# *5190B11A0069_5190B2DE02D6_impl*
 aCtx.rEngine.PushBool(fsItalic in aFont.Style);
//#UC END# *5190B11A0069_5190B2DE02D6_impl*
end;//TkwFontIsItalic.DoFont

procedure TkwFontIsItalic.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2DE02D6_var*
//#UC END# *5190DDC60327_5190B2DE02D6_var*
begin
//#UC START# *5190DDC60327_5190B2DE02D6_impl*
 aCtx.rEngine.PushBool(aFont.Italic);
//#UC END# *5190DDC60327_5190B2DE02D6_impl*
end;//TkwFontIsItalic.DoIFont

class function TkwFontIsItalic.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:IsItalic';
end;//TkwFontIsItalic.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwFontWord.imp.pas}
{$IfEnd} //not NoScripts

end.