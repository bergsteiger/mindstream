unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDiagramm,

  msDiagramms,
  msDiagrammsController,
  msInterfaces, FMX.Controls.Presentation
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
    btnSaveJsonAndPng: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
 msScrollShapeDownRight,
 msScrollShapeResetOrigin
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagrammsController.Clear;
end;

procedure TfmMain.CreateScrollButtons;
function BuildButton(aShape: ImsShapeClass) : TmsShapeButton;
begin
 Result := TmsShapeButton.Create(pnlBottom,
                                 aShape,
                                 cbShapes, 0, 0,
                                 FDiagrammsController.As_ImsDiagrammsHolder);
end;
var
 l_Button : TmsShapeButton;
 l_P: TPointF;
begin
 // TmsScrollShapeUpLeft
 l_Button := BuildButton(TmsScrollShapeUpLeft.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(0, 0);
 l_Button.Position.X := l_P.X;
 l_Button.Position.Y := l_P.Y;
 l_Button.Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];

 // TmsScrollShapeUp
 l_Button := BuildButton(TmsScrollShapeUp.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(pnlBottom.Width / 2, 0);
 l_Button.Position.X := l_P.X - l_Button.LocalRect.Width / 2;
 l_Button.Position.Y := l_P.Y;
 l_Button.Anchors := [TAnchorKind.akTop];

 // TmsScrollShapeUpRight
 l_Button := BuildButton(TmsScrollShapeUpRight.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(pnlBottom.Width, 0);
 l_Button.Position.X := l_P.X - l_Button.LocalRect.Width;
 l_Button.Position.Y := l_P.Y;
 l_Button.Anchors := [TAnchorKind.akTop, TAnchorKind.akRight];

 // TmsScrollShapeLeft
 l_Button := BuildButton(TmsScrollShapeLeft.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(0, pnlBottom.Height / 2);
 l_Button.Position.X := l_P.X;
 l_Button.Position.Y := l_P.Y - l_Button.LocalRect.Height / 2;
 l_Button.Anchors := [TAnchorKind.akLeft];

 // TmsScrollShapeRight
 l_Button := BuildButton(TmsScrollShapeRight.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(pnlBottom.Width, pnlBottom.Height / 2);
 l_Button.Position.X := l_P.X - l_Button.LocalRect.Width;
 l_Button.Position.Y := l_P.Y - l_Button.LocalRect.Height / 2;
 l_Button.Anchors := [TAnchorKind.akRight];

 // TmsScrollShapeDownLeft
 l_Button := BuildButton(TmsScrollShapeDownLeft.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(0, pnlBottom.Height);
 l_Button.Position.X := l_P.X;
 l_Button.Position.Y := l_P.Y - l_Button.LocalRect.Height;
 l_Button.Anchors := [TAnchorKind.akLeft, TAnchorKind.akBottom];

 // TmsScrollShapeDown
 l_Button := BuildButton(TmsScrollShapeDown.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(pnlBottom.Width / 2 , pnlBottom.Height);
 l_Button.Position.X := l_P.X - l_Button.LocalRect.Width / 2;
 l_Button.Position.Y := l_P.Y - l_Button.LocalRect.Height;
 l_Button.Anchors := [TAnchorKind.akBottom];

 // TmsScrollShapeDownRight
 l_Button := BuildButton(TmsScrollShapeDownRight.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(pnlBottom.Width, pnlBottom.Height);
 l_Button.Position.X := l_P.X - l_Button.LocalRect.Width;
 l_Button.Position.Y := l_P.Y - l_Button.LocalRect.Height;
 l_Button.Anchors := [TAnchorKind.akRight, TAnchorKind.akBottom];

 // TmsScrollShapeResetOrigin
 l_Button := BuildButton(TmsScrollShapeResetOrigin.MC);
 pnlBottom.AddObject(l_Button);
 l_P := TPointF.Create(0, 0);
 l_Button.Position.X := l_P.X + l_Button.LocalRect.Width;
 l_Button.Position.Y := l_P.Y;
 l_Button.Anchors := [TAnchorKind.akTop, TAnchorKind.akLeft];
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
                                                       btnSaveToPNG,
                                                       btnSaveJsonAndPng);
 CreateToolBar(pnlToolBar.Width);
 CreateScrollButtons;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
 FDiagrammsController := nil;
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
