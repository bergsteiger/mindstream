unit TestSaveToPNG;

interface

uses
  TestFrameWork,
  msShapeTest,
  msInterfaces
  ;

type
  TTestSaveToPNG = class(TmsShapeTestPrim)
   protected
    procedure SaveDiagrammToPNG_AndCheck(const aDiagramm: ImsDiagramm);
    procedure SaveToPng(const aFileName: String; const aDiagramm: ImsDiagramm);
    function MakeFileName(const aTestName: String): String; override;
   published

    procedure CreateDiagrammWithShapeAndSaveToPNG_AndCheck;
  end;//TTestSaveToPNG

implementation

uses
  SysUtils,
  System.Types,
  msRegisteredShapes,
  uMain
  ;

{ TTestSaveToPNG }

procedure TTestSaveToPNG.CreateDiagrammWithShapeAndSaveToPNG_AndCheck;

begin
 CreateDiagrammAndCheck(
  procedure (const aDiagramm : ImsDiagramm)
  var
   l_P: TPointF;
  begin
   for l_P in f_Coords do
    aDiagramm.AddShape(f_Context.rShapeClass.Create(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil, nil))).AddNewDiagramm;

   // Вот тут надо как-то обновить контролер, так как только он отвечает за рисование
   SaveDiagrammToPNG_AndCheck(aDiagramm);
  end
  , f_Context.rDiagrammName
 );
end;

function TTestSaveToPNG.MakeFileName(const aTestName: String): String;
var
 l_Folder : String;
begin
 l_Folder := ExtractFilePath(ParamStr(0)) + 'TestResults\PNG\';
 ForceDirectories(l_Folder);
 Result := l_Folder + ClassName + '_' + aTestName + '.png';
end;

procedure TTestSaveToPNG.SaveDiagrammToPNG_AndCheck(const aDiagramm: ImsDiagramm);
var
 l_FileNameTest : String;
begin
 l_FileNameTest := TestResultsFileName;
 SaveToPng(l_FileNameTest, aDiagramm);
 CheckFileWithEtalon(l_FileNameTest);
end;

procedure TTestSaveToPNG.SaveToPng(const aFileName: String; const aDiagramm: ImsDiagramm);
begin
 aDiagramm.SaveToPng(aFileName, fmMain.imgMain);
end;

initialization
 TestFramework.RegisterTest(TTestSaveToPNG.Create(TmsShapeTestContext.Create('CreateDiagrammWithShapeAndSaveToPNG_AndCheck', 0, 'Diagramm № 1', 0, TmsRegisteredShapes.Instance.First)));
end.

