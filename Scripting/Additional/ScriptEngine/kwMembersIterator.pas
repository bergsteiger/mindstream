unit kwMembersIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMembersIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::MembersWorkingPack::MembersIterator
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
 TkwMembersIterator = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMembersIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwMembersIterator,
  kwForwardDeclarationHolder,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMembersIterator;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMembersIterator

procedure TkwMembersIterator.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3BF5A701C3_var*
var
 l_W : TtfwWord;
//#UC END# *4DAEEDE10285_4F3BF5A701C3_var*
begin
//#UC START# *4DAEEDE10285_4F3BF5A701C3_impl*
 l_W := (aCtx.rEngine.PopObj As TtfwWord);
 if (l_W = nil) then
  aCtx.rEngine.Push(TtfwStackValue_C(TtfwMembersIterator.Make(nil)))
 else
 if (l_W Is TkwForwardDeclaration) then
  aCtx.rEngine.Push(TtfwStackValue_C(TtfwMembersIterator.Make(TkwForwardDeclaration(l_W).RealWord.InnerDictionary)))
 else
  aCtx.rEngine.Push(TtfwStackValue_C(TtfwMembersIterator.Make(l_W.InnerDictionary)));
//#UC END# *4DAEEDE10285_4F3BF5A701C3_impl*
end;//TkwMembersIterator.DoDoIt

class function TkwMembersIterator.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MembersIterator';
end;//TkwMembersIterator.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.