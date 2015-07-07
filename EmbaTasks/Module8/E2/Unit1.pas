unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    A1: TEdit;
    B1: TEdit;
    C1: TEdit;
    A2: TEdit;
    B2: TEdit;
    C2: TEdit;
    Button1: TButton;
    P1: TLabel;
    S1: TLabel;
    P2: TLabel;
    S2: TLabel;
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

 procedure P(A, B, C: Extended; var theP : Extended);
 begin
  theP := A + B + C;
 end;

 procedure S(A, B, C: Extended; var theS : Extended);
 var
  l_P : Extended;
 begin
  P(A, B, C, l_P);
  l_P := l_P / 2;
  theS := Sqrt(l_P * (l_P - A) * (l_P - B) * (l_P - C));
 end;

var
 l_A1 : Extended;
 l_B1 : Extended;
 l_C1 : Extended;
 l_A2 : Extended;
 l_B2 : Extended;
 l_C2 : Extended;

 l_P1 : Extended;
 l_P2 : Extended;
 l_S1 : Extended;
 l_S2 : Extended;
begin
 l_A1 := StrToInt(A1.Text);
 l_B1 := StrToInt(B1.Text);
 l_C1 := StrToInt(C1.Text);

 l_A2 := StrToInt(A2.Text);
 l_B2 := StrToInt(B2.Text);
 l_C2 := StrToInt(C2.Text);

 P(l_A1, l_B1, l_C1, l_P1);
 P(l_A2, l_B2, l_C2, l_P2);

 S(l_A1, l_B1, l_C1, l_S1);
 S(l_A2, l_B2, l_C2, l_S2);

 P1.Caption := FloatToStr(l_P1);
 P2.Caption := FloatToStr(l_P2);

 S1.Caption := FloatToStr(l_S1);
 S2.Caption := FloatToStr(l_S2);
end;

end.
