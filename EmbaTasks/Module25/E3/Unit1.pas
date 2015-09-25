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
    dlgSaveResult: TSaveDialog;
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
  function SumFromLine(const aLine : string) : integer;
  begin
    Result := 20;
  end;
var
  FileOpen,
  FileResult: TextFile;

  FilePathOpen,
  FilePathResult,
  Line : string;

  IsOpenFrom,
  IsOpenResult : Boolean;

  Num, SumNum : integer;
begin
  if dlgOpen.Execute then
    IsOpenFrom := True;

  if dlgSaveResult.Execute then
    IsOpenResult := True;

  if (IsOpenFrom and IsOpenResult) then
  begin
    FilePathOpen := dlgOpen.FileName;
    FilePathResult := dlgSaveResult.FileName;

    AssignFile(FileOpen, FilePathOpen);
    Reset(FileOpen);

    AssignFile(FileResult, FilePathResult);
    Rewrite(FileResult);

    SumNum := 0;

    while not Eof(FileOpen) do
    begin
      Readln(FileOpen, Line);

      SumNum := SumNum + SumFromLine(Line);
    end;

    Writeln(FileResult, SumNum);

    CloseFile(FileOpen);
    CloseFile(FileResult);

    lblResult.Caption := 'All right - ' + IntToStr(SumNum);
  end
  else
    lblResult.Caption := 'Some files not open';
end;

end.
