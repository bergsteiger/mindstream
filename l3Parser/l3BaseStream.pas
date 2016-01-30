unit l3BaseStream;
{* Базовый класс потоков, поддерживающих счетчик ссылок и интерфейсы IUnknown и IStream. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3BaseStream - }
{ Начат: 29.08.2001 10:29 }
{ $Id: l3BaseStream.pas,v 1.47 2015/01/15 13:50:25 lulin Exp $ }

// $Log: l3BaseStream.pas,v $
// Revision 1.47  2015/01/15 13:50:25  lulin
// {RequestLink:585926571}. Используем Interlocked.
//
// Revision 1.46  2014/12/22 11:45:12  lukyanets
// Закоммител лишнее
//
// Revision 1.45  2014/12/19 12:36:56  lukyanets
// Пишем бинарно
//
// Revision 1.44  2014/12/05 16:42:18  lulin
// - готовимся к объединению стримов.
//
// Revision 1.43  2014/12/05 16:22:27  lulin
// - используем буфера.
//
// Revision 1.42  2014/12/05 13:23:07  lulin
// - рисуем на модели.
//
// Revision 1.41  2014/09/23 12:02:51  lulin
// - записываем в лог те исключения, которые потом "похороним".
//
// Revision 1.40  2014/07/30 12:27:51  lulin
// - чистим код.
//
// Revision 1.39  2014/07/16 15:56:57  lulin
// - чистим код и упрощаем наследование.
//
// Revision 1.38  2014/02/06 13:23:40  dinishev
// Убрал проверку для тестового EverestLite
//
// Revision 1.37  2012/03/05 16:42:31  lulin
// {RequestLink:342866160}
//
// Revision 1.36  2011/09/28 15:00:41  lulin
// {RequestLink:288010443}.
//
// Revision 1.35  2011/09/28 14:28:14  lulin
// {RequestLink:288010443}.
//
// Revision 1.34  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.33  2008/02/15 13:22:43  lulin
// - <TDN>: 79.
//
// Revision 1.32  2008/02/14 19:32:40  lulin
// - изменены имена файлов с примесями.
//
// Revision 1.31  2008/02/14 14:12:25  lulin
// - <K>: 83920106.
//
// Revision 1.30  2008/02/07 08:37:59  lulin
// - каждому базовому объекту по собственному модулю.
//
// Revision 1.29  2008/01/30 20:31:44  lulin
// - подготавливаемся к штатному использованию классов-примесей на модели.
//
// Revision 1.28  2008/01/25 12:06:59  lulin
// - синхронизируем имена с моделью.
//
// Revision 1.27  2008/01/25 11:32:14  lulin
// - синхронизируем имена с моделью.
//
// Revision 1.26  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.25  2007/08/13 17:23:34  lulin
// - cleanup.
//
// Revision 1.24  2007/01/18 10:49:42  lulin
// - заменяем объект менеджера памяти на интерфейс.
//
// Revision 1.23  2006/12/18 12:07:20  lulin
// - cleanup.
//
// Revision 1.22  2006/12/18 09:40:27  lulin
// - cleanup.
//
// Revision 1.21  2006/04/26 12:16:23  voba
// - bug fix: архивирующие потоки не работали над файловыми потоками, отличными от m3.
//
// Revision 1.20  2006/04/25 12:47:50  lulin
// - cleanup.
//
// Revision 1.19  2006/04/14 13:40:33  lulin
// - запрещаем перекрывать деструктор.
//
// Revision 1.18  2006/04/14 12:11:25  lulin
// - файлу с шаблоном дано более правильное название.
//
// Revision 1.17  2006/04/14 11:53:13  lulin
// - объединил интерфейс и реализацию _Unknown_ в один файл.
//
// Revision 1.16  2005/02/02 09:14:45  lulin
// - расширен шаблон Unknown.
//
// Revision 1.15  2004/09/15 11:09:29  lulin
// - Tl3Stream переведен на "шаблон" l3Unknown.
//
// Revision 1.14  2004/09/13 07:33:05  lulin
// - new behavior: _Tl3InterfacedComponent теперь может распределять свою память в пуле объектов.
//
// Revision 1.13  2004/09/08 11:22:55  lulin
// - new define: _l3NoTrace.
// - new define: l3TraceObjects.
//
// Revision 1.12  2004/08/05 17:40:31  law
// - избавился от ряда Warning'ов и Hint'ов.
//
// Revision 1.11  2004/06/25 16:47:25  migel
// - change/fix: для совместимости с win9x перешли на собственную реализацию `Interlocked*` функций.
//
// Revision 1.10  2004/06/03 16:54:46  law
// - new method: Il3Base.CheckStamp.
//
// Revision 1.9  2004/04/15 11:34:38  law
// - bug fix: Inc/Dec заменены на InterlockedIncrement/InterlockedDecrement.
//
// Revision 1.8  2003/03/13 16:37:20  law
// - change: попытка портировать на Builder.
//
// Revision 1.7  2002/12/24 13:02:03  law
// - change: объединил Int64_Seek c основной веткой.
//
// Revision 1.6.6.1  2002/12/23 15:51:28  law
// - bug fix: не работали с хранилищем > 2Гб.
//
// Revision 1.6  2001/10/12 17:52:00  law
// - new behavior: работа с буфером обмена через _OleSetClipboard.
//
// Revision 1.5  2001/09/04 16:47:26  law
// - comments: xHelpGen.
//
// Revision 1.4  2001/08/31 12:19:58  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.3  2001/08/31 08:50:08  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.2  2001/08/29 07:24:20  law
// - cleanup.
//
// Revision 1.1  2001/08/29 07:01:09  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//

