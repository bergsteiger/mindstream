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

 function Sign(a: Extended): Extended;
 begin
  if (a < 0) then
   Result := -1
  else
  if (a > 0) then
   Result := 1
  else
   Result := 0;
 end;

var
 l_x : Extended;
 l_y : Extended;
 l_z : Extended;
begin
 l_x := StrToFloat(x.Text);
 l_y := StrToFloat(y.Text);

 l_z := (Sign(l_x) + Sign(l_y)) * Sign(l_x * l_y);

 z.Caption := FloatToStr(l_z);
end;

end.
