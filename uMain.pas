unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    btnRect: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure btnRectClick(Sender: TObject);
  private
   FObjects : array of TRectangle;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.fmx}

procedure TfmMain.btnRectClick(Sender: TObject);
var
 l_RectF: TRectF;
begin
 SetLength(FObjects, length(FObjects) + 1);
 FObjects[0] := TRectangle.Create(nil);
 FObjects[0].Position.X := 10;
 FObjects[0].Position.Y := 10;
 FObjects[0].Height := 100;
 FObjects[0].Width := 100;

// l_RectF := TRectF.Create();
// FObjects[0].PaintTo(self.Canvas, );
// self.Canvas.
// FObjects[0].Size := TSizeF.Create(100, 100);
// TRectangle(high(FObjects)).
end;

procedure TfmMain.miAboutClick(Sender: TObject);
begin
 ShowMessage(self.Caption);
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
 self.Close;
end;

end.
