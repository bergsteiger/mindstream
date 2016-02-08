unit l3CustomRecListView;
 
{$Include l3Define.inc}

interface

uses
  l3ProtoPtrRecListPrim,
  l3PureMixIns,
  l3CustomOtherListView
  ;

type
 _ListType_ = Tl3ProtoPtrRecListPrim;
 _ItemType_ = VOID;
 {$Include l3OtherListView.imp.pas}
 Tl3CustomRecListView = {abstract} class(_l3OtherListView_)
 protected
 // realized methods
   function CompareData(const anItem1: _ItemType_;
     const anItem2: _ItemType_): Integer; override;
 protected
 // protected methods
   function CompareRecs(aRec1: PItemType;
     aRec2: PItemType): Integer; virtual; abstract;
 end;//Tl3CustomRecListView

implementation

uses
  l3Base,
  SysUtils
  ;

{$Include l3OtherListView.imp.pas}

// start class Tl3CustomRecListView

function Tl3CustomRecListView.CompareData(const anItem1: _ItemType_;
  const anItem2: _ItemType_): Integer;
//#UC START# *4DEFB2D90167_4DEFC4AE0296_var*
//#UC END# *4DEFB2D90167_4DEFC4AE0296_var*
begin
//#UC START# *4DEFB2D90167_4DEFC4AE0296_impl*
 Result := CompareRecs(@anItem1, @anItem2);
//#UC END# *4DEFB2D90167_4DEFC4AE0296_impl*
end;//Tl3CustomRecListView.CompareData

end.