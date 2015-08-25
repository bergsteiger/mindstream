unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    btnDoIt: TButton;
    pnlTop: TPanel;
    memFirst: TMemo;
    memSecond: TMemo;
    memResult: TMemo;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnDoItClick(Sender: TObject);
var
  FirstMemIndex,
  SecondMemIndex : integer;
  IsIdenticalLine : boolean;
begin
  IsIdenticalLine := False;

  memResult.Lines.Clear;

  for FirstMemIndex := 0 to memFirst.Lines.Count - 1 do
    for SecondMemIndex := 0 to memSecond.Lines.Count - 1 do
      if Pos(memFirst.Lines[FirstMemIndex], memSecond.Lines[SecondMemIndex]) > 0 then
      begin
        memResult.Lines.Add(memFirst.Lines[FirstMemIndex]);
        IsIdenticalLine := True;
      end;

  if not IsIdenticalLine then
    memResult.Lines.Add('there are no identical lines')
end;

end.
