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
  function GetIndexWordInLine(aWord : string) : integer;
  var
    Index : integer;
  begin
    Result := -1;
    for Index := 0 to memMain.Lines.Count - 1 do
      if pos(aWord, memMain.Lines[Index]) > 0 then
      begin
        Result := Index;
        Exit;
      end;
  end;
var
  DogIndex, CatIndex : integer;
begin
  DogIndex := GetIndexWordInLine('dog');
  CatIndex := GetIndexWordInLine('cat');
  memMain.Lines.Exchange(DogIndex, CatIndex);
end;

end.
