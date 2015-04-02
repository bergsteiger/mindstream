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
   constructor CreatePrim(aTestClass : RmsShapeTest);
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   class function Create(aTestClass : RmsShapeTest): ITest;
  end;//TmsParametrizedShapeTestSuite

implementation

uses
 System.TypInfo,
 System.Rtti,
 SysUtils,
 TestSaveToPNG,
 msShapeClassList,
 TestSaveMoverToPNG
 ;

// TmsParametrizedShapeTestSuite

constructor TmsParametrizedShapeTestSuite.CreatePrim(aTestClass : RmsShapeTest);
begin
 inherited Create(aTestClass);
end;

class function TmsParametrizedShapeTestSuite.Create(aTestClass : RmsShapeTest): ITest;
begin
 Result := CreatePrim(aTestClass);
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
    begin
     RmsShapeTest(testClass).AddTest(TmsShapeTestContext.Create(l_Method.Name, l_Seed, l_DiagrammName, l_ShapesCount, aShapeClass),
      procedure (ATest: ITest)
      begin
       AddTest(aTest);
      end
     );
    end;//l_Method.Visibility = mvPublished
  end
 );
end;

initialization
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TmsShapeTest));
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TmsDiagrammTest));
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TTestSaveToPNG));
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TTestSaveMoverToPNG));
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TmsMoverFloatingButtonsTest));
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TmsConnectorDrawTest));
 RegisterTest(TmsParametrizedShapeTestSuite.Create(TmsShapeWithConnectorTest));
end.
