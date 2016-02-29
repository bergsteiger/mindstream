unit Windows;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "Rtl"
// Модуль: "w:/common/components/rtl/external/NotFinished/Borland/Delphi/Rtl/Win/Windows.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Core::Rtl::Win::Windows
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

interface

uses
  Types
  ;

type
 PLongint = System.PLongint;

const
  { CodePages }
 CP_ACP = !;
 CP_OEMCP = !;

type
 hWnd = type Cardinal;

 HPALETTE = type Cardinal;

 HMETAFILE = type Cardinal;

 HFONT = type Cardinal;

 PInteger = ^Integer;

 LPARAM = Integer;

 WPARAM = Integer;

 hRgn = Cardinal;
  {* Регион. }

 HANDLE = Cardinal;

 THandle = HANDLE;

 HGLOBAL = THandle;

 TMsg = record
 end;//TMsg

 hDC = HANDLE;
  {* Контекст устройства вывода. }

 TPoint = record
  {* Точка. }
 end;//TPoint

 HHOOK = HANDLE;

 TTextMetric = record
 end;//TTextMetric

 PTextMetric = TTextMetric;
  {* Указатель на TTextMetric. }

 TDeviceModeA = record
 end;//TDeviceModeA

 PDeviceModeA = ^TDeviceModeA;

 PDeviceMode = PDeviceModeA;

const
  { Memory Manipulation }
 PAGE_NOACCESS = 1;
 PAGE_READONLY = 2;
 PAGE_READWRITE = 4;
 PAGE_WRITECOPY = 8;
 PAGE_EXECUTE = $10;
 PAGE_EXECUTE_READ = $20;
 PAGE_EXECUTE_READWRITE = $40;
 PAGE_EXECUTE_WRITECOPY = $80;
 PAGE_GUARD = $100;
 PAGE_NOCACHE = $200;
  { Key Codes }
 VK_APPS = !;
  { CharSets }
 ANSI_CHARSET = 1;
 OEM_CHARSET = !;
 DEFAULT_CHARSET = !;
 RUSSIAN_CHARSET = !;
  { Device Caps }
 HORZRES = !;

type
 DWORD = Types.DWORD;

 TRTLCriticalSection = record
 end;//TRTLCriticalSection

const
  { Timeouts }
 INFINITE : DWORD = $FFFFFFFF;

type
 UINT = System.LongWord;

 LCID = Cardinal;
  {* Идентификатор локали. }

const
  { Chars }
 VK_ESCAPE = !;
  { Clipboard Formats }
 CF_LOCALE = !;
  { ShowWindow() Commands }
 SW_HIDE = 0;
 SW_SHOWNORMAL = 1;
 SW_NORMAL = 1;
 SW_SHOWMINIMIZED = 2;
 SW_SHOWMAXIMIZED = 3;
 SW_MAXIMIZE = 3;
 SW_SHOWNOACTIVATE = 4;
 SW_SHOW = 5;
 SW_MINIMIZE = 6;
 SW_SHOWMINNOACTIVE = 7;
 SW_SHOWNA = 8;
 SW_RESTORE = 9;
 SW_SHOWDEFAULT = 10;
 SW_MAX = 10;

type
 HWND = hWnd;

 TCWPStruct = record
 end;//TCWPStruct

 PCWPStruct = ^TCWPStruct;

 TInput = record
 end;//TInput

 TCWPRetStruct = record
 end;//TCWPRetStruct

 PCWPRetStruct = ^TCWPRetStruct;

 TMouseHookStruct = record
 end;//TMouseHookStruct

 PMouseHookStruct = ^TMouseHookStruct;

 LRESULT = Integer;

 TBlendFunction = record
   BlendOp : Byte;
   BlendFlags : Byte;
   SourceConstantAlpha : Byte;
   AlphaFormat : Byte;
 end;//TBlendFunction

 TScrollInfo = record
 end;//TScrollInfo

 PMsg = ^TMsg;

 TEnhMetaHeader = ;

 TFileTime = record
 end;//TFileTime

 TMetaHeader = ;

 TSmallRect = record
 end;//TSmallRect

 PSmallRect = ^TSmallRect;

 HCURSOR = ;

