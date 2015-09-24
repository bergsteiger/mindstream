unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

const
  c_ColCount = 7;
  c_RowCount = 12;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    pnlMain: TPanel;
    sgdMy: TStringGrid;
    btnBuildGrid: TButton;
    lblHighest: TLabel;
    lblLowlest: TLabel;
    edtHighest: TEdit;
    edtLowlest: TEdit;
    memResult: TMemo;
    procedure btnBuildGridClick(Sender: TObject);
  private
    { Private declarations }
  fArray : array[1 .. c_RowCount, 1 .. c_ColCount] of real;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnBuildGridClick(Sender: TObject);
var
  i, j,
  RowCount, ColCount : Integer;

  RandomValue, SumElements,
  MaxValue, MinValue,
  SumEachColumn : real;
begin
  ColCount := c_ColCount + 1;
  RowCount := c_RowCount + 1;

  sgdMy.ColCount := ColCount;
  sgdMy.RowCount := RowCount;

  sgdMy.FixedCols := 1;
  sgdMy.FixedRows := 1;

  for i := 1 to ColCount - 1 do
   sgdMy.Cells[i, 0] := IntToStr(i);

  for i := 1 to RowCount - 1 do
    sgdMy.Cells[0, i] := IntToStr(i);

  for i := 1 to RowCount - 1 do
    for j := 1 to ColCount - 1 do
    begin
      RandomValue := random * (StrToInt(edtLowlest.Text) -
                               StrToInt(edtHighest.Text)) + StrToInt(edtHighest.Text);

      fArray[i, j] := RandomValue;
    end;

  for i := 1 to ColCount - 1 do
    for j := 1 to RowCount - 1 do
      sgdMy.Cells[i, j] := FloatToStr(fArray[j, i]);

  sgdMy.ColCount := sgdMy.ColCount + 1;

  memResult.Lines.Append(floatToStr(fArray[c_RowCount, c_ColCount]));
end;

end.
