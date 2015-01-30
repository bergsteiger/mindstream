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
    pnlBottom: TPanel;
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
   procedure CreateScrollButtons;
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
 msPaletteShapeCreator,
 msShapeClass,

 msScrollShapeUp,
 msScrollShapeDown,
 msScrollShapeRight,
 msScrollShapeLeft,
 msScrollShapeUpLeft,
 msScrollShapeUpRight,
 msScrollShapeDownLeft,
 msScrollShapeDownRight
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagrammsController.Clear;
end;

procedure TfmMain.CreateScrollButtons;
var
 l_Button : TmsShapeButton;
 l_P: TPointF;
begin
{ l_Button := TmsScrollShapeUp.Create(pnlBottom,
                                   msScrollShapeUp,
                                   FDiagrammsController.As_ImsDiagrammsHolder,
                                   TmsUpArrow.Create(l_Button.LocalRect.CenterPoint));Ъ
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(pnlBottom.Width / 2, 0);
 l_Button.Position.X := l_P.X - l_Button.LocalRect.Width / 2;
 l_Button.Position.Y := l_P.Y;}
end;

procedure TfmMain.CreateToolBar(const aPanelWidth: Single);
var
 l_Row, l_Column : Integer;
begin
 l_Row := 0;
 l_Column := 0;
 TmsShapesForToolbar.Instance.IterateShapes(
  procedure (const aShapeClass : MCmsShape)
   function GetColumnCount: Integer;
   begin//GetColumnCount
    Result := Round(aPanelWidth) div TmsPaletteShapeCreator.ButtonSize;
   end;//GetColumnCount
  begin
   pnlToolBar.AddObject(TmsShapeButton.Create(pnlToolBar, aShapeClass, cbShapes, l_Column, l_Row, FDiagrammsController.As_ImsDiagrammsHolder));
   Inc(l_Column);
   if (l_Column > GetColumnCount-1) then
   begin
    l_Column := 0;
    Inc(l_Row);
   end;//l_Column > GetColumnCount-1
  end
 );
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
 CreateScrollButtons;
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
