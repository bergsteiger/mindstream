unit tfwValueTypes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwValueTypes.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::TypeInfoCache::TtfwValueTypes
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  TypInfo,
  tfwTypeInfo,
  tfwTypeInfoList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwValueTypes = class(TtfwTypeInfoList)
 private
 // private fields
   f_CustomName : Il3CString;
 protected
 // overridden protected methods
   procedure InitFields; override;
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   function Compare(anOther: TtfwValueTypes): Integer; overload; 
   function Has(const aType: TtfwTypeInfo): Boolean; overload; 
   constructor Create(anOther: TtfwTypeInfoList;
     const aType: TtfwTypeInfo;
     const aCustomName: Il3CString); reintroduce;
   function Add(const aType: TtfwTypeInfo): TtfwValueTypes; overload; 
   class function Make(const aType: TtfwTypeInfo): TtfwValueTypes; overload; 
   function Name: Il3CString;
   function AcceptsValue(const aValue: TtfwStackValue): Boolean;
   function Add(anOther: TtfwValueTypes): TtfwValueTypes; overload; 
   class function Make(aType: PTypeInfo): TtfwValueTypes; overload; 
   function Has(aType: TtfwValueType): Boolean; overload; 
   function EQ(anOther: TtfwValueTypes): Boolean; overload; 
   function DefaultValue: TtfwStackValue;
   function EQ(aType: PTypeInfo): Boolean; overload; 
   function Compare(const anOther: TtfwTypeInfo): Integer; overload; 
   function MakeCustomName(const aName: Il3CString): TtfwValueTypes;
 end;//TtfwValueTypes
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3String,
  tfwCStringFactory,
  tfwValueTypesCache,
  tfwScriptingInterfaces,
  tfwValueTypesWordsPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwValueTypes

function TtfwValueTypes.Compare(anOther: TtfwValueTypes): Integer;
//#UC START# *55BF2B5E0045_55BF2B000047_var*
var
 l_Index : Integer;
//#UC END# *55BF2B5E0045_55BF2B000047_var*
begin
//#UC START# *55BF2B5E0045_55BF2B000047_impl*
 if (anOther = Self) then
 begin
  Result := 0;
  Exit;
 end;//anOther = Self

 if (anOther = nil) then
 begin
  if Self.Empty then
   Result := 0
  else
   Result := +1;
  Exit;  
 end//anOther = nil
 else
 if (Self = nil) then
 begin
  if anOther.Empty then
   Result := 0
  else
   Result := -1;
  Exit; 
 end//Self = nil
 else
  Result := (Self.Count - anOther.Count);

 if (Result <> 0) then
  Exit;

 for l_Index := 0 to Pred(Count) do
 begin
  Result := Self.ItemSlot(l_Index)^.Compare(anOther.ItemSlot(l_Index)^);
  if (Result <> 0) then
   break;
 end;//for l_Index

 if (Result <> 0) then
  Exit;

 Result := l3Compare(l3PCharLen(f_CustomName), l3PCharLen(anOther.f_CustomName));

//#UC END# *55BF2B5E0045_55BF2B000047_impl*
end;//TtfwValueTypes.Compare

function TtfwValueTypes.Has(const aType: TtfwTypeInfo): Boolean;
//#UC START# *55BF36E60133_55BF2B000047_var*
var
 l_Index : Integer;
//#UC END# *55BF36E60133_55BF2B000047_var*
begin
//#UC START# *55BF36E60133_55BF2B000047_impl*
 if (Self = nil) then
 // - типа принимаем любое значение
  Result := false
 else
  Result := FindData(aType, l_Index);
//#UC END# *55BF36E60133_55BF2B000047_impl*
end;//TtfwValueTypes.Has

constructor TtfwValueTypes.Create(anOther: TtfwTypeInfoList;
  const aType: TtfwTypeInfo;
  const aCustomName: Il3CString);
//#UC START# *55BF370A0309_55BF2B000047_var*
var
 l_Index : Integer;
//#UC END# *55BF370A0309_55BF2B000047_var*
begin
//#UC START# *55BF370A0309_55BF2B000047_impl*
 f_CustomName := aCustomName;
 inherited Create;
 Sorted := true;
 if not aType.Empty then
  inherited Add(aType);
 if (anOther <> nil) then
  for l_Index := 0 to Pred(anOther.Count) do
   inherited Add(anOther.Items[l_Index]);
//#UC END# *55BF370A0309_55BF2B000047_impl*
end;//TtfwValueTypes.Create

function TtfwValueTypes.Add(const aType: TtfwTypeInfo): TtfwValueTypes;
//#UC START# *55BF3734022E_55BF2B000047_var*
var
 l_L : TtfwValueTypes;
 l_Index : Integer;
