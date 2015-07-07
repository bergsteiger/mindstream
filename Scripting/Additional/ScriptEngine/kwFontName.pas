unit kwFontName;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFontName.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::font_Name
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
 TkwFontName = {final} class(_kwFontWord_)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontName
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

type _Instance_R_ = TkwFontName;

{$Include ..\ScriptEngine\kwFontWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwFontWord.imp.pas}
{$IfEnd} //not NoScripts

end.