{$IfDef NoEverest}
 {$Include l3Define.inc}
{$Else  NoEverest}
 {$Include evDefine.inc}
{$EndIf NoEverest}

{$Define seCacheDict}

{$Define seTypeCheck}

{$IfDef NewGen}
 {.$Undef seCacheDict}
{$EndIf NewGen}