unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
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

 function y(a, b: Extended): Extended;
 begin
  y := a + Sqrt(b);
 end;

var
 x : Extended;
begin
 x := y(15, 8) / y(8, 15) + y(6, 12) / y(12, 6) + y(7, 21) / y (21, 7);
 Label1.Caption := FloatToStr(x);
end;

end.
