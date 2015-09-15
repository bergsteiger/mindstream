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
    pnlBottom: TPanel;
    memResult: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edtRow: TEdit;
    edtColumn: TEdit;
    edtFixedRow: TEdit;
    edtFixedColumn: TEdit;
    btnCreateGrid: TButton;
    lbl5: TLabel;
    btnChangeFixedRed: TButton;
    btnChangeFixedBlue: TButton;
    btnChangeFixedGreen: TButton;
    lbl6: TLabel;
    btnChangeRed: TButton;
    btnChangeBlue: TButton;
    btnChangeGreen: TButton;
    lbl7: TLabel;
    lbl8: TLabel;
    edtDisplayRow: TEdit;
    edtDisplayColumn: TEdit;
    btnDisplayRow: TButton;
    btnDisplayColumn: TButton;
    procedure btnCreateGridClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

Procedure GetGridParam(var n1, n2, n3, n4: integer);
Begin
  n1 := StrToInt(fmMain.edtRow.Text);
  n2 := StrToInt(fmMain.edtColumn.Text);
  n3 := StrToInt(fmMain.edtFixedRow.Text);
  n4 := StrToInt(fmMain.edtFixedColumn.Text);
End;

Procedure CreateGrid(n1, n2, n3, n4: integer);
Begin
  fmMain.sgdMy.RowCount := n1;
  fmMain.sgdMy.ColCount := n2;
  fmMain.sgdMy.FixedRows := n3;
  fmMain.sgdMy.FixedCols := n4;
end;

procedure TfmMain.btnCreateGridClick(Sender: TObject);
var
  Row, Column, FixedRow, FixedColumn : integer;
begin
  GetGridParam(Row, Column, FixedRow, FixedColumn);
  CreateGrid(Row, Column, FixedRow, FixedColumn)
end;

end.
