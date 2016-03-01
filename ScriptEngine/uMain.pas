unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm6 = class(TForm)
    btnFindAndCopy: TButton;
    lbOutput: TListBox;
    btnFindFiles: TButton;
    btnCopyFiles: TButton;
    btnTestScriptEngine: TButton;
    procedure btnFindAndCopyClick(Sender: TObject);
    procedure btnFindFilesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCopyFilesClick(Sender: TObject);
    procedure btnTestScriptEngineClick(Sender: TObject);
  private
   F_AllFiles,
   F_NotDuplicateFiles,
   F_CopyFiles : TStringList;
   F_CountFindFiles : integer;
   procedure FindFile(const aDir, aFileName: string);
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses
 System.IOUtils
 , tfwScriptEngineEX
 ;

const
 cFilesWithPath = 'FilesWithPath.txt';
 cDestinationPath = '..\..\..\l3Parser\ScriptEngine\';

{$R *.dfm}

procedure TForm6.btnCopyFilesClick(Sender: TObject);
var
 l_Index : Integer;
 l_DestinationPath : string;
begin
 if lbOutput.Items.Count = 0 then
  lbOutput.Items.LoadFromFile(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + cFilesWithPath);

 for l_Index := 0 to lbOutput.Items.Count - 1 do
 begin
  lbOutput.Items[l_Index] := lbOutput.Items[l_Index].Replace('\\', '\', [rfReplaceAll]);
  l_DestinationPath := IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) +
                       cDestinationPath +
                       ExtractFileName(lbOutput.Items[l_Index]);
  TFile.Copy(lbOutput.Items[l_Index], l_DestinationPath, True);
 end;

 lbOutput.Items.SaveToFile(IncludeTrailingPathDelimiter(ExtractFileDir(ParamStr(0))) + cFilesWithPath);
end;

procedure TForm6.btnFindAndCopyClick(Sender: TObject);
var

 l_CSVFileName, l_Files : String;
 l_Index : integer;
 procedure ParseFiles(aFiles : string);
 var
  l_Str : string;
  l_Strings : TArray<string>;
 begin
  l_Strings := aFiles.Split([';'], none);
  for l_Str in l_Strings do
   F_NotDuplicateFiles.Add(l_Str);
 end;
begin
 l_CSVFileName := ExtractFileDir(ParamStr(0)) + '\Units.csv';

 F_AllFiles.Delimiter:= ';';
 F_AllFiles.Duplicates := dupError;

 F_NotDuplicateFiles.Duplicates := dupIgnore;
 F_NotDuplicateFiles.Sorted := True;
 try
  F_AllFiles.LoadFromFile(l_CSVFileName);

  for l_Index := 0 to F_AllFiles.Count - 1 do
  begin
   l_Files := F_AllFiles[l_Index];
   ParseFiles(l_Files);
  end;
  F_NotDuplicateFiles.Sort;
  lbOutput.Items.AddStrings(F_NotDuplicateFiles);
  F_NotDuplicateFiles.SaveToFile('Units.txt');
 finally

 end;
end;

procedure TForm6.btnFindFilesClick(Sender: TObject);
const
 c_FileName = 'Units.txt';
 c_UnitsRootDir = 'e:\Work\Repository\CodeGenerations\';
var
  l_UnitsFileName : string;
  i : integer;
begin
  l_UnitsFileName := ExtractFileDir(ParamStr(0));// + c_FileName;
  F_CountFindFiles := 0;
  lbOutput.Items.Clear;
  for i := 0 to F_NotDuplicateFiles.Count - 1 do
  begin
   FindFile(c_UnitsRootDir, F_NotDuplicateFiles[i]+'.pas');
   Application.ProcessMessages;
  end;

  lbOutput.Items.SaveToFile(cFilesWithPath);
  ShowMessage(IntToStr(F_CountFindFiles));
end;

procedure TForm6.btnTestScriptEngineClick(Sender: TObject);
var
 ScriptEngineEx : TtfwScriptEngineEX;
begin
 ScriptEngineEx := TtfwScriptEngineEX.ScriptFromFile();

 FreeAndNil(ScriptEngineEx);
end;

procedure TForm6.FindFile(const aDir, aFileName: string);
var
  l_SR: TSearchRec;
  l_FindRes: Integer;
begin
  l_FindRes := FindFirst(aDir + '*.*', faAnyFile, l_SR);
  while l_FindRes = 0 do
  begin
    if ((l_SR.Attr and faDirectory) = faDirectory) and
      ((l_SR.Name = '.') or (l_SR.Name = '..')) then
    begin
      l_FindRes := FindNext(l_SR);
      Continue;
    end;

    // если найден каталог, то
    if ((l_SR.Attr and faDirectory) = faDirectory) then
    begin
      // входим в процедуру поиска с параметрами текущего каталога +
      // каталог, что мы нашли
      FindFile(aDir + l_SR.Name + '\\', aFileName);
      l_FindRes := FindNext(l_SR);
      // после осмотра вложенного каталога мы продолжаем поиск
      // в этом каталоге
      Continue; // продолжить цикл
    end;

    if l_SR.Name = aFileName then
    begin
     lbOutput.Items.Add(aDir + l_SR.Name);
     inc(F_CountFindFiles);
     Break;
    end;

    l_FindRes := FindNext(l_SR);
  end;
  FindClose(l_SR);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
 F_AllFiles := TStringList.Create;
 F_CopyFiles := TStringList.Create;
 F_NotDuplicateFiles := TStringList.Create;
end;

procedure TForm6.FormDestroy(Sender: TObject);
begin
  FreeAndNil(F_AllFiles);
  FreeAndNil(F_CopyFiles);
  FreeAndNil(F_NotDuplicateFiles);
end;

end.
