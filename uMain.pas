unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  Generics.Collections,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Menus, FMX.Edit, FMX.ListBox, msDiagramm,

  msDiagramms,
  msDiagrammsController,
  msInterfaces,
  msShapeButton
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
    btnTriangleShape: TButton;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgMainMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure FormDestroy(Sender: TObject);
    procedure btnClearImageClick(Sender: TObject);
    procedure imgMainPaint(Sender: TObject; Canvas: TCanvas);
    procedure btnTriangleShapeClick(Sender: TObject);
  private
   FDiagrammsController: ImsDiagrammsController;
  public
    { Public declarations }
  end;

var
 fmMain: TfmMain;

implementation

uses
 System.Math.Vectors,
 msSmallTriangle,
 msRectangle,
 msTriangle
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagrammsController.Clear;
end;

procedure TfmMain.btnTriangleShapeClick(Sender: TObject);
var
 l_ShapeButton, l_ShapeButton1: TmsShapeButton;
 l_Triangle, l_Rectangle : ImsShape;
 l_StartPoint: TPointF;
begin
 l_StartPoint := TPointF.Create(20, 20);
 l_Triangle := TmsTriangle.Create(TmsMakeShapeContext.Create(l_StartPoint,nil,nil));

 l_ShapeButton := TmsShapeButton.Create(nil, l_Triangle);
 l_ShapeButton.Position.X := 20;
 l_ShapeButton.Position.Y := 20;
 pnlToolBar.AddObject(l_ShapeButton);

 l_Rectangle := TmsRectangle.Create(TmsMakeShapeContext.Create(l_StartPoint,nil,nil));
 l_ShapeButton1 := TmsShapeButton.Create(nil, l_Rectangle);
 l_ShapeButton1.Position.X := l_ShapeButton.Position.X + 40;
 l_ShapeButton1.Position.Y := 20;
 pnlToolBar.AddObject(l_ShapeButton1)
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
