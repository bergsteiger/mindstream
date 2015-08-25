unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    btnDoIt: TButton;
    pnlTop: TPanel;
    lblNumbers: TLabel;
    lblPositiveNumbers: TLabel;
    lblNegativeNumbers: TLabel;
    memNumbers: TMemo;
    memPositiveNumbers: TMemo;
    memNegativeNumbers: TMemo;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnDoItClick(Sender: TObject);
var
  Index : integer;
begin
  for Index := 0 to memNumbers.Lines.Count - 1 do
    if StrToInt(memNumbers.Lines[Index]) < 0 then
      memNegativeNumbers.Lines.Add(memNumbers.Lines[Index])
    else
      memPositiveNumbers.Lines.Add(memNumbers.Lines[Index]);
end;

end.
