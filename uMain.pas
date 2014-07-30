unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDiagramm,

  msDiagramms,
  msDiagrammsController
  ;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlTop: TPanel;
    imgMain: TImage;
    btnClearImage: TButton;
    cbShapes: TComboBox;
    cbDiagramm: TComboBox;
    btAddDiagramm: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
  private
   FDiagramm: TmsDiagrammsController;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

implementation

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagramm.Clear;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 FDiagramm := TmsDiagrammsController.Create(imgMain, cbShapes, cbDiagramm, btAddDiagramm);
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 FreeAndNil(FDiagramm);
end;

procedure TfmMain.imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 Caption := 'x = ' + FloatToStr(X) + '; y = ' + FloatToStr(Y);
end;

procedure TfmMain.miAboutClick(Sender: TObject);
begin
 ShowMessage(Self.Caption);
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
 Self.Close;
end;

end.
