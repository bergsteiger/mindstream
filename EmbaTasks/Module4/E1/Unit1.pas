unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lbInt: TLabel;
    DoIt: TButton;
    Edit1: TEdit;
    lbFrac: TLabel;
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

procedure TForm1.DoItClick(Sender: TObject);
var
 l_V : Double;
 l_I : Double;
begin
 l_V := StrToFloat(Edit1.Text);
 l_I := Int(l_V);
 lbInt.Caption := FloatToStr(l_I);
 lbFrac.Caption := FloatToStr(Frac(l_V));
end;

end.
