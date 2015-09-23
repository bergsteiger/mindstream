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
    procedure btnBuildGridClick(Sender: TObject);
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
  RowCount, ColCount, ReverseIndex: integer;
begin
  ColCount := StrToInt(edtColCount.Text);
  RowCount := StrToInt(edtRowCount.Text);
  sgdMy.ColCount := ColCount;
  sgdMy.RowCount := RowCount;

  for i := 0 to ColCount do
    for j := 0 to RowCount do
      sgdMy.Cells[i, j] := '0';

  ReverseIndex := 0;

  for i := RowCount - 1 downto (RowCount - ColCount - 1) do
    begin
      for j := ReverseIndex to (ColCount - ReverseIndex - 1) do
      begin
        sgdMy.Cells[j, i] := '1';
      end;

      ReverseIndex := ReverseIndex + 1;
    end;
end;

end.
