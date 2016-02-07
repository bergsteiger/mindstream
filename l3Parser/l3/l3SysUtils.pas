unit l3SysUtils;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3SysUtils -                }
{ Начат: 27.05.2005 14:22             }
{ $Id: l3SysUtils.pas,v 1.10 2015/09/08 07:57:41 lulin Exp $ }

// $Log: l3SysUtils.pas,v $
// Revision 1.10  2015/09/08 07:57:41  lulin
// - правим под XE.
//
// Revision 1.9  2014/10/27 14:48:04  lulin
// - bug fix: не падаем под Win 2000 при ненахождении функции.
//
// Revision 1.8  2011/11/02 15:27:29  lulin
// - переносим утилитную функцию в более подходящее место.
//
// Revision 1.7  2011/10/12 16:00:54  lulin
// {RequestLink:234363429}.
// - оставляем результаты НИР пока на память.
//
// Revision 1.6  2010/10/06 09:28:47  lulin
// {RequestLink:235864089}.
//
// Revision 1.5  2010/09/22 08:59:23  lulin
// {RequestLink:235053347}.
//
// Revision 1.4  2010/09/14 13:12:09  lulin
// {RequestLink:235048134}.
//
// Revision 1.3  2010/07/28 14:47:57  lulin
// {RequestLink:228692580}.
// - выделяем утилитную функию для узнавания того, что работает под 64-разрядной операционной системой.
//
// Revision 1.2  2008/09/10 13:12:27  lulin
// - <K>: 88080895.
//
// Revision 1.1  2005/05/27 12:06:04  lulin
// - убраны лишние зависимости.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  l3Interfaces
  ;

function l3GetCursorPos(var lpPoint: TPoint): WinBOOL;
  stdcall;
  {-}
function l3RegisterDragDrop(wnd: HWnd; dropTarget: IDropTarget): HResult;
  stdcall;
  {-}
function l3DoDragDrop(dataObj: IDataObject; dropSource: IDropSource;
  dwOKEffects: Longint; var dwEffect: Longint): HResult;
  stdcall;
  {-}
function l3RevokeDragDrop(wnd: HWnd): HResult;
  stdcall;
  {-}
procedure l3ReleaseStgMedium(var medium: Tl3StoragePlace);
  stdcall;
  {-}
function l3OleInitialize(pwReserved: Pointer = nil): HResult;
  stdcall;
  {-}
procedure l3OleUninitialize;
  stdcall;
  {-}
procedure OleCheck(Result: HResult);
  {-}
function OleGetClipboard(out dataObj: IDataObject): HResult;
  stdcall;
  {-}
function l3Is64System: Boolean;
  {-}
function l3NeedsHackFor64System: Boolean;
  {-}
function l3IsRemoteSession: Boolean;
  {-}
procedure ImmDisableIME;
  {-}
function l3IsTimeElapsed(aStartTime : Longword; aTimeOut : Longword) : boolean;
  {-}
function l3WTSGetActiveConsoleSessionId: DWORD; stdcall;

implementation

uses
  ComObj,
  //Windows,
  SysUtils
  ;

const
{$IFDEF MSWINDOWS}
  advapi32  = 'advapi32.dll';
  kernel32  = 'kernel32.dll';
  mpr       = 'mpr.dll';
  {$EXTERNALSYM version}
  version   = 'version.dll';
  comctl32  = 'comctl32.dll';
  gdi32     = 'gdi32.dll';
  opengl32  = 'opengl32.dll';
  user32    = 'user32.dll';
  wintrust  = 'wintrust.dll';
  msimg32   = 'msimg32.dll';
{$ENDIF}
{$IFDEF LINUX}
  advapi32  = 'libwine.borland.so';
  kernel32  = 'libwine.borland.so';
  mpr       = 'libmpr.borland.so';
  version   = 'libversion.borland.so';
  {$EXTERNALSYM version}
  comctl32  = 'libcomctl32.borland.so';
  gdi32     = 'libwine.borland.so';
  opengl32  = 'libopengl32.borland.so';
  user32    = 'libwine.borland.so';
  wintrust  = 'libwintrust.borland.so';
  msimg32   = 'libmsimg32.borland.so';
{$ENDIF}
{$IFDEF MSWINDOWS}
  ole32    = 'ole32.dll';
  oleaut32 = 'oleaut32.dll';
  olepro32 = 'olepro32.dll';
{$ENDIF}
{$IFDEF LINUX}
  ole32    = 'libole32.borland.so';
  oleaut32 = 'liboleaut32.borland.so';
  olepro32 = 'libolepro32.borland.so';
{$ENDIF}

function l3RegisterDragDrop;
  external ole32 name 'RegisterDragDrop';
  {-}
function l3DoDragDrop;
  external ole32 name 'DoDragDrop';
  {-}
function l3RevokeDragDrop;
  external ole32 name 'RevokeDragDrop';
  {-}
