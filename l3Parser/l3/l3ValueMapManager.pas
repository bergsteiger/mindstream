unit l3ValueMapManager;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3ValueMap,
  l3ValueMapManagerPrim,
  l3Types
  ;

type
 _FindDataType_ = Tl3ValueMapID;
 _l3Searcher_Parent_ = Tl3ValueMapManagerPrim;
 {$Include ..\L3\l3Searcher.imp.pas}
 Tl3ValueMapManager = class(_l3Searcher_)
  {* базовая реализация менеджера мап "строка"-что-то. }
 protected
 // property methods
   function pm_GetMap(const aID: Tl3ValueMapID): Il3ValueMap;
 protected
 // protected methods
   function MakeDefaultMap(const aID: Tl3ValueMapID): Il3ValueMap; virtual;
 public
 // public properties
   property Map[const aID: Tl3ValueMapID]: Il3ValueMap
     read pm_GetMap;
 end;//Tl3ValueMapManager

implementation

uses
  SysUtils,
  l3Base,
  l3Memory
  ;

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}

// start class Tl3ValueMapManager

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_478E372C025D_var*
//#UC END# *47B9BAFD01F4_478E372C025D_var*
begin
//#UC START# *47B9BAFD01F4_478E372C025D_impl*
 //Assert(aSortIndex = l3_siNative);
 Assert(aSortIndex = l3_siByID);
 Result := anItem.MapID.rID - aData.rID;
//#UC END# *47B9BAFD01F4_478E372C025D_impl*
end;//CompareItemWithData

type _Instance_R_ = Tl3ValueMapManager;

{$Include ..\L3\l3Searcher.imp.pas}

// start class Tl3ValueMapManager

function Tl3ValueMapManager.pm_GetMap(const aID: Tl3ValueMapID): Il3ValueMap;
//#UC START# *47A1C3DA01BE_478E372C025Dget_var*
var
 l_Index: Integer;
 l_Map: Il3ValueMap;
//#UC END# *47A1C3DA01BE_478E372C025Dget_var*
begin
//#UC START# *47A1C3DA01BE_478E372C025Dget_impl*
 if not FindData(aID, l_Index, l3_siByID) then
  begin
   l_Map := MakeDefaultMap(aID);
   try
    if l_Map<>nil then
     Result := Items[Add(l_Map)]
    else
     Result := nil;
   finally
    l_Map := nil;
   end;
  end
 else
  Result := Items[l_Index];
 if Assigned(Result) and (Result.MapID.rName <> aID.rName) then
  raise El3ValueMap.CreateFmt('Duplicate value map id = %d names (%s - %s)',[aID.rID, Result.MapID.rName, aID.rName]);
//#UC END# *47A1C3DA01BE_478E372C025Dget_impl*
end;//Tl3ValueMapManager.pm_GetMap

function Tl3ValueMapManager.MakeDefaultMap(const aID: Tl3ValueMapID): Il3ValueMap;
//#UC START# *47A1C42301B5_478E372C025D_var*
//#UC END# *47A1C42301B5_478E372C025D_var*
begin
//#UC START# *47A1C42301B5_478E372C025D_impl*
 Assert(False,Format('Value map id %d not found',[aID.rID]));
 Result := nil;
//#UC END# *47A1C42301B5_478E372C025D_impl*
end;//Tl3ValueMapManager.MakeDefaultMap

end.