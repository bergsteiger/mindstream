unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    btnDoIt: TButton;
    pnlTop: TPanel;
    pnlMain: TPanel;
    memMain: TMemo;
    edtIn: TEdit;
    lblResult: TLabel;
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
  ResultStr, FindStr : string;
  Index : integer;
begin
  ResultStr := '';
  FindStr := edtIn.Text;

  for Index := 0 to memMain.Lines.Count - 1 do
    if pos(FindStr, memMain.Lines[Index]) > 0 then
      ResultStr := ResultStr + 'Line ' + IntToStr(Index + 1) + '; ';

  lblResult.Caption := ResultStr;
end;

end.
