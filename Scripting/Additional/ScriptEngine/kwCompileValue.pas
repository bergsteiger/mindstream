unit kwCompileValue;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompileValue.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::WordsDefinition::CompileValue
//
// Компилирует значение со стека в код
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwCompileValue = {final scriptword} class(TtfwRegisterableWord)
  {* Компилирует значение со стека в код }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCompileValue
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwInteger,
  kwString,
  SysUtils,
  kwValue
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompileValue

procedure TkwCompileValue.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52B46673008A_var*
var
 l_V : TtfwStackValue;
 l_W : TtfwWord;
//#UC END# *4DAEEDE10285_52B46673008A_var*
begin
//#UC START# *4DAEEDE10285_52B46673008A_impl*
 l_V := aCtx.rEngine.Pop;
 if (l_V.rType = tfw_svtObj) AND (l_V.AsObject Is TtfwWord) then
  l_W := TtfwWord(l_V.AsObject).Use
 else
  l_W := TkwValue.Create(l_V);
 try
  RunnerAssert(l_W <> nil, 'Нет слова для компиляции', aCtx);
  aCtx.rCompiler.AddCodePart(l_W, false, aCtx);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DAEEDE10285_52B46673008A_impl*
end;//TkwCompileValue.DoDoIt

class function TkwCompileValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CompileValue';
end;//TkwCompileValue.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CompileValue
 TkwCompileValue.RegisterInEngine;
{$IfEnd} //not NoScripts

end.