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
  InStr, NumberStr, AvgNumberStr, OutStr : string;
  Index, BeginPos, EndPos, SumNumber : Integer;
  Average : double;
begin
  InStr := edtIn.Text;

  BeginPos := Pos('(', InStr);
  EndPos := Pos(')', InStr);

  NumberStr := Copy(InStr, BeginPos + 1, EndPos - BeginPos - 1);

  edtOut.Text := NumberStr;

  SumNumber := 0;
  for Index := 1 to Length(NumberStr) do
    SumNumber := SumNumber + StrToInt(NumberStr[Index]);

  Average := SumNumber / Length(NumberStr);
  Str(Average :6 :2, AvgNumberStr);

  OutStr := '';
  for Index := 1 to Length(NumberStr) do
    OutStr := OutStr + AvgNumberStr;

  edtOut.Text := StringReplace(InStr, NumberStr, OutStr, []);;
end;

end.
