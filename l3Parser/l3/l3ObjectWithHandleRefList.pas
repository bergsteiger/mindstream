unit l3ObjectWithHandleRefList;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ObjectWithHandleRefListPrim,
  l3Types
  ;

type
 _l3ObjectByHandleSearcher_Parent_ = Tl3ObjectWithHandleRefListPrim;
 {$Include ..\L3\l3ObjectByHandleSearcher.imp.pas}
 Tl3ObjectWithHandleRefList = class(_l3ObjectByHandleSearcher_)
 end;//Tl3ObjectWithHandleRefList

implementation

type _Instance_R_ = Tl3ObjectWithHandleRefList;

{$Include ..\L3\l3ObjectByHandleSearcher.imp.pas}

end.