unit msCustomDiagramms;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 msShape,
 msDiagramm
;

type
 TmsItemsHolderParent = TmsDiagrammsPrim;
 TmsItem = ImsDiagramm;
 {$Include msItemsHolder.mixin.pas}
 TmsCustomDiagramms = class abstract(TmsItemsHolder)
 end;//TmsCustomDiagramms

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils
 ;

{$Include msItemsHolder.mixin.pas}

end.
