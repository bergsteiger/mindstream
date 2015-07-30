unit seModalSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "seModalSupport.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: UtilityPack::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::seModalSupport
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces
  ;

type
 TseModalExecute = (
   se_meUsual
 , se_meInLoop
 , se_meAfterLoop
 );//TseModalExecute
function SeAddModalWorker(aWorker: TtfwWord;
  const aCtx: TtfwContext): Integer;
function SeHasModalWorker: Boolean;
function SeIsValidModalWorkersCount(aCount: Integer): Boolean;
function SeExecuteCurrentModalWorker(aModalExecute: TseModalExecute = se_meUsual): Boolean;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3MessagesService,
  tfwWordRefList,
  seModalWorkerList,
  seModalWorker,
  l3AFWExceptions,
  l3BatchService
  ;

// unit methods

function SeAddModalWorker(aWorker: TtfwWord;
  const aCtx: TtfwContext): Integer;
//#UC START# *4FC7549A03B6_4FC7541C02BA_var*
//#UC END# *4FC7549A03B6_4FC7541C02BA_var*
begin
//#UC START# *4FC7549A03B6_4FC7541C02BA_impl*
 {$If defined(InsiderTest) AND defined(nsTest)}
 TseModalWorkerList.Instance.Add(TseModalWorker_C(aWorker, aCtx));
 Result := TseModalWorkerList.Instance.Count;
 {$IfEnd}
//#UC END# *4FC7549A03B6_4FC7541C02BA_impl*
end;//SeAddModalWorker

function SeHasModalWorker: Boolean;
//#UC START# *4FC7749201E0_4FC7541C02BA_var*
//#UC END# *4FC7749201E0_4FC7541C02BA_var*
begin
//#UC START# *4FC7749201E0_4FC7541C02BA_impl*
 Result := not TseModalWorkerList.Instance.Empty;
//#UC END# *4FC7749201E0_4FC7541C02BA_impl*
end;//SeHasModalWorker

function SeIsValidModalWorkersCount(aCount: Integer): Boolean;
//#UC START# *5193915002D8_4FC7541C02BA_var*
//#UC END# *5193915002D8_4FC7541C02BA_var*
begin
//#UC START# *5193915002D8_4FC7541C02BA_impl*
 Result := (TseModalWorkerList.Instance.Count < aCount);
 // - проверяем, что предыдущий модальный код выполнися
 if not Result then
  TseModalWorkerList.Instance.Delete(Pred(TseModalWorkerList.Instance.Count));
  // - снимаем этот код со стека, если он не выполнился
//#UC END# *5193915002D8_4FC7541C02BA_impl*
end;//SeIsValidModalWorkersCount

function SeExecuteCurrentModalWorker(aModalExecute: TseModalExecute = se_meUsual): Boolean;
//#UC START# *4FC754C20096_4FC7541C02BA_var*
{$If defined(InsiderTest) AND defined(nsTest)}
var
 l_W : TseModalWorker;
{$IfEnd} 
//#UC END# *4FC754C20096_4FC7541C02BA_var*
begin
//#UC START# *4FC754C20096_4FC7541C02BA_impl*
 Result := false;
 {$If defined(InsiderTest) AND defined(nsTest)}
 if not Tl3BatchService.Instance.IsBatchMode then
  Exit;
 if TseModalWorkerList.Instance.Empty then
  Exit;
 Tl3MessagesService.Instance.ProcessMessages; 
 l_W := TseModalWorkerList.Instance.Last;
 if aModalExecute <> se_meInLoop then
  TseModalWorkerList.Instance.Delete(Pred(TseModalWorkerList.Instance.Count));
 if aModalExecute > se_meUsual then
  l_W.rContext^.rEngine.PushBool(aModalExecute = se_meAfterLoop);
 l_W.rWord.DoIt(l_W.rContext^);
 Tl3MessagesService.Instance.ProcessMessages; 
 Result := true;
 {$IfEnd}
//#UC END# *4FC754C20096_4FC7541C02BA_impl*
end;//SeExecuteCurrentModalWorker
{$IfEnd} //not NoScripts

end.