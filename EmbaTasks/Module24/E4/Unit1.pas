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
    btnStart: TButton;
    lblResult: TLabel;
    mem1: TMemo;
    procedure btnStartClick(Sender: TObject);
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

procedure TfmMain.btnStartClick(Sender: TObject);
var
  FileText : TextFile;
  Line, SchoolNumStr : string;
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
    mem1.Lines.Append(IntToStr(SchoolNum));

    SchoolArray[SchoolNum] := SchoolArray[SchoolNum] + 1;
  end;

  for i := 1 to 99 do
    if SchoolArray[i] > 0 then
    begin
      MinPupils := SchoolArray[i];
      if SchoolArray[i] < MinPupils then
        MinPupils := SchoolArray[i];
    end;

  mem1.Lines.Append('---------------');

  for i := 1 to 99 do
    if SchoolArray[i] = MinPupils then
      mem1.Lines.Append(IntToStr(i));

  CloseFile(FileText);
end;

end.
