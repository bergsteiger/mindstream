unit msDiagrammStack;
// - סעוך הטאדנאלל

interface

uses
 Generics.Collections,
 msInterfaces
 ;

type
 TmsCurrentDiagrammRec = record
 public
  rDiagramms : ImsDiagrammsList;
  rDiagramm : ImsDiagramm;
  constructor Create(const aDiagramms : ImsDiagrammsList; const aDiagramm : ImsDiagramm);
 end;//TmsCurrentDiagrammRec

implementation

constructor TmsCurrentDiagrammRec.Create(const aDiagramms : ImsDiagrammsList; const aDiagramm : ImsDiagramm);
begin
 Assert(aDiagramms <> nil);
 Assert(aDiagramm <> nil);
end;

end.
