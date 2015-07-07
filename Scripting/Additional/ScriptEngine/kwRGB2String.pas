unit kwRGB2String;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwRGB2String.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::RGB2String
//
// Переводит представление R G B в шестнадцатиричное представление в виде строки:
// {code}
// 151 40 30 RGB2String .
// {code}
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
 TkwRGB2String = {final} class(_tfwSysUtilsWord_)
  {* Переводит представление R G B в шестнадцатиричное представление в виде строки:
[code]
151 40 30 RGB2String .
[code] }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwRGB2String
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  Graphics,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwRGB2String;

{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class TkwRGB2String

procedure TkwRGB2String.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_503C792001BA_var*
var
 l_SColor : AnsiString;
 l_Color  : TColor;
 l_R, l_G, l_B: Byte;
//#UC END# *4DAEEDE10285_503C792001BA_var*
begin
//#UC START# *4DAEEDE10285_503C792001BA_impl*
 l_B := aCtx.rEngine.PopInt;
 l_G := aCtx.rEngine.PopInt;
 l_R := aCtx.rEngine.PopInt;
 l_Color := TColor(RGB(l_R, l_G, l_B));
 l_SColor := ColorToString(l_Color);
 aCtx.rEngine.PushString(l_SColor);
//#UC END# *4DAEEDE10285_503C792001BA_impl*
end;//TkwRGB2String.DoDoIt

class function TkwRGB2String.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'RGB2String';
end;//TkwRGB2String.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

end.