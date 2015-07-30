unit kwFontIsBold;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontIsBold.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_IsBold
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
 TkwFontIsBold = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsBold
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFontIsBold

procedure TkwFontIsBold.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2E90230_var*
//#UC END# *5190B11A0069_5190B2E90230_var*
begin
//#UC START# *5190B11A0069_5190B2E90230_impl*
 aCtx.rEngine.PushBool(fsBold in aFont.Style);
//#UC END# *5190B11A0069_5190B2E90230_impl*
end;//TkwFontIsBold.DoFont

procedure TkwFontIsBold.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2E90230_var*
//#UC END# *5190DDC60327_5190B2E90230_var*
begin
//#UC START# *5190DDC60327_5190B2E90230_impl*
 aCtx.rEngine.PushBool(aFont.Bold);
//#UC END# *5190DDC60327_5190B2E90230_impl*
end;//TkwFontIsBold.DoIFont

class function TkwFontIsBold.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:IsBold';
end;//TkwFontIsBold.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация font_IsBold
 TkwFontIsBold.RegisterInEngine;
{$IfEnd} //not NoScripts

end.