unit kwFontIsUnderline;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontIsUnderline.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_IsUnderline
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
 TkwFontIsUnderline = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsUnderline
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

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
// Регистрация font_IsUnderline
 TkwFontIsUnderline.RegisterInEngine;
{$IfEnd} //not NoScripts

end.