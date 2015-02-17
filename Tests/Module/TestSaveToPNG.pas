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
    function FileExtension: String; override;
    function InnerFolders: String; override;
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

// TTestSaveToPNG

procedure TTestSaveToPNG.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
begin
 aDiagramm.SaveToPng(aFileName);
end;

procedure TTestSaveToPNG.CreateDiagrammWithShapeAndSaveToPNG_AndCheck;
begin
 CreateDiagrammWithShapeAndSaveAndCheck;
end;

function TTestSaveToPNG.FileExtension: String;
begin
 Result := '.png';
end;

function TTestSaveToPNG.InnerFolders: String;
const
 c_PNG = 'PNG\';
begin
 Result := c_PNG + ClassName + '\' + String(ComputerName) + '\';
end;

end.

