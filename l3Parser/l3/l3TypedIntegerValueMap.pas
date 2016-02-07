unit l3TypedIntegerValueMap;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  TypInfo,
  l3ValueMap
  ;

type
 Tl3IntegerValueMap = class(Tl3ValueMap, Il3IntegerValueMap)
 private
 // private fields
   f_TypeData : PTypeData;
 protected
 // realized methods
   function DisplayNameToValue(const aDisplayName: Il3CString): Integer;
   function ValueToDisplayName(aValue: Integer): Il3CString;
 protected
 // protected methods
   function DoDisplayNameToValue(const aDisplayName: Il3CString): Integer; virtual; abstract;
   function DoValueToDisplayName(aValue: Integer): Il3CString; virtual; abstract;
 public
 // public methods
   constructor Create(const aID: Tl3ValueMapID;
    aTypeInfo: PTypeInfo); reintroduce;
 end;//Tl3IntegerValueMap

 Tl3SimpleTypedIntegerValueMap = class(Tl3IntegerValueMap)
 protected
 // realized methods
   function DoDisplayNameToValue(const aDisplayName: Il3CString): Integer; override;
   function DoValueToDisplayName(aValue: Integer): Il3CString; override;
 protected
 // overridden protected methods
   procedure DoGetDisplayNames(const aList: Il3StringsEx); override;
   function GetMapSize: Integer; override;
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected fields
   f_Values : Tl3StringArray;
 public
 // public methods
   constructor Create(const aID: Tl3ValueMapID;
    aTypeInfo: PTypeInfo;
    const aValues: array of AnsiString); reintroduce;
   class function Make(const aID: Tl3ValueMapID;
    aTypeInfo: PTypeInfo;
    const aValues: array of AnsiString): Il3IntegerValueMap; reintroduce;
 end;//Tl3SimpleTypedIntegerValueMap

 Tl3ResStringArray = array of PResStringRec;

 Tl3ResourceTypedIntegerValueMap = class(Tl3IntegerValueMap)
 protected
 // realized methods
   function DoDisplayNameToValue(const aDisplayName: Il3CString): Integer; override;
   function DoValueToDisplayName(aValue: Integer): Il3CString; override;
 protected
 // overridden protected methods
   procedure DoGetDisplayNames(const aList: Il3StringsEx); override;
   function GetMapSize: Integer; override;
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected fields
   f_Values : Tl3ResStringArray;
 public
 // public methods
   constructor Create(const aID: Tl3ValueMapID;
    aTypeInfo: PTypeInfo;
    const aValues: array of PResStringRec); reintroduce;
   class function Make(const aID: Tl3ValueMapID;
    aTypeInfo: PTypeInfo;
    const aValues: array of PResStringRec): Il3IntegerValueMap; reintroduce;
 end;//Tl3ResourceTypedIntegerValueMap

implementation

uses
  SysUtils,
  l3String,
  l3Base
  ;

// start class Tl3IntegerValueMap

constructor Tl3IntegerValueMap.Create(const aID: Tl3ValueMapID;
  aTypeInfo: PTypeInfo);
//#UC START# *478E20F70032_478E1E9E01CE_var*
//#UC END# *478E20F70032_478E1E9E01CE_var*
begin
//#UC START# *478E20F70032_478E1E9E01CE_impl*
 inherited Create(aID);
 Assert(Assigned(aTypeInfo),Format('Typed map %s - Unspecified typeinfo',[rMapID.rName]));
 Assert(aTypeInfo^.Kind in [tkInteger, tkChar, tkEnumeration, tkWChar],Format('Typed map %s - Unsupported type',[rMapID.rName]));
 f_TypeData := GetTypeData(aTypeInfo);
 Assert(Assigned(f_TypeData),Format('Typed map %s - Can''t find type data',[rMapID.rName]));
//#UC END# *478E20F70032_478E1E9E01CE_impl*
end;//Tl3IntegerValueMap.Create

function Tl3IntegerValueMap.DisplayNameToValue(const aDisplayName: Il3CString): Integer;
//#UC START# *46A5FCF900E0_478E1E9E01CE_var*
//#UC END# *46A5FCF900E0_478E1E9E01CE_var*
begin
//#UC START# *46A5FCF900E0_478E1E9E01CE_impl*
 Result := DoDisplayNameToValue(aDisplayName);
//#UC END# *46A5FCF900E0_478E1E9E01CE_impl*
end;//Tl3IntegerValueMap.DisplayNameToValue

function Tl3IntegerValueMap.ValueToDisplayName(aValue: Integer): Il3CString;
//#UC START# *46A5FD1B000D_478E1E9E01CE_var*
//#UC END# *46A5FD1B000D_478E1E9E01CE_var*
begin
//#UC START# *46A5FD1B000D_478E1E9E01CE_impl*
 Result := DoValueToDisplayName(aValue);
//#UC END# *46A5FD1B000D_478E1E9E01CE_impl*
end;//Tl3IntegerValueMap.ValueToDisplayName
// start class Tl3SimpleTypedIntegerValueMap

