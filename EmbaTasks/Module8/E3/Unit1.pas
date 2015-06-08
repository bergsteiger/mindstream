unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    R1: TEdit;
    R2: TEdit;
    Button1: TButton;
    lbS: TLabel;
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

 procedure S(R: Extended; var theS: Extended);
 begin
  theS := pi * Sqr(R);
 end;

var
 l_R1 : Extended;
 l_R2 : Extended;
 l_S1 : Extended;
 l_S2 : Extended;
begin
 l_R1 := StrToFloat(R1.Text);
 l_R2 := StrToFloat(R2.Text);

 S(l_R1, l_S1);
 S(l_R2, l_S2);

 lbS.Caption := FloatToStr(l_S2 - l_S1);
end;

end.
