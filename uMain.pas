unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDiagramm,

  msDiagramms,
  msDiagrammsController,
  msInterfaces
  ;

type
  TfmMain = class(TForm)
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    pnlTop: TPanel;
    imgMain: TPaintBox;
    btnClearImage: TButton;
    cbShapes: TComboBox;
    cbDiagramm: TComboBox;
    btAddDiagramm: TButton;
    btSaveDiagramm: TButton;
    btLoadDiagramm: TButton;
    btnSaveToPNG: TButton;
    pnlToolBar: TPanel;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure imgMainPaint(Sender: TObject; Canvas: TCanvas);
  private
   FDiagrammsController: ImsDiagrammsController;
   procedure CreateToolBar(const aPanelWidth: Single);
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

implementation

uses
 System.Math.Vectors,
 msShape,
 msTool,
 msShapeButton,
 msShapesForToolbar,
 msPaletteShapeCreator
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagrammsController.Clear;
end;

procedure TfmMain.CreateToolBar(const aPanelWidth: Single);

 function GetColumnCount: Integer;
 begin//GetColumnCount
  Result := Round(aPanelWidth) div TmsPaletteShapeCreator.ButtonSize;
 end;//GetColumnCount

var
 l_RmsShape: RmsShape;

 l_Row, l_Column : Integer;
 l_ShapeIndex : Integer;
begin
 l_Row := 0;
 l_Column := 0;
 l_ShapeIndex := 0;
 for l_RmsShape in TmsShapesForToolbar.Instance do
 begin
  pnlToolBar.AddObject(TmsShapeButton.Create(pnlToolBar, l_RmsShape, cbShapes, l_Column, l_Row));
  Inc(l_Column);
  if (l_Column > GetColumnCount-1) then
  begin
   l_Column := 0;
   Inc(l_Row);
  end;//l_Column > GetColumnCount-1
  Inc(l_ShapeIndex);
 end;//for l_RmsShape in TmsShapesForToolbar.Instance
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
 FDiagrammsController := TmsDiagrammsController.Create(imgMain,
                                                       cbShapes,
                                                       cbDiagramm,
                                                       btAddDiagramm,
                                                       btSaveDiagramm,
                                                       btLoadDiagramm,
                                                       btnSaveToPNG);
 CreateToolBar(pnlToolBar.Width);
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 FDiagrammsController := nil;
end;

procedure TfmMain.imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
 Caption := 'x = ' + FloatToStr(X) + '; y = ' + FloatToStr(Y);
end;

procedure TfmMain.imgMainPaint(Sender: TObject; Canvas: TCanvas);
begin
 FDiagrammsController.DrawTo(Canvas);
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
