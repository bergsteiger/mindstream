unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    lbl1: TLabel;
    edtFileName: TEdit;
    pnlCenter: TPanel;
    pnlBottom: TPanel;
    memResult: TMemo;
    btnStart: TButton;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  IsCountDown : boolean;

implementation

{$R *.dfm}

procedure TfmMain.btnStartClick(Sender: TObject);
var
  FileText, FileTextSame, FileWrite : TextFile;
  Line : string;
  Num, SumLine : integer;
begin
  AssignFile(FileTextSame, edtFileName.Text);
  Reset(FileTextSame);

  AssignFile(FileText, edtFileName.Text);
  Reset(FileText);

  AssignFile(FileWrite, 'Result.txt');
  Rewrite(FileWrite);

  while not EOF(FileText) do
  begin
    SumLine := 0;

    while not SeekEoln(FileText) do
    begin
      Read(FileText, Num);
      SumLine := SumLine + Num;
    end;

    Readln(FileText);
    Readln(FileTextSame, Line);

    if (SumLine mod 2 = 0) then
    begin
      writeln(FileWrite, Line);
      memResult.Lines.Add(Line)
    end;
  end;

  CloseFile(FileText);
  CloseFile(FileTextSame);
  CloseFile(FileWrite);
end;

end.
