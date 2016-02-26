unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm6 = class(TForm)
    btnFindAndCopy: TButton;
    lb1: TListBox;
    btnFindFiles: TButton;
    procedure btnFindAndCopyClick(Sender: TObject);
    procedure btnFindFilesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
   l_AllFiles,
   l_NotDuplicateFiles,
   l_CopyFiles : TStringList;
   l_CountFindFiles : integer;
   procedure FindFile(const aDir, aFileName: string);
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.btnFindAndCopyClick(Sender: TObject);
var

 l_CSVFileName, l_Files : String;
 i : integer;
 procedure ParseFiles(aFiles : string);
 var
  l_Str : string;
  l_Strings : TArray<string>;
 begin
  l_Strings := aFiles.Split([';'], none);
  for l_Str in l_Strings do
   l_NotDuplicateFiles.Add(l_Str);
 end;
begin
 l_CSVFileName := ExtractFileDir(ParamStr(0)) + '\Units.csv';

 l_AllFiles.Delimiter:= ';';
 l_AllFiles.Duplicates := dupError;

 l_NotDuplicateFiles.Duplicates := dupIgnore;
 l_NotDuplicateFiles.Sorted := True;
 try
  l_AllFiles.LoadFromFile(l_CSVFileName);

  for I := 0 to l_AllFiles.Count - 1 do
  begin
   l_Files := l_AllFiles[I];
   ParseFiles(l_Files);
  end;
  l_NotDuplicateFiles.Sort;
  lb1.Items.AddStrings(l_NotDuplicateFiles);
  l_NotDuplicateFiles.SaveToFile('Units.txt');
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
  l_CountFindFiles := 0;
  lb1.Items.Clear;
  for i := 0 to l_NotDuplicateFiles.Count - 1 do
  begin
   FindFile(c_UnitsRootDir, l_NotDuplicateFiles[i]+'.pas');
   Application.ProcessMessages;
  end;

  lb1.Items.SaveToFile('FilesWithPath.txt');
  ShowMessage(IntToStr(l_CountFindFiles));
end;

procedure TForm6.FindFile(const aDir, aFileName: string);
var
  SR: TSearchRec;
  FindRes: Integer;
begin
  FindRes := FindFirst(aDir + '*.*', faAnyFile, SR);
  while FindRes = 0 do
  begin
    if ((SR.Attr and faDirectory) = faDirectory) and
      ((SR.Name = '.') or (SR.Name = '..')) then
    begin
      FindRes := FindNext(SR);
      Continue;
    end;

    // если найден каталог, то
    if ((SR.Attr and faDirectory) = faDirectory) then
    begin
      // входим в процедуру поиска с параметрами текущего каталога +
      // каталог, что мы нашли
      FindFile(aDir + SR.Name + '\\', aFileName);
      FindRes := FindNext(SR);
      // после осмотра вложенного каталога мы продолжаем поиск
      // в этом каталоге
      Continue; // продолжить цикл
    end;

    if SR.Name = aFileName then
    begin
     lb1.Items.Add(aDir + SR.Name);
     inc(l_CountFindFiles);
    end;

    FindRes := FindNext(SR);
  end;
  FindClose(SR);
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
 l_AllFiles := TStringList.Create;
 l_CopyFiles := TStringList.Create;
 l_NotDuplicateFiles := TStringList.Create;
end;

procedure TForm6.FormDestroy(Sender: TObject);
begin
  FreeAndNil(l_AllFiles);
  FreeAndNil(l_CopyFiles);
  FreeAndNil(l_NotDuplicateFiles);
end;

end.
