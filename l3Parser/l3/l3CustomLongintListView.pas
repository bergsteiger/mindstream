unit l3CustomLongintListView;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3LongintList,
  l3PureMixIns,
  l3CustomOtherListView
  ;

type
 _ListType_ = Tl3LongintList;
 _ItemType_ = Integer;
 {$Include ..\L3\l3OtherTypedListView.imp.pas}
 Tl3CustomLongintListView = {abstract} class(_l3OtherTypedListView_)
 end;//Tl3CustomLongintListView

implementation

uses
  l3Base,
  SysUtils
  ;

{$Include ..\L3\l3OtherTypedListView.imp.pas}

end.