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
  procedure SerializeTo(const aFileName: String);
  procedure DeSerializeFrom(const aFileName: String);
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

procedure TmsCustomDiagramms.SerializeTo(const aFileName: String);
begin
 TmsDiagrammsMarshal.Serialize(aFileName, Self);
end;


procedure TmsCustomDiagramms.DeSerializeFrom(const aFileName: String);
begin
 TmsDiagrammsMarshal.DeSerialize(aFileName, Self As TmsDiagramms);
end;

procedure TmsCustomDiagramms.AddDiagramm(const aDiagramm: ImsDiagramm);
begin
 Items.Add(aDiagramm);
end;

end.

