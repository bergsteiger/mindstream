unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    btnDoIt: TButton;
    pnlTop: TPanel;
    pnlMain: TPanel;
    memMain: TMemo;
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
  Index,
  LongestLineIndex,
  MaxLineLenght : Integer;
begin
  MaxLineLenght := 0;
  LongestLineIndex := -1;
  for Index := 0 to memMain.Lines.Count - 1 do
    if Length(memMain.Lines[Index]) > MaxLineLenght then
    begin
      MaxLineLenght := Length(memMain.Lines[Index]);
      LongestLineIndex := Index;
    end;

  memMain.Lines.Exchange(0, LongestLineIndex);
end;

end.
