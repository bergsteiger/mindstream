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
const
  c_SubString = 'abc';
var
  TmpStr : string;
  SubStrCount: Integer;
begin
  TmpStr := edtMain.Text;

  SubStrCount := 0;
  while Length(TmpStr) > 0 do
  begin
    if Pos(c_SubString, TmpStr) <> 0 then
    begin
      Delete(TmpStr, 1, Pos(c_SubString, TmpStr) + Length(c_SubString));
      Inc(SubStrCount);
    end
    else
      Break;
  end;

  lblResult.Caption := IntToStr(SubStrCount);
end;

end.
