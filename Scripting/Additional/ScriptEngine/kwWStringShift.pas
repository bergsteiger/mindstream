unit kwWStringShift;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringShift.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_Shift
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWStrWord,
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWStringShift = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringShift
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация WString_Shift
 TkwWStringShift.RegisterInEngine;
{$IfEnd} //not NoScripts

end.