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
  TmpStr, ResultWord : string;
  BeginPos, EndPos : integer;
begin
  TmpStr := edtMain.Text;

  ResultWord := 'No word in parentheses';
  if (Pos('(', TmpStr) <> 0) and
     (Pos(')', TmpStr) <> 0) then
  begin
    BeginPos := Pos('(', TmpStr);
    EndPos := Pos(')', TmpStr);
    ResultWord := Copy(TmpStr, BeginPos + 1, EndPos - BeginPos - 1);
  end;

  lblResult.Caption := ResultWord;
end;

end.
