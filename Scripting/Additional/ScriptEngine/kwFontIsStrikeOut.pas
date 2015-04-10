unit kwFontIsStrikeOut;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFontIsStrikeOut.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::font_IsStrikeOut
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
 TkwFontIsStrikeOut = {final} class(_kwFontWord_)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsStrikeOut
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

type _Instance_R_ = TkwFontIsStrikeOut;

{$Include ..\ScriptEngine\kwFontWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwFontWord.imp.pas}
{$IfEnd} //not NoScripts

end.