unit msShapeTestSuite;

interface

uses
 TestFramework,
 msShape,
 msShapeTest
 ;

type
  TmsParametrizedShapeTestSuite = class(TTestSuite)
  private
   constructor CreatePrim;
  protected
   class function TestClass: RmsShapeTest; virtual; abstract;
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   class function Create: ITest;
  end;//TmsParametrizedShapeTestSuite

  TmsShapesTest = class(TmsParametrizedShapeTestSuite)
  protected
   class function TestClass: RmsShapeTest; override;
  end;//TmsShapesTest

  TmsDiagrammsTest = class(TmsParametrizedShapeTestSuite)
  protected
   class function TestClass: RmsShapeTest; override;
  end;//TmsDiagrammsTest

  TmsDiagrammsToPNGTest = class(TmsParametrizedShapeTestSuite)
  protected
   class function TestClass: RmsShapeTest; override;
  end;//TmsDiagrammsTest

  TmsDiagrammsMoverToPNGTest = class(TmsParametrizedShapeTestSuite)
  protected
   class function TestClass: RmsShapeTest; override;
  end;//TmsDiagrammsMoverToPNGTest

implementation

uses
 System.TypInfo,
 System.Rtti,
 SysUtils,
 TestSaveToPNG,
 msShapeClassList,
 TestSaveMoverToPNG
 ;

// TmsShapesTest

class function TmsShapesTest.TestClass: RmsShapeTest;
begin
 Result := TmsShapeTest;
end;

// TmsDiagrammsTest

class function TmsDiagrammsTest.TestClass: RmsShapeTest;
begin
 Result := TmsDiagrammTest;
end;

// TmsParametrizedShapeTestSuite

constructor TmsParametrizedShapeTestSuite.CreatePrim;
begin
 inherited Create(TestClass);
end;

class function TmsParametrizedShapeTestSuite.Create: ITest;
begin
 Result := CreatePrim;
end;

procedure TmsParametrizedShapeTestSuite.AddTests(testClass: TTestCaseClass);
begin
 Assert(testClass.InheritsFrom(TmsShapeTestPrim));

 RandSeed := 10;
 TmsShapeTestPrim.CheckShapes(
  procedure (const aShapeClass: MCmsShape)
  var
   l_Method: TRttiMethod;
   l_DiagrammName : String;
   l_Seed : Integer;
   l_ShapesCount : Integer;
  begin
   l_Seed := Random(High(l_Seed));
   l_DiagrammName := 'Диаграмма №' + IntToStr(Random(10));
   l_ShapesCount := Random(1000) + 1;
   for l_Method in TRttiContext.Create.GetType(testClass).GetMethods do
    if (l_Method.Visibility = mvPublished) then
     AddTest(RmsShapeTest(testClass).Create(TmsShapeTestContext.Create(l_Method.Name, l_Seed, l_DiagrammName, l_ShapesCount, aShapeClass)));
  end
 );
end;

// TmsDiagrammsToPNGTest

class function TmsDiagrammsToPNGTest.TestClass: RmsShapeTest;
begin
 Result := TTestSaveToPNG;
end;

// TmsDiagrammsMoverToPNGTest

class function TmsDiagrammsMoverToPNGTest.TestClass: RmsShapeTest;
begin
 Result := TTestSaveMoverToPNG;
end;

initialization
 RegisterTest(TmsShapesTest.Create);
 RegisterTest(TmsDiagrammsTest.Create);
 RegisterTest(TmsDiagrammsToPNGTest.Create);
 RegisterTest(TmsDiagrammsMoverToPNGTest.Create);
end.
