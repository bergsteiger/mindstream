unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm6 = class(TForm)
    btnFindAndCopy: TButton;
    lb1: TListBox;
    procedure btnFindAndCopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.btnFindAndCopyClick(Sender: TObject);
var
 l_AllFiles, l_NotDuplicateFiles,
 l_CopyFiles : TStringList;
 l_CSVFileName, l_Files, l_FileName : String;
 i : integer;
 l_AllFilesStrings : TStrings;
begin
// todo тут будем загружать список файлов и искать их, и копировать к нам в папку.
 l_CSVFileName := ExtractFileDir(ParamStr(0)) + '\Units.csv';
 l_AllFiles := TStringList.Create;
 l_CopyFiles := TStringList.Create;
 l_AllFiles.Delimiter:= ';';
 l_AllFiles.Duplicates := dupError;
 l_NotDuplicateFiles := TStringList.Create;
 l_NotDuplicateFiles.Duplicates := dupIgnore;
 l_NotDuplicateFiles.Sorted := True;
{ l_AllFilesStrings := TStrings.Create;
 l_AllFilesStrings.Delimiter := ';';
 l_AllFilesStrings.LoadFromFile();}
 try
  l_AllFiles.LoadFromFile(l_CSVFileName);
  {for I := Low to High do}
  l_NotDuplicateFiles.Add('qwe');
  l_NotDuplicateFiles.Add('qwe');
  l_NotDuplicateFiles.Add('qwe');
  lb1.Items.AddStrings(l_NotDuplicateFiles);
 finally
  FreeAndNil(l_AllFiles);
  FreeAndNil(l_CopyFiles);
  FreeAndNil(l_NotDuplicateFiles);
  //FreeAndNil(l_AllFilesStrings);
 end;
end;

end.
