unit kwFontSize;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwFontSize.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::FontKeywords::font_Size
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
 TkwFontSize = {final scriptword} class(TkwFontWord)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontSize
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwFontSize

procedure TkwFontSize.DoFont(aFont: TFont;
  const aCtx: TtfwContext);
//#UC START# *5190B11A0069_5190B2720147_var*
//#UC END# *5190B11A0069_5190B2720147_var*
begin
//#UC START# *5190B11A0069_5190B2720147_impl*
 aCtx.rEngine.PushInt(aFont.Size);
//#UC END# *5190B11A0069_5190B2720147_impl*
end;//TkwFontSize.DoFont

procedure TkwFontSize.DoIFont(const aFont: Il3Font;
  const aCtx: TtfwContext);
//#UC START# *5190DDC60327_5190B2720147_var*
//#UC END# *5190DDC60327_5190B2720147_var*
begin
//#UC START# *5190DDC60327_5190B2720147_impl*
 aCtx.rEngine.PushInt(aFont.Size);
//#UC END# *5190DDC60327_5190B2720147_impl*
end;//TkwFontSize.DoIFont

class function TkwFontSize.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'font:Size';
end;//TkwFontSize.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация font_Size
 TkwFontSize.RegisterInEngine;
{$IfEnd} //not NoScripts

end.