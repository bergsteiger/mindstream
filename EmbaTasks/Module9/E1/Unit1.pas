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

 function y(x: Extended): Extended;
 begin
  y := Sqrt(x) + x;
 end;

var
 x : Extended;
begin
 x := y(6) / 2 + y(13) / 2 + y(21) / 2;
 Label1.Caption := FloatToStr(x);
end;

end.
