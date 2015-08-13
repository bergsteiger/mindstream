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
    procedure DoIt;
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
begin
  DoIt;
end;

procedure TForm1.DoIt;
var
  Index : integer;
  InStr,
  ResultStr : String;
begin
  InStr := edtIn.Text;

  for Index := 0 to Pred(Length(InStr)) do
    if not (InStr[Index] in ['0' .. '9']) then
      ResultStr := ResultStr + InStr[Index];

  edtOut.Text := ResultStr;
end;

end.
