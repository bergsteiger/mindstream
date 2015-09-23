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
    edtRowCount: TEdit;
    edtColCount: TEdit;
    btnBuildGrid: TButton;
    lblHighest: TLabel;
    lblLowlest: TLabel;
    edtHighest: TEdit;
    edtLowlest: TEdit;
    btnCalcPow: TButton;
    memResult: TMemo;
    procedure btnBuildGridClick(Sender: TObject);
    procedure btnCalcPowClick(Sender: TObject);
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
  i, j,
  RowCount, ColCount: integer;
begin
  ColCount := StrToInt(edtColCount.Text);
  RowCount := StrToInt(edtRowCount.Text);
  sgdMy.ColCount := ColCount;
  sgdMy.RowCount := RowCount;

  for i := 0 to ColCount do
    for j := 0 to RowCount do
      sgdMy.Cells[i, j] := IntToStr(Random(StrToInt(edtLowlest.Text) -
                                           StrToInt(edtHighest.Text)) + StrToInt(edtHighest.Text));

end;

procedure TfmMain.btnCalcPowClick(Sender: TObject);
var
  i, j,
  RowCount, ColCount,
  ColumnPow : integer;
begin
  ColCount := sgdMy.ColCount;
  RowCount := sgdMy.RowCount;

  memResult.Lines.Clear;

  for i := 0 to ColCount - 1 do
  begin
    ColumnPow := 1;
    for j := 0 to RowCount - 1 do
    begin
      if j mod 2 <> 0 then
        ColumnPow := ColumnPow * StrToInt(sgdMy.Cells[i, j])
    end;

    memResult.Lines[0] := memResult.Lines[0] + IntToStr(ColumnPow) + '           ';
  end;
end;

end.