//#UC END# *55BF3734022E_55BF2B000047_var*
begin
//#UC START# *55BF3734022E_55BF2B000047_impl*
 Assert(not aType.Empty);
 if (Self <> nil) AND FindData(aType, l_Index) then
  Result := Self
 else
 begin
  if Self.Empty then
   Result := TtfwValueTypes.Make(aType)
  else
  begin
   l_L := TtfwValueTypes.Create(Self, aType, nil);
   try
    Result := TtfwValueTypesCache.Instance.CheckList(l_L);
   finally
    FreeAndNil(l_L);
   end;//try..finally
  end;//Self.Empty
 end;//FindData(aType, l_Index)
//#UC END# *55BF3734022E_55BF2B000047_impl*
end;//TtfwValueTypes.Add

class function TtfwValueTypes.Make(const aType: TtfwTypeInfo): TtfwValueTypes;
//#UC START# *55BF43E80361_55BF2B000047_var*
var
 l_L : TtfwValueTypes;
 l_Index : Integer;
//#UC END# *55BF43E80361_55BF2B000047_var*
begin
//#UC START# *55BF43E80361_55BF2B000047_impl*
 if aType.Empty then
  Result := nil
 else
 begin
  if TtfwValueTypesCache.Instance.FindData(aType, l_Index) then
   Result := TtfwValueTypesCache.Instance.Items[l_Index]
  else
  begin
   l_L := TtfwValueTypes.Create(nil, aType, nil);
   try
    Result := TtfwValueTypesCache.Instance.CheckList(l_L);
   finally
    FreeAndNil(l_L);
   end;//try..finally
  end;//TtfwValueTypesCache.Instance.FindData..
 end;//aType.rTypeInfo = nil
//#UC END# *55BF43E80361_55BF2B000047_impl*
end;//TtfwValueTypes.Make

function TtfwValueTypes.Name: Il3CString;
//#UC START# *55BF5E4D02CE_55BF2B000047_var*

 function locCat(const aA: Il3CString; const aB: Il3CString): Il3CString;
 begin
  if l3IsNil(aA) then
   Result := aB
  else
  if l3IsNil(aB) then
   Result := aA
  else
   Result := l3Cat([aA, TtfwCStringFactory.C(' '), aB]);
 end;

var
 l_Index : Integer;
//#UC END# *55BF5E4D02CE_55BF2B000047_var*
begin
//#UC START# *55BF5E4D02CE_55BF2B000047_impl*
 Result := nil;
 if (Self <> nil) then
 begin
  if l3IsNil(f_CustomName) then
  begin
   for l_Index := 0 to Pred(Count) do
    Result := locCat(Result, ItemSlot(l_Index)^.Name);
  end//l3IsNil(f_CustomName)
  else
   Result := f_CustomName; 
 end;//Self <> nil
//#UC END# *55BF5E4D02CE_55BF2B000047_impl*
end;//TtfwValueTypes.Name

function TtfwValueTypes.AcceptsValue(const aValue: TtfwStackValue): Boolean;
//#UC START# *55BF5E8A0099_55BF2B000047_var*
{$IfDef seTypeCheck}
var
 l_Index : Integer;
{$EndIf seTypeCheck}
//#UC END# *55BF5E8A0099_55BF2B000047_var*
begin
//#UC START# *55BF5E8A0099_55BF2B000047_impl*
 if Empty then
 // - типа можем принимать ЛЮБОЕ значение
  Result := true
 else
 {$IfNDef seTypeCheck}
  Case aValue.rType of
   tfw_vtNil:
    Result := Has(tfw_vtObj) OR
              Has(tfw_vtFile) OR
              Has(tfw_vtIntf) OR
              Has(tfw_vtClass) OR
 //           Has(tfw_vtList) OR
              Has(tfw_vtStr);
   tfw_vtVoid:
    Result := false;
   else
    Result := Has(aValue.rType);
  end;//Case aValueType
 {$Else   seTypeCheck}
 begin
  Result := false;
  for l_Index := 0 to Pred(Count) do
  begin
   Result := ItemSlot(l_Index)^.AcceptsValue(aValue);
   if Result then
    Exit;
  end;//for l_Index
 end;//Empty
 {$EndIf seTypeCheck}
//#UC END# *55BF5E8A0099_55BF2B000047_impl*
end;//TtfwValueTypes.AcceptsValue

function TtfwValueTypes.Add(anOther: TtfwValueTypes): TtfwValueTypes;
//#UC START# *55BF624D0018_55BF2B000047_var*
var
 l_L : TtfwValueTypes;
//#UC END# *55BF624D0018_55BF2B000047_var*
begin
//#UC START# *55BF624D0018_55BF2B000047_impl*
 if Empty then
  Result := anOther
 else
 if anOther.Empty then
  Result := Self
 else
 if (Self.Compare(anOther) = 0) then
  Result := Self
 else
 begin
  l_L := TtfwValueTypes.Create(Self, TtfwTypeInfo_C(nil), nil);
  try
   l_L.JoinWith(anOther);
   Result := TtfwValueTypesCache.Instance.CheckList(l_L);
  finally
   FreeAndNil(l_L);
  end;//try..finally
 end;//else
