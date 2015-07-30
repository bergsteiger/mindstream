unit kwFontIsStrikeOut;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontIsStrikeOut.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_IsStrikeOut
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
 TkwFontIsStrikeOut = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsStrikeOut
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFontIsStrikeOut

procedure TkwFontIsStrikeOut.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2FB0337_var*
//#UC END# *5190B11A0069_5190B2FB0337_var*
begin
//#UC START# *5190B11A0069_5190B2FB0337_impl*
 aCtx.rEngine.PushBool(fsStrikeOut in aFont.Style);
//#UC END# *5190B11A0069_5190B2FB0337_impl*
end;//TkwFontIsStrikeOut.DoFont

procedure TkwFontIsStrikeOut.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2FB0337_var*
//#UC END# *5190DDC60327_5190B2FB0337_var*
begin
//#UC START# *5190DDC60327_5190B2FB0337_impl*
 aCtx.rEngine.PushBool(aFont.Strikeout);
//#UC END# *5190DDC60327_5190B2FB0337_impl*
end;//TkwFontIsStrikeOut.DoIFont

class function TkwFontIsStrikeOut.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:IsStrikeOut';
end;//TkwFontIsStrikeOut.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация font_IsStrikeOut
 TkwFontIsStrikeOut.RegisterInEngine;
{$IfEnd} //not NoScripts

end.