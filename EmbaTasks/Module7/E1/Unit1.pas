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
begin
 l_A := StrToFloat(A.Text);
 l_B := StrToFloat(B.Text);
 l_C := StrToFloat(C.Text);
end;

end.
