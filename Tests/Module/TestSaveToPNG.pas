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

procedure TTestSaveToPNG.CreateDiagrammWithShapeAndSaveToPNG_AndCheck;
var
 l_Bitmap: TBitmap;
 l_SourceRect: TRectF;
begin
 // Фиксируем размер снимаемой области
 l_SourceRect := TRectF.Create(0, 0, 700, 500);
 // Создаем временный буфер для получения скриншота
 l_Bitmap := TBitmap.Create(Round(l_SourceRect.Width), Round(l_SourceRect.Height));
 try
 CreateDiagrammAndCheck(
  procedure (const aDiagramm : ImsDiagramm)
  var
   l_P : TPoint;
  begin
   for l_P in f_Coords do
    aDiagramm.AddShape(f_Context.rShapeClass.Create(TmsMakeShapeContext.Create(TPointF.Create(l_P.X, l_P.Y), nil, nil))).AddNewDiagramm;

   SaveDiagrammAndCheck(aDiagramm,
    procedure (const aFileName: String; const aDiagramm: ImsDiagramm)
    begin
     aDiagramm.DrawTo(l_Bitmap.Canvas);
     aDiagramm.SaveToPng(aFileName, l_Bitmap.Canvas);
    end)
  end
  , f_Context.rDiagrammName
 );
 finally
  FreeAndNil(l_Bitmap);
 end;
end;

function TTestSaveToPNG.MakeFileName(const aTestName: string; const aTestFolder: string): String;
begin
 Result := inherited + '.png';
end;

function TTestSaveToPNG.TestResultsFileName: String;
begin
 Result := MakeFileName(Name, c_PNG);
end;

initialization
end.

