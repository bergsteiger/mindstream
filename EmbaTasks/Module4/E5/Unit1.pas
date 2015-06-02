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
begin
 lbHeight.Caption := FloatToStr(Abs(StrToFloat(L.Text) * Tan(StrToFloat(alpha.Text))));
end;

end.
