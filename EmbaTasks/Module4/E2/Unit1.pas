unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    DoIt: TButton;
    Edit1: TEdit;
    lbResult: TLabel;
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
const
 R = 6350;
begin
 lbResult.Caption := FloatToStr(Sqrt(Sqr(R + StrToFloat(Edit1.Text)) - Sqr(R)));
end;

end.
