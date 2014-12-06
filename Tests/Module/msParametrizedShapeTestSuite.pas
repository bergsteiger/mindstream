unit msParametrizedShapeTestSuite;

interface

uses
 TestFramework,
 msShape
 ;

type
  TmsParametrizedShapeTestSuite = class(TTestSuite)
  private
   constructor CreatePrim;
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   class function Create: ITest;
  end;//TmsParametrizedShapeTestSuite

implementation

uses
 System.TypInfo,
 System.Rtti,
 SysUtils,
 TestmsSerializeController
 ;

// TmsParametrizedShapeTestSuite

constructor TmsParametrizedShapeTestSuite.CreatePrim;
begin
 inherited Create(TmsShapeTest);
end;

class function TmsParametrizedShapeTestSuite.Create: ITest;
begin
 Result := CreatePrim;
end;

procedure TmsParametrizedShapeTestSuite.AddTests(testClass: TTestCaseClass);
begin
 Assert(testClass.InheritsFrom(TmsShapeTest));

 RandSeed := 10;
 TmsShapeTestPrim.CheckShapes(
  procedure (aShapeClass: RmsShape)
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

initialization
  RegisterTest(TmsParametrizedShapeTestSuite.Create);

end.
