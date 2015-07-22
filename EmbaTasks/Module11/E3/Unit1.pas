unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pbxEx: TPaintBox;
    pnlButtons: TPanel;
    btnDraw: TButton;
    edtRowCount: TEdit;
    edtColumnCount: TEdit;
    lblColumnCount: TLabel;
    lblRowcount: TLabel;
    procedure btnDrawClick(Sender: TObject);
  private
    { Private declarations }
    procedure Draw;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnDrawClick(Sender: TObject);
begin
  Draw;
end;

procedure TfrmMain.Draw;
var
  PaintCenter,
  SquareTopLeft,
  SquareRightBottom : TPoint;

  RowCount,
  ColumnCount,
  RowStep,
  ColumnStep,
  Index : integer;
begin
  PaintCenter.X := pbxEx.Width div 2;
  PaintCenter.Y := pbxEx.Height div 2;

  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  RowCount := StrToInt(edtRowCount.Text);
  ColumnCount := StrToInt(edtColumnCount.Text);

  RowStep := pbxEx.Height div RowCount;
  ColumnStep := pbxEx.Width div ColumnCount;

  for Index := 1 to RowCount do
  begin
    pbxEx.Canvas.MoveTo(0, RowStep * Index);
    pbxEx.Canvas.LineTo(pbxEx.Width, RowStep * Index);
  end;

  for Index := 1 to ColumnCount do
  begin
    pbxEx.Canvas.MoveTo(ColumnStep * Index, 0);
    pbxEx.Canvas.LineTo(ColumnStep * Index, pbxEx.Height);
  end;

end;

end.
