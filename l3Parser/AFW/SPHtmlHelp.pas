unit SPHTMLHelp;

{*******************************************************}
{                                                       }
{        HTML HELP VIEWER UTILITY FOR Delphi 6,7        }
{                   FOR MS Windows                      }
{              Copyright (c) 2002 SP&Co                 }
{                       v 1.3                           }
{                   radiosoft@mail.ru                   }
{                     Maltsev Sergey                    }
{                                                       }
{*******************************************************}

{ $Id: SPHtmlHelp.pas,v 1.9 2014/05/16 17:08:14 kostitsin Exp $ }

// $Log: SPHtmlHelp.pas,v $
// Revision 1.9  2014/05/16 17:08:14  kostitsin
// {requestlink: 535346886 }
//
// Revision 1.8  2014/05/15 11:46:20  kostitsin
// {requestlink: 533090776 }
//
// Revision 1.7  2013/12/26 08:32:21  fireton
// - доработана функция подбора пути к файлу справки
//
// Revision 1.6  2013/07/01 06:36:42  lulin
// - чистка кода.
//
// Revision 1.5  2013/04/24 09:35:36  lulin
// - портируем.
//
// Revision 1.4  2012/11/01 09:41:22  lulin
// - забыл точку с запятой.
//
// Revision 1.3  2012/11/01 07:42:26  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.2  2010/06/11 09:15:40  migel
// - fix: снимаем атрибут `ReadOnly` (для случая неудачного копирования).
//
// Revision 1.1  2009/09/14 11:27:54  lulin
// - выводим пути и для незавершённых модулей.
//
// Revision 1.20  2008/04/14 12:59:45  migel
// - fix: не определяем макрос второй раз (если он был определен в настройках проекта).
//
// Revision 1.19  2008/02/06 09:14:29  oman
// - new: В случае отсутствия файла помощи бросаем исключение (cq28369)
//
// Revision 1.18  2007/04/20 07:44:44  migel
// - add: снаятие атрибута `read-only` перед удалением файла.
//
// Revision 1.17  2007/04/19 11:03:18  migel
// - add: ищем файл помощи также на текущем уровне в каталоге `help`.
//
// Revision 1.16  2007/04/17 15:57:18  migel
// - add: возможность работы с несколькими chm-файлами (пока в процессе исследования/доработки).
//
// Revision 1.15  2007/04/16 07:11:20  migel
// - change: включили (для Немезиса) поддержку копирования файла помощи на локальный диск.
// - change: улучшили обработку ошибочных ситуаций.
//
// Revision 1.14  2007/04/13 15:13:05  migel
// - add: функциональность, позволяющая показывать хелп путем копирования его в локальный временный каталог (пока disabled).
//
// Revision 1.13  2007/04/13 10:34:33  migel
// - change: стайлинг.
//
// Revision 1.12  2005/04/16 10:43:51  lulin
// - для опции D- выключаем всякую трассировку.
//
// Revision 1.11  2005/04/15 13:15:35  demon
// - fix: добавлены дефайны для нормальной компиляции с опцией l3NoTrace
//
// Revision 1.10  2005/03/03 14:37:54  migel
// - change: возвращаем имя к файлу помощи с полным путем к нему (раньше хелп искался в текущем каталоге, который мог быть сменен из приложения).
// - refactoring/optimization: оптимизация работы со строками (сохраняем строчку в локальной переменной один раз и дальше используем ее).
//
// Revision 1.9  2004/11/05 15:45:06  lulin
// - для Delphi 6 не проверяем число оставшихся ссылок на объект.
//
// Revision 1.8  2004/11/05 15:37:10  lulin
// - для Delphi 6 не проверяем число оставшихся ссылок на объект.
//
// Revision 1.7  2004/10/06 17:33:59  lulin
// - вставлены директивы CVS.
//

{$Include l3Define.inc }

{$IFDEF NEMESIS}
 {$IFNDEF USE_TEMP_CACHING}
  {$DEFINE USE_TEMP_CACHING} // Always copy any chm-help file to local temp folder and use local copy of it
 {$ENDIF USE_TEMP_CACHING}
{$ENDIF NEMESIS}

interface

{$Include l3XE.inc}

