unit l3AsynkTaskList;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3AsyncTask,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Tl3AsyncTask;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}
 Tl3AsynkTaskList = class(_l3UncomparabeObjectRefList_)
 end;//Tl3AsynkTaskList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3AsynkTaskList

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_549BC6740033_var*
//#UC END# *47B2C42A0163_549BC6740033_var*
begin
//#UC START# *47B2C42A0163_549BC6740033_impl*
 Assert(False);
//#UC END# *47B2C42A0163_549BC6740033_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_549BC6740033_var*
//#UC END# *47B99D4503A2_549BC6740033_var*
begin
//#UC START# *47B99D4503A2_549BC6740033_impl*
 Assert(False);
//#UC END# *47B99D4503A2_549BC6740033_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3AsynkTaskList;

{$Include ..\L3\l3UncomparabeObjectRefList.imp.pas}

end.