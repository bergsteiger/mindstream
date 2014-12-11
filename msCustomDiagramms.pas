unit msCustomDiagramms;

interface

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 msShape,
 msDiagramm,
 msInterfaces,
 msDiagrammsPrim
;

type
 TmsItemsHolderParent = TmsDiagrammsPrim;
 TmsItem = ImsDiagramm;
 {$Include msItemsHolder.mixin.pas}
 TmsCustomDiagramms = class abstract(TmsItemsHolder)
 protected
  function GetEnumerator: TmsDiagrammsEnumerator; override;
 end;//TmsCustomDiagramms

implementation

uses
 {$Include msItemsHolder.mixin.pas}
 ,
 System.SysUtils
 ;

{$Include msItemsHolder.mixin.pas}

function TmsCustomDiagramms.GetEnumerator: TmsDiagrammsEnumerator;
begin
 Result := DoGetEnumerator;
end;

end.
