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
    procedure btnDisplayRowClick(Sender: TObject);
    procedure btnDisplayColumnClick(Sender: TObject);
    procedure btnChangeFixedRedClick(Sender: TObject);
    procedure btnChangeFixedGreenClick(Sender: TObject);
    procedure btnChangeRedClick(Sender: TObject);
    procedure btnChangeFixedBlueClick(Sender: TObject);
    procedure btnChangeGreenClick(Sender: TObject);
    procedure btnChangeBlueClick(Sender: TObject);
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

procedure TfmMain.btnChangeBlueClick(Sender: TObject);
begin
  sgdMy.Color := clBlue;
end;

procedure TfmMain.btnChangeFixedBlueClick(Sender: TObject);
begin
  sgdMy.FixedColor := clBlue;
end;

procedure TfmMain.btnChangeFixedGreenClick(Sender: TObject);
begin
  sgdMy.FixedColor := clGreen;
end;

procedure TfmMain.btnChangeFixedRedClick(Sender: TObject);
begin
  sgdMy.FixedColor := clRed;
end;

procedure TfmMain.btnChangeGreenClick(Sender: TObject);
begin
  sgdMy.Color := clGreen;
end;

procedure TfmMain.btnChangeRedClick(Sender: TObject);
begin
  sgdMy.Color := clRed;
end;

procedure TfmMain.btnCreateGridClick(Sender: TObject);
var
  RowCount, ColumnCount, FixedRowCount, FixedColumnCount : integer;
begin
  GetGridParam(RowCount, ColumnCount, FixedRowCount, FixedColumnCount);
  CreateGrid(RowCount, ColumnCount, FixedRowCount, FixedColumnCount)
end;

procedure TfmMain.btnDisplayColumnClick(Sender: TObject);
var
  i : integer;
  TmpStr : String;
begin
  TmpStr := '';

  for i := sgdMy.FixedRows to sgdMy.RowCount do
    TmpStr := TmpStr + sgdMy.Cells[StrToInt(edtDisplayColumn.Text), i];

  memResult.Lines.Append(TmpStr);
end;

procedure TfmMain.btnDisplayRowClick(Sender: TObject);
var
  i : integer;
  TmpStr : String;
begin
  TmpStr := '';

  for i := sgdMy.FixedCols to sgdMy.ColCount do
    TmpStr := TmpStr + sgdMy.Cells[i, StrToInt(edtDisplayRow.Text)];

  memResult.Lines.Append(TmpStr);
end;

end.
