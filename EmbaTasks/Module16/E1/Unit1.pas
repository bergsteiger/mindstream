unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfmMain = class(TForm)
    edtFirstNum: TEdit;
    edtSecondNum: TEdit;
    edtGuess: TEdit;
    btnGuess: TButton;
    lblAnswer: TLabel;
    btnPeep: TButton;
    btnRandomize: TButton;
    procedure btnRandomizeClick(Sender: TObject);
    procedure btnPeepClick(Sender: TObject);
    procedure btnGuessClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RandomNum : integer;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnGuessClick(Sender: TObject);
var
  GuessNum : integer;
begin
  GuessNum := StrToInt(edtGuess.Text);
  if GuessNum < RandomNum then
    lblAnswer.Caption := 'smaller'
  else if GuessNum > RandomNum then
    lblAnswer.Caption := 'larger'
  else if GuessNum = RandomNum then
    lblAnswer.Caption := 'correct guess'
end;

procedure TfmMain.btnPeepClick(Sender: TObject);
begin
  lblAnswer.Caption := IntToStr(RandomNum);
end;

procedure TfmMain.btnRandomizeClick(Sender: TObject);
var
  FirstNum, SecondNum : integer;
begin
  FirstNum := StrToInt(edtFirstNum.Text);
  SecondNum := StrToInt(edtSecondNum.Text);
  RandomNum := Round((SecondNum - FirstNum) * Random + FirstNum);
end;

end.
