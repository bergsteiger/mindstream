unit msDiagrammsList;

interface

uses
 {$Include msPersistent.mixin.pas}
 ,
 {$Include msItemsHolder.mixin.pas}
 ,
 msInterfaces,
 System.Classes,
 System.Types,
 msInterfacedRefcounted
;

type
 TmsItemsHolderParent = TmsInterfacedRefcounted;
 TmsItem = ImsDiagramm;
 {$Include msItemsHolder.mixin.pas}
 TmsPersistentParent = TmsItemsHolder;
 {$Include msPersistent.mixin.pas}
 TmsDiagrammsList = class abstract(TmsPersistent, ImsDiagrammsList)
 protected
  procedure AddDiagramm(const aDiagramm: ImsDiagramm);
  function AddNewDiagramm: ImsDiagramm;
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm); virtual;
  procedure ShapesForToolbarToList(aList: TStrings);
 end;//TmsDiagrammsList

implementation

uses
 {$Include msPersistent.mixin.pas}
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils,
 msDiagramm,
 msInvalidators,
 msShape,
 msShapesForToolbar
 ;

{$Include msPersistent.mixin.pas}

{$Include msItemsHolder.mixin.pas}

procedure TmsDiagrammsList.AddDiagramm(const aDiagramm: ImsDiagramm);
begin
 Items.Add(aDiagramm);
end;

function TmsDiagrammsList.AddNewDiagramm: ImsDiagramm;
begin
 Result := TmsDiagramm.Create('Диаграмма №' + IntToStr(Items.Count + 1));
 AddDiagramm(Result);
 DiagrammAdded(Result);
end;

procedure TmsDiagrammsList.DiagrammAdded(const aDiagramm: ImsDiagramm);
begin
 TmsInvalidators.DiagrammAdded(aDiagramm);
end;

procedure TmsDiagrammsList.ShapesForToolbarToList(aList: TStrings);
var
 l_Class: RmsShape;
begin
 aList.Clear;
 for l_Class in TmsShapesForToolbar.Instance do
  aList.AddObject(l_Class.ClassName, TObject(l_Class));
end;

end.