{$Include l3Define.inc }

interface

uses
  Classes,
  SysUtils,

  l3InternalInterfaces,
  l3IID,
  l3Types
  ;

type
  _l3Unknown_Parent_ = TStream;
  {$Define _UnknownNeedsQI}
  {$Include l3Unknown.imp.pas}
  Tl3Stream = class(_l3Unknown_, Il3ObjectWrap, IStream)
   {* Базовый класс потоков, поддерживающих счетчик ссылок и интерфейсы IUnknown и IStream. }
    protected
    {interface methods}
      // Il3ObjectWrap
      function  GetObject: TObject;
        {-}
      // IStream
      function IStream.Read = IStreamRead;
      function IStream.Write = IStreamWrite;
      function IStream.Seek = IStreamSeek;
      function IStream.SetSize = IStreamSetSize;
      function IStream.CopyTo = IStreamCopyTo;
      function IStream.Commit = IStreamCommit;
      function IStream.Revert = IStreamRevert;
      function IStream.LockRegion = IStreamLockRegion;
      function IStream.UnlockRegion = IStreamUnlockRegion;
      function IStream.Stat = IStreamStat;
      function IStream.Clone = IStreamClone;

      function IStreamRead(pv: Pointer; cb: Longint;
        pcbRead: PLongint): HResult; virtual; stdcall;
      function IStreamWrite(pv: Pointer; cb: Longint;
        pcbWritten: PLongint): HResult; virtual; stdcall;
      function IStreamSeek(dlibMove: Large; dwOrigin: Longint;
        out libNewPosition: Large): HResult; virtual; stdcall;
      function IStreamSetSize(libNewSize: Large): HResult; virtual; stdcall;
      function IStreamCopyTo(stm: IStream; cb: Large; out cbRead: Large;
        out cbWritten: Large): HResult; stdcall;
      function IStreamCommit(grfCommitFlags: Longint): HResult; virtual; stdcall;
      function IStreamRevert: HResult; virtual; stdcall;
      function IStreamLockRegion(libOffset: Large; cb: Large;
        dwLockType: Longint): HResult; virtual; stdcall;
      function IStreamUnlockRegion(libOffset: Large; cb: Large;
        dwLockType: Longint): HResult; virtual; stdcall;
      function IStreamStat(out statstg: TStatStg;
        grfStatFlag: Longint): HResult; virtual; stdcall;
      function IStreamClone(out stm: IStream): HResult; virtual; stdcall;
      procedure FillStat(var statstg: TStatStg; grfStatFlag: Longint);
        virtual;
        {-}
    public
    // public methods
      constructor Create;
        overload;
        virtual;
        {* - создает поток. }
      function QueryInterface(const IID: TGUID; out Obj): HResult;
        override;
        {* - реализация метода QueryInterface интерфейса IUnknown. }
      function  COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        virtual;
        {* - метод для реализации QueryInterface (Для перекрытия в потомках). }
  end;//Tl3Stream

