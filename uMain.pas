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
 msCompletedShapeCreator
 ;

{$R *.fmx}

procedure TfmMain.btnClearImageClick(Sender: TObject);
begin
 FDiagrammsController.Clear;
end;

procedure TfmMain.CreateToolBar(const aPanelWidth: Single);

const
 c_ButtonSize = 40;

 function GetColumnCount: Integer;
 begin//GetColumnCount
  Result := Round(aPanelWidth) div c_ButtonSize;
 end;//GetColumnCount

var
 l_ShapeButton: TmsShapeButton;
 l_Shape : ImsShape;
 l_RmsShape: RmsShape;

 l_Row, l_Column : Integer;
 l_ShapeIndex : Integer;
begin
 l_Row := 0;
 l_Column := 0;
 l_ShapeIndex := 0;
 for l_RmsShape in TmsShapesForToolbar.Instance do
 begin
  l_Shape := TmsCompletedShapeCreator.Create(l_RmsShape).CreateShape(TmsMakeShapeContext.Create(TPointF.Create(c_ButtonSize / 2,
                               c_ButtonSize / 2), nil, nil));

  l_ShapeButton := TmsShapeButton.Create(pnlToolBar, c_ButtonSize, l_Shape, cbShapes, l_ShapeIndex);
  l_ShapeButton.Position.X := l_Column * c_ButtonSize;
  l_ShapeButton.Position.Y := l_Row * c_ButtonSize;

  pnlToolBar.AddObject(l_ShapeButton);
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
