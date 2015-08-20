unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtMain: TEdit;
    btnMain: TButton;
    lblResult: TLabel;
    procedure btnMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMainClick(Sender: TObject);
var
  InStr : string;
  Index, SubStrCount: Integer;
begin
  InStr := edtMain.Text;

  SubStrCount := 0;

  for Index := 1 to Length(InStr) do
  begin
    if InStr[Index] = '.' then
      Inc(SubStrCount);
  end;

  lblResult.Caption := IntToStr(SubStrCount);
end;

end.
