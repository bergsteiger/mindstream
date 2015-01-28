unit msLoggedTest;

interface

uses
 TestFramework,
 msCoreObjects,
 TestInterfaces
 ;

type
  TmsLoggedTest = class abstract(TTestCase, ImsEtalonsHolder)
  protected
   procedure OutToFileAndCheck(aLambda: TmsLogLambda);
   function MakeFileName(const aTestName: string; const aTestFolder: string): String;
   function ContextName: String; virtual;
   procedure CheckFileWithEtalon(const aFileName: String);
   function InnerFolders: String; virtual;

   // ImsEtalonsHolder
   procedure DeleteEtalonFile;
   function TestResultsFileName: String;
   function FileExtension: String; virtual;
  public
  end;//TmsLoggedTest

implementation

uses
 SysUtils,
 msStreamUtils,
 Windows
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
 Result := l_Folder + ClassName + '_' + aTestName + ContextName + FileExtension;
end;

function TmsLoggedTest.ContextName: String;
begin
 Result := '';
end;

procedure TmsLoggedTest.DeleteEtalonFile;
var
 l_FileName: string;
begin
 l_FileName:= TestResultsFileName + '.etalon' + FileExtension;
 DeleteFile(PWideChar(l_FileName));
end;


procedure TmsLoggedTest.CheckFileWithEtalon(const aFileName: String);
var
 l_FileNameEtalon : String;
begin
 l_FileNameEtalon := aFileName + '.etalon' + ExtractFileExt(aFileName);
 if FileExists(l_FileNameEtalon) then
 begin
  CheckTrue(msCompareFiles(l_FileNameEtalon, aFileName));
 end//FileExists(l_FileNameEtalon)
 else
 begin
  CopyFile(PWideChar(aFileName),PWideChar(l_FileNameEtalon),True);
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

end.
