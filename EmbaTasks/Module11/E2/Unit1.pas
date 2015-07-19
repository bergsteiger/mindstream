unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    pbxEx: TPaintBox;
    pnlButtons: TPanel;
    btnSnowMan: TButton;
    procedure btnSnowManClick(Sender: TObject);
  private
    { Private declarations }
    procedure DrawSnowMan;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnSnowManClick(Sender: TObject);
begin
  DrawSnowMan;
end;

procedure TfrmMain.DrawSnowMan;
var
  Center : TPoint;
begin
  Center.X := pbxEx.Width div 2;
  Center.Y := pbxEx.Height div 2;

  pbxEx.Canvas.Pen.Color:= clBlack;
  pbxEx.Canvas.Pen.Width:= 2;

  pbxEx.Canvas.Brush.Color := clWhite;
  pbxEx.Canvas.Pixels[Center.X, Center.Y] := clBlack;

  //pbxEx.Canvas.LineTo(Center.X, Center.Y);
end;

end.
