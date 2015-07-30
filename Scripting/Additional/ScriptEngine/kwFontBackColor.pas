unit kwFontBackColor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontBackColor.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_BackColor
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
 TkwFontBackColor = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontBackColor
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFontBackColor

procedure TkwFontBackColor.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_51A1C34E022B_var*
//#UC END# *5190B11A0069_51A1C34E022B_var*
begin
//#UC START# *5190B11A0069_51A1C34E022B_impl*
 RunnerError('Слово font:BackColor умеет работать только с шрифтом редактора.', aCtx);
//#UC END# *5190B11A0069_51A1C34E022B_impl*
end;//TkwFontBackColor.DoFont

procedure TkwFontBackColor.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_51A1C34E022B_var*
//#UC END# *5190DDC60327_51A1C34E022B_var*
begin
//#UC START# *5190DDC60327_51A1C34E022B_impl*
 aCtx.rEngine.PushInt(aFont.BackColor);
//#UC END# *5190DDC60327_51A1C34E022B_impl*
end;//TkwFontBackColor.DoIFont

class function TkwFontBackColor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:BackColor';
end;//TkwFontBackColor.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация font_BackColor
 TkwFontBackColor.RegisterInEngine;
{$IfEnd} //not NoScripts

end.