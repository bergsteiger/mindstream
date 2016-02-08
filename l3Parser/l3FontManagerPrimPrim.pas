unit l3FontManagerPrimPrim;
 
{$Include l3Define.inc}

interface

uses
  l3LogFont,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Undef l3Items_NoSort}

 {$Define l3Items_CaseUnsensitive}

type
 _ItemType_ = Tl3LogFont;
 _l3UncomparabeObjectRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3UncomparabeObjectRefList.imp.pas}
 Tl3FontManagerPrimPrim = class(_l3UncomparabeObjectRefList_)
 end;//Tl3FontManagerPrimPrim

implementation

uses
  l3String,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

// start class Tl3FontManagerPrimPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_53147FD702AC_var*
//#UC END# *47B2C42A0163_53147FD702AC_var*
begin
//#UC START# *47B2C42A0163_53147FD702AC_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_53147FD702AC_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_53147FD702AC_var*
//#UC END# *47B99D4503A2_53147FD702AC_var*
begin
//#UC START# *47B99D4503A2_53147FD702AC_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert((CI.rSortIndex = l3_siNative) OR
        (CI.rSortIndex = l3_siCaseUnsensitive){ OR
        (CI.rSortIndex = l3_siByID)}
        );
(* if (CI.rSortIndex = l3_siByID) then
  Result := CI.rA.StringID - CI.rB.StringID*)
 else
 {$EndIf l3Items_HasCustomSort}
  Result := l3Compare(CI.rA.AsWStr, CI.rB.AsWStr,
                      {$IfDef l3Items_HasCustomSort}
                      CI.rSortIndex
                      {$Else  l3Items_HasCustomSort}
                      {$IfDef l3Items_CaseUnsensitive}
                      l3_siCaseUnsensitive
                      {$Else  l3Items_CaseUnsensitive}
                      l3_siNative
                      {$EndIf l3Items_CaseUnsensitive}
                      {$EndIf l3Items_HasCustomSort}
                      );
//#UC END# *47B99D4503A2_53147FD702AC_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3FontManagerPrimPrim;

{$Include l3UncomparabeObjectRefList.imp.pas}

end.