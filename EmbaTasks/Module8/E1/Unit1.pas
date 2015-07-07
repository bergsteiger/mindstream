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
    D: TEdit;
    Button1: TButton;
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

 procedure Swap(var V1, V2 : Extended);
 var
  l_T : Extended;
 begin
  l_T := V1;
  V1 := V2;
  v2 := l_T;
 end;

var
 l_A : Extended;
 l_B : Extended;
 l_C : Extended;
 l_D : Extended;
begin
 l_A := StrToFloat(A.Text);
 l_B := StrToFloat(B.Text);
 l_C := StrToFloat(C.Text);
 l_D := StrToFloat(D.Text);

 Swap(l_A, l_B);
 Swap(l_C, l_D);

 A.Text := FloatToStr(l_A);
 B.Text := FloatToStr(l_B);
 C.Text := FloatToStr(l_C);
 D.Text := FloatToStr(l_D);
end;

end.
