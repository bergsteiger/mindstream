unit kwWStringInc;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringInc.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_Inc
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
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
 TkwWStringInc = {final} class(_tfwWStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringInc
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  SysUtils,
  l3String,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWStringInc;

{$Include ..\ScriptEngine\tfwWStrWord.imp.pas}

// start class TkwWStringInc

procedure TkwWStringInc.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FEBF70060_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4F4FE51201BD_4F4FEBF70060_var*
begin
//#UC START# *4F4FE51201BD_4F4FEBF70060_impl*
 l_P := Tl3PCharLen(aStr);
 l_P.Shift(+1);
 aCtx.rEngine.PushWStr(l_P);
//#UC END# *4F4FE51201BD_4F4FEBF70060_impl*
end;//TkwWStringInc.DoString

class function TkwWStringInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:++';
end;//TkwWStringInc.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.