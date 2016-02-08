{$IfNDef _Thread_Notifier_Declared}

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3ThreadNotifier.int -      }
{ Начат: 21.11.2005 16:56             }
{ $Id: l3ThreadNotifier.int.pas,v 1.5 2008/10/21 10:42:30 lulin Exp $ }

// $Log: l3ThreadNotifier.int.pas,v $
// Revision 1.5  2008/10/21 10:42:30  lulin
// - <K>: 121156801.
//
// Revision 1.4  2008/08/08 08:31:13  oman
// - fix: Зацикливались (K-107380987)
//
// Revision 1.3  2008/08/06 12:12:33  lulin
// http://mdp.garant.ru/pages/viewpage.action?pageId=93264761&focusedCommentId=106987926#comment-106987926
//
// Revision 1.2  2008/08/05 06:50:23  lulin
// - <K>: 93264761.
//
// Revision 1.1  2008/08/05 06:25:52  lulin
// - переименовываем в рамках <K>: 93264761.
//
// Revision 1.8  2008/01/18 07:32:19  oman
// - fix: Более избирательно ждем нотификационные сообщения (cq28198)
//
// Revision 1.7  2007/09/04 06:33:17  oman
// - fix: Не пытаемся два раза освободить служебное окно (cq25334)
//
// Revision 1.6  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.5  2006/06/01 10:29:58  oman
// - fix: Отпускаем нотификатор сразу по получению данных, а не
//  после окончания обработки - иначе было зацикливание при
// закрытии оболочки внутри обработчика (cq21166)
//
// Revision 1.4  2005/11/30 16:56:28  lulin
// - при синхронизации посылаем объект, а не буфер.
//
// Revision 1.3  2005/11/22 17:39:08  lulin
// - cleanup.
//
// Revision 1.2  2005/11/22 17:02:10  lulin
// - не переопределяем конструктор.
//
// Revision 1.1  2005/11/21 14:11:08  lulin
// - нотификатор выделен в шаблон.
//

 {$Define _Thread_Notifier_Declared}

type
  Tl3DataHolder = class(Tl3CacheableBase)
    protected
    // internal fields
      f_Data : Pointer;
      f_Intf : array of IUnknown;
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aData  : Pointer;
                         aDataSize    : Integer;
                         const anIntf : array of IUnknown);
        reintroduce;
        {-}
    public
    // public properties
      property Data: Pointer
        read f_Data;
        {-}
  end;//Tl3DataHolder
  Rl3DataHolder = class of Tl3DataHolder;

  TnsOnChangeInOtherThreadMethod = procedure(aDataPtr: Tl3DataHolder) of object;

  _ThreadNotifier_ = class(_ThreadNotifierParent_)
    private
      f_CustomChangeWindow: HWND;
      f_PostMessageCounter: Longint;
    private
    // internal methods
      class function SynchronizeMessage: Longword;
        {-}
      procedure WndProc(var aMessage: TMessage);
        {-}
    protected
    // internal methods
      procedure Synchronize(const aOnChangeInOtherThread : TnsOnChangeInOtherThreadMethod;
                            const aDataPtr               : Pointer;
                            const aDataSize              : Integer;
                            const anIntf                 : array of IUnknown);
        overload;
        {-}
      procedure Synchronize(const aOnChangeInOtherThread : TnsOnChangeInOtherThreadMethod;
                            const aDataPtr               : Pointer;
                            const aDataSize              : Integer);
        overload;
        {-}
      procedure Synchronize(const aOnChangeInOtherThread : TnsOnChangeInOtherThreadMethod;
                            const aDataPtr               : Tl3DataHolder = nil);
        overload;
        {-}
      procedure InitFields;
        override;
        {-}
      function  HolderClass: Rl3DataHolder;
        virtual;
        {-}
      procedure Cleanup;
        override;
        {-}
  end;//_ThreadNotifier_

{$Else   _Thread_Notifier_Declared}

type
 PnsOnChangeInOtherThreadMethodWrapper = ^TnsOnChangeInOtherThreadMethodWrapper;
 TnsOnChangeInOtherThreadMethodWrapper = packed record
  r_ObjectMethod: TnsOnChangeInOtherThreadMethod;
 end;//TnsOnChangeInOtherThreadMethodWrapper

// start class _Notifier_

procedure _ThreadNotifier_.InitFields;
 //override;
begin
 inherited;
 f_CustomChangeWindow := AllocateHWnd(WndProc);
end;

function _ThreadNotifier_.HolderClass: Rl3DataHolder;
  {-}
begin
 Result := Tl3DataHolder;
end;
                                                     
