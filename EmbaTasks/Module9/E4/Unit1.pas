unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    a: TEdit;
    b: TEdit;
    c: TEdit;
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
 l_a : Extended;
 l_b : Extended;
 l_c : Extended;
 l_t : Extended;
begin
 l_a := StrToFloat(a.Text);
 l_b := StrToFloat(b.Text);
 l_c := StrToFloat(c.Text);

 Label1.Caption := FloatToStr(l_t);
end;

end.
