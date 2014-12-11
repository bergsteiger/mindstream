unit msDiagrammsPrim;

interface

uses
 System.Types,
 System.Classes,
 msInterfaces,
 msInterfacedRefcounted
 ;

type
 TmsDiagrammsPrim = class abstract(TmsInterfacedRefcounted, ImsDiagramms)
  protected
   procedure AllowedShapesToList(aList: TStrings); virtual; abstract;
   function CurrentShapeClassIndex: Integer; virtual; abstract;
   function CurrentDiagrammIndex: Integer; virtual; abstract;
   function pm_GetCurrentDiagramm: ImsDiagramm; virtual; abstract;
   procedure AddDiagramm(aList: TStrings); virtual; abstract;
   procedure Serialize; virtual; abstract;
   procedure DeSerialize; virtual; abstract;
   procedure Clear; virtual; abstract;
   procedure SelectDiagramm(anIndex: Integer); virtual; abstract;
   procedure SelectShape(aList: TStrings; anIndex: Integer); virtual; abstract;
   procedure ProcessClick(const aStart: TPointF); virtual; abstract;
   function GetEnumerator: TmsDiagrammsEnumerator; virtual; abstract;
   property CurrentDiagramm: ImsDiagramm
    read pm_GetCurrentDiagramm;
 end;//TmsDiagrammsPrim

implementation

end.