constructor Tl3SimpleTypedIntegerValueMap.Create(const aID: Tl3ValueMapID;
  aTypeInfo: PTypeInfo;
  const aValues: array of AnsiString);
//#UC START# *478E21AD021D_478E1E3A0182_var*
var
 l_Index: Integer;
//#UC END# *478E21AD021D_478E1E3A0182_var*
begin
//#UC START# *478E21AD021D_478E1E3A0182_impl*
 inherited Create(aID, aTypeInfo);
 Assert(Length(aValues)=(f_TypeData.MaxValue-f_TypeData.MinValue+1),Format('Typed map %s - Mismatch map size',[rMapID.rName]));
 SetLength(f_Values, f_TypeData.MaxValue-f_TypeData.MinValue+1);
 for l_Index := Low(aValues) to High(aValues) do
  f_Values[l_Index-Low(aValues)+Low(f_Values)] := aValues[l_Index];
 Assert(Length(aValues)=(f_TypeData.MaxValue-f_TypeData.MinValue+1),Format('Typed map %s - Mismatch map size',[rMapID.rName]));
//#UC END# *478E21AD021D_478E1E3A0182_impl*
end;//Tl3SimpleTypedIntegerValueMap.Create

class function Tl3SimpleTypedIntegerValueMap.Make(const aID: Tl3ValueMapID;
  aTypeInfo: PTypeInfo;
  const aValues: array of AnsiString): Il3IntegerValueMap;
var
 l_Inst : Tl3SimpleTypedIntegerValueMap;
begin
 l_Inst := Create(aID, aTypeInfo, aValues);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3SimpleTypedIntegerValueMap.DoDisplayNameToValue(const aDisplayName: Il3CString): Integer;
//#UC START# *478E235D0041_478E1E3A0182_var*
var
 l_Index: Integer;
//#UC END# *478E235D0041_478E1E3A0182_var*
begin
//#UC START# *478E235D0041_478E1E3A0182_impl*
 for l_Index := Low(f_Values) to High(f_Values) do
  if l3Same(aDisplayName, f_Values[l_Index]) then
  begin
   Result := l_Index + f_TypeData.MinValue - Low(f_Values);
   exit;
  end;//l3Same(aDisplayName, 
 raise El3ValueMapValueNotFound.CreateFmt('Display name %s not found in Map %d',[l3Str(aDisplayName), rMapID.rID]);
//#UC END# *478E235D0041_478E1E3A0182_impl*
end;//Tl3SimpleTypedIntegerValueMap.DoDisplayNameToValue

function Tl3SimpleTypedIntegerValueMap.DoValueToDisplayName(aValue: Integer): Il3CString;
//#UC START# *478E237001B3_478E1E3A0182_var*
//#UC END# *478E237001B3_478E1E3A0182_var*
begin
//#UC START# *478E237001B3_478E1E3A0182_impl*
 if (aValue<f_TypeData.MinValue) or (aValue>f_TypeData.MaxValue) then
  raise El3ValueMapValueNotFound.CreateFmt('Value %d not found in Map %s',[aValue,rMapID.rName]);
 Result := l3CStr(f_Values[aValue - f_TypeData.MinValue + Low(f_Values)]);
//#UC END# *478E237001B3_478E1E3A0182_impl*
end;//Tl3SimpleTypedIntegerValueMap.DoValueToDisplayName

procedure Tl3SimpleTypedIntegerValueMap.DoGetDisplayNames(const aList: Il3StringsEx);
//#UC START# *478CFFBA017D_478E1E3A0182_var*
var
 l_Index: Integer;
//#UC END# *478CFFBA017D_478E1E3A0182_var*
begin
//#UC START# *478CFFBA017D_478E1E3A0182_impl*
 inherited;
 for l_Index := Low(f_Values) To High(f_Values) Do
  aList.Add(f_values[l_Index]);
//#UC END# *478CFFBA017D_478E1E3A0182_impl*
end;//Tl3SimpleTypedIntegerValueMap.DoGetDisplayNames

function Tl3SimpleTypedIntegerValueMap.GetMapSize: Integer;
//#UC START# *478CFFCE02DE_478E1E3A0182_var*
//#UC END# *478CFFCE02DE_478E1E3A0182_var*
begin
//#UC START# *478CFFCE02DE_478E1E3A0182_impl*
 Result := Length(f_Values);
//#UC END# *478CFFCE02DE_478E1E3A0182_impl*
end;//Tl3SimpleTypedIntegerValueMap.GetMapSize

procedure Tl3SimpleTypedIntegerValueMap.Cleanup;
//#UC START# *479731C50290_478E1E3A0182_var*
//#UC END# *479731C50290_478E1E3A0182_var*
begin
//#UC START# *479731C50290_478E1E3A0182_impl*
 f_Values := nil;
 inherited;
//#UC END# *479731C50290_478E1E3A0182_impl*
end;//Tl3SimpleTypedIntegerValueMap.Cleanup
// start class Tl3ResourceTypedIntegerValueMap

