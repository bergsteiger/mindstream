unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtIn: TEdit;
    edtOut: TEdit;
    btnDoIt: TButton;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDoItClick(Sender: TObject);
var
  InStr, SubStr, ErrorStr : string;
  OperandPos, Code : integer;
  FirstNum, SecondNum, ResultSum : Double;
begin
  InStr := trim(edtIn.Text);

  OperandPos := Pos('+', InStr);
  SubStr := Copy(InStr, 0, OperandPos - 1);
  Delete(InStr, 1, OperandPos);
  Val(SubStr, FirstNum, Code);

  OperandPos := Pos('=', InStr);
  SubStr := Copy(InStr, 0, OperandPos - 1);
  Delete(InStr, 1, OperandPos);
  Val(SubStr, SecondNum, Code);

  ResultSum := FirstNum + SecondNum;

  edtOut.Text := FloatToStr(ResultSum);
end;

end.
