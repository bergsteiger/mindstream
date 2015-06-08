unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 l_S : String;
 l_I : Integer;
 l_k : Integer;
begin
 l_S := '';
 for l_I := 10 to 99 do
  l_S := l_S + IntToStr(l_I);
 l_k := StrToInt(Edit1.Text);
 Label1.Caption := l_S[l_k];
end;

end.
