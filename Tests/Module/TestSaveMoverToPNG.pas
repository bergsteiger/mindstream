unit TestSaveMoverToPNG;

interface

uses
  TestFrameWork,
  msShapeTest,
  msInterfaces,
  TestSaveToPNG
  ;

type
  TTestSaveMoverToPNG = class(TTestSaveToPNG)
  protected
   procedure SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm); override;
  end;//TTestSaveMoverToPNG

implementation

// TTestSaveMoverToPNG

procedure TTestSaveMoverToPNG.SaveDiagramm(const aFileName: String; const aDiagramm: ImsDiagramm);
var
 l_ShapeToDeal : ImsShape;
begin
 l_ShapeToDeal := aDiagramm.FirstShape;
 inherited;
end;

end.

