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
    fArray : array[1 .. c_RowCount, 1 .. c_ColCount] of integer;
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
  RowCount, ColCount,
  RandomValue, SumElements,
  MaxValue, MinValue,
  SumEachColumn : integer;
begin
  ColCount := c_ColCount;
  RowCount := c_RowCount;

  sgdMy.ColCount := ColCount;
  sgdMy.RowCount := RowCount;

  SumElements := 0;
  MaxValue := fArray[1, 1];
  MinValue := fArray[1, 1];

  for i := 1 to ColCount do
  begin
    SumEachColumn := 0;

    for j := 1 to RowCount do
    begin
      RandomValue := Random(StrToInt(edtLowlest.Text) -
                      StrToInt(edtHighest.Text)) + StrToInt(edtHighest.Text);

      fArray[i, j] := RandomValue;
      sgdMy.Cells[i - 1, j - 1] := IntToStr(fArray[i, j]);

      SumEachColumn := SumEachColumn + fArray[i, j];
      SumElements := SumElements + fArray[i, j];

      if fArray[i, j] < MinValue then
        MinValue := fArray[i, j];

      if fArray[i, j] > MaxValue then
        MaxValue := fArray[i, j];
    end;

    memResult.Lines.Append('Sum of elements of ' + IntToStr(i) + ' column = ' + IntToStr(SumEachColumn));
  end;

  memResult.Lines.Append('Sum of elements = ' + IntToStr(SumElements));
  memResult.Lines.Append('Maximal element = ' + IntToStr(MaxValue));
  memResult.Lines.Append('Minimal element = ' + IntToStr(MinValue));
end;

end.
