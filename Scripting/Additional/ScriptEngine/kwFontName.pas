unit kwFontName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_Name
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
 TkwFontName = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontName
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFontName

procedure TkwFontName.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2AD0188_var*
//#UC END# *5190B11A0069_5190B2AD0188_var*
begin
//#UC START# *5190B11A0069_5190B2AD0188_impl*
 aCtx.rEngine.PushString(aFont.Name);
//#UC END# *5190B11A0069_5190B2AD0188_impl*
end;//TkwFontName.DoFont

procedure TkwFontName.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2AD0188_var*
//#UC END# *5190DDC60327_5190B2AD0188_var*
begin
//#UC START# *5190DDC60327_5190B2AD0188_impl*
 aCtx.rEngine.PushString(aFont.Name);
//#UC END# *5190DDC60327_5190B2AD0188_impl*
end;//TkwFontName.DoIFont

class function TkwFontName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:Name';
end;//TkwFontName.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация font_Name
 TkwFontName.RegisterInEngine;
{$IfEnd} //not NoScripts

end.