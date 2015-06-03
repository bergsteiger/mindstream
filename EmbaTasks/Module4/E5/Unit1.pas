unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    DoIt: TButton;
    L: TEdit;
    lbHeight: TLabel;
    alpha: TEdit;
    procedure DoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
 Math
 ;

{$R *.dfm}

procedure TForm1.DoItClick(Sender: TObject);
var
 l_H : Extended;
 l_M : Extended;
 l_CM : Extended;
begin
 l_H := Abs(StrToFloat(L.Text) * 100 * Tan(StrToFloat(alpha.Text)));
 l_M := l_H / 100;
 l_CM := Frac(l_M);
 l_M := Int(l_M);
 lbHeight.Caption := Format('Tree height equals to %f m %f cm', [l_M, l_CM]);
end;

end.
