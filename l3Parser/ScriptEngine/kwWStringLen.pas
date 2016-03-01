unit kwWStringLen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWStringLen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::WString_Len
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
 TkwWStringLen = {final scriptword} class(TtfwWStrWord)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWStringLen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWStringLen

procedure TkwWStringLen.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FE3880056_var*
//#UC END# *4F4FE51201BD_4F4FE3880056_var*
begin
//#UC START# *4F4FE51201BD_4F4FE3880056_impl*
 aCtx.rEngine.PushInt(aStr.SLen);
//#UC END# *4F4FE51201BD_4F4FE3880056_impl*
end;//TkwWStringLen.DoString

class function TkwWStringLen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WString:Len';
end;//TkwWStringLen.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WString_Len
 TkwWStringLen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.