const
  { Invalid Values }
 INVALID_HANDLE_VALUE = DWORD(-1);
 INVALID_FILE_SIZE = DWORD($FFFFFFFF);

function TerminateProcess(hProcess: HANDLE;
  uExitCode: UINT): BOOL;
   {* The TerminateProcess function terminates the specified process and all of its threads. }
function GetCurrentProcess: HANDLE; overload; 
   {* The GetCurrentProcess function returns a pseudohandle for the current process. }
procedure CreateProcess;
   {* Сигнатура метода CreateProcess }
procedure GetTickCount;
   {* Сигнатура метода GetTickCount }
procedure SetFocus;
   {* Сигнатура метода SetFocus }
procedure SendMessage;
   {* Сигнатура метода SendMessage }
procedure GetFocus;
   {* Сигнатура метода GetFocus }
procedure CreateRoundRectRgn;
   {* Сигнатура метода CreateRoundRectRgn }
procedure WinExec;
   {* Сигнатура метода WinExec }
procedure WindowFromPoint;
   {* Сигнатура метода WindowFromPoint }
procedure PostMessage;
   {* Сигнатура метода PostMessage }
procedure GetForegroundWindow;
   {* Сигнатура метода GetForegroundWindow }
procedure GetCurrentProcess; overload; 
   {* Сигнатура метода GetCurrentProcess }
procedure GetWindowThreadProcessId;
   {* Сигнатура метода GetWindowThreadProcessId }
procedure GlobalLock;
   {* Сигнатура метода GlobalLock }
procedure CopyRect;
   {* Сигнатура метода CopyRect }
procedure RGB;
   {* Сигнатура метода RGB }
procedure QueryPerformanceCounter;
   {* Сигнатура метода QueryPerformanceCounter }
procedure QueryPerformanceFrequency;
   {* Сигнатура метода QueryPerformanceFrequency }

implementation

// unit methods

procedure IsWindowEnabled;
//#UC START# *4DCD6C0402E8_48A41FF10094_var*
//#UC END# *4DCD6C0402E8_48A41FF10094_var*
begin
//#UC START# *4DCD6C0402E8_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DCD6C0402E8_48A41FF10094_impl*
end;//IsWindowEnabled

procedure CreateProcess;
//#UC START# *4B2B7A6C004E_48A41FF10094_var*
//#UC END# *4B2B7A6C004E_48A41FF10094_var*
begin
//#UC START# *4B2B7A6C004E_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B2B7A6C004E_48A41FF10094_impl*
end;//CreateProcess

procedure GetTickCount;
//#UC START# *4BEA8FE9008B_48A41FF10094_var*
//#UC END# *4BEA8FE9008B_48A41FF10094_var*
begin
//#UC START# *4BEA8FE9008B_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4BEA8FE9008B_48A41FF10094_impl*
end;//GetTickCount

procedure SetFocus;
//#UC START# *4C3F434301AA_48A41FF10094_var*
//#UC END# *4C3F434301AA_48A41FF10094_var*
begin
//#UC START# *4C3F434301AA_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4C3F434301AA_48A41FF10094_impl*
end;//SetFocus

procedure SendMessage;
//#UC START# *4D6E60D6024F_48A41FF10094_var*
//#UC END# *4D6E60D6024F_48A41FF10094_var*
begin
//#UC START# *4D6E60D6024F_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4D6E60D6024F_48A41FF10094_impl*
end;//SendMessage

procedure GetFocus;
//#UC START# *4DDE2C4C01CD_48A41FF10094_var*
//#UC END# *4DDE2C4C01CD_48A41FF10094_var*
begin
//#UC START# *4DDE2C4C01CD_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DDE2C4C01CD_48A41FF10094_impl*
end;//GetFocus

procedure CreateRoundRectRgn;
//#UC START# *4E270C21028E_48A41FF10094_var*
//#UC END# *4E270C21028E_48A41FF10094_var*
begin
//#UC START# *4E270C21028E_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4E270C21028E_48A41FF10094_impl*
end;//CreateRoundRectRgn

