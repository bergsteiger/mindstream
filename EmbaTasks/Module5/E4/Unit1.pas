unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
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
var
 l_V : Integer;
 l_I1 : Integer;
 l_I2 : Integer;
 l_I3 : Integer;
begin
 l_V := StrToInt(Edit1.Text);
 l_I1 := l_V mod 10;
 l_V := l_V div 10;
 l_I2 := l_V mod 10;
 l_V := l_V div 10;
 l_I3 := l_V mod 10;
 l_V := l_V div 10;
 if (l_I3 + l_I2 = l_I1) then
  Label1.Caption := 'true'
 else
  Label1.Caption := 'false';
end;

end.
