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
  procedure DiagrammAdded(const aDiagramm: ImsDiagramm);
  function  SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
  procedure DiagrammsForToolbarToList(aList: TStrings);
  function FirstDiagramm: ImsDiagramm;
  function pm_GetCount: Integer;
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
const
 cN : array [0..6] of String = ('main', 'methods', 'uses', 'call', 'state', 'inject', 'sequence');
begin
 if (Items.Count >= Low(cN)) AND (Items.Count <= High(cN)) then
  Result := TmsDiagramm.Create(cN[Items.Count])
 else
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

procedure TmsDiagrammsList.DiagrammsForToolbarToList(aList: TStrings);
var
 l_D : ImsDiagramm;
begin
 aList.Clear;
 for l_D in Items do
  aList.Add(l_D.Name);
end;

function TmsDiagrammsList.FirstDiagramm: ImsDiagramm;
begin
 if (Items.Count <= 0) then
  Result := nil
 else
  Result := Items.First;
end;

function TmsDiagrammsList.pm_GetCount: Integer;
begin
 Result := Items.Count;
end;

end.

