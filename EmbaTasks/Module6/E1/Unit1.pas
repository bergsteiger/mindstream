unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Button1: TButton;
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
 l_m : Integer;
 l_n : Integer;
begin
 l_m := StrToInt(Edit1.Text);
 l_n:= StrToInt(Edit2.Text);
 if (l_m mod l_n = 0) then
  Label1.Caption := IntToStr(l_m div l_n)
 else
  Label1.Caption := Format('%d cannot be divided by %d', [l_m, l_n]);
end;

end.
