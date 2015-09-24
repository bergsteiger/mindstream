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
    btnDetermineYoungest: TButton;
    procedure btnDetermineYoungestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TfmMain.btnDetermineYoungestClick(Sender: TObject);
var
  i, YoungestIndex : Integer;
  MinDate : TDateTime;
begin
  for i := 1 to sgdMy.RowCount -1 do
    sgdMy.Cells[3, i] := '';

  MinDate := StrToDate(sgdMy.Cells[1, 1]);
  YoungestIndex := 1;

  for i := 1 to sgdMy.RowCount - 1 do
    if StrToDate(sgdMy.Cells[1, i]) < MinDate then
    begin
      MinDate := StrToDate(sgdMy.Cells[1, i]);
      YoungestIndex := i;
    end;

  sgdMy.Cells[3, YoungestIndex] := 'This man';
end;


procedure TfmMain.FormCreate(Sender: TObject);
begin
  sgdMy.Cells[0, 0] := 'Last name';
  sgdMy.ColWidths[0] := 100;
  sgdMy.Cells[1, 0] := 'Dates of birth';
  sgdMy.ColWidths[1] := 120;
  sgdMy.Cells[2, 0] := 'Dates of the Nobel Prize';
  sgdMy.ColWidths[2] := 140;
  sgdMy.Cells[3, 0] := 'Who youngest';
  sgdMy.ColWidths[3] := 100;
end;

end.
