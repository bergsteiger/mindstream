unit kwFontIsBold;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFontIsBold.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FontKeywords::font_IsBold
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
 TkwFontIsBold = {final} class(_kwFontWord_)
 protected
 // realized methods
   procedure DoFont(aFont: TFont;
     const aCtx: TtfwContext); override;
   procedure DoIFont(const aFont: Il3Font;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFontIsBold
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

type _Instance_R_ = TkwFontIsBold;

{$Include ..\ScriptEngine\kwFontWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwFontWord.imp.pas}
{$IfEnd} //not NoScripts

end.