unit msDiagrammsList;

interface

uses
 {$Include msPersistent.mixin.pas}
 ,
 {$Include msItemsHolder.mixin.pas}
 ,
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
 end;//TmsDiagrammsList

implementation

uses
 {$Include msPersistent.mixin.pas}
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils
 ;

{$Include msPersistent.mixin.pas}

{$Include msItemsHolder.mixin.pas}

procedure TmsDiagrammsList.AddDiagramm(const aDiagramm: ImsDiagramm);
begin
 Items.Add(aDiagramm);
end;

end.

