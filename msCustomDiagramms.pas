unit msCustomDiagramms;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 msShape,
 msDiagramm,
 msInterfaces,
 System.Classes,
 System.Types,
 msInterfacedRefcounted
;

type
 TmsItemsHolderParent = TmsInterfacedRefcounted;
 TmsItem = ImsDiagramm;
 {$Include msItemsHolder.mixin.pas}
 TmsCustomDiagramms = class abstract(TmsItemsHolder, ImsDiagramms)
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
  procedure SaveTo(const aFileName: String);
  procedure LoadFrom(const aFileName: String);
  procedure AddDiagramm(const aDiagramm: ImsDiagramm);
 end;//TmsCustomDiagramms

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils,
 msDiagramms,
 msDiagrammsMarshal
 ;

{$Include msItemsHolder.mixin.pas}

procedure TmsCustomDiagramms.SaveTo(const aFileName: String);
begin
 TmsDiagrammsMarshal.Serialize(aFileName, Self);
end;


procedure TmsCustomDiagramms.LoadFrom(const aFileName: String);
begin
 TmsDiagrammsMarshal.DeSerialize(aFileName, Self As TmsDiagramms);
end;

procedure TmsCustomDiagramms.AddDiagramm(const aDiagramm: ImsDiagramm);
begin
 Items.Add(aDiagramm);
end;

end.

