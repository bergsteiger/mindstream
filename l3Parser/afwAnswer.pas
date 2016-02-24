unit afwAnswer;

{$Include l3Define.inc}

interface

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3ProtoObject,
  l3ProtoIntegerList,
  l3AFWExceptions,
  l3BatchService
  ;

type
 EafwTryEnterModalState = l3AFWExceptions.El3TryEnterModalState;

 TafwBatchService = {final} class(Tl3ProtoObject, Il3BatchService)
 private
 // private fields
   f_BatchMode : Integer;
   f_WasDialog : Integer;
 public
 // realized methods
   procedure PushAnswer(aValue: Integer);
   function CheckWasDialog: Boolean;
   procedure SignalWasDialog;
   procedure ClearAnswers;
   procedure EnterBatchMode;
   function IsBatchMode: Boolean;
   function PopAnswer: Integer;
   procedure LeaveBatchMode;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwBatchService;
    {- возвращает экземпляр синглетона. }
 end;//TafwBatchService

 TafwAnswers = class(Tl3ProtoIntegerList)
 protected
 // protected methods
   class function GetAnswer: Integer;
   class procedure SetAnswer(anAnswer: Integer);
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TafwAnswers;
    {- возвращает экземпляр синглетона. }
 end;//TafwAnswers

 EkwWaitBracketsBalance = class(Exception)
 end;//EkwWaitBracketsBalance
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  
  ;


// start class TafwBatchService

var g_TafwBatchService : TafwBatchService = nil;

procedure TafwBatchServiceFree;
begin
 l3Free(g_TafwBatchService);
end;

class function TafwBatchService.Instance: TafwBatchService;
begin
 if (g_TafwBatchService = nil) then
 begin
  l3System.AddExitProc(TafwBatchServiceFree);
  g_TafwBatchService := Create;
 end;
 Result := g_TafwBatchService;
end;


class function TafwBatchService.Exists: Boolean;
 {-}
begin
 Result := g_TafwBatchService <> nil;
end;//TafwBatchService.Exists

procedure TafwBatchService.PushAnswer(aValue: Integer);
//#UC START# *194C97B8A2DF_5507FE0A0095_var*
//#UC END# *194C97B8A2DF_5507FE0A0095_var*
begin
//#UC START# *194C97B8A2DF_5507FE0A0095_impl*
 TafwAnswers.SetAnswer(aValue);
//#UC END# *194C97B8A2DF_5507FE0A0095_impl*
end;//TafwBatchService.PushAnswer

function TafwBatchService.CheckWasDialog: Boolean;
//#UC START# *217998C234EE_5507FE0A0095_var*
//#UC END# *217998C234EE_5507FE0A0095_var*
begin
//#UC START# *217998C234EE_5507FE0A0095_impl*
 Result := (f_WasDialog > 0);
 Dec(f_WasDialog);
 if (f_WasDialog < 0) then
  raise EkwWaitBracketsBalance.Create('Ожидали диалоговое окно, но не появилось');
//#UC END# *217998C234EE_5507FE0A0095_impl*
end;//TafwBatchService.CheckWasDialog

procedure TafwBatchService.SignalWasDialog;
//#UC START# *23858A465AF6_5507FE0A0095_var*
//#UC END# *23858A465AF6_5507FE0A0095_var*
begin
//#UC START# *23858A465AF6_5507FE0A0095_impl*
 Inc(f_WasDialog);
//#UC END# *23858A465AF6_5507FE0A0095_impl*
end;//TafwBatchService.SignalWasDialog

procedure TafwBatchService.ClearAnswers;
//#UC START# *37CC2CF2A1FF_5507FE0A0095_var*
//#UC END# *37CC2CF2A1FF_5507FE0A0095_var*
begin
//#UC START# *37CC2CF2A1FF_5507FE0A0095_impl*
 if TafwAnswers.Exists then
  TafwAnswers.Instance.Clear;
 f_WasDialog := 0; 
//#UC END# *37CC2CF2A1FF_5507FE0A0095_impl*
end;//TafwBatchService.ClearAnswers

