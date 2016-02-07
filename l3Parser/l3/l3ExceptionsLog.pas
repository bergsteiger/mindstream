unit l3ExceptionsLog;

(*
//
// module:  l3ExceptionsLog
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: l3ExceptionsLog.pas,v 1.47 2015/08/21 14:58:22 lulin Exp $
//
*)

// $Log: l3ExceptionsLog.pas,v $
// Revision 1.47  2015/08/21 14:58:22  lulin
// - подтачиваем.
//
// Revision 1.45  2015/08/21 14:43:54  lulin
// - подтачиваем.
//
// Revision 1.44  2015/05/28 09:56:13  lulin
// - чистим код.
//
// Revision 1.43  2015/02/10 17:40:10  lulin
// - bug fix: не собиралось.
//
// Revision 1.42  2015/01/16 15:51:51  lulin
// - рисуем на модели.
//
// Revision 1.41  2014/10/27 14:48:04  lulin
// - bug fix: не падаем под Win 2000 при ненахождении функции.
//
// Revision 1.40  2014/09/26 09:24:53  lulin
// - bug fix: не компилировалось.
//
// Revision 1.39  2014/09/26 05:56:09  lulin
// - временно исключаем многопоточный тест.
//
// Revision 1.38  2014/09/25 14:02:41  lulin
// - в тестах пишем дату/время если это написано в ini-файле.
//
// Revision 1.37  2014/09/25 13:48:19  lulin
// - будем кешировать лог.
//
// Revision 1.36  2014/09/24 16:04:39  lulin
// - в некоторые логи таки пишем дату/время.
//
// Revision 1.35  2014/09/22 14:53:59  lulin
// - аккуратнее работаем с логом.
//
// Revision 1.34  2014/09/22 14:34:44  lulin
// - аккуратнее работаем с логом.
//
// Revision 1.33  2014/09/22 13:05:33  voba
// - imp. имя станции для ремоут сессий сдела подробнее
//
// Revision 1.32  2014/09/09 11:17:45  lulin
// - добавляем виртуальности.
//
// Revision 1.31  2014/09/09 10:39:07  lulin
// - более по-человечески называем класс.
//
// Revision 1.30  2014/09/09 10:19:00  lulin
// - выкидываем ненужное.
//
// Revision 1.29  2014/08/07 05:57:05  lukyanets
// Не собиралось
//
// Revision 1.28  2014/08/07 05:55:48  lukyanets
// Не собиралось
//
// Revision 1.27  2014/08/06 13:18:03  lukyanets
// {Requestlink:556143119}. Меняем в логе имя станции
//
// Revision 1.26  2014/04/22 09:45:32  lulin
// - улучшаем диагностику.
//
// Revision 1.25  2013/04/19 13:08:17  lulin
// - портируем.
//
// Revision 1.24  2013/04/16 10:16:46  lulin
// - портируем.
//
// Revision 1.23  2013/04/05 16:45:00  lulin
// - портируем.
//
// Revision 1.22  2013/04/03 15:03:20  lulin
// - портируем.
//
// Revision 1.21  2013/03/28 14:03:17  lulin
// - портируем.
//
// Revision 1.20  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.19  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.18  2011/05/06 15:49:38  lulin
// - делаем "предложения".
//
// Revision 1.17  2011/05/06 14:28:16  lulin
// - правим IfDef'ы.
//
// Revision 1.16  2011/01/31 13:06:22  lulin
// {RequestLink:252513593}.
//
// Revision 1.15  2010/11/16 06:56:01  voba
// - не компилировалось
//
// Revision 1.14  2010/05/26 14:32:07  lulin
// {RequestLink:216072357}.
// - теперь падение при отрисовке неправильного документа считается положительным результатом теста.
//
// Revision 1.13  2010/05/13 14:26:02  lulin
// {RequestLink:210438932}.
// - сделано построчное сроллирование.
// - уменьшен размер тестового файла.
//
// Revision 1.12  2010/01/26 15:33:42  lulin
// - пытаемся писать максимум ошибок в лог.
//
// Revision 1.11  2010/01/20 12:58:51  lulin
// - пишем не пустую строку, а имя класса исключения.
//
// Revision 1.10  2010/01/18 11:40:19  lulin
// - новый JEDI.
//
// Revision 1.9  2006/08/29 11:46:18  lulin
// - bug fix: лог не разделял файл между процессами.
//
// Revision 1.8  2005/08/11 11:02:10  migel
// - change: убрали хинт компилятора о неиспользуемых переменных.
//
// Revision 1.7  2005/07/08 12:31:29  mmorozov
// change: миллисекунды выводим в трех знаках;
//
// Revision 1.6  2005/07/06 10:46:34  lulin
// - new behavior: ловим исключение и выводим сообщение об ошибке.
//
// Revision 1.5  2005/07/06 10:32:00  lulin
// - new behavior: не висим если не можем открыть файл лога, а кидаем исключение.
//
// Revision 1.4  2005/07/06 09:35:22  lulin
// - new behavior: выводим в лог время в миллисекундах.
//
// Revision 1.3  2005/06/30 11:02:47  lulin
// - bug fix: не собирался конвертер everest2everest.
//
// Revision 1.2  2005/05/26 10:45:05  lulin
// - bug fix: в лог не писалось время.
//
// Revision 1.1  2005/05/24 11:07:37  lulin
// - cleanup.
//
// Revision 1.41  2005/05/24 10:03:02  lulin
// - cleanup.
//
// Revision 1.40  2005/04/18 13:36:23  voba
// -bug fix: неправильно обрабатывался El3NoLoggedException
// -refactoring
//
// Revision 1.39  2005/04/16 12:15:22  lulin
// - отключаем трассировку стека для релизной сборки.
//
// Revision 1.38  2004/10/07 09:21:23  lulin
// - new directive: l3TraceMemAllocStat.
//
// Revision 1.37  2004/09/16 09:25:19  lulin
// - bug fix: наследники от evCtrl убивались в DesignTime произвольным образом.
//
// Revision 1.36  2004/08/23 09:03:23  voba
// - add El3NoLoggedException  - предок ошибок, которые в лог не попадают
//
// Revision 1.35  2004/06/04 15:25:18  voba
// - formating
//
// Revision 1.34  2004/04/09 08:28:17  law
// - bug fix: не писалиьсь Exception'ы в лог.
//
// Revision 1.33  2004/04/08 07:52:57  voba
// no message
//
// Revision 1.32  2004/04/07 10:43:19  law
// - вставлены директивы CVS.
//

