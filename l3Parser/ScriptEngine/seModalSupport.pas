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
  l3ProtoObject,
  tfwScriptingInterfaces,
  l3ModalService
  ;

type
 TseModalService = {final} class(Tl3ProtoObject, Il3ModalService)
 public
 // realized methods
   function HasModalWorker: Boolean;
   function ExecuteCurrentModalWorker(aModalExecute: TseModalExecute = se_meUsual): Boolean;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TseModalService;
    {- возвращает экземпляр синглетона. }
 end;//TseModalService
function SeAddModalWorker(aWorker: TtfwWord;
  const aCtx: TtfwContext): Integer;
function SeIsValidModalWorkersCount(aCount: Integer): Boolean;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3MessagesService,
  l3Base {a},
  seModalWorkerList,
  seModalWorker,
  l3AFWExceptions,
  l3BatchService
  ;

// unit methods

function SeExecuteCurrentModalWorker(aModalExecute: TseModalExecute): Boolean;
//#UC START# *4FC754C20096_4FC7541C02BA_var*
var
 l_W : TseModalWorker;
//#UC END# *4FC754C20096_4FC7541C02BA_var*
begin
//#UC START# *4FC754C20096_4FC7541C02BA_impl*
 Result := false;
 if not Tl3BatchService.Instance.IsBatchMode then
  Exit;
 if TseModalWorkerList.Instance.Empty then
  Exit;
 Tl3MessagesService.Instance.ProcessMessages;
 l_W := TseModalWorkerList.Instance.Last;
 if (aModalExecute <> se_meInLoop) then
  TseModalWorkerList.Instance.Delete(Pred(TseModalWorkerList.Instance.Count));
 if (aModalExecute > se_meUsual) then
  l_W.rContext^.rEngine.PushBool(aModalExecute = se_meAfterLoop);
 l_W.rWord.DoIt(l_W.rContext^);
 Tl3MessagesService.Instance.ProcessMessages;
 Result := true;
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

function SeAddModalWorker(aWorker: TtfwWord;
  const aCtx: TtfwContext): Integer;
//#UC START# *4FC7549A03B6_4FC7541C02BA_var*
//#UC END# *4FC7549A03B6_4FC7541C02BA_var*
begin
//#UC START# *4FC7549A03B6_4FC7541C02BA_impl*
 TseModalWorkerList.Instance.Add(TseModalWorker_C(aWorker, aCtx));
 Result := TseModalWorkerList.Instance.Count;
//#UC END# *4FC7549A03B6_4FC7541C02BA_impl*
end;//SeAddModalWorker

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

// start class TseModalService

var g_TseModalService : TseModalService = nil;

procedure TseModalServiceFree;
begin
 l3Free(g_TseModalService);
end;

class function TseModalService.Instance: TseModalService;
begin
 if (g_TseModalService = nil) then
 begin
  l3System.AddExitProc(TseModalServiceFree);
  g_TseModalService := Create;
 end;
 Result := g_TseModalService;
end;


class function TseModalService.Exists: Boolean;
 {-}
begin
 Result := g_TseModalService <> nil;
end;//TseModalService.Exists

function TseModalService.HasModalWorker: Boolean;
//#UC START# *553F7345032E_553F737A02D6_var*
//#UC END# *553F7345032E_553F737A02D6_var*
begin
//#UC START# *553F7345032E_553F737A02D6_impl*
 Result := SeHasModalWorker;
//#UC END# *553F7345032E_553F737A02D6_impl*
end;//TseModalService.HasModalWorker

function TseModalService.ExecuteCurrentModalWorker(aModalExecute: TseModalExecute = se_meUsual): Boolean;
//#UC START# *553F8EA30300_553F737A02D6_var*
//#UC END# *553F8EA30300_553F737A02D6_var*
begin
//#UC START# *553F8EA30300_553F737A02D6_impl*
 Result := SeExecuteCurrentModalWorker(aModalExecute);
//#UC END# *553F8EA30300_553F737A02D6_impl*
end;//TseModalService.ExecuteCurrentModalWorker
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TseModalService
 Tl3ModalService.Instance.Alien := TseModalService.Instance;
{$IfEnd} //not NoScripts

end.