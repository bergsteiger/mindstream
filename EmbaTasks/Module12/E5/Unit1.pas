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
  InStr, OutStr : string;
  BeginPos, EndPos : integer;
begin
  InStr := edtMain.Text;

  OutStr := 'No word in parentheses';
  if (Pos('(', InStr) <> 0) and
     (Pos(')', InStr) <> 0) then
  begin
    BeginPos := Pos('(', InStr);
    EndPos := Pos(')', InStr);
    OutStr := Copy(InStr, BeginPos + 1, EndPos - BeginPos - 1);
  end;

  lblResult.Caption := OutStr;
end;

end.
