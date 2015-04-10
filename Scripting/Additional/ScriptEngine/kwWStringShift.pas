unit kwWStringShift;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWStringShift.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::WString_Shift
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
 TkwWStringShift = {final} class(_tfwWStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringShift
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

type _Instance_R_ = TkwWStringShift;

{$Include ..\ScriptEngine\tfwWStrWord.imp.pas}

// start class TkwWStringShift

procedure TkwWStringShift.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FEB9E02A9_var*
var
 l_P : Tl3PCharLen;
//#UC END# *4F4FE51201BD_4F4FEB9E02A9_var*
begin
//#UC START# *4F4FE51201BD_4F4FEB9E02A9_impl*
 l_P := Tl3PCharLen(aStr);
 l_P.Shift(aCtx.rEngine.PopInt);
 aCtx.rEngine.PushWStr(l_P);
//#UC END# *4F4FE51201BD_4F4FEB9E02A9_impl*
end;//TkwWStringShift.DoString

class function TkwWStringShift.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:+';
end;//TkwWStringShift.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
{$IfEnd} //not NoScripts

end.