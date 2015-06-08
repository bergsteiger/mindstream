unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    a: TEdit;
    n: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 l_a : Integer;
 l_n : Integer;
 l_Summ : Integer;
 l_I : Integer;
begin
 l_a := StrToInt(a.Text);
 l_n := StrToInt(n.Text);
 l_Summ := 0;
 for l_I := l_a to l_a + l_n - 1 do
  l_Summ := l_Summ + l_I;
 if (l_Summ mod 2 = 0) then
  Label1.Caption := 'true'
 else
  Label1.Caption := 'false';
end;

end.
