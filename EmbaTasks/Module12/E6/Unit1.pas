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
  TmpStr : string;
  BeginPos, WordCount : integer;
begin
  TmpStr := edtMain.Text;

  WordCount := 0;
  while Length(TmpStr) > 0 do
  begin
    BeginPos := Pos(' ', TmpStr);

    if (BeginPos = 0) and
       (Length(TmpStr) > 0) then
      Delete(TmpStr, 1, Length(TmpStr))
    else
      Delete(TmpStr, 1, BeginPos);

    if BeginPos <> 1 then
      Inc(WordCount);
  end;

  lblResult.Caption := IntToStr(WordCount);
end;

end.
