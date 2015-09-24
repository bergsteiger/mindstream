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
    tmrMain: TTimer;
    procedure btnSnowManClick(Sender: TObject);
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

procedure TfrmMain.btnSnowManClick(Sender: TObject);
begin
  Draw;
end;

procedure TfrmMain.Draw;
var
  Rect : TRect;
begin
  // Draw Sky
  pbxEx.Canvas.Brush.Color := clBlack;
  pbxEx.Canvas.FillRect(TRect.Create(0, 0, pbxEx.Width, pbxEx.Height));

  tmrMain.Enabled := True;
end;

end.
