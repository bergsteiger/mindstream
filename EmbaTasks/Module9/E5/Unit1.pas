unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    x: TEdit;
    y: TEdit;
    z: TLabel;
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
 l_x : Extended;
 l_y : Extended;
 l_z : Extended;
begin
 l_x := StrToFloat(x.Text);
 l_y := StrToFloat(y.Text);

 z.Caption := FloatToStr(l_z);
end;

end.