procedure TafwBatchService.EnterBatchMode;
//#UC START# *3E2DB431FD1A_5507FE0A0095_var*
//#UC END# *3E2DB431FD1A_5507FE0A0095_var*
begin
//#UC START# *3E2DB431FD1A_5507FE0A0095_impl*
 Inc(f_BatchMode);
//#UC END# *3E2DB431FD1A_5507FE0A0095_impl*
end;//TafwBatchService.EnterBatchMode

function TafwBatchService.IsBatchMode: Boolean;
//#UC START# *8A081B195E08_5507FE0A0095_var*
//#UC END# *8A081B195E08_5507FE0A0095_var*
begin
//#UC START# *8A081B195E08_5507FE0A0095_impl*
 Result := (f_BatchMode > 0);
//#UC END# *8A081B195E08_5507FE0A0095_impl*
end;//TafwBatchService.IsBatchMode

function TafwBatchService.PopAnswer: Integer;
//#UC START# *FE26372CAD8B_5507FE0A0095_var*
//#UC END# *FE26372CAD8B_5507FE0A0095_var*
begin
//#UC START# *FE26372CAD8B_5507FE0A0095_impl*
 Result := TafwAnswers.GetAnswer;
//#UC END# *FE26372CAD8B_5507FE0A0095_impl*
end;//TafwBatchService.PopAnswer

procedure TafwBatchService.LeaveBatchMode;
//#UC START# *FE46A80B1DA3_5507FE0A0095_var*
//#UC END# *FE46A80B1DA3_5507FE0A0095_var*
begin
//#UC START# *FE46A80B1DA3_5507FE0A0095_impl*
 Dec(f_BatchMode);
//#UC END# *FE46A80B1DA3_5507FE0A0095_impl*
end;//TafwBatchService.LeaveBatchMode

// start class TafwAnswers

var g_TafwAnswers : TafwAnswers = nil;

procedure TafwAnswersFree;
begin
 l3Free(g_TafwAnswers);
end;

class function TafwAnswers.Instance: TafwAnswers;
begin
 if (g_TafwAnswers = nil) then
 begin
  l3System.AddExitProc(TafwAnswersFree);
  g_TafwAnswers := Create;
 end;
 Result := g_TafwAnswers;
end;


class function TafwAnswers.GetAnswer: Integer;
//#UC START# *4E0321910152_553E013F0125_var*
//#UC END# *4E0321910152_553E013F0125_var*
begin
//#UC START# *4E0321910152_553E013F0125_impl*
 {$IfNDef NoVCL}
 if Exists AND
    (Instance.Count > 0) AND
    (Instance.Last <> mrNone) then
 begin
  Result := Instance.Last;
  Instance.Delete(Instance.Hi);
  //Inc(g_WasWait);
  // - нельзя тут это делать
  // http://mdp.garant.ru/pages/viewpage.action?pageId=337513713
  // http://mdp.garant.ru/pages/viewpage.action?pageId=337513713&focusedCommentId=337514042#comment-337514042
 end // if Exists AND (Instance.Last <> mrNone) then
 else
  Result := mrNone;
 {$Else  NoVCL}
 Assert(false);
 {$EndIf NoVCL}
//#UC END# *4E0321910152_553E013F0125_impl*
end;//TafwAnswers.GetAnswer

class procedure TafwAnswers.SetAnswer(anAnswer: Integer);
//#UC START# *4E0312C70245_553E013F0125_var*
//#UC END# *4E0312C70245_553E013F0125_var*
begin
//#UC START# *4E0312C70245_553E013F0125_impl*
 Instance.Add(anAnswer);
//#UC END# *4E0312C70245_553E013F0125_impl*
end;//TafwAnswers.SetAnswer

class function TafwAnswers.Exists: Boolean;
 {-}
begin
 Result := g_TafwAnswers <> nil;
end;//TafwAnswers.Exists
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TafwBatchService
 Tl3BatchService.Instance.Alien := TafwBatchService.Instance;
{$IfEnd} //not NoScripts

end.