unit msDiagrammsList;

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
 TmsDiagrammsList = class abstract(TmsItemsHolder, ImsDiagrammsList)
 protected
  procedure SaveTo(const aFileName: String); virtual; abstract;
  procedure LoadFrom(const aFileName: String); virtual; abstract;
  procedure AddDiagramm(const aDiagramm: ImsDiagramm);
 end;//TmsDiagrammsList

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils
 ;

{$Include msItemsHolder.mixin.pas}

procedure TmsDiagrammsList.AddDiagramm(const aDiagramm: ImsDiagramm);
begin
 Items.Add(aDiagramm);
end;

end.

