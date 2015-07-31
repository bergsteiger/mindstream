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
    lblNPoints: TLabel;
    edtNSquare: TEdit;
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
procedure DrawSquare(aStartX, aStartY : integer; aSide : integer);
begin
  pbxEx.Canvas.MoveTo(aStartX, aStartY);
  pbxEx.Canvas.LineTo(aStartX + aSide, aStartY);
  pbxEx.Canvas.LineTo(aStartX + aSide, aStartY + aSide);
  pbxEx.Canvas.LineTo(aStartX, aStartY + aSide);
  pbxEx.Canvas.LineTo(aStartX, aStartY);
end;
var
  NSquare: integer;

begin
  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;


  DrawSquare(100, 100, 50);
end;


end.
