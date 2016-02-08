unit l3ProtoPersistentWithHandleRefList;

 
{$Include l3Define.inc}

interface

uses
  l3ProtoPersistentWithHandleRefListPrim,
  l3Types
  ;

type
 _l3ObjectByHandleSearcher_Parent_ = Tl3ProtoPersistentWithHandleRefListPrim;
 {$Include l3ObjectByHandleSearcher.imp.pas}
 Tl3ProtoPersistentWithHandleRefList = class(_l3ObjectByHandleSearcher_)
 end;//Tl3ProtoPersistentWithHandleRefList

implementation

type _Instance_R_ = Tl3ProtoPersistentWithHandleRefList;

{$Include l3ObjectByHandleSearcher.imp.pas}

end.