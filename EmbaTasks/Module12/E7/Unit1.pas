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
  InStr, OutStr : string;
  BeginPos, WordCount : integer;
begin
  InStr := edtMain.Text;

  while Length(InStr) > 0 do
  begin
    BeginPos := Pos('dog', InStr);
    if BeginPos > 0 then
    begin
      OutStr := OutStr + Copy(InStr, 0, BeginPos - 1) + 'cat';
      Delete(InStr, 1, BeginPos + 2);
    end
    else
      Exit;
  end;

  edtMain.Text := OutStr;
end;

end.
