{$IfNDef TmsPersistent_uses_intf}

// interface

{$Define TmsPersistent_uses_intf}

// uses
 msSerializeInterfaces

{$Else TmsPersistent_uses_intf}

{$IfNDef TmsPersistent_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsPersistent_intf}
 TmsPersistent = class abstract(TmsPersistentParent{, ImsPersistent})
 protected
  procedure SaveTo(const aFileName: String); virtual; abstract;
  procedure LoadFrom(const aFileName: String); virtual; abstract;
 end;//TmsPersistent

{$Else TmsPersistent_intf}

// implementation

{$IfNDef TmsPersistent_uses_impl}

// uses

{$Define TmsPersistent_uses_impl}

{$Else TmsPersistent_uses_impl}

// TmsPersistent

{$EndIf TmsPersistent_uses_impl}

{$EndIf TmsPersistent_intf}
{$EndIf TmsPersistent_uses_intf}
