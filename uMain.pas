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
 msSmallTriangle
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagrammsController.Clear;
end;

procedure TfmMain.btnTriangleShapeClick(Sender: TObject);
var
 l_ShapeButton: TmsShapeButton;
 l_SmallTriangle: ImsShape;
 l_StartPoint: TPointF;

 l_Button: TButton;
begin
 l_StartPoint := TPointF.Create(3, 3);
 l_SmallTriangle := TmsSmallTriangle.Create(TmsMakeShapeContext.Create(l_StartPoint,nil,nil));
 l_ShapeButton := TmsShapeButton.Create(l_SmallTriangle);
// l_ShapeButton.Height := 50;
// l_ShapeButton.Width := 50;
// pnlToolBar.AddObject(l_Button);
 l_Button := TButton.Create(nil);
 l_Button.Width:= 50;
 l_Button.Height:= 50;
 pnlToolBar.AddObject(l_Button);
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
