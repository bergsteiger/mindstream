unit msLoggedTest;

interface

uses
 TestFramework,
 FMX.DUnit.Interfaces,
 FMX.DUnit.msLog
 ;

type
  TmsLoggedTest = class abstract(TTestCase, ImsEtalonsHolder)
  protected
   procedure OutToFileAndCheck(aLambda: TmsLogLambda);
   function MakeFileName(const aTestName: string; const aTestFolder: string): String;
   function IsEtalonValid(const aFileName: String; const anEtalonName: String): Boolean;
   procedure CheckFileWithEtalon(const aFileName: String);
   function InnerFolders: String; virtual;
   function TestResultsFileName: String;
   function FileExtension: String; virtual;

   // ImsEtalonsHolder
   procedure DeleteEtalonFile(const aLog: ImsLog);
   procedure RunDiffPrim(const aFileName: String; const anEtalonName: String);
   function RunDiff(const aLog: ImsLog): Boolean;
  public
   class function ComputerName: AnsiString;
  end;//TmsLoggedTest

implementation

uses
 SysUtils,
 msStreamUtils,
 Windows,
 ShellAPI,
 FMX.DUnit.Settings
 ;

// TmsLoggedTest

function TmsLoggedTest.FileExtension: String;
begin
 Result := '';
end;

function TmsLoggedTest.MakeFileName(const aTestName: string; const aTestFolder: string): String;
var
 l_Folder : String;
begin
 l_Folder := ExtractFilePath(ParamStr(0)) + 'TestResults\' + aTestFolder;
 ForceDirectories(l_Folder);
 Result := l_Folder + ClassName + '_' + aTestName + FileExtension;
end;

const
 cEtalon = '.etalon';

procedure TmsLoggedTest.DeleteEtalonFile(const aLog: ImsLog);
var
 l_OutFileName : String;
 l_EtalonFileName : String;
begin
 l_OutFileName := TestResultsFileName;
 l_EtalonFileName := l_OutFileName + cEtalon + ExtractFileExt(l_OutFileName);
 DeleteFile(PWideChar(l_EtalonFileName));
end;

function TmsLoggedTest.IsEtalonValid(const aFileName: String; const anEtalonName: String): Boolean;
begin
 if not FileExists(aFileName) then
 begin
  Result := true;
  Exit;
 end;//FileExists(aFileName)
 Assert(FileExists(aFileName), 'Файл не существует ' + aFileName);
 Assert(FileExists(anEtalonName), 'Файл не существует ' + anEtalonName);
 Result := msCompareFiles(anEtalonName, aFileName);
end;

procedure TmsLoggedTest.CheckFileWithEtalon(const aFileName: String);
var
 l_FileNameEtalon : String;
 l_IsEtalonValid : Boolean;
begin
 l_FileNameEtalon := aFileName + cEtalon + ExtractFileExt(aFileName);
 if FileExists(l_FileNameEtalon) then
 begin
  l_IsEtalonValid := IsEtalonValid(aFileName, l_FileNameEtalon);
  if not l_IsEtalonValid then
   try
    RunDiffPrim(aFileName, l_FileNameEtalon);
   except
    Assert(false);
   end;//try..except
  CheckTrue(l_IsEtalonValid);
 end//FileExists(l_FileNameEtalon)
 else
 begin
  CopyFile(PWideChar(aFileName), PWideChar(l_FileNameEtalon),True);
 end;//FileExists(l_FileNameEtalon)
end;

function TmsLoggedTest.TestResultsFileName: String;
begin
 Result := MakeFileName(Name, InnerFolders);
end;

function TmsLoggedTest.InnerFolders: String;
begin
 Result := '';
end;

procedure TmsLoggedTest.OutToFileAndCheck(aLambda: TmsLogLambda);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName;
 TmsLog.Log(l_FileNameTest,
  procedure (aLog: TmsLog)
  begin
   aLambda(aLog);
  end
 );
 CheckFileWithEtalon(l_FileNameTest);
end;

function TmsLoggedTest.RunDiff(const aLog: ImsLog): Boolean;
var
 l_TestFileName : String;
 l_EtalonFileName : String;
begin
 l_TestFileName:= TestResultsFileName;
 l_EtalonFileName:= l_TestFileName + cEtalon + ExtractFileExt(l_TestFileName);
 Result := not IsEtalonValid(l_TestFileName, l_EtalonFileName);
 if Result then
  RunDiffPrim(l_TestFileName, l_EtalonFileName)
end;

procedure TmsLoggedTest.RunDiffPrim(const aFileName: String;
                                    const anEtalonName: String);
const
 c_cmdFileName = 'diff.cmd';
var
 l_cmdFileName : String;
 l_ExecInfo: TShellExecuteInfo;
 l_Param : String;
begin
 if not TmsDUnitSettings.Instance.IsUseDiffer then
  Exit;

{ TODO 1 -oIngword -cProposal : Добавить вывод ошибок в лог }
 l_cmdFileName := ExtractFilePath(ParamStr(0)) +
                  String(Self.ComputerName) + '_' +
                  c_cmdFileName;

 if not FileExists(l_cmdFileName) then
  l_cmdFileName := ExtractFilePath(ParamStr(0)) + c_cmdFileName;

 Assert(FileExists(l_cmdFileName));

 FillChar(l_ExecInfo, SizeOf(l_ExecInfo), 0);
 l_ExecInfo.cbSize := SizeOf(l_ExecInfo);
 l_ExecInfo.Wnd := 0;
 l_ExecInfo.lpVerb := PWideChar('');
 l_ExecInfo.lpFile := PChar(l_cmdFileName);
 l_Param := ' ' + '"' + anEtalonName + '"' + ' ' + '"' + aFileName  + '"';
 l_ExecInfo.lpParameters := PWideChar(l_Param);
 l_ExecInfo.nShow := 1;

 if not ShellExecuteEx(@l_ExecInfo) then
  RaiseLastOSError;
end;

class function TmsLoggedTest.ComputerName: AnsiString;
var
 l_CompSize : Integer;
begin
 l_CompSize := MAX_COMPUTERNAME_LENGTH + 1;
 SetLength(Result, l_CompSize);

 Win32Check(GetComputerNameA(PAnsiChar(Result), LongWord(l_CompSize)));
 SetLength(Result, l_CompSize);
end;

end.