function l3GetCursorPos;
  external user32 name 'GetCursorPos';
  {-}
procedure l3ReleaseStgMedium;
  external ole32 name 'ReleaseStgMedium';
  {-}
function l3OleInitialize;
  external ole32 name 'OleInitialize';
  {-}
procedure l3OleUninitialize;
  external ole32 name 'OleUninitialize';
  {-}
function OleGetClipboard;
  {-}
  external ole32 name 'OleGetClipboard';

procedure OleCheck(Result: HResult);
begin
 ComObj.OleCheck(Result);
end;

function l3Is64System: Boolean;
type
 TIsWow64Process = function (handle:THandle;var x64:Windows.BOOL): Windows.BOOL; stdcall;
{$WriteableConst On}
const
 Inited : Boolean = false;
 l_Is     : Boolean = false;
{$WriteableConst Off}
var
 l_DLL : THandle;
 l_P   : TIsWow64Process;
 l_x64 : Windows.BOOL;
begin
 if not Inited then
 begin
  Inited := true;
  l_DLL := LoadLibrary('kernel32');
  try
   if (l_DLL <> 0) then
   begin
    l_P := GetProcAddress(l_DLL, 'IsWow64Process');
    if Assigned(l_P) then
     if l_P(GetCurrentProcess, l_x64) then
      l_Is := l_x64
     else
      Assert(false);
   end;//l_DLL <> 0
  finally
   FreeLibrary(l_DLL);
  end;//try..finally
 end;//not Inited
 Result := l_Is;
end;

function l3NeedsHackFor64System: Boolean;
  {-}
begin
 Result := false;
 if (Win32Platform = VER_PLATFORM_WIN32_NT) then
  if (Win32MajorVersion >= 5{6}) then
                        // ^ - потому что под терминалом почему-то возвращается 5
                        // "почему-то" - там и 3 может быть :-) если "режим совместимости"
                        // руками поставить
  // - Vista
   if l3Is64System then
    Result := true;
end;

function l3IsRemoteSession: Boolean;
const
  sm_RemoteSession = $1000;
begin
 Result := GetSystemMetrics(sm_RemoteSession) <> 0;
end;

procedure ImmDisableIME;
  {-}

 function _ImmDisableIME(idThread: DWORD): BOOL;
 type
  TProcType = function (idThread: DWORD): BOOL; stdcall;
 var
  l_ProcAddress: Pointer;
  l_Lib : THandle;
 begin//_ImmDisableIME
  l_Lib := LoadLibrary('Imm32.dll');
  if (l_Lib <> 0) then
   try
    l_ProcAddress := GetProcAddress(l_Lib, 'ImmDisableIME');
    if not Assigned(l_ProcAddress) then
     Result := true
    else
     Result := TProcType(l_ProcAddress)(idThread);
   finally
    FreeLibrary(l_Lib);
   end//try..finally
  else
   Result := true; 
 end;//_ImmDisableIME

begin
 _ImmDisableIME({DWORD(-1)}GetCurrentThreadID);
end;
    
function l3IsTimeElapsed(aStartTime : Longword; aTimeOut : Longword) : boolean;
var
 lCurTime : Longword;
begin
 lCurTime := GetTickCount;
 if aStartTime > lCurTime then // перевалили за High(Longword)
  Result := (High(Longword) - aStartTime + lCurTime) > aTimeOut
 else
  Result := (lCurTime - aStartTime) > aTimeOut;
end;

procedure GetProcedureAddress(var P: Pointer; const ModuleName, ProcName: string);
var
  ModuleHandle: HMODULE;
begin
  if not Assigned(P) then
  begin
    {$IfDef XE}
    ModuleHandle := GetModuleHandle(PChar(ModuleName));
    {$Else  XE}
    ModuleHandle := GetModuleHandle(PAnsiChar(ModuleName));
    {$EndIf XE}
    if ModuleHandle = 0 then
    begin
      {$IfDef XE}
      ModuleHandle := LoadLibrary(PChar(ModuleName));
      {$Else  XE}
      ModuleHandle := LoadLibrary(PAnsiChar(ModuleName));
      {$EndIf XE}
      if ModuleHandle = 0 then raise {EJwaLoadLibraryError}Exception.Create('Library not found: ' + ModuleName);
    end;
    P := GetProcAddress(ModuleHandle, PAnsiChar(ProcName));
    if not Assigned(P) then raise {EJwaGetProcAddressError}Exception.Create('Function not found: ' + ModuleName + '.' + ProcName);
  end;
end;

var
  _WTSGetActiveConsoleSessionId: Pointer;

function l3WTSGetActiveConsoleSessionId: DWORD; stdcall;
begin
  GetProcedureAddress(_WTSGetActiveConsoleSessionId, kernel32, 'WTSGetActiveConsoleSessionId');
  asm
    mov esp, ebp
    pop ebp
    jmp [_WTSGetActiveConsoleSessionId]
  end;
end;

end.

