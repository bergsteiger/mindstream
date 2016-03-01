unit tfwStoredValuesStack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStoredValuesStack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::TtfwStoredValuesStack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3ProtoDataContainer,
  tfwScriptingInterfaces,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes,
  l3PureMixIns,
  tfwDictionaryPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ItemType_ = ItfwStoredValues;
 _l3InterfaceRefListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfaceRefListPrim.imp.pas}
 TtfwStoredValuesStack = class(_l3InterfaceRefListPrim_, ItfwStoredValuesStack)
 protected
 // realized methods
   function pm_GetCount: Integer;
 public
 // realized methods
   procedure Restore(const aCtx: TtfwContext);
   procedure StoreDictionary(aDictionary: TtfwDictionaryPrim;
     const aCtx: TtfwContext);
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // public methods
   constructor Create; reintroduce;
   class function Make: ItfwStoredValuesStack; reintroduce;
     {* Сигнатура фабрики TtfwStoredValuesStack.Make }
 end;//TtfwStoredValuesStack
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwStoredValues,
  tfwArray,
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwStoredValuesStack

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_); forward;
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort


function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If not defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
  const B: _ItemType_): Boolean;
//#UC START# *47B07CF403D0_4F49416600CB_var*
//#UC END# *47B07CF403D0_4F49416600CB_var*
begin
//#UC START# *47B07CF403D0_4F49416600CB_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_4F49416600CB_impl*
end;//IsSameItems
{$IfEnd} //not l3Items_IsAtomic

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4F49416600CB_var*
//#UC END# *47B2C42A0163_4F49416600CB_var*
begin
//#UC START# *47B2C42A0163_4F49416600CB_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4F49416600CB_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_4F49416600CB_var*
//#UC END# *47B99D4503A2_4F49416600CB_var*
begin
//#UC START# *47B99D4503A2_4F49416600CB_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_4F49416600CB_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwStoredValuesStack;

{$Include l3InterfaceRefListPrim.imp.pas}

// start class TtfwStoredValuesStack

constructor TtfwStoredValuesStack.Create;
//#UC START# *4F49438E0354_4F49416600CB_var*
//#UC END# *4F49438E0354_4F49416600CB_var*
begin
//#UC START# *4F49438E0354_4F49416600CB_impl*
 inherited Create;
//#UC END# *4F49438E0354_4F49416600CB_impl*
end;//TtfwStoredValuesStack.Create

class function TtfwStoredValuesStack.Make: ItfwStoredValuesStack;
var
 l_Inst : TtfwStoredValuesStack;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TtfwStoredValuesStack.pm_GetCount: Integer;
//#UC START# *4BB08B8902F2_4F49416600CBget_var*
//#UC END# *4BB08B8902F2_4F49416600CBget_var*
begin
//#UC START# *4BB08B8902F2_4F49416600CBget_impl*
 Result := Count;
//#UC END# *4BB08B8902F2_4F49416600CBget_impl*
end;//TtfwStoredValuesStack.pm_GetCount

procedure TtfwStoredValuesStack.Restore(const aCtx: TtfwContext);
//#UC START# *4F494C2C0049_4F49416600CB_var*
var
 l_I : Integer;
 l_Last : PItemType;
//#UC END# *4F494C2C0049_4F49416600CB_var*
begin
//#UC START# *4F494C2C0049_4F49416600CB_impl*
 l_I := Count - 1;
 l_Last := ItemSlot(l_I);
 if (l_Last^ <> nil) then
  l_Last.Restore(aCtx);
(* if (Last <> nil) then
  Last.Restore(aCtx);*)
 Delete(l_I);
//#UC END# *4F494C2C0049_4F49416600CB_impl*
end;//TtfwStoredValuesStack.Restore

procedure TtfwStoredValuesStack.StoreDictionary(aDictionary: TtfwDictionaryPrim;
  const aCtx: TtfwContext);
//#UC START# *55A52ACE0238_4F49416600CB_var*
var
 l_SV : ItfwStoredValues;
 l_Index : Integer;
 l_W : TtfwWord;
 l_SVE : TtfwStoredValue;
//#UC END# *55A52ACE0238_4F49416600CB_var*
begin
//#UC START# *55A52ACE0238_4F49416600CB_impl*
 l_SV := nil;
 if (aDictionary <> nil) then
 begin
  for l_Index := 0 to Pred(aDictionary.Count) do
  begin
   l_W := TtfwKeyWord(aDictionary.Items[l_Index]).Word;
   if l_W.IsVarLike then
   begin
    l_SVE := TtfwStoredValue_C(l_W, l_W.GetValue(aCtx)^);
    if (l_SV = nil) then
     l_SV := TtfwStoredValues.Make;
    l_SV.Add(l_SVE);
    if (l_SVE.rValue.rType = tfw_vtList) then
     l_W.SetValue(TtfwStackValue_E, aCtx, false);
     //l_W.InitValue(aCtx);
     //l_W.SetValue(TtfwStackValue_C(TtfwArray.Make), aCtx);
     // - чтобы последующий вызов не испортил наш массив
   end;//l_W.IsVarLike
  end;//for l_Index
 end;//aDictionary <> nil
 Self.Add(l_SV);
//#UC END# *55A52ACE0238_4F49416600CB_impl*
end;//TtfwStoredValuesStack.StoreDictionary

{$If not defined(DesignTimeLibrary)}
class function TtfwStoredValuesStack.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4F49416600CB_var*
//#UC END# *47A6FEE600FC_4F49416600CB_var*
begin
//#UC START# *47A6FEE600FC_4F49416600CB_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4F49416600CB_impl*
end;//TtfwStoredValuesStack.IsCacheable
{$IfEnd} //not DesignTimeLibrary

{$IfEnd} //not NoScripts

end.