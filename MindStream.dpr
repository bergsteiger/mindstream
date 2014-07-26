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
  msLineWithArrow in 'msLineWithArrow.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
