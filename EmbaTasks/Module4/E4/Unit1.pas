unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    DoIt: TButton;
    v1x: TEdit;
    lbS: TLabel;
    lbP: TLabel;
    v2x: TEdit;
    v3x: TEdit;
    v1y: TEdit;
    v3y: TEdit;
    v2y: TEdit;
    procedure DoItClick(Sender: TObject);
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

procedure TForm1.DoItClick(Sender: TObject);
var
 v1, v2, v3 : TP;
begin
 v1.X := StrToFloat(v1x.Text);
 v1.Y := StrToFloat(v1y.Text);

 v2.X := StrToFloat(v2x.Text);
 v2.Y := StrToFloat(v2y.Text);

 v3.X := StrToFloat(v3x.Text);
 v3.Y := StrToFloat(v3y.Text);
end;

end.
