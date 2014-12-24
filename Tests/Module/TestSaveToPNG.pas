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
    function MakeFileName(const aTestName: string; const aTestFolder: string): String; override;
    function TestResultsFileName: String; override;
    procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
   published
    procedure CreateDiagrammWithShapeAndSaveToPNG_AndCheck;
  end;//TTestSaveToPNG

implementation

uses
  SysUtils,
  System.Types,
  msRegisteredShapes,
  FMX.Graphics
  ;

{ TTestSaveToPNG }

procedure TTestSaveToPNG.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
begin
 aDiagramm.SaveToPng(aFileName);
end;

procedure TTestSaveToPNG.CreateDiagrammWithShapeAndSaveToPNG_AndCheck;
begin
 CreateDiagrammWithShapeAndSaveAndCheck;
end;

function TTestSaveToPNG.MakeFileName(const aTestName: string; const aTestFolder: string): String;
begin
 Result := inherited + '.png';
end;

function TTestSaveToPNG.TestResultsFileName: String;
const
 c_PNG = 'PNG\';
begin
 Result := MakeFileName(Name, c_PNG + ComputerName + '\');
end;

initialization
end.

