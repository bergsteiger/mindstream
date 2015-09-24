unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    sgdMy: TStringGrid;
    btnBuildGrid: TButton;
    lblHighest: TLabel;
    lblLowlest: TLabel;
    edtDuration: TEdit;
    edtStartTime: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edtBreakDuration: TEdit;
    edtNumLessons: TEdit;
    procedure btnBuildGridClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnBuildGridClick(Sender: TObject);
var
  i, Duration,
  BreakDuration,
  NumLessons : Integer;

  StartTime : TDateTime;
begin
  StartTime := StrToTime(edtStartTime.Text);
  Duration :=  StrToInt(edtDuration.Text);
  BreakDuration :=  StrToInt(edtBreakDuration.Text);
  NumLessons :=  StrToInt(edtNumLessons.Text);

  sgdMy.RowCount := NumLessons * 2;

  for i := 1 to sgdMy.RowCount - 1 do
  begin
    if i = 1 then
      sgdMy.Cells[1, i] := TimeToStr(StartTime)
    else
      sgdMy.Cells[1, i] := sgdMy.Cells[2, i - 1];

    // We define a lesson or break
    if (i mod 2) <> 0 then
    begin
      sgdMy.Cells[0, i] := 'Lesson ' + IntToStr(i div 2 + 1);
      sgdMy.Cells[2, i] := TimeToStr(StrToTime(sgdMy.Cells[1, i]) +
                                     (Duration / 60 / 24));
    end
    else
    begin
      sgdMy.Cells[0, i] := 'Break';
      sgdMy.Cells[2, i] := TimeToStr(StrToTime(sgdMy.Cells[1, i]) +
                                     (BreakDuration / 60 / 24));
    end;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  sgdMy.FixedCols := 1;
  sgdMy.FixedRows := 1;

  sgdMy.ColWidths[0] := 100;
  sgdMy.Cells[1, 0] := 'Start Time';
  sgdMy.ColWidths[1] := 85;
  sgdMy.Cells[2, 0] := 'End Time';
  sgdMy.ColWidths[2] := 90;
end;

end.

