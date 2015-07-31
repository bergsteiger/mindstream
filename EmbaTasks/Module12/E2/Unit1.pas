unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtMain: TEdit;
    btnMain: TButton;
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
  TmpStr : string;
  i: Integer;
begin
  TmpStr := edtMain.Text;

  for i := 1 to Length(TmpStr) do
  begin
    if TmpStr[i] = ' ' then
      TmpStr[i] := '!';
  end;

  edtMain.Text := TmpStr;
end;

end.
