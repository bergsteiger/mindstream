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
    lblEvenNumbers: TLabel;
    lblOddNumbers: TLabel;
    memNumbers: TMemo;
    memEvenNumbers: TMemo;
    memOddNumbers: TMemo;
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
  Index,
  EvenNumber : integer;
  OddNumber : double;
begin
  for Index := 0 to memNumbers.Lines.Count - 1 do
    if (StrToInt(memNumbers.Lines[Index]) mod 2) = 0 then
    begin
      EvenNumber := StrToInt(memNumbers.Lines[Index]) * 2;
      memEvenNumbers.Lines[0] := memEvenNumbers.Lines[0] + ' ' + IntToStr(EvenNumber);
    end
    else
    begin
      OddNumber := StrToInt(memNumbers.Lines[Index]) / 2;
      memOddNumbers.Lines[0] := memOddNumbers.Lines[0] + ' ' + FloatToStr(OddNumber);
    end;
end;

end.
