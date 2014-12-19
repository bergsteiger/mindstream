unit msDiagrammsList;

interface

uses
 {$Include msPersistent.mixin.pas}
 ,
 {$Include msItemsHolder.mixin.pas}
 ,
 {$Include msShapesProvider.mixin.pas}
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
 TmsShapesProviderParent = TmsPersistent;
 {$Include msShapesProvider.mixin.pas}
 TmsDiagrammsList = class abstract(TmsShapesProvider, ImsDiagrammsList)
 protected
  procedure AddDiagramm(const aDiagramm: ImsDiagramm);
  function AddNewDiagramm: ImsDiagramm;
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm); virtual;
  function  SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
 end;//TmsDiagrammsList

implementation

uses
 {$Include msPersistent.mixin.pas}
 {$Include msItemsHolder.mixin.pas}
 ,
 {$Include msShapesProvider.mixin.pas}
 System.SysUtils,
 msDiagramm,
 msInvalidators,
 msShape,
 msShapesForToolbar
 ;

{$Include msPersistent.mixin.pas}

{$Include msItemsHolder.mixin.pas}

{$Include msShapesProvider.mixin.pas}

procedure TmsDiagrammsList.AddDiagramm(const aDiagramm: ImsDiagramm);
begin
 Items.Add(aDiagramm);
end;

function TmsDiagrammsList.AddNewDiagramm: ImsDiagramm;
begin
 Result := TmsDiagramm.Create('¹' + IntToStr(Items.Count + 1));
 AddDiagramm(Result);
 DiagrammAdded(Result);
end;

procedure TmsDiagrammsList.DiagrammAdded(const aDiagramm: ImsDiagramm);
begin
 TmsInvalidators.DiagrammAdded(Self, aDiagramm);
end;

function TmsDiagrammsList.SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
var
 l_D : ImsDiagramm;
begin
 Result := nil;
 for l_D in Items do
  if (l_D.Name = aDiagrammName) then
  begin
   Result := l_D;
   break;
  end;//l_D.Name = aDiagrammName
end;

end.

