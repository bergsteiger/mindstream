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
  function AddNewDiagramm: ImsDiagramm;
  procedure ItemAdded(const aDiagramm: ImsDiagramm); override;
  function  SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
  procedure DiagrammsForToolbarToList(aList: TStrings);
  function FirstDiagramm: ImsDiagramm;
  function pm_GetCount: Integer;
  procedure Cleanup; override;
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

// TmsDiagrammsList

procedure TmsDiagrammsList.Cleanup;
begin
 // - перекрыто чисто для отладки
 inherited;
end;

function TmsDiagrammsList.AddNewDiagramm: ImsDiagramm;
const
 cN : array [0..6] of String = ('main', 'methods', 'uses', 'call', 'state', 'inject', 'sequence');
begin
 if (Self.ItemsCount >= Low(cN)) AND (Self.ItemsCount <= High(cN)) then
  Result := TmsDiagramm.Create(cN[Self.ItemsCount])
 else
  Result := TmsDiagramm.Create('№' + IntToStr(Self.ItemsCount + 1));
 Self.Add(Result);
end;

procedure TmsDiagrammsList.ItemAdded(const aDiagramm: ImsDiagramm);
begin
 inherited;
 TmsInvalidators.DiagrammAdded(Self, aDiagramm);
end;

function TmsDiagrammsList.SelectDiagramm(const aDiagrammName: String): ImsDiagramm;
var
 l_D : ImsDiagramm;
begin
 Result := nil;
 for l_D in Self do
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
 for l_D in Self do
  aList.Add(l_D.Name);
end;

function TmsDiagrammsList.FirstDiagramm: ImsDiagramm;
begin
 if (Self.ItemsCount <= 0) then
  Result := nil
 else
  Result := Self.FirstItem;
end;

function TmsDiagrammsList.pm_GetCount: Integer;
begin
 Result := Self.ItemsCount;
end;

end.

