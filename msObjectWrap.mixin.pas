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
  function EQ(const anOther: ImsObjectWrap): Boolean;
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

function TmsObjectWrap.EQ(const anOther: ImsObjectWrap): Boolean;
begin
 Assert(Self <> nil);
 Assert(anOther <> nil);
 Result := (Self = anOther.toObject);
end;

{$EndIf TmsObjectWrap_uses_impl}

{$EndIf TmsObjectWrap_intf}
{$EndIf TmsObjectWrap_uses_intf}
