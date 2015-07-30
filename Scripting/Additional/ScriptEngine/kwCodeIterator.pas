unit kwCodeIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCodeIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::MembersWorkingPack::CodeIterator
//
// Перебирает слова компилированного кода слова
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
 TkwCodeIterator = {final scriptword} class(TtfwRegisterableWord)
  {* Перебирает слова компилированного кода слова }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCodeIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwCodeIterator,
  kwCompiledWordPrim,
  kwCompiledWordContainer,
  kwDualCompiledWordContainer,
  kwRuntimeWordWithCode,
  tfwWordRefList,
  SysUtils,
  kwForwardDeclarationHolder,
  kwCompiledWordWorkerWord,
  kwCompiledWordWorkerWordRunner,
  kwCompiledWordWorker,
  kwCompiledIfElse
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCodeIterator

procedure TkwCodeIterator.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F47932C001F_var*

 procedure DoWord(aWord: TtfwWord);
 var
  l_List : TtfwWordRefList;
  l_RightParamsCount : Integer;
  l_Index : Integer;
 begin
  if (aWord Is TkwForwardDeclaration) then
   DoWord(TkwForwardDeclaration(aWord).RealWord)
  else
  if (aWord is TkwCompiledWordWorkerWord) then
   DoWord(TkwCompiledWordWorkerWord(aWord).Compiled)
  else
  if (aWord is TkwForwardDeclarationHolder) then
  begin
   l_List := TtfwWordRefList.Create;
   try
    l_List.Add(TkwForwardDeclarationHolder(aWord).Holded);
    aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(l_List)));
   finally
    FreeAndNil(l_List);
   end;//try..finally
  end//aWord is TkwForwardDeclarationHolder
  else
  if (aWord is TkwCompiledIfElse) then
  begin
   l_List := TtfwWordRefList.Create;
   try
    l_List.Add(TkwCompiledIfElse(aWord).Condition);
    l_List.Add(TkwCompiledIfElse(aWord).Compiled);
    if (TkwCompiledIfElse(aWord).ElseBranch <> nil) then
     l_List.Add(TkwCompiledIfElse(aWord).ElseBranch);
    aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(l_List)));
   finally
    FreeAndNil(l_List);
   end;//try..finally
  end//aWord is TkwCompiledIfElse
  else
  if (aWord is TkwDualCompiledWordContainer) then
  begin
   l_List := TtfwWordRefList.Create;
   try
    l_List.Add(TkwDualCompiledWordContainer(aWord).Compiled);
    if (TkwDualCompiledWordContainer(aWord).ElseBranch <> nil) then
     l_List.Add(TkwDualCompiledWordContainer(aWord).ElseBranch);
    aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(l_List)));
   finally
    FreeAndNil(l_List);
   end;//try..finally
  end//aWord is TkwDualCompiledWordContainer
  else
  if (aWord is TkwCompiledWordContainer) then
  begin
   l_List := TtfwWordRefList.Create;
   try
    l_List.Add(TkwCompiledWordContainer(aWord).Compiled);
    aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(l_List)));
   finally
    FreeAndNil(l_List);
   end;//try..finally
  end//aWord is TkwCompiledWordContainer
  else
  if (aWord is TkwCompiledWordWorkerWordRunner) then
  begin
   l_List := TtfwWordRefList.Create;
   try
    l_RightParamsCount := TkwCompiledWordWorkerWordRunner(aWord).Compiled.RightParamsCount(aCtx);
    if (l_RightParamsCount = 1) then
     l_List.Add(TkwCompiledWordWorkerWordRunner(aWord).WordToWork)
    else
    begin
     for l_Index := 0 to Pred(l_RightParamsCount) do
      l_List.Add((TkwCompiledWordWorkerWordRunner(aWord).WordToWork As TkwRuntimeWordWithCode).Code[l_Index]);
    end;//l_RightParamsCount = 1
    aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(l_List)));
   finally
    FreeAndNil(l_List);
   end;//try..finally
  end//aWord is TkwCompiledWordWorkerWordRunner
  else
  if (aWord is TkwCompiledWordWorker) then
  begin
   l_List := TtfwWordRefList.Create;
   try
    l_List.Add(TkwCompiledWordWorker(aWord).WordToWork);
    aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(l_List)));
   finally
    FreeAndNil(l_List);
   end;//try..finally
  end//aWord is TkwCompiledWordWorker
  else
  if (aWord = nil) OR not (aWord Is TkwRuntimeWordWithCode) then
   aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(nil)))
  else
   aCtx.rEngine.Push(TtfwStackValue_C(TtfwCodeIterator.Make(TkwCompiledWordPrim(aWord).GetCode(aCtx))));
 end;//DoWord

var
 l_W : TtfwWord;
//#UC END# *4DAEEDE10285_4F47932C001F_var*
begin
//#UC START# *4DAEEDE10285_4F47932C001F_impl*
 l_W := (aCtx.rEngine.PopObj As TtfwWord);
 DoWord(l_W);
//#UC END# *4DAEEDE10285_4F47932C001F_impl*
end;//TkwCodeIterator.DoDoIt

class function TkwCodeIterator.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CodeIterator';
end;//TkwCodeIterator.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CodeIterator
 TkwCodeIterator.RegisterInEngine;
{$IfEnd} //not NoScripts

end.