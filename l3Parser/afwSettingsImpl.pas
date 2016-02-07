unit afwSettingsImpl;
 
{$Include ..\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  afwSettingsImplPrimPrim,
  afwSettingsImplPrim,
  l3Types,
  l3Interfaces
  ;

type
 _FindDataType_ = TafwSettingId;
 _l3Searcher_Parent_ = TafwSettingsImplPrim;
 {$Include l3Searcher.imp.pas}
 TafwSettingsImpl = class(_l3Searcher_, IafwSettingsImpl)
 protected
 // realized methods
   function GetString(const aSettingId: TafwSettingId;
      out theValue: Il3CString): Boolean;
   function GetLong(const aSettingId: TafwSettingId;
      out theValue: Integer): Boolean;
   function GetBool(const aSettingId: TafwSettingId;
      out theValue: Boolean): Boolean;
   procedure SetString(const aSettingId: TafwSettingId;
      aValue: PAnsiChar);
   procedure SetLong(const aSettingId: TafwSettingId;
      aValue: Integer);
   procedure SetBool(const aSettingId: TafwSettingId;
      aValue: Boolean);
 end;//TafwSettingsImpl

implementation

uses
  l3String,
  l3Base,
  SysUtils
  ;

// start class TafwSettingsImpl

function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_4F6C8A610176_var*
//#UC END# *47B9BAFD01F4_4F6C8A610176_var*
begin
//#UC START# *47B9BAFD01F4_4F6C8A610176_impl*
 Result := l3Compare(l3PCharLen(anItem.rKey), l3PCharLen(aData));
//#UC END# *47B9BAFD01F4_4F6C8A610176_impl*
end;//CompareItemWithData

type _Instance_R_ = TafwSettingsImpl;

{$Include l3Searcher.imp.pas}

// start class TafwSettingsImpl

function TafwSettingsImpl.GetString(const aSettingId: TafwSettingId;
  out theValue: Il3CString): Boolean;
//#UC START# *4F6C7F2B036B_4F6C8A610176_var*
var
 l_Index : Integer;
//#UC END# *4F6C7F2B036B_4F6C8A610176_var*
begin
//#UC START# *4F6C7F2B036B_4F6C8A610176_impl*
 if FindData(aSettingId, l_Index) then
 begin
  Result := true;
  theValue := Items[l_Index].rValue;
 end//FindData(aSettingId, l_Index)
 else
  Result := false;
//#UC END# *4F6C7F2B036B_4F6C8A610176_impl*
end;//TafwSettingsImpl.GetString

function TafwSettingsImpl.GetLong(const aSettingId: TafwSettingId;
  out theValue: Integer): Boolean;
//#UC START# *4F6C7F650121_4F6C8A610176_var*
var
 l_Index : Integer;
//#UC END# *4F6C7F650121_4F6C8A610176_var*
begin
//#UC START# *4F6C7F650121_4F6C8A610176_impl*
 if FindData(aSettingId, l_Index) then
  Result := TryStrToInt(l3Str(Items[l_Index].rValue), theValue)
 else
  Result := false;
//#UC END# *4F6C7F650121_4F6C8A610176_impl*
end;//TafwSettingsImpl.GetLong

function TafwSettingsImpl.GetBool(const aSettingId: TafwSettingId;
  out theValue: Boolean): Boolean;
//#UC START# *4F6C7F9D0247_4F6C8A610176_var*
var
 l_Index : Integer;
//#UC END# *4F6C7F9D0247_4F6C8A610176_var*
begin
//#UC START# *4F6C7F9D0247_4F6C8A610176_impl*
 if FindData(aSettingId, l_Index) then
  Result := TryStrToBool(l3Str(Items[l_Index].rValue), theValue)
 else
  Result := false;
//#UC END# *4F6C7F9D0247_4F6C8A610176_impl*
end;//TafwSettingsImpl.GetBool

procedure TafwSettingsImpl.SetString(const aSettingId: TafwSettingId;
  aValue: PAnsiChar);
//#UC START# *4F6C7FDF00C2_4F6C8A610176_var*
var
 l_Index : Integer;
//#UC END# *4F6C7FDF00C2_4F6C8A610176_var*
begin
//#UC START# *4F6C7FDF00C2_4F6C8A610176_impl*
 if FindData(aSettingId, l_Index) then
  ItemSlot(l_Index)^.rValue := l3CStr(aValue)
 else
  Add(TafwKeyValue_C(l3CStr(aSettingId), l3CStr(aValue)));
//#UC END# *4F6C7FDF00C2_4F6C8A610176_impl*
end;//TafwSettingsImpl.SetString

procedure TafwSettingsImpl.SetLong(const aSettingId: TafwSettingId;
  aValue: Integer);
//#UC START# *4F6C800D02AE_4F6C8A610176_var*
var
 l_Index : Integer;
 l_V : AnsiString;
//#UC END# *4F6C800D02AE_4F6C8A610176_var*
begin
//#UC START# *4F6C800D02AE_4F6C8A610176_impl*
 l_V := IntToStr(aValue);
 if FindData(aSettingId, l_Index) then
  ItemSlot(l_Index)^.rValue := l3CStr(l_V)
 else
  Add(TafwKeyValue_C(l3CStr(aSettingId), l3CStr(l_V)));
//#UC END# *4F6C800D02AE_4F6C8A610176_impl*
end;//TafwSettingsImpl.SetLong

procedure TafwSettingsImpl.SetBool(const aSettingId: TafwSettingId;
  aValue: Boolean);
//#UC START# *4F6C80390209_4F6C8A610176_var*
var
 l_Index : Integer;
 l_V : AnsiString;
//#UC END# *4F6C80390209_4F6C8A610176_var*
begin
//#UC START# *4F6C80390209_4F6C8A610176_impl*
 l_V := BoolToStr(aValue, true);
 if FindData(aSettingId, l_Index) then
  ItemSlot(l_Index)^.rValue := l3CStr(l_V)
 else
  Add(TafwKeyValue_C(l3CStr(aSettingId), l3CStr(l_V)));
//#UC END# *4F6C80390209_4F6C8A610176_impl*
end;//TafwSettingsImpl.SetBool

end.