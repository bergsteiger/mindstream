unit kwCompileValue;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompileValue.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WordsDefinition::CompileValue
//
// Компилирует значение со стека в код
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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwCompileValue = {final} class(_tfwAutoregisteringWord_)
  {* Компилирует значение со стека в код }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCompileValue
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwInteger,
  kwString,
  SysUtils,
  kwValue,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCompileValue;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.