program MindStream;

uses
  msCoreObjects in 'Core\msCoreObjects.pas',
  FMX.Forms,
  uMain in 'uMain.pas' {fmMain},
  msDiagramm in 'msDiagramm.pas',
  msShape in 'AbstractShapes\msShape.pas',
  msRegisteredShapes in 'msRegisteredShapes.pas',
  msLine in 'ConcreteShapes\msLine.pas',
  msRectangle in 'ConcreteShapes\msRectangle.pas',
  msPointCircle in 'SpecialShapes\msPointCircle.pas',
  msCircle in 'ConcreteShapes\msCircle.pas',
  msRoundedRectangle in 'ConcreteShapes\msRoundedRectangle.pas',
  msUseCaseLikeEllipse in 'ConcreteShapes\msUseCaseLikeEllipse.pas',
  msTriangle in 'ConcreteShapes\msTriangle.pas',
  msDiagramms in 'msDiagramms.pas',
  msDiagrammsController in 'msDiagrammsController.pas',
  msDashDotLine in 'ConcreteShapes\msDashDotLine.pas',
  msDashLine in 'ConcreteShapes\msDashLine.pas',
  msDotLine in 'ConcreteShapes\msDotLine.pas',
  msLineWithArrow in 'ConcreteShapes\msLineWithArrow.pas',
  msSmallTriangle in 'SpecialShapes\msSmallTriangle.pas',
  msOurShapes in 'msOurShapes.pas',
  msTriangleDirectionRight in 'ConcreteShapes\msTriangleDirectionRight.pas',
  msMover in 'ShapeTools\msMover.pas',
  u_fmGUITestRunner in 'FMX.DUnit\u_fmGUITestRunner.pas' {fmGUITestRunner},
  FirstTest in 'Tests\Module\FirstTest.pas',
  RegisteredShapesTest in 'Tests\Integrated\RegisteredShapesTest.pas' {/ - тут "банальные" интеграционные тесты (https: /ru.wikipedia.org/wiki/%D0%98%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B5_%D1%82%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)},
  TestMsLine in 'Tests\Module\TestMsLine.pas',
  TestMsRectangle in 'Tests\Module\TestMsRectangle.pas',
  TestMsPointCircle in 'Tests\Module\TestMsPointCircle.pas',
  TestMsCircle in 'Tests\Module\TestMsCircle.pas',
  msShapeTest in 'Tests\Module\msShapeTest.pas',
  msRedRectangle in 'ConcreteShapes\msRedRectangle.pas',
  msGreenRectangle in 'ConcreteShapes\msGreenRectangle.pas',
  msSerializeInterfaces in 'msSerializeInterfaces.pas',
  msTool in 'ShapeTools\msTool.pas',
  msDiagrammMarshal in 'Marshal\msDiagrammMarshal.pas',
  msDiagrammsMarshal in 'Marshal\msDiagrammsMarshal.pas',
  msInterfacedNonRefcounted in 'Core\msInterfacedNonRefcounted.pas',
  msWatchedObjectInstance in 'Core\msWatchedObjectInstance.pas',
  msStringList in 'Core\msStringList.pas',
  msInterfacedRefcounted in 'Core\msInterfacedRefcounted.pas',
  msMarshalPrim in 'Marshal\msMarshalPrim.pas',
  msShapeTestSuite in 'Tests\Module\msShapeTestSuite.pas',
  msInvalidators in 'msInvalidators.pas',
  msCustomDiagramms in 'msCustomDiagramms.pas',
  msInterfaces in 'msInterfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  u_fmGUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
