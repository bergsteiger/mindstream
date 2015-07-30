unit kwFontColor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontColor.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_Color
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
 TkwFontColor = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontColor
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFontColor

procedure TkwFontColor.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2BE0251_var*
//#UC END# *5190B11A0069_5190B2BE0251_var*
begin
//#UC START# *5190B11A0069_5190B2BE0251_impl*
 aCtx.rEngine.PushInt(aFont.Color);
//#UC END# *5190B11A0069_5190B2BE0251_impl*
end;//TkwFontColor.DoFont

procedure TkwFontColor.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2BE0251_var*
//#UC END# *5190DDC60327_5190B2BE0251_var*
begin
//#UC START# *5190DDC60327_5190B2BE0251_impl*
 aCtx.rEngine.PushInt(aFont.ForeColor);
//#UC END# *5190DDC60327_5190B2BE0251_impl*
end;//TkwFontColor.DoIFont

class function TkwFontColor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:Color';
end;//TkwFontColor.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация font_Color
 TkwFontColor.RegisterInEngine;
{$IfEnd} //not NoScripts

end.