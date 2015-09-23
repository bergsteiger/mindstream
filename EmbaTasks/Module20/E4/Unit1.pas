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
    btnChangeMin: TButton;
    procedure btnBuildGridClick(Sender: TObject);
    procedure btnChangeMinClick(Sender: TObject);
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

procedure TfmMain.btnChangeMinClick(Sender: TObject);
var
  i, j,
  RowCount, ColCount,
  Min, DiagonalNum,
  MinColIndex : integer;
begin
  ColCount := sgdMy.ColCount;
  RowCount := sgdMy.RowCount;

  for j := 0 to RowCount - 1 do
  begin
    Min := StrToInt(sgdMy.Cells[0, j]);
    MinColIndex := 0;

    for i := 0 to ColCount - 1 do
    begin
      if Min > StrToInt(sgdMy.Cells[i, j]) then
      begin
        Min := StrToInt(sgdMy.Cells[i, j]);
        MinColIndex := i;
      end;
    end;

    DiagonalNum := StrToInt(sgdMy.Cells[j, j]);

    sgdMy.Cells[j, j] := IntToStr(Min);
    sgdMy.Cells[MinColIndex, j] := IntToStr(DiagonalNum);
  end;
end;

end.
