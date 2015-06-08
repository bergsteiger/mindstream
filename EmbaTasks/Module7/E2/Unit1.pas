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
 l_Y : Integer;
 l_IsLeap : Boolean;
begin
 l_Y := StrToInt(Edit1.Text);
 l_IsLeap := false;

 if (l_Y mod 4 = 0) then
 begin
  if (l_Y mod 100 = 0) then
  begin
   if (l_Y mod 400 = 0) then
    l_IsLeap := true;
  end//l_Y mod 100 = 0
  else
   l_IsLeap := true;
 end;//l_Y mod 4

 if l_IsLeap then
  Label1.Caption := 'true'
 else
  Label1.Caption := 'false';
end;

end.