{$Include l3Define.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,
  {$IFDEF _m0USEFORMS1}
  Forms,
  {$ENDIF}
  IniFiles

  {$IfDef DebugStackTrace}
  ,
  jclDebug,
  jclHookExcept
  {$EndIf}
  ;

type
 Tm0EXCLibMessageStyle = (Cm0EXCLibINF, Cm0EXCLibWRG, Cm0EXCLibERR);

 Tl3ExceptionsLog = class(TObject)
 private
  f_UseJCL : Boolean;
  f_Disable : Integer;
  f_NeedTime : Boolean;
  FNameHandle: AnsiString;
{$IFDEF _m0USEFORMS1}
  FExceptionEvent: TExceptionEvent;
{$ENDIF}
{$IFDEF _m0LOGSAV1}
  FCompHandle: AnsiString;
  FFileHandle: {$IfDef XE}THandle{$Else XE}Integer{$EndIf};
{$ENDIF}
protected
{$IFDEF _m0USEFORMS1}
  procedure SetOnException; virtual;
{$ENDIF}

{$IFDEF _m0USEFORMS1}
  procedure ResOnException; virtual;
{$ENDIF}
  function NeedTime: Boolean; virtual;
private
  function pm_GetCompHandle: AnsiString;
  procedure pm_SetCompHandle(const Value: AnsiString);

{$IFDEF _m0USEFORMS1}
  procedure ExceptionHandler(ASender: TObject; AException: Exception);
  {- привешивается в application}
  procedure HandleException(aException: Exception);
  {- собственно обработчик}
{$ENDIF}

{$IfDef DebugStackTrace}
 procedure SaveStack(AStackList: TJclStackInfoList);
{$EndIf}

 protected

 procedure SetNameHandle(Value: AnsiString);

 public
 procedure CloseLogFile;

  constructor Create(const ALogFileName : AnsiString = '';
                     aUseJCL            : Boolean = true);

  destructor Destroy;
   override;

  procedure SaveString(const AString: AnsiString);

  procedure ShowMessage(AMessageStyle: Tm0EXCLibMessageStyle;
                        const AMessage: AnsiString);

  procedure SaveMessage(AMessageStyle: Tm0EXCLibMessageStyle;
                        AMessage: AnsiString
                       {$IfDef DebugStackTrace};
                        AWithStack: Boolean = False; AStackRaw: Boolean = False
                       {$EndIf});

  procedure ShowSaveMessage(AMessageStyle: Tm0EXCLibMessageStyle;
   const AMessage: AnsiString); overload;

  procedure ShowSaveMessage(AMessageStyle: Tm0EXCLibMessageStyle;
   const AException: Exception); overload;
  procedure SaveException(AException: Exception);
  {-}
 procedure DisableExceptionToLog;
 procedure EnableExceptionToLog;

  property LogFileName: AnsiString read FNameHandle write SetNameHandle;
  property LogMachineName: AnsiString read pm_GetCompHandle write pm_SetCompHandle;
 end;


(*procedure m0EXCHandleException;*)
function m0EXCUnknownError(AHandle: Word): AnsiString;

{$IfNDef DesignTimeLibrary}
var
  Gm0EXCLibDefSrv: Tl3ExceptionsLog = nil;
{$EndIf DesignTimeLibrary}

procedure OpenLog;

procedure Exception2Log(E: Exception);
  {* - вывести Exception в лог. }
procedure Stack2Log(const S: AnsiString = '');
  {* - вывести текущий стек в лог. }
  
implementation

uses
  l3Chars,
  l3Except,
  l3Base,
  l3DateSt,
  l3SysUtils{,
  JwaWinBase},
  l3FileUtils,
  StrUtils
  ;

{ -- unit.private -- }

resourcestring
{$IFDEF _m0LANGUAGE_ENG}
 SIInfo = 'INFORMATION';
 SIWarning = 'WARNING';
 SIError = 'ERROR';
 SIUnknownError = 'Unknown error: %.5d(0x%.4x)';
{$ENDIF}

{$IFDEF _m0LANGUAGE_RUS}
 SIInfo = 'ИНФОРМАЦИЯ';
 SIWarning = 'ВНИМАНИЕ';
 SIError = 'ОШИБКА';
 SIUnknownError = 'Неизвестная ошибка: %.5d(0x%.4x)';
{$ENDIF}

const
 CLogFileExt: AnsiString = '.log';

procedure OpenLog;
{$If Declared(Gm0EXCLibDefSrv)}
var
 l_FileName : String;
{$IfEnd}
begin
 {$If Declared(Gm0EXCLibDefSrv)}
 with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  try
   l_FileName := ReadString('EXE', 'LOGFILE', ChangeFileExt(ParamStr(0), '.log'));
   if ANSIStartsText('.\', l_FileName) then
   begin
    Delete(l_FileName, 1, 2);
    l_FileName := ConcatDirName(GetCurrentDir, l_FileName);
   end//ANSIStartsText('.\', l_FileName)
   else
   if (l_FileName = '.') then
   begin
    l_FileName := ConcatDirName(GetCurrentDir, ExtractFileName(ChangeFileExt(ParamStr(0), '.log')));
   end;//l_FileName = '.'
   Gm0EXCLibDefSrv := Tl3ExceptionsLog.Create(l_FileName);
  finally
   Free;
  end;
 {$IfEnd}
end;

procedure _Finalization;
begin
 {$If Declared(Gm0EXCLibDefSrv)}
 FreeAndNil(Gm0EXCLibDefSrv);
 {$IfEnd}
end;

{ -- unit.public -- }

(*procedure m0EXCHandleException;
{$If Declared(Gm0EXCLibDefSrv)}
var
 LExceptObject : TObject;

procedure _ShowExceptProc(AObject: TObject; AAddress: Pointer);
var
 LMessage : String;
begin
 if AObject is Exception then
  Gm0EXCLibDefSrv.ShowSaveMessage(Cm0EXCLibERR, Exception(AObject))
 else
 begin
  SetLength(LMessage, 1024);
  ExceptionErrorMessage(AObject, AAddress, PChar(LMessage), Length(LMessage));
  Gm0EXCLibDefSrv.ShowSaveMessage(Cm0EXCLibERR, LMessage);
 end;
end;
{$IfEnd}

begin
 {$If Declared(Gm0EXCLibDefSrv)}
 LExceptObject := ExceptObject;
 {$IFDEF _m0USEFORMS1}
 if (LExceptObject is Exception) then
  Gm0EXCLibDefSrv.HandleException(Exception(LExceptObject))
 else
 {$EndIF _m0USEFORMS1}
  _ShowExceptProc(LExceptObject, ExceptAddr);
 {$IfEnd}
end;*)

function m0EXCUnknownError(AHandle: Word): AnsiString;
begin
 Result := Format(SIUnknownError, [AHandle, AHandle]);
end;

{ -- Tl3ExceptionsLog.private -- }

{$IFDEF _m0USEFORMS1}
procedure Tl3ExceptionsLog.SetOnException;
begin
 FExceptionEvent := Application.OnException;
 Application.OnException := ExceptionHandler;
end;
{$ENDIF}

{$IFDEF _m0USEFORMS1}
procedure Tl3ExceptionsLog.ResOnException;
begin
 if (Application <> nil) then
  Application.OnException := FExceptionEvent;
 FExceptionEvent := nil;
end;
{$ENDIF}

{$IFDEF _m0USEFORMS1}
procedure Tl3ExceptionsLog.ExceptionHandler(ASender: TObject; AException: Exception);
begin
 ResOnException;
 try
  HandleException(aException);
 finally
  SetOnException;
 end;//try..finally
end;

procedure Tl3ExceptionsLog.HandleException(aException: Exception);
{$If Defined(nsTest) AND not Defined(InsiderTest)}
type
 RException = class of Exception;
{$IfEnd}
begin
 if not (aException is EAbort) then
 begin
  if (aException is EReadError) then
  begin
   if (f_Disable <= 0) then
    SaveMessage(Cm0EXCLibERR, aException.Message)
  end//aException is EReadError
  else
  if (aException is El3NoLoggedException) then
   ShowMessage(Cm0EXCLibERR, aException.Message)
  else
   ShowSaveMessage(Cm0EXCLibERR, aException);
  {$If Defined(nsTest) AND not Defined(InsiderTest)}
  raise RException(aException.ClassType).Create(aException.Message);
  {$IfEnd}
 end;
end;

{$ENDIF}

procedure Tl3ExceptionsLog.DisableExceptionToLog;
begin
 Inc(f_Disable);
end;

procedure Tl3ExceptionsLog.EnableExceptionToLog;
begin
 Dec(f_Disable);
end;

{$IFDEF _m0LOGSAV1}

const
 cInvalidHandle =
{$IfDef XE}
 INVALID_HANDLE_VALUE
{$Else  XE}
 -1
{$EndIf XE};

{$ENDIF}

procedure Tl3ExceptionsLog.SetNameHandle(Value: AnsiString);
{$IFDEF _m0LOGSAV1}
var
 l_Error : Cardinal;
{$ENDIF} 
begin
 {$IFDEF _m0LOGSAV1}
 CloseLogFile;
 if f_UseJCL then
 begin
  if (Value = '') then
   FNameHandle := ChangeFileExt(ParamStr(0), CLogFileExt)
  else
   FNameHandle := ChangeFileExt(Value, CLogFileExt);
 end//f_UseJCL
 else
  FNameHandle := Value;
 try
  repeat
   FFileHandle := FileOpen(FNameHandle, fmOpenReadWrite + fmShareDenyNone);
   if (FFileHandle = cInvalidHandle) then
   begin
    l_Error := GetLastError;
    if (l_Error <> ERROR_SHARING_VIOLATION) AND
       (l_Error <> ERROR_FILE_NOT_FOUND) then
     l3RaiseOSError(l_Error, ^M + FNameHandle);
    FFileHandle := FileCreate(FNameHandle);
    if (FFileHandle <> cInvalidHandle) then
    begin
     FileClose(FFileHandle);
     FFileHandle := cInvalidHandle;
    end//FFileHandle >= 0
    else
    begin
     l_Error := GetLastError;
     if (l_Error <> ERROR_SHARING_VIOLATION) then
      l3RaiseOSError(l_Error, ^M + FNameHandle);
    end;//FFileHandle <> cInvalidHandle
   end;//FFileHandle < 0
  until (FFileHandle <> 0) AND (FFileHandle <> cInvalidHandle);
 except
  on E : Exception do
   {$IFDEF _m0USEFORMS1}
   MessageBox(0, PChar(E.Message), nil, MB_OK or MB_ICONEXCLAMATION);
   {$Else  _m0USEFORMS1}
   WriteLn(E.Message);
   {$EndIF _m0USEFORMS1}
 end;//try..except
 {$ENDIF}
end;

procedure Tl3ExceptionsLog.CloseLogFile;
begin
 {$IFDEF _m0LOGSAV1}
 if (FFileHandle = 0) OR (FFileHandle = cInvalidHandle) then
  Exit;
 if (FileSeek(FFileHandle, 0, soFromEnd) = 0) then
 begin
  FileClose(FFileHandle);
  SysUtils.DeleteFile(FNameHandle);
 end
 else
  FileClose(FFileHandle);
 FFileHandle := 0;
 {$ENDIF}
end;

{ -- Tl3ExceptionsLog.public -- }

constructor Tl3ExceptionsLog.Create(const ALogFileName : AnsiString ='';
                                      aUseJCL            : Boolean = true);
{$IFDEF _m0LOGSAV1}
var
 LCompSize : LongInt;
{$ENDIF}
begin
 {$If Defined(nsTest)}
 // - чтобы дату/время в логи не писать, чтобы К не расстраивался
 f_NeedTime := false;
 {$Else}
 f_NeedTime := true;
 {$IfEnd}
 with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do
  try
   f_NeedTime := ReadBool('EXE', 'NeedTime', f_NeedTime);
  finally
   Free;
  end;
{$IFDEF _m0LOGSAV1}
 FFileHandle := 0;
{$EndIF _m0LOGSAV1}
 inherited Create;
 f_UseJCL := aUseJCL;
{$IFDEF _m0LOGSAV1}
 LCompSize := MAX_COMPUTERNAME_LENGTH + 1;
 SetLength(FCompHandle, LCompSize);

 Win32Check(GetComputerNameA(PAnsiChar(FCompHandle), LongWord(LCompSize)));
 SetLength(FCompHandle, LCompSize);

 if l3IsRemoteSession then
 //if SameText(SysUtils.GetEnvironmentVariable('SESSIONNAME'), 'Console') then
  // -  подключены к консоли
  FCompHandle := FCompHandle + Format('.%s.%d', [SysUtils.GetEnvironmentVariable('SESSIONNAME'), Integer(l3WTSGetActiveConsoleSessionId)]);

 LogFileName := ALogFileName;
{$ENDIF}

{$IFDEF _m0USEFORMS1}
 SetOnException;
{$ENDIF}

{$IfDef DebugStackTrace}
 if f_UseJCL then
  JclStartExceptionTracking;
{$EndIf}
end;

destructor Tl3ExceptionsLog.Destroy;
begin
{$IfDef DebugStackTrace}
 if f_UseJCL then
  JclStopExceptionTracking;
{$EndIf}
{$IFDEF _m0USEFORMS1}
 ResOnException;
{$ENDIF}
{$IFDEF _m0LOGSAV1}
 CloseLogFile;
{$ENDIF}
 inherited;
end;

procedure Tl3ExceptionsLog.SaveString(const AString: AnsiString);
{$IFDEF l3SharedLog}
var
 l_TickCount : Longword;
 l_Locked    : Boolean;
{$EndIF l3SharedLog}
begin
{$IFDEF _m0LOGSAV1}
 if (AString <> '') then
 begin
{$IFDEF l3SharedLog}
  l_Locked := false;
  l_TickCount := GetTickCount;
  while true do
  begin
   if LockFile(FFileHandle, 0, 0, 1, 0) then
   begin
    l_Locked := true;
    break;
   end;//LockFile(FFileHandle, 0, 0, 1, 0)
   if l3IsTimeElapsed(l_TickCount, 2000) then
    break;
  end;//while true 
  try
{$ENDIF l3SharedLog}
   FileSeek(FFileHandle, 0, soFromEnd);
   FileWrite(FFileHandle, Pointer(AString)^, Length(AString));
{$IFDEF l3SharedLog}
  finally
   if l_Locked then
    Win32Check(UnlockFile(FFileHandle, 0, 0, 1, 0));
  end;//try..finally
{$ENDIF l3SharedLog}
 end;
{$ENDIF}
end;

procedure Tl3ExceptionsLog.ShowMessage(AMessageStyle: Tm0EXCLibMessageStyle;
 const AMessage: AnsiString);
{$IFDEF _m0MSGBOX1}
{$IFNDEF NotShowException}
type
 TMessageBoxCaption = packed array [Tm0EXCLibMessageStyle] of AnsiString;
 TMessageBoxStyle = packed array [Tm0EXCLibMessageStyle] of Integer;
const
 CMessageBoxCaption: TMessageBoxCaption = (SIInfo, SIWarning, SIError);
 CMessageBoxStyle: TMessageBoxStyle = (MB_ICONINFORMATION, MB_ICONEXCLAMATION, MB_ICONSTOP);
var
 LMessage : AnsiString;
 LMessageLength : Integer;
 LOEMMessage : AnsiString;
{$ENDIF}
{$ENDIF}
begin
{$IFDEF _m0MSGBOX1}
{$IFNDEF NotShowException}
 if (AMessage <> '') and ((AMessage[Length(AMessage)] <> '.')) then
  LMessage := AMessage + '.'
 else
  LMessage := AMessage;

 if IsConsole then
 begin
  LMessageLength := Length(LMessage);
  SetLength(LOEMMessage, LMessageLength);
  CharToOemBuffA(PAnsiChar(LMessage), PAnsiChar(LOEMMessage), LMessageLength);
  WriteLN;
  WriteLN(LOEMMessage);
 end
 else
 begin
  MessageBoxA(0, PAnsiChar(LMessage), PAnsiChar(CMessageBoxCaption[AMessageStyle]), (MB_OK or CMessageBoxStyle[AMessageStyle]));
 end;
{$ENDIF}
{$ENDIF}
end;

function Tl3ExceptionsLog.NeedTime: Boolean;
begin
 Result := f_NeedTime;
end;

procedure Tl3ExceptionsLog.SaveMessage(AMessageStyle: Tm0EXCLibMessageStyle;
                                         AMessage: AnsiString
                                        {$IfDef DebugStackTrace};
                                         AWithStack: Boolean = False; AStackRaw: Boolean = False
                                        {$EndIf});
{$IFDEF _m0LOGSAV1}
type
 TSaveStringStyle = packed array [Tm0EXCLibMessageStyle] of Char;
const
 CSaveStringStyle: TSaveStringStyle = ('i', 'w', 'e');
var
 LIndex : LongInt;
{$IfDef DebugStackTrace}
 LStackList : TJclStackInfoList;
{$EndIf}
{$ENDIF}
begin
{$IFDEF _m0LOGSAV1}
 if (AMessage <> '') then
 begin
  for LIndex := 1 to Length(AMessage) do
   if (AMessage[LIndex] in [''^J'', ''^M'']) then
    AMessage[LIndex] := ' ';
  if not NeedTime then
  // - чтобы дату/время в логи не писать, чтобы К не расстраивался
   SaveString(Format('%1s.%-15s %s%s', [CSaveStringStyle[AMessageStyle], FCompHandle, AMessage, cc_EOL]))
  else
   SaveString(Format('%1s.%-15s %-19s %s%s', [CSaveStringStyle[AMessageStyle], FCompHandle, l3DateTimeToStr(Now, 'dd/mm/yyyy hh:nn:ss:zzz'), AMessage, cc_EOL]));
 end//AMessage <> ''
 else
  SaveString(cc_EOL);

{$IfDef DebugStackTrace}
 if AWithStack then
 begin
  LStackList := JclCreateStackList(AStackRaw, 2 + 4 * Ord(AStackRaw), nil);
  try
   SaveStack(LStackList);
  finally
   LStackList.Free;
  end;
 end;
{$EndIf}
{$ENDIF}
end;

procedure Tl3ExceptionsLog.ShowSaveMessage(AMessageStyle: Tm0EXCLibMessageStyle; const AMessage: AnsiString);
begin
 SaveMessage(AMessageStyle, AMessage);
 ShowMessage(AMessageStyle, AMessage);
end;

procedure Tl3ExceptionsLog.SaveException(AException: Exception);
{-}
begin
 if (AException.Message = '') then
  SaveMessage(Cm0EXCLibERR, AException.ClassName)
 else
  SaveMessage(Cm0EXCLibERR, AException.Message);
{$IfDef DebugStackTrace}
 SaveStack(JclLastExceptStackList);
{$EndIf}
end;

procedure Tl3ExceptionsLog.ShowSaveMessage(AMessageStyle: Tm0EXCLibMessageStyle; const AException: Exception);
begin
 if (f_Disable <= 0) then
  SaveMessage(AMessageStyle, AException.Message);
{$IfDef DebugStackTrace}
 SaveStack(JclLastExceptStackList);
{$EndIf}
 ShowMessage(AMessageStyle, AException.Message);
end;

{$IfDef DebugStackTrace}
procedure Tl3ExceptionsLog.SaveStack(AStackList: TJclStackInfoList);
var
 I : Integer;
begin
 if (f_Disable <= 0) then
  try
   if (AStackList = nil) or (AStackList.Count <= 0) then
    SaveMessage(Cm0EXCLibINF, '  [Stack is absent]')
   else
    with AStackList do
     for I := 0 to Count - 1 do
      SaveMessage(Cm0EXCLibINF, Format('  [Stack #%3d] %s',
       [I, GetLocationInfoStr(Pointer(Items[I].StackInfo.CallerAddr))]));
  except
  end;//try..except
end;
{$EndIf}

function Tl3ExceptionsLog.pm_GetCompHandle: AnsiString;
begin
  Result := '';
{$IFDEF _m0LOGSAV1}
  Result := FCompHandle;
{$ENDIF _m0LOGSAV1}
end;

procedure Tl3ExceptionsLog.pm_SetCompHandle(const Value: AnsiString);
begin
{$IFDEF _m0LOGSAV1}
  FCompHandle := Value;
{$ENDIF _m0LOGSAV1}
end;

procedure Exception2Log(E: Exception);
  {-}
begin
{$IfDef l3Requires_m0}
 {$If Declared(Gm0EXCLibDefSrv)}
 if (Gm0EXCLibDefSrv <> nil) then
  Gm0EXCLibDefSrv.SaveException(E);
 {$IfEnd}
{$EndIf l3Requires_m0}
end;

procedure Stack2Log(const S: AnsiString = '');
  {-}
var
 lStr : AnsiString;
begin
 try
  if S = '' then
   lStr := 'StackOut'
  else
   lStr := S;

  raise El3InfoException.Create(lStr);
 except
  on E : El3InfoException do
   Exception2Log(E);
 end;//try..except
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3ExceptionsLog.pas initialization enter'); {$EndIf}
 OpenLog;

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3ExceptionsLog.pas initialization leave'); {$EndIf}
finalization
 _Finalization;

end.

