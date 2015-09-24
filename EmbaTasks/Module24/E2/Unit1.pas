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
  function IsPalindrome(const aLine) : Boolean;
  begin
    Result := True;
  end;
var
  FileText : TextFile;
  Line : string;
begin
  AssignFile(FileText, edtFileName.Text);
  Reset(FileText);

  while not EOF(FileText) do
  begin
    Readln(FileText, Line);
    if IsPalindrome(Line) then
      memResult.Lines.Append(Line);
  end;

  CloseFile(FileText);
end;

end.
