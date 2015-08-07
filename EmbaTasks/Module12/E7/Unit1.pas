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
  TmpStr, ResultWord : string;
  BeginPos, WordCount : integer;
begin
  TmpStr := edtMain.Text;

  while Length(TmpStr) > 0 do
  begin
    BeginPos := Pos('dog', TmpStr);
    if BeginPos <> 0 then
    begin
      ResultWord := ResultWord + Copy(TmpStr, 0, BeginPos - 1) + 'cat';
      Delete(TmpStr, 1, BeginPos + 2);
    end;
  end;

  edtMain.Text := ResultWord;
end;

end.