procedure WinExec;
//#UC START# *4EA036FE0056_48A41FF10094_var*
//#UC END# *4EA036FE0056_48A41FF10094_var*
begin
//#UC START# *4EA036FE0056_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4EA036FE0056_48A41FF10094_impl*
end;//WinExec

procedure WindowFromPoint;
//#UC START# *4F8549470227_48A41FF10094_var*
//#UC END# *4F8549470227_48A41FF10094_var*
begin
//#UC START# *4F8549470227_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F8549470227_48A41FF10094_impl*
end;//WindowFromPoint

procedure PostMessage;
//#UC START# *4F8C0CE20242_48A41FF10094_var*
//#UC END# *4F8C0CE20242_48A41FF10094_var*
begin
//#UC START# *4F8C0CE20242_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F8C0CE20242_48A41FF10094_impl*
end;//PostMessage

procedure GetForegroundWindow;
//#UC START# *4F9ACA0D01CA_48A41FF10094_var*
//#UC END# *4F9ACA0D01CA_48A41FF10094_var*
begin
//#UC START# *4F9ACA0D01CA_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F9ACA0D01CA_48A41FF10094_impl*
end;//GetForegroundWindow

procedure GetCurrentProcess;
//#UC START# *4F9ACCD0030C_48A41FF10094_var*
//#UC END# *4F9ACCD0030C_48A41FF10094_var*
begin
//#UC START# *4F9ACCD0030C_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F9ACCD0030C_48A41FF10094_impl*
end;//GetCurrentProcess

procedure GetWindowThreadProcessId;
//#UC START# *4F9ACCFA00E9_48A41FF10094_var*
//#UC END# *4F9ACCFA00E9_48A41FF10094_var*
begin
//#UC START# *4F9ACCFA00E9_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *4F9ACCFA00E9_48A41FF10094_impl*
end;//GetWindowThreadProcessId

procedure GlobalLock;
//#UC START# *500D2FBD0047_48A41FF10094_var*
//#UC END# *500D2FBD0047_48A41FF10094_var*
begin
//#UC START# *500D2FBD0047_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *500D2FBD0047_48A41FF10094_impl*
end;//GlobalLock

procedure CopyRect;
//#UC START# *502CE5D0026E_48A41FF10094_var*
//#UC END# *502CE5D0026E_48A41FF10094_var*
begin
//#UC START# *502CE5D0026E_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *502CE5D0026E_48A41FF10094_impl*
end;//CopyRect

procedure RGB;
//#UC START# *503C7FEF0075_48A41FF10094_var*
//#UC END# *503C7FEF0075_48A41FF10094_var*
begin
//#UC START# *503C7FEF0075_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *503C7FEF0075_48A41FF10094_impl*
end;//RGB

procedure QueryPerformanceCounter;
//#UC START# *548008E60336_48A41FF10094_var*
//#UC END# *548008E60336_48A41FF10094_var*
begin
//#UC START# *548008E60336_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *548008E60336_48A41FF10094_impl*
end;//QueryPerformanceCounter

procedure QueryPerformanceFrequency;
//#UC START# *548008FA01FD_48A41FF10094_var*
//#UC END# *548008FA01FD_48A41FF10094_var*
begin
//#UC START# *548008FA01FD_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *548008FA01FD_48A41FF10094_impl*
end;//QueryPerformanceFrequency

function TerminateProcess(hProcess: HANDLE;
  uExitCode: UINT): BOOL;
//#UC START# *48A4207A03C1_48A41FF10094_var*
//#UC END# *48A4207A03C1_48A41FF10094_var*
begin
//#UC START# *48A4207A03C1_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *48A4207A03C1_48A41FF10094_impl*
end;//TerminateProcess

function GetCurrentProcess: HANDLE;
//#UC START# *48A420D30305_48A41FF10094_var*
//#UC END# *48A420D30305_48A41FF10094_var*
begin
//#UC START# *48A420D30305_48A41FF10094_impl*
 !!! Needs to be implemented !!!
//#UC END# *48A420D30305_48A41FF10094_impl*
end;//GetCurrentProcess

end.