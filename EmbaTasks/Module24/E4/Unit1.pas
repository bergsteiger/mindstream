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
    pnlBottom: TPanel;
    btnStart: TButton;
    lblResult: TLabel;
    mem1: TMemo;
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
  FileText : TextFile;
  Line : string;
  Num, SumLine : integer;
  SchoolArray : array[1..99] of Integer;
begin
  AssignFile(FileText, edtFileName.Text);
  Reset(FileText);

  while not EOF(FileText) do
  begin
    Readln(FileText, Line);
    mem1.Lines.Append(Copy(Line, Length(Line) - 1, 2));
  end;

  CloseFile(FileText);
end;

end.
