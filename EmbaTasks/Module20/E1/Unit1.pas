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
  i, j, RowCount, ColCount: integer;
begin
  sgdMy.ColCount := StrToInt(edtColCount.Text);
  sgdMy.RowCount := StrToInt(edtRowCount.Text);

  sgdMy.Cells[1,1] := 'qwe';
{  n := StrToInt(edit1.Text);
  m := StrToInt(edit2.Text);
  stringgrid1.RowCount := n;
  stringgrid1.ColCount := m;

  for i := 0 to n - 1 do
    for j := 0 to m - 1 do
      if i mod 2 = 0 then
        stringgrid1.Cells[j, i] := IntToStr(i * m + j + 1)
      else
        stringgrid1.Cells[j, i] := IntToStr((i + 1) * m - j)   }
end;

end.
