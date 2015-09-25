unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    lbl1: TLabel;
    edtFileName: TEdit;
    pnlBottom: TPanel;
    btnDoIt: TButton;
    lblResult: TLabel;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  IsCountDown : boolean;

implementation

{$R *.dfm}

procedure TfmMain.btnDoItClick(Sender: TObject);
var
  FileText : TextFile;
  Line, SchoolNumStr, ResultStr : string;
  SchoolNum, MinPupils : integer;
  SchoolArray : array[1..99] of Integer;
  i: Integer;
begin
  AssignFile(FileText, edtFileName.Text);
  Reset(FileText);

  for i := 1 to 99 do
    SchoolArray[i] := 0;

  Readln(FileText);

  while not EOF(FileText) do
  begin
    Readln(FileText, Line);
    SchoolNum := StrToInt(Copy(Line, Length(Line) - 1, 2));

    SchoolArray[SchoolNum] := SchoolArray[SchoolNum] + 1;
  end;

  for i := 1 to 99 do
    if SchoolArray[i] > 0 then
    begin
      MinPupils := SchoolArray[i];
      if SchoolArray[i] < MinPupils then
        MinPupils := SchoolArray[i];
    end;

  for i := 1 to 99 do
    if SchoolArray[i] = MinPupils then
      ResultStr := ResultStr + IntToStr(i) + ',';

  Delete(ResultStr, Length(ResultStr), 1);
  lblResult.Caption := ResultStr;

  CloseFile(FileText);
end;

end.
