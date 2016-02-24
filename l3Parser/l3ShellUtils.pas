unit l3ShellUtils;

interface

uses
  Windows,
  Graphics
  ;

function l3RetrieveAssociatedIconPicture(aFilename: string; aBackColor: TColor): TBitmap;

function l3RetrieveAssociatedDescription(aFileName: string): string;

function ExtractIcon(aExeName: String; aIndex: Integer; aBackColor: TColor; aSize: Integer = 32): TBitmap;

type
  TExecState = (esNormal, esMinimized, esMaximized, esHidden);

function FileExecute(const FileName, Params, StartDir: string; InitialState: TExecState): THandle;

function FileExecuteWait(const FileName, Params, StartDir: string; InitialState: TExecState): Integer;

implementation

uses
  Types,
  SysUtils,
  Registry,
  ShellAPI,

  Forms
  ;

const
 cShell32 = 'shell32.dll';


function l3RetrieveAssociatedDescription(aFileName: string): string;
var
 l_Ext: string;
 l_Reg: TRegistry;
begin
 Result := '';
 l_Ext := LowerCase(ExtractFileExt(aFilename));
 if l_Ext = '.exe' then
 begin
  Result := 'Исполняемый файл';
  Exit;
 end
 else
  if l_Ext = '.dll' then
  begin
   Result := 'Динамическая библиотека';
   Exit;
  end
  else
  begin
   l_Reg := TRegistry.Create(KEY_READ);
   try
    l_Reg.RootKey := HKEY_CLASSES_ROOT;
    if l_Reg.OpenKeyReadOnly(l_Ext) then
    begin
     l_Ext := l_Reg.ReadString('');
     if l_Reg.OpenKeyReadOnly('\'+l_Ext) then
     begin
      Result := l_Reg.ReadString('');
     end;
    end;
   finally
    l_Reg.Free;
   end;
  end;
end;

function ExtractIcon(aExeName: String; aIndex: Integer; aBackColor: TColor; aSize: Integer = 32): TBitmap;
var
 l_Icon: HICON;
 l_Icon2: HICON;
 l_Res: HICON;//Integer;
begin
 l_Res := ExtractIconEx(PChar(AnsiDequotedStr(aExeName, '"')), aIndex, l_Icon, l_Icon2, 1);
 if l_Res <> 2 then
  l_Res := ExtractIconEx(cShell32, 0, l_Icon, l_Icon2, 1);

 if l_Res = 2 then
 try
  Result := TBitmap.Create;
  with Result do
  begin
   Width := aSize;
   Height := aSize;
   Canvas.Brush.Color := aBackColor;
   Canvas.Brush.Style := bsSolid;
   Canvas.FillRect(Rect(0,0,100,100));
   DrawIcon(Canvas.Handle, 0, 0, l_Icon);
   Result.PixelFormat := pf24bit;
  end;
 finally
  DestroyIcon(l_Icon);
  DestroyIcon(l_Icon2);
 end;
end;

function l3RetrieveAssociatedIconPicture(aFilename: string; aBackColor: TColor): TBitmap;
var
 l_Ext: string;
 l_Exe: string;
 l_Icon  : HICON;
 l_Icon2 : HICON;
 l_IIdx: Integer;
 l_IIdxS: string;
 l_Reg: TRegistry;
 I: Integer;
 l_Res: Integer;
begin
 Result := nil;
 l_Ext := LowerCase(ExtractFileExt(aFilename));
 if l_Ext = '.exe' then
 begin
  l_Exe  := cShell32;
  l_IIdx := 2;
 end
 else
  if l_Ext = '.dll' then
  begin
   l_Exe  := cShell32;
   l_IIdx := 72;
  end
  else
  begin
   l_Exe  := '';
   l_IIdx := 0;
   l_Reg := TRegistry.Create(KEY_READ);
   try
    l_Reg.RootKey := HKEY_CLASSES_ROOT;
    if l_Reg.OpenKeyReadOnly(l_Ext) then
    begin
     l_Ext := l_Reg.ReadString('');
     if l_Reg.OpenKeyReadOnly('\'+l_Ext+'\DefaultIcon') then
     begin
      l_Ext := l_Reg.ReadString('');
      if l_Ext <> '' then
      begin
       l_IIdxS := '';
       I := Length(l_Ext);
       while l_Ext[I] in [' ', '0'..'9', '-'] do
       begin
        l_IIdxS := l_Ext[I] + l_IIdxS;
        Dec(I);
       end;
       if l_Ext[I] = ',' then
       begin
        l_IIdx := StrToIntDef(l_IIdxS, 0);
        l_Exe := Copy(l_Ext, 1, I - 1);
       end;
      end;
     end;
    end;
   finally
    l_Reg.Free;
   end;
  end;

 if l_Exe = '' then
 begin
  l_Exe := cShell32;
  l_IIdx := 0;
 end;

 Result:= ExtractIcon(l_Exe, l_IIdx, aBackColor);
end;

const
  ShowCommands: array[TExecState] of Integer =
    (SW_SHOWNORMAL, SW_MINIMIZE, SW_SHOWMAXIMIZED, SW_HIDE);
    
function FileExecuteWait(const FileName, Params, StartDir: string;
  InitialState: TExecState): Integer;
var
  Info: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  FillChar(Info, SizeOf(Info), 0);
  Info.cbSize := SizeOf(TShellExecuteInfo);
  with Info do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(FileName);
    lpParameters := PChar(Params);
    lpDirectory := PChar(StartDir);
    nShow := ShowCommands[InitialState];
  end;
  if ShellExecuteEx(@Info) then begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(Info.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or Application.Terminated;
    Result := ExitCode;
  end
  else Result := -1;
end;

function FileExecute(const FileName, Params, StartDir: string; InitialState: TExecState): THandle;
begin
  Result := ShellExecute(Application.Handle, nil, PChar(FileName),
    PChar(Params), PChar(StartDir), ShowCommands[InitialState]);
end;

end.
