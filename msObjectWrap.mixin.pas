{$IfNDef TmsObjectWrap_uses_intf}

// interface

{$Define TmsObjectWrap_uses_intf}

// uses
 msSerializeInterfaces

{$Else TmsObjectWrap_uses_intf}

{$IfNDef TmsObjectWrap_intf}
 TmsObjectWrap = class(TmsObjectWrapParent{, ImsObjectWrap})
 protected
  function toObject: TObject;
 end;//TmsObjectWrap
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsObjectWrap_intf}

{$Else TmsObjectWrap_intf}

// implementation

{$IfNDef TmsObjectWrap_uses_impl}

// uses

{$Define TmsObjectWrap_uses_impl}

{$Else TmsObjectWrap_uses_impl}

// TmsObjectWrap

function TmsObjectWrap.toObject: TObject;
begin
 Result := Self;
end;

{$EndIf TmsObjectWrap_uses_impl}

{$EndIf TmsObjectWrap_intf}
{$EndIf TmsObjectWrap_uses_intf}
