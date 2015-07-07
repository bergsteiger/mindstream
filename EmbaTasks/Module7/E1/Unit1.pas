unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    A: TEdit;
    B: TEdit;
    C: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
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
 l_A : Extended;
 l_B : Extended;
 l_C : Extended;
 l_D : Extended;

 l_X1 : Extended;
 l_X2 : Extended;
begin
 l_A := StrToFloat(A.Text);
 l_B := StrToFloat(B.Text);
 l_C := StrToFloat(C.Text);

 l_D := Sqr(l_B) - 4 * l_A * l_C;

 if (l_D < 0) then
  Label1.Caption := 'no roots'
 else
 begin
  l_X1 := (-l_B + Sqrt(l_D)) / (2 * l_A);
  l_X2 := (-l_B - Sqrt(l_D)) / (2 * l_A);
  Label1.Caption := FloatToStr(l_X1);
  Label2.Caption := FloatToStr(l_X2);
 end;//l_D < 0
end;

end.