{$IfDef nsTest}
var
 g_IStreamCopyTo_Guard : Integer = 0;
 // - запрещает попадание в IStreamCopyTo
{$EndIf nsTest}  

implementation

uses
  Windows,
  
  l3Const,
  l3Interfaces,
  l3Base,
  l3Memory,
  l3INterlocked
  ;

{$Include l3Unknown.imp.pas}

// start class Tl3Stream 

constructor Tl3Stream.Create;
  {virtual;}
  {-}
begin
 inherited Create;
end;

function Tl3Stream.GetObject: TObject;
  {-}
begin
 Result := Self;
end;

function Tl3Stream.QueryInterface(const IID: TGUID; out Obj): HResult;
var
 l_Res : Tl3HResult;
begin
 if TObject(Self).GetInterface(IID, Obj) then
  Result := S_Ok
 else
 begin
  l_Res := COMQueryInterface(Tl3GUID_C(IID), Obj);
  Result := l_Res.Res;
 end;//TObject(Self).GetInterface(IID, Obj)
 if l3IFail(Result) then
  Result := inherited QueryInterface(IID, Obj);
end;

function Tl3Stream.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {virtual;}
  {-}
begin
 Result.SetOk;
 if not TObject(Self).GetInterface(IID.IID, Obj) then
 begin
  Pointer(Obj) := nil;
  Result.SetNoInterface;
 end;{not TObject(Self).GetInterface(IID.IID, Obj)}
end;

function Tl3Stream.IStreamRead(pv: Pointer; cb: Longint; pcbRead: PLongint): HResult;
var
  NumRead: Longint;
begin
  try
    if pv = Nil then
    begin
      Result := STG_E_INVALIDPOINTER;
      Exit;
    end;
    NumRead := Self.Read(pv^, cb);
    if pcbRead <> Nil then pcbRead^ := NumRead;
    Result := S_OK;
  except
    Result := S_FALSE;
  end;
end;

function Tl3Stream.IStreamWrite(pv: Pointer; cb: Longint; pcbWritten: PLongint): HResult;
var
  NumWritten: Longint;
begin
  try
    if pv = Nil then
    begin
      Result := STG_E_INVALIDPOINTER;
      Exit;
    end;
    NumWritten := Self.Write(pv^, cb);
    if pcbWritten <> Nil then pcbWritten^ := NumWritten;
    Result := S_OK;
  except
    Result := STG_E_CANTSAVE;
  end;
end;

function Tl3Stream.IStreamSeek(dlibMove: Large; dwOrigin: Longint;
  out libNewPosition: Large): HResult;
var
  NewPos: Large;
begin
  try
    if (dwOrigin < STREAM_SEEK_SET) or (dwOrigin > STREAM_SEEK_END) then
    begin
      Result := STG_E_INVALIDFUNCTION;
      Exit;
    end;
    NewPos := Self.Seek(dlibMove, TSeekOrigin(dwOrigin));
    if @libNewPosition <> nil then libNewPosition := NewPos;
    Result := S_OK;
  except
    Result := STG_E_INVALIDPOINTER;
  end;
end;

function Tl3Stream.IStreamSetSize(libNewSize: Large): HResult;
begin
 try
  Self.Size := LongInt(libNewSize);
  if (libNewSize <> Self.Size) then
   Result := E_Fail
  else
   Result := S_Ok;
 except
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;
end;

var
  m3CopyBuffers : Pl3MemoryChain = nil;

function Tl3Stream.IStreamCopyTo(stm: IStream; cb: Large; out cbRead: Large;
  out cbWritten: Large): HResult;
