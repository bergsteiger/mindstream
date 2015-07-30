unit kwCharDupe;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCharDupe.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::char_Dupe
//
// Размножаем символ столько раз, сколько указано
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
 TkwCharDupe = {final scriptword} class(TtfwWStrWord)
  {* Размножаем символ столько раз, сколько указано }
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCharDupe
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

// start class TkwCharDupe

procedure TkwCharDupe.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F51FCBD03B9_var*
//#UC END# *4F4FE51201BD_4F51FCBD03B9_var*
begin
//#UC START# *4F4FE51201BD_4F51FCBD03B9_impl*
 aCtx.rEngine.PushString(ev_psFixLen('', aCtx.rEngine.PopInt, aStr.S[0]));
//#UC END# *4F4FE51201BD_4F51FCBD03B9_impl*
end;//TkwCharDupe.DoString

class function TkwCharDupe.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'char:Dupe';
end;//TkwCharDupe.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация char_Dupe
 TkwCharDupe.RegisterInEngine;
{$IfEnd} //not NoScripts

end.