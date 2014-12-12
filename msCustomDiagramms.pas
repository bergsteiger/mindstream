unit msCustomDiagramms;

interface

uses
 msShape,
 msDiagramm,
 msInterfaces,
 System.Classes,
 System.Types,
 msInterfacedRefcounted,
 msDiagrammsList
;

type
 TmsCustomDiagramms = class abstract(TmsDiagrammsList, ImsDiagramms)
 protected
  procedure AllowedShapesToList(aList: TStrings); virtual; abstract;
  function CurrentShapeClassIndex: Integer; virtual; abstract;
  function CurrentDiagrammIndex: Integer; virtual; abstract;
  function pm_GetCurrentDiagramm: ImsDiagramm; virtual; abstract;
  procedure AddNewDiagramm(aList: TStrings); virtual; abstract;
  procedure Serialize; virtual; abstract;
  procedure DeSerialize; virtual; abstract;
  procedure Clear; virtual; abstract;
  procedure SelectDiagramm(anIndex: Integer); virtual; abstract;
  procedure SelectShape(aList: TStrings; anIndex: Integer); virtual; abstract;
  procedure ProcessClick(const aStart: TPointF); virtual; abstract;
  property CurrentDiagramm: ImsDiagramm
   read pm_GetCurrentDiagramm;
  procedure SaveTo(const aFileName: String); virtual; abstract;
  procedure LoadFrom(const aFileName: String); virtual; abstract;
 end;//TmsCustomDiagramms

implementation

uses
 System.SysUtils,
 msDiagramms,
 msDiagrammsMarshal
 ;

end.

