unit l3ProtoObjectComparable;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoObject
  ;

type
 Tl3ProtoObjectComparable = class(Tl3ProtoObject)
 public
 // public methods
   function CompareWith(anOther: Tl3ProtoObjectComparable): Integer; virtual; abstract;
 end;//Tl3ProtoObjectComparable

implementation

end.