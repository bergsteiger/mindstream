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
  InStr, OutStr, FirstSurname, SecondSurname : string;
  FirstHeight, SecondHeight, SpacePos : Integer;
begin
  InStr := Trim(edtIn.Text);

  SpacePos := Pos(' ',InStr);
  FirstSurname := Copy(InStr, 0, SpacePos - 1);
  Delete(InStr, 1, SpacePos);

  SpacePos := Pos(' ',InStr);
  FirstHeight := StrToInt(Copy(InStr, 0, SpacePos - 1));
  Delete(InStr, 1, SpacePos);

  SpacePos := Pos(' ',InStr);
  SecondSurname := Copy(InStr, 0, SpacePos - 1);
  Delete(InStr, 1, SpacePos);

  SecondHeight := StrToInt(Copy(InStr, 0, Length(InStr)));
  Delete(InStr, 1, SpacePos);

  if FirstHeight > SecondHeight then
    OutStr := FirstSurname
  else if SecondHeight > FirstHeight then
    OutStr := SecondSurname
  else if FirstHeight = SecondHeight then
    OutStr := FirstSurname + ' ' + SecondSurname;

  edtOut.Text := OutStr;
end;

end.