uses  Windows, Messages, SysUtils, Classes, Forms,  WinHelpViewer, HelpIntfs, HTMLHelpAPI;

var
   HtmlHelpA: THtmlHelpA;
   HHCTRL: THandle;

procedure SPCorrectHelpFileName;

implementation

uses
  spHelpNotifyManager,
  l3Base
{$IFDEF USE_TEMP_CACHING}
  , l3FileUtils
  , l3ValLst
  , ComObj // Used for generation of unique (based on GUID) file name only
{$ENDIF USE_TEMP_CACHING}
  ;

const
 c_HelpFileExtension = '.chm';

resourcestring
 hHelpFileNotFound = 'Can''t locate help file';

type
 TSPHelpTester = class(Tl3Base, IWinHelpTester)
 public
  function CanShowALink(const ALink, FileName: String): Boolean;
  function CanShowTopic(const Topic, FileName: String): Boolean;
  function CanShowContext(const Context: Integer; const FileName: String): Boolean;
  function GetHelpStrings(const ALink: String): TStringList;
  function GetHelpPath: String;
  function GetDefaultHelpFile: String;
 end;

procedure SPCorrectHelpFileName;
begin
 with Application do
  if ((HHCTRL = THandle(0)) and (LowerCase(ExtractFileExt(HelpFile)) = c_HelpFileExtension)) then
   HelpFile := '';
end;

