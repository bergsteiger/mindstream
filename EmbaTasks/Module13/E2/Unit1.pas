unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtIn: TEdit;
    edtOut: TEdit;
    btnDoIt: TButton;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDoItClick(Sender: TObject);
var
  Index, NumberCount  : integer;
  Str : string;
begin
  Str := edtIn.Text;
  NumberCount := 0;
  for Index := 0 to Length(Str) do
  begin
    if Str[Index] in ['0'..'9'] then
      Inc(NumberCount);
  end;

  edtOut.Text := IntToStr(NumberCount);
end;

end.
