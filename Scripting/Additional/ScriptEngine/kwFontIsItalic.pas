unit kwFontIsItalic;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontIsItalic.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_IsItalic
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwFontWord,
  Graphics,
  tfwScriptingInterfaces,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwFontIsItalic = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsItalic
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

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
// Регистрация font_IsItalic
 TkwFontIsItalic.RegisterInEngine;
{$IfEnd} //not NoScripts

end.