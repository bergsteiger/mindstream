unit seModalSupport;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/seModalSupport.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Scripting::ScriptEngine::CodeFlowWords::seModalSupport
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
  tfwScriptingInterfaces
  ;

function SeAddModalWorker(aWorker: TtfwWord;
  const aCtx: TtfwContext): Integer;
function SeExecuteCurrentModalWorker: Boolean;
function SeHasModalWorker: Boolean;
function SeIsValidModalWorkersCount(aCount: Integer): Boolean;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  afwFacade,
  tfwWordRefList,
  seModalWorkerList
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  seModalWorker
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

function SeExecuteCurrentModalWorker: Boolean;
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
 if not g_BatchMode then
  Exit;
 if TseModalWorkerList.Instance.Empty then
  Exit;
 afw.ProcessMessages; 
 l_W := TseModalWorkerList.Instance.Last;
 TseModalWorkerList.Instance.Delete(Pred(TseModalWorkerList.Instance.Count));
 l_W.rWord.DoIt(l_W.rContext^);
 afw.ProcessMessages; 
 Result := true;
 {$IfEnd}
//#UC END# *4FC754C20096_4FC7541C02BA_impl*
end;//SeExecuteCurrentModalWorker

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
{$IfEnd} //not NoScripts

end.