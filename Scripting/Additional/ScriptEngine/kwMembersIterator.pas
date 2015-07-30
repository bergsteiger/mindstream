unit kwMembersIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMembersIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::MembersWorkingPack::MembersIterator
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
 TkwMembersIterator = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMembersIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwMembersIterator,
  kwForwardDeclarationHolder
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация MembersIterator
 TkwMembersIterator.RegisterInEngine;
{$IfEnd} //not NoScripts

end.