constructor Tl3ResourceTypedIntegerValueMap.Create(const aID: Tl3ValueMapID;
  aTypeInfo: PTypeInfo;
  const aValues: array of PResStringRec);
//#UC START# *478E212D0257_478E1DFA01DF_var*
var
 l_Index: Integer;
//#UC END# *478E212D0257_478E1DFA01DF_var*
begin
//#UC START# *478E212D0257_478E1DFA01DF_impl*
 inherited Create(aID, aTypeInfo);
 Assert(Length(aValues)=(f_TypeData.MaxValue-f_TypeData.MinValue+1),Format('Typed map %s - Mismatch map size',[rMapID.rName]));
 SetLength(f_Values, f_TypeData.MaxValue-f_TypeData.MinValue+1);
 for l_Index := Low(aValues) to High(aValues) do
  f_Values[l_Index-Low(aValues)+Low(f_Values)] := aValues[l_Index];
 Assert(Length(aValues)=(f_TypeData.MaxValue-f_TypeData.MinValue+1),Format('Typed map %s - Mismatch map size',[rMapID.rName]));
//#UC END# *478E212D0257_478E1DFA01DF_impl*
end;//Tl3ResourceTypedIntegerValueMap.Create

class function Tl3ResourceTypedIntegerValueMap.Make(const aID: Tl3ValueMapID;
  aTypeInfo: PTypeInfo;
  const aValues: array of PResStringRec): Il3IntegerValueMap;
var
 l_Inst : Tl3ResourceTypedIntegerValueMap;
begin
 l_Inst := Create(aID, aTypeInfo, aValues);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3ResourceTypedIntegerValueMap.DoDisplayNameToValue(const aDisplayName: Il3CString): Integer;
//#UC START# *478E235D0041_478E1DFA01DF_var*
var
 l_Index: Integer;
//#UC END# *478E235D0041_478E1DFA01DF_var*
begin
//#UC START# *478E235D0041_478E1DFA01DF_impl*
 for l_Index := Low(f_Values) to High(f_Values) do
  if l3Same(aDisplayName, l3CStr(f_Values[l_Index])) then
  begin
   Result := l_Index + f_TypeData.MinValue - Low(f_Values);
   exit;
  end;//l3Same(aDisplayName, 
 raise El3ValueMapValueNotFound.CreateFmt('Display name %s not found in Map %d',[l3Str(aDisplayName),rMapID.rID]);
//#UC END# *478E235D0041_478E1DFA01DF_impl*
end;//Tl3ResourceTypedIntegerValueMap.DoDisplayNameToValue

function Tl3ResourceTypedIntegerValueMap.DoValueToDisplayName(aValue: Integer): Il3CString;
//#UC START# *478E237001B3_478E1DFA01DF_var*
//#UC END# *478E237001B3_478E1DFA01DF_var*
begin
//#UC START# *478E237001B3_478E1DFA01DF_impl*
 if (aValue<f_TypeData.MinValue) or (aValue>f_TypeData.MaxValue) then
  raise El3ValueMapValueNotFound.CreateFmt('Value %d not found in Map %s',[aValue,rMapID.rName]);
 Result := l3CStr(f_Values[aValue - f_TypeData.MinValue + Low(f_Values)]);
//#UC END# *478E237001B3_478E1DFA01DF_impl*
end;//Tl3ResourceTypedIntegerValueMap.DoValueToDisplayName

procedure Tl3ResourceTypedIntegerValueMap.DoGetDisplayNames(const aList: Il3StringsEx);
//#UC START# *478CFFBA017D_478E1DFA01DF_var*
var
 l_Index: Integer;
//#UC END# *478CFFBA017D_478E1DFA01DF_var*
begin
//#UC START# *478CFFBA017D_478E1DFA01DF_impl*
 inherited;
 for l_Index := Low(f_Values) To High(f_Values) Do
  aList.Add(l3CStr(f_values[l_Index]));
//#UC END# *478CFFBA017D_478E1DFA01DF_impl*
end;//Tl3ResourceTypedIntegerValueMap.DoGetDisplayNames

function Tl3ResourceTypedIntegerValueMap.GetMapSize: Integer;
//#UC START# *478CFFCE02DE_478E1DFA01DF_var*
//#UC END# *478CFFCE02DE_478E1DFA01DF_var*
begin
//#UC START# *478CFFCE02DE_478E1DFA01DF_impl*
 Result := Length(f_Values);
//#UC END# *478CFFCE02DE_478E1DFA01DF_impl*
end;//Tl3ResourceTypedIntegerValueMap.GetMapSize

procedure Tl3ResourceTypedIntegerValueMap.Cleanup;
//#UC START# *479731C50290_478E1DFA01DF_var*
//#UC END# *479731C50290_478E1DFA01DF_var*
begin
//#UC START# *479731C50290_478E1DFA01DF_impl*
 f_Values := nil;
 inherited;
//#UC END# *479731C50290_478E1DFA01DF_impl*
end;//Tl3ResourceTypedIntegerValueMap.Cleanup

end.