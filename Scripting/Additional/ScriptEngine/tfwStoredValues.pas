unit tfwStoredValues;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStoredValues.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::StoredValues::TtfwStoredValues
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoDataContainer,
  tfwScriptingInterfaces,
  l3Memory,
  l3Interfaces,
  l3Types,
  l3Core,
  l3Except,
  Classes,
  l3PureMixIns
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = TtfwStoredValue;
 _l3RecordListPrimPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RecordListPrimPrim.imp.pas}
 TtfwStoredValues = class(_l3RecordListPrimPrim_, ItfwStoredValues)
 protected
 // realized methods
   function pm_GetCount: Integer;
   procedure Restore(const aCtx: TtfwContext);
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // public methods
   constructor Create; reintroduce;
   class function Make: ItfwStoredValues; reintroduce;
     {* Сигнатура фабрики TtfwStoredValues.Make }
 end;//TtfwStoredValues
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVar,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwStoredValues

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  ); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4F49408A03C0_var*
//#UC END# *47B07CF403D0_4F49408A03C0_var*
begin
//#UC START# *47B07CF403D0_4F49408A03C0_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_4F49408A03C0_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4F49408A03C0_var*
//#UC END# *47B2C42A0163_4F49408A03C0_var*
begin
//#UC START# *47B2C42A0163_4F49408A03C0_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4F49408A03C0_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

procedure FreeItem(var aPlace: _ItemType_
  {$If defined(l3Items_FreeItem_NeedsList)}
  ;
  aList: _l3Items_
  {$IfEnd} //l3Items_FreeItem_NeedsList
  );
//#UC START# *47B94A5C006E_4F49408A03C0_var*
//#UC END# *47B94A5C006E_4F49408A03C0_var*
begin
//#UC START# *47B94A5C006E_4F49408A03C0_impl*
 aPlace.rValue.rString := nil;
 Finalize(aPlace.rValue);
 Finalize(aPlace);
//#UC END# *47B94A5C006E_4F49408A03C0_impl*
end;//FreeItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4F49408A03C0_var*
//#UC END# *47B99D4503A2_4F49408A03C0_var*
begin
//#UC START# *47B99D4503A2_4F49408A03C0_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4F49408A03C0_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwStoredValues;

{$Include w:\common\components\rtl\Garant\L3\l3RecordListPrimPrim.imp.pas}

// start class TtfwStoredValues

constructor TtfwStoredValues.Create;
//#UC START# *4F4947D50241_4F49408A03C0_var*
//#UC END# *4F4947D50241_4F49408A03C0_var*
begin
//#UC START# *4F4947D50241_4F49408A03C0_impl*
 inherited Create;
//#UC END# *4F4947D50241_4F49408A03C0_impl*
end;//TtfwStoredValues.Create

class function TtfwStoredValues.Make: ItfwStoredValues;
var
 l_Inst : TtfwStoredValues;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TtfwStoredValues.pm_GetCount: Integer;
//#UC START# *4BB08B8902F2_4F49408A03C0get_var*
//#UC END# *4BB08B8902F2_4F49408A03C0get_var*
begin
//#UC START# *4BB08B8902F2_4F49408A03C0get_impl*
 Result := Count;
//#UC END# *4BB08B8902F2_4F49408A03C0get_impl*
end;//TtfwStoredValues.pm_GetCount

procedure TtfwStoredValues.Restore(const aCtx: TtfwContext);
//#UC START# *4F494C0D009A_4F49408A03C0_var*
var
 l_Index : Integer;
 l_V : TtfwStoredValue;
//#UC END# *4F494C0D009A_4F49408A03C0_var*
begin
//#UC START# *4F494C0D009A_4F49408A03C0_impl*
 for l_Index := 0 to Pred(Count) do
 begin
  l_V := Items[l_Index];
  try
   l_V.rWord.SetValue(l_V.rValue, aCtx, false);
  finally
   Finalize(l_V);
  end;///try..finally
 end;//for l_Index
//#UC END# *4F494C0D009A_4F49408A03C0_impl*
end;//TtfwStoredValues.Restore

{$If not defined(DesignTimeLibrary)}
class function TtfwStoredValues.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4F49408A03C0_var*
//#UC END# *47A6FEE600FC_4F49408A03C0_var*
begin
//#UC START# *47A6FEE600FC_4F49408A03C0_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4F49408A03C0_impl*
end;//TtfwStoredValues.IsCacheable
{$IfEnd} //not DesignTimeLibrary

{$IfEnd} //not NoScripts

end.