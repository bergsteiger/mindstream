unit CodeFlowWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "CodeFlowWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::CodeFlowWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordWorkerEx
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  seModalSupport,
  l3AFWExceptions,
  seThreadSupport,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwMODAL = {final scriptword} class(TtfwWordWorkerEx)
  {* Слово скрипта MODAL
*Пример:*
[code]
 aBeforeModal MODAL aWord
[code]  }
 private
 // private methods
   procedure MODAL(const aCtx: TtfwContext;
    aWord: TtfwWord;
    aBeforeModal: TtfwWord);
     {* Реализация слова скрипта MODAL }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMODAL

// start class TkwMODAL

procedure TkwMODAL.MODAL(const aCtx: TtfwContext;
  aWord: TtfwWord;
  aBeforeModal: TtfwWord);
//#UC START# *D14B34278240_05ABA7975E25_var*
var
 l_Count : Integer;
//#UC END# *D14B34278240_05ABA7975E25_var*
begin
//#UC START# *D14B34278240_05ABA7975E25_impl*
 l_Count := seAddModalWorker(aWord, aCtx);
 try
  try
   aBeforeModal.DoIt(aCtx);
  except
(*   {$If defined(nsTest)}
   on El3TryEnterModalState do
    Exit;
   {$Else}*)
   // - закомментировал, т.к. непонятно - зачем в тестах это исключение давить
   raise;
(*   {$IfEnd} //nsTest*)
  end;//try..except
 finally
  RunnerAssert(seIsValidModalWorkersCount(l_Count), 'Видимо не выполнился код модального окна', aCtx);
 end;//try..finally
//#UC END# *D14B34278240_05ABA7975E25_impl*
end;//TkwMODAL.MODAL

class function TkwMODAL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MODAL';
end;//TkwMODAL.GetWordNameForRegister

procedure TkwMODAL.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_aBeforeModal : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aBeforeModal := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aBeforeModal: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 MODAL(aCtx, l_aWord, l_aBeforeModal);
end;//TkwMODAL.DoRun

function TkwMODAL.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwMODAL.GetResultTypeInfo

type
 TkwTHREAD = {final scriptword} class(TtfwWordWorkerEx)
  {* Слово скрипта THREAD
*Пример:*
[code]
 THREAD aWord
[code]  }
 private
 // private methods
   procedure THREAD(const aCtx: TtfwContext;
    aWord: TtfwWord);
     {* Реализация слова скрипта THREAD }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTHREAD

// start class TkwTHREAD

procedure TkwTHREAD.THREAD(const aCtx: TtfwContext;
  aWord: TtfwWord);
//#UC START# *A56425D1C72F_44C318D8896A_var*
//#UC END# *A56425D1C72F_44C318D8896A_var*
begin
//#UC START# *A56425D1C72F_44C318D8896A_impl*
 TseWorkThreadList.Instance.AddAndResumeThread(aCtx, aWord);
//#UC END# *A56425D1C72F_44C318D8896A_impl*
end;//TkwTHREAD.THREAD

class function TkwTHREAD.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'THREAD';
end;//TkwTHREAD.GetWordNameForRegister

procedure TkwTHREAD.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 THREAD(aCtx, l_aWord);
end;//TkwTHREAD.DoRun

function TkwTHREAD.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTHREAD.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация MODAL
 TkwMODAL.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация THREAD
 TkwTHREAD.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts

end.