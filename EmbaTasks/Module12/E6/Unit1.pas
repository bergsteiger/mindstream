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
  BeginPos, WordCount : integer;
begin
  InStr := edtMain.Text;

  WordCount := 0;
  while Length(InStr) > 0 do
  begin
    BeginPos := Pos(' ', InStr);

    if (BeginPos = 0) and
       (Length(InStr) > 0) then
      Delete(InStr, 1, Length(InStr))
    else
      Delete(InStr, 1, BeginPos);

    if BeginPos <> 1 then
      Inc(WordCount);
  end;

  lblResult.Caption := IntToStr(WordCount);
end;

end.
