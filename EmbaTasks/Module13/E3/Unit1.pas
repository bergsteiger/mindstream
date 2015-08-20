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
  Index, ResultSum, SpacePos, Number, Code  : integer;
  InStr, SubStr : string;
begin
  InStr := edtIn.Text;

  ResultSum := 0;
  SpacePos := 1;
  while SpacePos > 0 do
  begin
    InStr := Trim(InStr);
    SpacePos := Pos(' ', InStr);
    SubStr := Copy(InStr, 0, SpacePos - 1);
    Delete(InStr, 1, SpacePos);
    Val(SubStr, Number, Code);

    if Code = 0 then
      ResultSum := ResultSum + Number;
  end;

  edtOut.Text := IntToStr(ResultSum);
end;

end.
