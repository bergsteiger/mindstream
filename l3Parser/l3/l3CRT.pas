unit l3CRT;

{ $Id: l3CRT.pas,v 1.4 2014/02/13 10:53:59 lulin Exp $ }

// $Log: l3CRT.pas,v $
// Revision 1.4  2014/02/13 10:53:59  lulin
// - рефакторим безликие списки.
//
// Revision 1.3  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.2  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.1  2012/01/11 11:03:09  voba
// - k: 326771281
//

{$I vtDefine.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  l3Base,
  l3ProtoObject
  ;

type
  Tl3CRT = class(Tl3ProtoObject)
  protected
   fConHandle : THandle; // Дескриптор консольного окна
   fMaxX : Word;
   fMaxY : Word; // Для хранения максимальных размеров окна
  public
   constructor Create;

   function GetConInputHandle : THandle;
    {- Получение дескриптора для консольного ввода}

   function GetConOutputHandle : THandle;
    {- Получение дескриптора для консольного вывода}

   procedure GotoXY(X, Y : Word);
    {- Установка курсора в координаты X, Y}

   procedure Cls;
    {- Очистка экрана - заполнение его пробелами}

   procedure ShowCursor(Show : Bool);
    {- Показываем/Скрываем курсор}

   procedure ReWrite(const aStr : String);
    {- переписывает содержимое текущей строки консоли}
  end;

var
 CRT : Tl3CRT;

implementation

function Coord(X, Y : Word): TCoord;
begin
 Result.X := X;
 Result.Y := Y;
end;

constructor Tl3CRT.Create;
var
 lCoord: TCoord;
begin
 Inherited Create;
  // Получаем дескриптор вывода (output)
 fConHandle := GetConOutputHandle;
 // Получаем максимальные размеры окна
 lCoord := GetLargestConsoleWindowSize(fConHandle);
 fMaxX := lCoord.X;
 fMaxY := lCoord.Y;
 ShowCursor(False);
end;

function Tl3CRT.GetConInputHandle : THandle;
{- Получение дескриптора для консольного ввода}
begin
  Result := GetStdHandle(STD_INPUT_HANDLE)
end;

function Tl3CRT.GetConOutputHandle : THandle;
{- Получение дескриптора для консольного вывода}
begin
  Result := GetStdHandle(STD_OUTPUT_HANDLE)
end;

procedure Tl3CRT.GotoXY(X, Y : Word);
{- Установка курсора в координаты X, Y}
begin
  SetConsoleCursorPosition(fConHandle, Coord(X, Y));
end;

procedure Tl3CRT.Cls;
{- Очистка экрана - заполнение его пробелами}
var
 lNOAW: DWORD; // Для хранения результатов некоторых функций
begin
  FillConsoleOutputCharacter(fConHandle, ' ', fMaxX * fMaxY, Coord(0, 0), lNOAW);
  GotoXY(0, 0);
end;

procedure Tl3CRT.ShowCursor(Show : Bool);
{- Показываем/Скрываем курсор}
var
 CCI: TConsoleCursorInfo;
begin
  CCI.bVisible := Show;
  SetConsoleCursorInfo(fConHandle, CCI);
end;

procedure Tl3CRT.ReWrite(const aStr : String);
{- переписывает содержимое текущей строки консоли}
var
 lpConsoleScreenBufferInfo: TConsoleScreenBufferInfo;
 lNOAW: DWORD; // Для хранения результатов некоторых функций
 lLen : Integer;
begin
 GetConsoleScreenBufferInfo(fConHandle, lpConsoleScreenBufferInfo);

 lLen := Length(aStr);
 with lpConsoleScreenBufferInfo do
 begin
  if lLen < dwCursorPosition.X then //подтираем хвост предыдущей надписи если она была длиннее
   FillConsoleOutputCharacter(fConHandle, ' ', dwCursorPosition.X - lLen, Coord(lLen, dwCursorPosition.Y), lNOAW);
  GotoXY(0, dwCursorPosition.Y);
  Write(aStr);
 end;
end;


initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3CRT.pas initialization enter'); {$EndIf}
 CRT := Tl3CRT.Create;

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3CRT.pas initialization leave'); {$EndIf}
finalization
 FreeAndNil(CRT);
end.

(*

SetConsoleCtrlHandler(@ConProc, False);
Cls;
//
// "Цикл обработки сообщений"
//
Continue := True;
while Continue do
begin
  ReadConsoleInput(GetConInputHandle, IBuff, 1, IEvent);
  case IBuff.EventType of
    KEY_EVENT :
      begin
        // Проверяем клавишу ESC и завершаем программу
        if ((IBuff.KeyEvent.bKeyDown = True) and
        (IBuff.KeyEvent.wVirtualKeyCode = VK_ESCAPE)) then
          Continue := False;
      end;
    _MOUSE_EVENT :
      begin
        with IBuff.MouseEvent.dwMousePosition do
          StatusLine(Format('%d, %d', [X, Y]));
      end;
  end;
end {While}


Так же можно добавить "обработчик событий" и перехватывать такие комбинации клавиш как Ctrl+C и Ctrl+Break:

//-----------------------------------------------------
// Обработчик консольных событий
//-----------------------------------------------------
function ConProc(CtrlType: DWord): Bool; stdcall; far;
var
  S: string;
begin
  case CtrlType of
    CTRL_C_EVENT: S := 'CTRL_C_EVENT';
    CTRL_BREAK_EVENT: S := 'CTRL_BREAK_EVENT';
    CTRL_CLOSE_EVENT: S := 'CTRL_CLOSE_EVENT';
    CTRL_LOGOFF_EVENT: S := 'CTRL_LOGOFF_EVENT';
    CTRL_SHUTDOWN_EVENT: S := 'CTRL_SHUTDOWN_EVENT';
    else
      S := 'UNKNOWN_EVENT';
  end;
  MessageBox(0, PChar(S + ' detected'), 'Win32 Console', MB_OK);
  Result := True;
end;


Чтобы посмотреть всё это в действии, я сделал небольшую демонстрационную программу, которая содержит подпрограммы, приведённые выше, а так же некоторые другие возможности. Далее приведён полный исходный код этого приложения. Наслаждайтесь!

{
[]-----------------------------------------------------------[]
CON001 - Show various Console API functions. Checked with Win95

version 1.01

by Alex G. Fedorov, May-July, 1997
alexfedorov@geocities.com

09-Jul-97 some minor corrections (shown in comments)
[]-----------------------------------------------------------[]
}
program Con001;

{$APPTYPE CONSOLE}

uses
  Windows, SysUtils;

const
  // Некоторые стандартные цвета
  YellowOnBlue = FOREGROUND_GREEN or FOREGROUND_RED or
  FOREGROUND_INTENSITY or BACKGROUND_BLUE;
  WhiteOnBlue = FOREGROUND_BLUE or FOREGROUND_GREEN or
  FOREGROUND_RED or FOREGROUND_INTENSITY or
  BACKGROUND_BLUE;

  RedOnWhite = FOREGROUND_RED or FOREGROUND_INTENSITY or
  BACKGROUND_RED or BACKGROUND_GREEN or BACKGROUND_BLUE
  or BACKGROUND_INTENSITY;

  WhiteOnRed = BACKGROUND_RED or BACKGROUND_INTENSITY or
  FOREGROUND_RED or FOREGROUND_GREEN or FOREGROUND_BLUE
  or FOREGROUND_INTENSITY;

var
  ConHandle: THandle; // Дескриптор консольного окна
  Coord: TCoord; // Для хранения/установки позиции экрана
  MaxX, MaxY: Word; // Для хранения максимальных размеров окна
  CCI: TConsoleCursorInfo;
  NOAW: LongInt; // Для хранения результатов некоторых функций


//---------------------------------------
// рисуем строку статуса ("status line")
//---------------------------------------
procedure StatusLine(S : string);
begin
  Coord.X := 0; Coord.Y := 0;
  WriteConsoleOutputCharacter(ConHandle, PChar(S), Length(S)+1, Coord, NOAW);
  FillConsoleOutputAttribute (ConHandle, WhiteOnRed, Length(S), Coord, NOAW);
end;

//-----------------------------------------------------
// Консольный обработчик событий
//-----------------------------------------------------
function ConProc(CtrlType : DWord) : Bool; stdcall; far;
var
  S: string;
begin
  case CtrlType of
    CTRL_C_EVENT: S := 'CTRL_C_EVENT';
    CTRL_BREAK_EVENT: S := 'CTRL_BREAK_EVENT';
    CTRL_CLOSE_EVENT: S := 'CTRL_CLOSE_EVENT';
    CTRL_LOGOFF_EVENT: S := 'CTRL_LOGOFF_EVENT';
    CTRL_SHUTDOWN_EVENT: S := 'CTRL_SHUTDOWN_EVENT';
    else
      S := 'UNKNOWN_EVENT';
  end;
  MessageBox(0, PChar(S + ' detected'), 'Win32 Console', MB_OK);
  Result := True;
end;

{
[]-----------------------------------------------------------[]
Основная программа - показывает использование некоторых подпрограмм
а так же некоторых функций консольного API
[]-----------------------------------------------------------[]
}
var
  R: TSmallRect;
  Color: Word;
  OSVer: TOSVersionInfo;
  IBuff: TInputRecord;
  IEvent: DWord;
  Continue: Bool;

begin
  // Инициализация глобальных переменных
  Init;
  // Расположение окна на экране
  {!! 1.01 !!}
  with R do
  begin
    Left := 10;
    Top := 10;
    Right := 40;
    Bottom := 40;
  end

  {!! 1.01 !!}
  SetConsoleWindowInfo(ConHandle, False, R);
  // Устанавливаем обработчик событий
  SetConsoleCtrlHandler(@ConProc, True);
  // Проверяем обработчик событий
  GenerateConsoleCtrlEvent(CTRL_C_EVENT, 0);
  // Изменяем заголовок окна
  SetConsoleTitle('Console Demo');
  // Прячем курсор
  ShowCursor(False);
  Coord.X := 0; Coord.Y := 0;
  // Устанавливаем белый текст на синем фоне
  Color := WhiteOnBlue;
  FillConsoleOutputAttribute(ConHandle, Color, MaxX * MaxY, Coord, NOAW);
  // Console Code Page API is not supported under Win95 - only GetConsoleCP
  Writeln('Console Code Page = ', GetConsoleCP);
  Writeln('Max X=', MaxX,' Max Y=', MaxY);
  Readln; // ожидаем ввода пользователя
  Cls; // очищаем экран
  ShowCursor(True); // показываем курсор

  // Use some Win32API stuff
  OSVer.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(OSVer);
  with OSVer do
  begin
    Writeln('dwMajorVersion = ', dwMajorVersion);
    Writeln('dwMinorVersion = ', dwMinorVersion);
    Writeln('dwBuildNumber = ', dwBuildNumber);
    Writeln('dwPlatformID = ', dwPlatformID);
  end;

  // ожидаем ввода пользователя
  Readln;
  // Удаляем обработчик событий
  SetConsoleCtrlHandler(@ConProc, False);
  Cls;

  // "Цикл обработки сообщений"
  Continue := True;
  while Continue do
  begin
    ReadConsoleInput(GetConInputHandle, IBuff, 1, IEvent);
    case IBuff.EventType of
      KEY_EVENT :
        begin
          // Проверяем клавишу ESC и завершаем программу
          if ((IBuff.KeyEvent.bKeyDown = True) and
          (IBuff.KeyEvent.wVirtualKeyCode = VK_ESCAPE)) then
            Continue := False;
        end;
      _MOUSE_EVENT :
        begin
          with IBuff.MouseEvent.dwMousePosition do
            StatusLine(Format('%d, %d', [X, Y]));
        end;
    end;
  end {While}
end. *)

