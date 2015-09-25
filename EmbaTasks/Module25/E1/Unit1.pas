unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    lblResult: TLabel;
    pnlBottom: TPanel;
    btnStart: TButton;
    dlgOpen: TOpenDialog;
    dlgSaveEven: TSaveDialog;
    dlgSaveOdd: TSaveDialog;
    lbl1: TLabel;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnStartClick(Sender: TObject);
var
  FileOpen,
  FileSaveEven,
  FileSaveOdd: TextFile;

  FilePathOpen,
  FilePathEven,
  FilePathOdd,
  Line : string;

  IsOpenFrom,
  IsOpenEven,
  IsOpenOdd : Boolean;
begin
  if dlgOpen.Execute then
    IsOpenFrom := True;

  if dlgSaveEven.Execute then
    IsOpenEven := True;

  if dlgSaveOdd.Execute then
    IsOpenOdd := True;

  if (IsOpenFrom and IsOpenEven and IsOpenOdd) then
  begin
    FilePathOpen := dlgOpen.FileName;
    FilePathEven := dlgSaveEven.FileName;
    FilePathOdd := dlgSaveOdd.FileName;

    AssignFile(FileOpen, FilePathOpen);
    Reset(FileOpen);

    AssignFile(FileSaveEven, FilePathEven);
    Rewrite(FileSaveEven);

    AssignFile(FileSaveOdd, FilePathOdd);
    Rewrite(FileSaveOdd);

    while not EOF(FileOpen) do
    begin
      Readln(FileOpen, Line);

      if Length(Line) mod 2 = 0 then
        Writeln(FileSaveEven, Line)
      else
        Writeln(FileSaveOdd, Line);
    end;

    CloseFile(FileOpen);
    CloseFile(FileSaveEven);
    CloseFile(FileSaveOdd);

    lblResult.Caption := 'All right';
  end
  else
    lblResult.Caption := 'Some files not open';
end;

end.
