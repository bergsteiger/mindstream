unit kwDoPushedWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDoPushedWord.pas"
// Начат: 12.05.2011 14:07
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::DoPushedWord
//
// Исолняет скомпилированное слово.
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
 TkwDoPushedWord = class(_tfwAutoregisteringWord_)
  {* Исолняет скомпилированное слово. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDoPushedWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDoPushedWord;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDoPushedWord

procedure TkwDoPushedWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCBB13702B7_var*
var
 l_V : TtfwStackValue;
//#UC END# *4DAEEDE10285_4DCBB13702B7_var*
begin
//#UC START# *4DAEEDE10285_4DCBB13702B7_impl*
 l_V := aCtx.rEngine.Pop;
 RunnerAssert(l_V.rType = tfw_svtObj, 'На стеке не объект, а ' + GetEnumName(TypeInfo(TtfwStackValueType), Ord(l_V.rType)), aCtx);
 RunnerAssert(l_V.AsObject Is TtfwWord, 'На стеке не слово', aCtx);
 TtfwWord(l_V.AsObject).DoIt(aCtx);
//#UC END# *4DAEEDE10285_4DCBB13702B7_impl*
end;//TkwDoPushedWord.DoDoIt

class function TkwDoPushedWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DO';
end;//TkwDoPushedWord.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.