procedure _ThreadNotifier_.Cleanup;

 procedure WaitForProcess(var aPostMessageCounter: Longint);
 var
  Msg: TMsg;
 begin
  while (l3InterlockedExchangeAdd(@aPostMessageCounter, 0) <> 0) do
  begin
   // Вызывать для ожидания обработки ProceesMessages здесь нельзя.
   // Т.к. в процессе его обработки может еще раз прийти волженный
   // Changed в процессе обработки Changed (cq28198)
   //
   // В теории если в этот момент очередь сообщений пуста, то уже все плохо -
   // нотификация ожидается, но ее еще нет и взяться ей не откуда
   // Если очередь не пуста, то теоретически, нотификация должна находиться в ней
   // и за один цикл PeekMessage aPostMessageCounter должен уменьшиться до нуля
   // если этого не происходит, то опять все плохо -
   // нотификация ожидается, но ее еще нет и взяться ей не откуда
   // Но не мудрствуя лукаво напишем просто и тупо. На всякий случай защитившись от
   // зацикливания и добавив Assert на разрушение окна до обработки всех
   // ожидаемых нотификаций
   while PeekMessage(Msg, f_CustomChangeWindow, 0, 0, PM_REMOVE) do
   begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
    if Msg.Message = WM_DESTROY then
    begin
     // Окно уже убили, а нотификация так и не пришла...
     Assert(l3InterlockedExchangeAdd(@aPostMessageCounter, 0) = 0, 'Unprocessed thread notification by ' + ClassName);
     Exit;
    end;
   end;
  end;
 end;

begin
 WaitForProcess(f_PostMessageCounter);           
 if f_CustomChangeWindow <> 0 then
  DeallocateHWnd(f_CustomChangeWindow);
 f_CustomChangeWindow := 0;
 inherited;
end;

class function _ThreadNotifier_.SynchronizeMessage: Longword;
begin
 Result := WM_USER+$0904;
end;

procedure _ThreadNotifier_.WndProc(var aMessage: TMessage);
var
 l_DataPtr                            : Tl3DataHolder;
 l_OnChangeInOtherThreadMethodWrapper : PnsOnChangeInOtherThreadMethodWrapper;
begin
 with aMessage do
  if (Msg = SynchronizeMessage) then
  begin
   try
    l_OnChangeInOtherThreadMethodWrapper := Pointer(WParam);
    try
     l_DataPtr := Tl3DataHolder(LParam);
     try
      l3InterlockedDecrement(f_PostMessageCounter);
      l_OnChangeInOtherThreadMethodWrapper^.r_ObjectMethod(l_DataPtr);
     finally
      l3Free(l_DataPtr);
     end;//try..finally
    finally
     l3System.FreeLocalMem(l_OnChangeInOtherThreadMethodWrapper);
    end;//try..finally
   except
    on EAbort do raise;
   end;//try..except
   Result := 0;
  end//Msg = SynchronizeMessage
  else
   Result := DefWindowProc(f_CustomChangeWindow, Msg, WParam, LParam);
end;

procedure _ThreadNotifier_.Synchronize(const aOnChangeInOtherThread : TnsOnChangeInOtherThreadMethod;
                                       const aDataPtr               : Pointer;
                                       const aDataSize              : Integer);
  //overload;
  {-}
begin
 Synchronize(aOnChangeInOtherThread, aDataPtr, aDataSize, []);
end;

procedure _ThreadNotifier_.Synchronize(const aOnChangeInOtherThread : TnsOnChangeInOtherThreadMethod;
                                       const aDataPtr               : Pointer;
                                       const aDataSize              : Integer;
                                       const anIntf                 : array of IUnknown);
var
 l_DataPtr : Tl3DataHolder;
begin
 l_DataPtr := HolderClass.Create(aDataPtr, aDataSize, anIntf);
 try
  Synchronize(aOnChangeInOtherThread, l_DataPtr);
 except
  l3Free(l_DataPtr);
  raise;
 end;//try..except
end;

procedure _ThreadNotifier_.Synchronize(const aOnChangeInOtherThread : TnsOnChangeInOtherThreadMethod;
                                       const aDataPtr               : Tl3DataHolder);
var
 l_OnChangeInOtherThreadMethodWrapper: PnsOnChangeInOtherThreadMethodWrapper;
begin
 l3System.GetLocalMem(l_OnChangeInOtherThreadMethodWrapper, SizeOf(l_OnChangeInOtherThreadMethodWrapper^));
 try
  l3InterlockedIncrement(f_PostMessageCounter);
  try
   l_OnChangeInOtherThreadMethodWrapper^.r_ObjectMethod := aOnChangeInOtherThread;
   Win32Check(PostMessage(f_CustomChangeWindow, SynchronizeMessage,
                          WPARAM(l_OnChangeInOtherThreadMethodWrapper), LPARAM(aDataPtr)));
  except
   l3InterlockedDecrement(f_PostMessageCounter);
   raise;
  end;//try..except
 except
  l3System.FreeLocalMem(l_OnChangeInOtherThreadMethodWrapper);
  raise;
 end;//try..except
end;

// start class Tl3DataHolder

constructor Tl3DataHolder.Create(const aData  : Pointer;
                                 aDataSize    : Integer;
                                 const anIntf : array of IUnknown);
  //reintroduce;
  {-}
var
 l_Index : Integer;
begin
 l3System.GetLocalMem(f_Data, aDataSize);
 l3Move(aData^, f_Data^, aDataSize);
 SetLength(f_Intf, Length(anIntf));
 for l_Index := Low(anIntf) to High(anIntf) do
  f_Intf[l_Index] := anIntf[l_Index];
 inherited Create;
end;

procedure Tl3DataHolder.Cleanup;
  //override;
  {-}
begin
 f_Intf := nil;
 l3System.FreeLocalMem(f_Data);
 inherited;
end;

{$EndIf  _Thread_Notifier_Declared}

