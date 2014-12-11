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
 TmsCustomDiagramms = class abstract(TmsItemsHolder, ImsDiagramms)
 protected
  procedure DeSerializeFrom(const aFileName: String);
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

procedure TmsCustomDiagramms.DeSerializeFrom(const aFileName: String);
begin
 TmsDiagrammsMarshal.DeSerialize(aFileName, Self As TmsDiagramms);
end;

end.