const
  MaxBufSize = 1024 * 1024;  // 1mb
var
  Buffer        : Pointer;
  BufSize       : Integer;
  l_IntPartSize : Long;
  l_NeedToRead  : Long;
  l_ReadedPart  : Long;
  BytesRead,
  BytesWritten,
  W             : Large;
begin
 {$IFNDEF EverestLite}
 {$IfDef nsTest}
 Assert(g_IStreamCopyTo_Guard <= 0);
 {$EndIf nsTest}
 {$ENDIF EverestLite}
 Result := S_OK;
 BytesRead := 0;
 BytesWritten := 0;
 try
  if (cb > MaxBufSize) then
    BufSize := MaxBufSize
  else
    BufSize := Integer(cb);
  if (m3CopyBuffers = nil) then
   m3CopyBuffers := l3NewMemoryChain(MaxBufSize);
  m3CopyBuffers.AllocItem(Buffer, BufSize);
//  GetMem(Buffer, BufSize);
  try
    while cb > 0 do
    begin
      if cb > MaxInt then
        l_IntPartSize := MaxInt
      else
        l_IntPartSize := cb;
      while (l_IntPartSize > 0) do begin
        if (l_IntPartSize > BufSize) then l_NeedToRead := BufSize else l_NeedToRead := l_IntPartSize;
        l_ReadedPart := Self.Read(Buffer^, l_NeedToRead);
        if (l_ReadedPart = 0) then Exit;
        Inc(BytesRead, l_ReadedPart);
        W := 0;
        Result := stm.Write(Buffer, l_ReadedPart, @W);
        Inc(BytesWritten, W);
        if (Result = S_OK) and (Integer(W) <> l_ReadedPart) then Result := E_FAIL;
        if Result <> S_OK then Exit;
        Dec(l_IntPartSize, l_ReadedPart);
      end;
      Dec(cb, l_IntPartSize);
    end;
  finally
   m3CopyBuffers.FreeItem(Buffer);
//   FreeMem(Buffer, BufSize);
   if (@cbWritten <> nil) then cbWritten := BytesWritten;
   if (@cbRead <> nil) then cbRead := BytesRead;
  end;//try..finally
 except
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..finally
end;

function Tl3Stream.IStreamCommit(grfCommitFlags: Longint): HResult;
begin
  Result := S_OK;
end;

function Tl3Stream.IStreamRevert: HResult;
begin
  Result := STG_E_REVERTED;
end;

function Tl3Stream.IStreamLockRegion(libOffset: Large; cb: Large;
  dwLockType: Longint): HResult;
begin
  Result := STG_E_INVALIDFUNCTION;
end;

function Tl3Stream.IStreamUnlockRegion(libOffset: Large; cb: Large;
  dwLockType: Longint): HResult;
begin
  Result := STG_E_INVALIDFUNCTION;
end;

function Tl3Stream.IStreamStat(out statstg: TStatStg; grfStatFlag: Longint): HResult;
begin
  Result := S_OK;
  try
    if (@statstg <> nil) then
     FillStat(statstg, grfStatFlag);
  except
   on E: Exception do
   begin
    l3System.Exception2Log(E);
    Result := E_UNEXPECTED;
   end;//on E: Exception
   else
    Result := E_UNEXPECTED;
  end;
end;

procedure Tl3Stream.FillStat(var statstg: TStatStg; grfStatFlag: Longint);
  //virtual;
  {-}
begin
 l3FillChar(statstg, SizeOf(statstg), 0);
 with statstg do
 begin
   dwType := STGTY_STREAM;
   cbSize := Self.Size;
   mTime.dwLowDateTime := 0;
   mTime.dwHighDateTime := 0;
   cTime.dwLowDateTime := 0;
   cTime.dwHighDateTime := 0;
   aTime.dwLowDateTime := 0;
   aTime.dwHighDateTime := 0;
   grfLocksSupported := LOCK_WRITE;
 end;//with statstg
end;

function Tl3Stream.IStreamClone(out stm: IStream): HResult;
begin
  Result := E_NOTIMPL;
end;

end.

