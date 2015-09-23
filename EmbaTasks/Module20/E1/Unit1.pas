unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    sgdMy: TStringGrid;
    lbl3: TLabel;
    lbl4: TLabel;
    edtNumExperiments: TEdit;
    edtScaleIntervals: TEdit;
    btnBuildGrid: TButton;
    btnCalculateResult: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnBuildGridClick(Sender: TObject);
    procedure btnCalculateResultClick(Sender: TObject);
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
  i : integer;
begin
  sgdMy.RowCount := StrToInt(edtNumExperiments.Text) + 1;
  for i := 1 to sgdMy.RowCount do
  begin
    sgdMy.Cells[0, i] := IntToStr(i);
    sgdMy.Cells[1, i] := edtScaleIntervals.Text;
  end;
end;

procedure TfmMain.btnCalculateResultClick(Sender: TObject);
var
  i, MaxRow, MinRow : integer;
begin
  MaxRow := 1;
  MinRow := 1;

  for i := 1 to sgdMy.RowCount - 1 do
  begin
    sgdMy.Cells[3, i] := IntToStr(StrToInt(sgdMy.Cells[2, i]) *
                                  StrToInt(edtScaleIntervals.Text));

    if StrToInt(sgdMy.Cells[3, i]) > StrToInt(sgdMy.Cells[3, MaxRow]) then
      MaxRow := i;

    if StrToInt(sgdMy.Cells[3, i]) < StrToInt(sgdMy.Cells[3, MinRow]) then
      MinRow := i;
  end;

  sgdMy.Cells[4, MaxRow] := 'Max Value';
  sgdMy.Cells[4, MinRow] := 'Min Value';
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  sgdMy.Cells[0, 0] := 'Number of Experiments';
  sgdMy.ColWidths[0] := 120;
  sgdMy.Cells[1, 0] := 'Scale Intervals';
  sgdMy.ColWidths[1] := 85;
  sgdMy.Cells[2, 0] := 'Measured Values';
  sgdMy.ColWidths[2] := 90;
  sgdMy.Cells[3, 0] := 'Result';
  sgdMy.ColWidths[3] := 40;
  sgdMy.Cells[4, 0] := 'Max/Min';
  sgdMy.ColWidths[4] := 70;
end;

end.
