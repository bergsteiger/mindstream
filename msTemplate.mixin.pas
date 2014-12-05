{$IfNDef TmsMixIn_uses_intf}

// interface

{$Define TmsMixIn_uses_intf}

// uses

{$Else TmsMixIn_uses_intf}

{$IfNDef TmsMixIn_intf}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsMixIn_intf}

{$Else TmsMixIn_intf}

// implementation

{$IfNDef TmsMixIn_uses_impl}

// uses

{$Define TmsMixIn_uses_impl}

{$Else TmsMixIn_uses_impl}

// TmsTemplate

{$EndIf TmsMixIn_uses_impl}

{$EndIf TmsMixIn_intf}
{$EndIf TmsMixIn_uses_intf}
