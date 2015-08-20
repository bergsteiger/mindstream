unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtIn: TEdit;
    edtOut: TEdit;
    btnDoIt: TButton;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnDoItClick(Sender: TObject);
var
  InNum : Integer;
  OutStr : string;
begin
  InNum := StrToInt(Trim(edtIn.Text));

  OutStr := '';
  repeat
    if (InNum mod 2) = 0 then
      OutStr := '0' + OutStr
    else
      OutStr := '1' + OutStr;

    InNum := InNum div 2;
  until (InNum = 1);

  if InNum = 1 then
    OutStr := '1' + OutStr;

  edtOut.Text := OutStr;
end;

end.