//#UC END# *55BF624D0018_55BF2B000047_impl*
end;//TtfwValueTypes.Add

class function TtfwValueTypes.Make(aType: PTypeInfo): TtfwValueTypes;
//#UC START# *55C0A53F0047_55BF2B000047_var*
//#UC END# *55C0A53F0047_55BF2B000047_var*
begin
//#UC START# *55C0A53F0047_55BF2B000047_impl*
 Result := Make(TtfwTypeInfo_C(aType));
//#UC END# *55C0A53F0047_55BF2B000047_impl*
end;//TtfwValueTypes.Make

function TtfwValueTypes.Has(aType: TtfwValueType): Boolean;
//#UC START# *55C0BC14032A_55BF2B000047_var*
//#UC END# *55C0BC14032A_55BF2B000047_var*
begin
//#UC START# *55C0BC14032A_55BF2B000047_impl*
 Result := Has(TtfwTypeInfo_C(aType));
//#UC END# *55C0BC14032A_55BF2B000047_impl*
end;//TtfwValueTypes.Has

function TtfwValueTypes.EQ(anOther: TtfwValueTypes): Boolean;
//#UC START# *55C0C92B01DF_55BF2B000047_var*
//#UC END# *55C0C92B01DF_55BF2B000047_var*
begin
//#UC START# *55C0C92B01DF_55BF2B000047_impl*
 Result := Compare(anOther) = 0;
//#UC END# *55C0C92B01DF_55BF2B000047_impl*
end;//TtfwValueTypes.EQ

function TtfwValueTypes.DefaultValue: TtfwStackValue;
//#UC START# *55C0C98B0347_55BF2B000047_var*
//#UC END# *55C0C98B0347_55BF2B000047_var*
begin
//#UC START# *55C0C98B0347_55BF2B000047_impl*
 if Empty then
  Result := TtfwStackValue_E
 else
 if (Count > 1) then
  Result := TtfwStackValue_E
 else
  Result := ItemSlot(0)^.DefaultValue; 
//#UC END# *55C0C98B0347_55BF2B000047_impl*
end;//TtfwValueTypes.DefaultValue

function TtfwValueTypes.EQ(aType: PTypeInfo): Boolean;
//#UC START# *55B7648501B7_55BF2B000047_var*
//#UC END# *55B7648501B7_55BF2B000047_var*
begin
//#UC START# *55B7648501B7_55BF2B000047_impl*
 Result := Compare(TtfwTypeInfo_C(aType)) = 0;   
//#UC END# *55B7648501B7_55BF2B000047_impl*
end;//TtfwValueTypes.EQ

function TtfwValueTypes.Compare(const anOther: TtfwTypeInfo): Integer;
//#UC START# *55C1E28200A0_55BF2B000047_var*
//#UC END# *55C1E28200A0_55BF2B000047_var*
begin
//#UC START# *55C1E28200A0_55BF2B000047_impl*
 if anOther.Empty then
 begin
  if Self.Empty then
   Result := 0
  else
   Result := +1; 
 end//anOther = nil
 else
 if Self.Empty then
  Result := -1
 else
 if (Count > 1) then
  Result := +1
 else
  Result := ItemSlot(0)^.Compare(anOther);
//#UC END# *55C1E28200A0_55BF2B000047_impl*
end;//TtfwValueTypes.Compare

function TtfwValueTypes.MakeCustomName(const aName: Il3CString): TtfwValueTypes;
//#UC START# *55CDF48F01D6_55BF2B000047_var*
var
 l_L : TtfwValueTypes;
//#UC END# *55CDF48F01D6_55BF2B000047_var*
begin
//#UC START# *55CDF48F01D6_55BF2B000047_impl*
 l_L := TtfwValueTypes.Create(Self, TtfwTypeInfo_C(nil), aName);
 try
  Result := TtfwValueTypesCache.Instance.CheckList(l_L);
 finally
  FreeAndNil(l_L);
 end;//try..finally
//#UC END# *55CDF48F01D6_55BF2B000047_impl*
end;//TtfwValueTypes.MakeCustomName

procedure TtfwValueTypes.InitFields;
//#UC START# *47A042E100E2_55BF2B000047_var*
//#UC END# *47A042E100E2_55BF2B000047_var*
begin
//#UC START# *47A042E100E2_55BF2B000047_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_55BF2B000047_impl*
end;//TtfwValueTypes.InitFields

{$If not defined(DesignTimeLibrary)}
class function TtfwValueTypes.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_55BF2B000047_var*
//#UC END# *47A6FEE600FC_55BF2B000047_var*
begin
//#UC START# *47A6FEE600FC_55BF2B000047_impl*
 Result := true;
//#UC END# *47A6FEE600FC_55BF2B000047_impl*
end;//TtfwValueTypes.IsCacheable
{$IfEnd} //not DesignTimeLibrary

procedure TtfwValueTypes.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_CustomName := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwValueTypes.ClearFields

{$IfEnd} //not NoScripts

end.