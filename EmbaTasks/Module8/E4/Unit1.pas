unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    v1x: TEdit;
    v2x: TEdit;
    v3x: TEdit;
    v4x: TEdit;
    v1y: TEdit;
    v2y: TEdit;
    v3y: TEdit;
    v4y: TEdit;
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

type
 TP = record
  X : Extended;
  Y : Extended;
 end;//TP

procedure TForm1.Button1Click(Sender: TObject);
var
 v1, v2, v3, v4 : TP;
begin
 v1.X := StrToFloat(v1x.Text);
 v1.Y := StrToFloat(v1y.Text);

 v2.X := StrToFloat(v2x.Text);
 v2.Y := StrToFloat(v2y.Text);

 v3.X := StrToFloat(v3x.Text);
 v3.Y := StrToFloat(v3y.Text);

 v4.X := StrToFloat(v4x.Text);
 v4.Y := StrToFloat(v4y.Text);
end;

end.
