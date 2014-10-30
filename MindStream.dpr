program MindStream;

uses
  FMX.Forms,
  uMain in 'uMain.pas' {fmMain},
  msDiagramm in 'msDiagramm.pas',
  msShape in 'msShape.pas',
  msRegisteredShapes in 'msRegisteredShapes.pas',
  msLine in 'msLine.pas',
  msRectangle in 'msRectangle.pas',
  msPointCircle in 'msPointCircle.pas',
  msCircle in 'msCircle.pas',
  msRoundedRectangle in 'msRoundedRectangle.pas',
  msUseCaseLikeEllipse in 'msUseCaseLikeEllipse.pas',
  msTriangle in 'msTriangle.pas',
  msDiagramms in 'msDiagramms.pas',
  msDiagrammsController in 'msDiagrammsController.pas',
  msDashDotLine in 'msDashDotLine.pas',
  msDashLine in 'msDashLine.pas',
  msDotLine in 'msDotLine.pas',
  msLineWithArrow in 'msLineWithArrow.pas',
  msSmallTriangle in 'msSmallTriangle.pas',
  msOurShapes in 'msOurShapes.pas',
  msTriangleDirectionRight in 'msTriangleDirectionRight.pas',
  msMover in 'msMover.pas',
  u_fmGUITestRunner in 'FMX.DUnit\u_fmGUITestRunner.pas' {fmGUITestRunner},
  FirstTest in 'Tests\Module\FirstTest.pas',
  RegisteredShapesTest in 'Tests\Integrated\RegisteredShapesTest.pas' {/ - тут "банальные" интеграционные тесты (https: /ru.wikipedia.org/wiki/%D0%98%D0%BD%D1%82%D0%B5%D0%B3%D1%80%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%BE%D0%B5_%D1%82%D0%B5%D1%81%D1%82%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5)},
  TestMsLine in 'Tests\Module\TestMsLine.pas',
  TestMsRectangle in 'Tests\Module\TestMsRectangle.pas',
  TestMsPointCircle in 'Tests\Module\TestMsPointCircle.pas',
  TestMsCircle in 'Tests\Module\TestMsCircle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  u_fmGUITestRunner.RunRegisteredTestsModeless;
  Application.Run;
end.
