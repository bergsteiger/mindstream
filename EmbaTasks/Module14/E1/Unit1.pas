unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfmMain = class(TForm)
    memMain: TMemo;
    btnDoIt: TButton;
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
const
  c_MaxLines = 4;

  procedure DelLines(aLastCount, aFirstCount : integer);
  var
    Index : integer;
  begin
    for Index := aLastCount downto aFirstCount do
      memMain.Lines.Delete(Index);
  end;
begin
  if memMain.Lines.Count > c_MaxLines then
    DelLines(memMain.Lines.Count, c_MaxLines)
  else
    DelLines(c_MaxLines, 1);
end;

end.
