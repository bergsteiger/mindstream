unit kwCompiledFindMember;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledFindMember.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::TkwCompiledFindMember
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWordWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledFindMember = class(TkwCompiledWordWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledFindMember
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledFindMember

procedure TkwCompiledFindMember.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3BEAA00144_var*
var
 l_O : TObject;
 l_S : Il3CString;
 l_W : TtfwKeyWord;
//#UC END# *4DAEEDE10285_4F3BEAA00144_var*
begin
//#UC START# *4DAEEDE10285_4F3BEAA00144_impl*
 l_O := aCtx.rEngine.PopObj;
 f_Word.DoIt(aCtx);
 l_S := aCtx.rEngine.PopString;
 if (l_O Is TtfwWord) AND (TtfwWord(l_O).InnerDictionary <> nil) then
 begin
  l_W := (TtfwWord(l_O).InnerDictionary As TtfwDictionary).DRbyCName[l_S];
  if (l_W = nil) then
   aCtx.rEngine.Push(TtfwStackValue_NULL)
  else
   aCtx.rEngine.PushObj(l_W.Word);
 end//l_O Is TkwCompiledWord
 else
  aCtx.rEngine.Push(TtfwStackValue_NULL);
//#UC END# *4DAEEDE10285_4F3BEAA00144_impl*
end;//TkwCompiledFindMember.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledFindMember
 TkwCompiledFindMember.RegisterClass;
{$IfEnd} //not NoScripts

end.