procedure TestHelp;
begin
 if HHCtrl=0 then
  Application.MessageBox('Для корректной работы системы помощи необходим'#13'установленный Internet Explorer версии 4 или выше.'#13#13'Система помощи будет недоступна.', 'ВНИМАНИЕ!',mb_ok+mb_iconWarning);
end;

function TSPHelpTester.CanShowALink(const ALink, FileName: String): Boolean;
begin
 Result := False;
end;

function TSPHelpTester.CanShowTopic(const Topic, FileName: String): Boolean;
begin
 Result := False;
end;

function TSPHelpTester.CanShowContext(const Context: Integer; const FileName: String): Boolean;
begin
 Result := false;
end;

function TSPHelpTester.GetHelpStrings(const ALink: String): TStringList;
begin
 Result := nil;
end;

function TSPHelpTester.GetHelpPath: String;
begin
 Result := '';
end;

function TSPHelpTester.GetDefaultHelpFile: String;
begin
 Result := '';
end;

{ =========================================================================== }

type
 TSPHelpViewer = class(Tl3Base, ICustomHelpViewer, IExtendedHelpViewer,ISpecialWinHelpViewer)
 private
  FViewerID: Integer;

  FCurrentHelpFile: String;
  FCurrentHandle: THandle;
 public
  FHelpManager: IHelpManager;

  function HelpFile(const a_FileName: String): String;

  procedure InternalShutDown;

  function  UpdateCurrentHelpFile(const a_HelpFile: String): String;
  procedure UpdateCurrentStatus(const a_Handle: THandle);

  { ICustomHelpViewer }
  function GetViewerName: String;
  function UnderstandsKeyword(const HelpString: String): Integer;
  function GetHelpStrings(const HelpString: String): TStringList;
  function CanShowTableOfContents: Boolean;
  procedure ShowTableOfContents;
  procedure ShowHelp(const a_HelpString: String);
  procedure NotifyID(const ViewerID: Integer);
  procedure SoftShutDown;
  procedure ShutDown;

  { IExtendedHelpViewer }
  function UnderstandsTopic(const Topic: String): Boolean;
  procedure DisplayTopic(const a_Topic: String);
  function UnderstandsContext(const ContextID: Integer; const HelpFileName: String): Boolean;
  procedure DisplayHelpByContext(const a_ContextID: Integer; const a_FileName: String);

  { ISpecialSPHelpViewer }
  function CallWinHelp(Handle: {$IfDef XE}THandle{$Else}LongInt{$EndIf}; const HelpFileName: String; Command: Word; Data: {$IfDef XE}NativeUInt{$Else}LongInt{$EndIf}): Boolean;
  property ViewerID: Integer read FViewerID;
  property HelpManager: IHelpManager read FHelpManager write FHelpManager;
 end;

var
 ViewerName: String = 'HtmlHelp';
{$IFDEF USE_TEMP_CACHING}
 CacheValueList: Tl3ValueList;
{$ENDIF USE_TEMP_CACHING}

function TSPHelpViewer.HelpFile(const a_FileName: String): String;
{$IFDEF USE_TEMP_CACHING}
 function GetTempName: String;
  function GetTempPath: String;
  var
   l_Length: Integer;
  begin
   l_Length := MAX_PATH+ 1;

   SetLength(Result, l_Length);
   SetLength(Result, Windows.GetTempPath(l_Length, PChar(Result)));

   l_Length := Length(Result);

   if ((l_Length > 0) and (Result[l_Length] = '\')) then
    SetLength(Result, Pred(l_Length));
  end;
 begin
  Result := Format('%s\%s'+c_HelpFileExtension, [GetTempPath, CreateClassID]);
 end;
{$ENDIF USE_TEMP_CACHING}
var
 l_ExePath: string;
 l_FileName: String;
 l_FullName: String;
{$IFDEF USE_TEMP_CACHING}
 l_TempName: String;
{$ENDIF USE_TEMP_CACHING}
begin
 Result := '';

 if (a_FileName = '') then
  l_FileName := Application.HelpFile
 else
  l_FileName := a_FileName;

 if (Assigned(FHelpManager) and (l_FileName = '')) then
  l_FileName := HelpManager.GetHelpFile;

 if (l_FileName <> '') then
 begin
  if ExtractFilePath(l_FileName) = '' then // если в имени есть уже путь, то это прямой путь и подбирать ничего не надо
  begin
   l_ExePath := ExtractFileDir(ParamStr(0));
   // если же там только имя файла, пробуем подобрать разные варианты, где этот файл может находиться
   l_FullName := Format('%s\..\help\%s', [l_ExePath, l_FileName]);
   if not (FileExists(l_FullName)) then
   begin
    l_FullName := Format('%s\help\%s', [l_ExePath, l_FileName]);
    if not (FileExists(l_FullName)) then
     l_FullName := Format('%s\%s', [l_ExePath, l_FileName]);
   end;
  end
  else
   l_FullName := l_FileName;
  if FileExists(l_FullName) then
   Result := l_FullName;
 end;

{$IFDEF USE_TEMP_CACHING}
 if ((Result <> '') and Assigned(CacheValueList)) then
  try
   Result := AnsiUpperCase(Result);

   l_TempName := CacheValueList.Values [Result];

   if (l_TempName = '') then
    l_TempName := GetTempName;

   if not(FileExists(l_TempName)) then
    try
     CopyFile(Result, l_TempName, (cmWriteOver or cmNoBakCopy));
    except
     FileSetReadOnly(l_TempName, False);
     DeleteFile(l_TempName);
     raise;
    end;

   CacheValueList.Values [Result] := l_TempName;

   Result := l_TempName;
  except
   Result := ''; // Help not available (disabled) if any error occur
  end;
{$ENDIF USE_TEMP_CACHING}
end;

procedure TSPHelpViewer.InternalShutDown;
begin
 SoftShutDown;

 if Assigned(FHelpManager) then
 begin
  HelpManager.Release(ViewerID);

  if Assigned(FHelpManager) then
   HelpManager := nil;
 end;
end;

function TSPHelpViewer.UpdateCurrentHelpFile(const a_HelpFile: String): String;
begin
 if (FCurrentHelpFile <> a_HelpFile) then
 begin
  HtmlHelpA(0, nil, HH_CLOSE_ALL, 0);
  Sleep(100);
 end;

 FCurrentHelpFile := a_HelpFile;

 Result := a_HelpFile;
end;

procedure TSPHelpViewer.UpdateCurrentStatus(const a_Handle: THandle);
begin
 FCurrentHandle := a_Handle;

 if IsWindow(FCurrentHandle) then
 begin
  SetForegroundWindow(FCurrentHandle);
  TspHelpNotifyManager.Instance.HelpShown;
 end;
end;

{---------------------------------------------------------------------------}
{ TSPHelpViewer - ICustomHelpViewer }

function TSPHelpViewer.GetViewerName: String;
begin
 Result := ViewerName;
end;

function TSPHelpViewer.UnderstandsKeyword(const HelpString: String): Integer;
begin
 Result := 1;
end;

function TSPHelpViewer.GetHelpStrings(const HelpString: String): TStringList;
begin
 Result := TStringList.Create;
 Result.Add(GetViewerName + ': ' + HelpString);
end;

function TSPHelpViewer.CanShowTableOfContents: Boolean;
begin
 Result := True;
end;

procedure TSPHelpViewer.ShowTableOfContents;
var
 l_HelpFile: String;
begin
 l_HelpFile := HelpFile('');

 if (l_HelpFile <> '') then
  UpdateCurrentStatus(HtmlHelpA(HelpManager.GetHandle, PChar(UpdateCurrentHelpFile(l_HelpFile)), HH_DISPLAY_TOC, 0))
 else
  raise EHelpSystemException.CreateRes(@hHelpFileNotFound);
end;

procedure TSPHelpViewer.ShowHelp(const a_HelpString: String);
var
 l_HelpFile: String;
begin
 l_HelpFile := HelpFile('');

 if (l_HelpFile <> '') then
  UpdateCurrentStatus(HtmlHelpA(HelpManager.GetHandle, PChar(UpdateCurrentHelpFile(l_HelpFile)), HH_DISPLAY_TOPIC, Longint(PChar(Format('page-%s.htm', [a_HelpString])))))
 else
  raise EHelpSystemException.CreateRes(@hHelpFileNotFound);
end;

procedure TSPHelpViewer.NotifyID(const ViewerID: Integer);
begin
 FViewerID := ViewerID;
end;

procedure TSPHelpViewer.SoftShutDown;
begin
 if IsWindow(FCurrentHandle) then
  SendMessage(FCurrentHandle, WM_CLOSE, 0, 0);
end;

procedure TSPHelpViewer.ShutDown;
begin
 SoftShutDown;

 if Assigned(FHelpManager) then
  HelpManager := nil;

 if Assigned(WinHelpTester) then
  WinHelpTester := nil;
end;

{-----------------------------------------------------------------------------}
{ TSPHelpViewer --- IExtendedHelpViewer }

function TSPHelpViewer.UnderstandsTopic(const Topic: String): Boolean;
begin
 Result := True;
end;

procedure TSPHelpViewer.DisplayTopic(const a_Topic: String);
var
 l_HelpFile: String;
begin
 l_HelpFile := HelpFile('');

 if (l_HelpFile <> '') then
  UpdateCurrentStatus(HtmlHelpA(HelpManager.GetHandle, PChar(UpdateCurrentHelpFile(l_HelpFile)), HH_DISPLAY_TOPIC, Longint(PChar(a_Topic))))
 else
  raise EHelpSystemException.CreateRes(@hHelpFileNotFound);
end;

function TSPHelpViewer.UnderstandsContext(const ContextID: Integer; const HelpFileName: String): Boolean;
begin
  Result := True;
end;

procedure TSPHelpViewer.DisplayHelpByContext(const a_ContextID: Integer; const a_FileName: String);
var
 l_HelpFile: String;
begin
 l_HelpFile := HelpFile(a_FileName);

 if (l_HelpFile <> '') then
  UpdateCurrentStatus(HtmlHelpA(HelpManager.GetHandle, PChar(UpdateCurrentHelpFile(l_HelpFile)), HH_HELP_CONTEXT, a_ContextID))
 else
  raise EHelpSystemException.CreateRes(@hHelpFileNotFound);
end;

{----------------------------------------------------------------------------}
{ TSPHelpViewer --- ISpecialSPHelpViewer }

function TSPHelpViewer.CallWinHelp(Handle: {$IfDef XE}THandle{$Else}LongInt{$EndIf}; const HelpFileName: String; Command: Word; Data:  {$IfDef XE}NativeUInt{$Else}LongInt{$EndIf}): Boolean;
begin
 Result := False;
// Application.MessageBox('Unsupported help command', 'Help System', MB_OK);
end;

{ =========================================================================== }

var
 SPHelpViewer: TSPHelpViewer = nil;
 SPHelpTester: TSPHelpTester = nil;

{ =========================================================================== }

type
 TSPHelpSelector = class(Tl3Base, IHelpSelector)
 public
  {FHelpSelector}
  function SelectKeyword(Keywords: TStrings): Integer;
  function TableOfContents(Contents: TStrings): Integer;
 end;

function TSPHelpSelector.SelectKeyword(Keywords: TStrings): Integer;
begin
 Result := SPHelpViewer.ViewerID-1;
end;

function TSPHelpSelector.TableOfContents(Contents: TStrings): Integer;
begin
 Result := SPHelpViewer.ViewerID-1;
end;

{ =========================================================================== }

var
 SPHelpSelector: TSPHelpSelector = nil;
 SPPreviousErrorMode: UINT;
{$IFDEF USE_TEMP_CACHING}
 Index: Longint; {$WARNINGS OFF} // 'For loop control variable must be local variable'
 FileName: String;
{$ENDIF USE_TEMP_CACHING}

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\gui\Garant\AFW\SPHtmlHelp.pas initialization enter'); {$EndIf}

 HHCtrl:=0;
 try
  HtmlHelpA := nil;

  SPPreviousErrorMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
   HHCTRL := LoadLibrary('hhctrl.ocx');
  finally
   SetErrorMode(SPPreviousErrorMode);
  end;

  if (HHCTRL <> 0) then
  begin
{$IFDEF USE_TEMP_CACHING}
   CacheValueList := Tl3ValueList.Create;
{$ENDIF USE_TEMP_CACHING}
   HtmlHelpA := GetProcAddress(HHCTRL, 'HtmlHelpA');
   SPHelpViewer := TSPHelpViewer.Create;
   SPHelpSelector:= TSPHelpSelector.Create;
   SPHelpTester:=TSPHelpTester.Create;
   HelpIntfs.RegisterViewer(SPHelpViewer, SPHelpViewer.FHelpManager);

   {Changing to HTML}
   WinHelpTester := SPHelpTester;
   Application.HelpSystem.AssignHelpSelector(SPHelpSelector);
  end;
 except
  HHCtrl:=0;
 end;

 TestHelp;

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\gui\Garant\AFW\SPHtmlHelp.pas initialization leave'); {$EndIf}
finalization

 if (HHCTRL <> 0) then
 begin
  if Assigned(SPHelpViewer.FHelpManager) then
   SPHelpViewer.InternalShutDown;

   {$IfDef VER140}
   if (g_l3System <> nil) then
    g_l3System.UnRegisterObject(SPHelpTester, SPHelpTester.Cacheable);
    // - hack Delphi 6.0 почему-то не отпускает интерфейс
   {$EndIf VER140}

   l3Free(SPHelpViewer);

   if Assigned(SPHelpTester) then
   begin
    {$IfDef l3TraceObjects}
    if (g_l3System <> nil)
     {$IfNDef VER140}
       and (SPHelpTester.RefCount = 2)
     {$EndIf  VER140}
    then
     g_l3System.UnRegisterObject(SPHelpTester, SPHelpTester.Cacheable);
    {$EndIf l3TraceObjects}

    // - hack Delphi почему-то не отпускает интерфейс
    l3Free(SPHelpTester);
   end;

   if Assigned(SPHelpSelector) then
   begin
    {$IfDef l3TraceObjects}
    if (g_l3System <> nil)
     {$IfNDef VER140}
     and (SPHelpSelector.RefCount = 2)
     {$EndIf  VER140}
    then
     g_l3System.UnRegisterObject(SPHelpSelector, SPHelpSelector.Cacheable);
    {$EndIf l3TraceObjects}

    // - hack Delphi почему-то не отпускает интерфейс
    l3Free(SPHelpSelector);

{$IFDEF USE_TEMP_CACHING}
    if Assigned(CacheValueList) then
    begin
     with CacheValueList do
      for Index := 0 to Pred (Count) do
       begin
        FileName := Tl3NamedString(Items[Index]).Value;

        FileSetReadOnly(FileName, False);
        DeleteFile(FileName);
       end;

     l3Free(CacheValueList);
    end;
{$ENDIF USE_TEMP_CACHING}
   end;

   Sleep(100);
   FreeLibrary(HHCTRL);
  end;

end.
