unit l3IntegerValueMapManager;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3ValueMapManager,
  l3SimpleDataContainer,
  l3Types,
  l3Memory,
  l3Core,
  l3Except,
  Classes
  ;

type
 _ItemType_ = Il3IntegerValueMapFactory;
 _l3InterfaceRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfaceRefList.imp.pas}
 Tl3IntegerValueMapFactories = class(_l3InterfaceRefList_)
 end;//Tl3IntegerValueMapFactories

 Tl3IntegerValueMapManager = class(Tl3ValueMapManager, Il3IntegerValueMapManager)
 private
 // private fields
   f_Factories : Tl3IntegerValueMapFactories;
 protected
 // realized methods
   procedure RegisterFactory(const aFactory: Il3IntegerValueMapFactory;
    aPreferred: Boolean);
     {* aPreferred - Фабрика будет вызываться как можно раньше. }
   procedure UnRegisterFactory(const aFactory: Il3IntegerValueMapFactory);
   function pm_GetMap(const aID: Tl3ValueMapID): Il3IntegerValueMap;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
   function MakeDefaultMap(const aID: Tl3ValueMapID): Il3ValueMap; override;
 public
 // public methods
   class function Make: Il3IntegerValueMapManager; reintroduce;
 end;//Tl3IntegerValueMapManager

function L3IntegerMapManager: Il3IntegerValueMapManager;

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

var g_l3IntegerMapManager : Tl3IntegerValueMapManager;

// unit methods

procedure DoneManager;
//#UC START# *47A1D8BA002F_478E35650120_var*
//#UC END# *47A1D8BA002F_478E35650120_var*
begin
//#UC START# *47A1D8BA002F_478E35650120_impl*
 l3Free(g_l3IntegerMapManager);
//#UC END# *47A1D8BA002F_478E35650120_impl*
end;//DoneManager
type _Instance_R_ = Tl3IntegerValueMapFactories;

{$Include l3InterfaceRefList.imp.pas}

// start class Tl3IntegerValueMapManager

class function Tl3IntegerValueMapManager.Make: Il3IntegerValueMapManager;
var
 l_Inst : Tl3IntegerValueMapManager;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure Tl3IntegerValueMapManager.RegisterFactory(const aFactory: Il3IntegerValueMapFactory;
  aPreferred: Boolean);
//#UC START# *46A5FDC600BD_47A1CCD50059_var*
//#UC END# *46A5FDC600BD_47A1CCD50059_var*
begin
//#UC START# *46A5FDC600BD_47A1CCD50059_impl*
 if f_Factories.IndexOf(aFactory) = -1 then
  begin
   if aPreferred then
    f_Factories.Insert(0,aFactory)
   else
    f_Factories.Add(aFactory);
  end;
//#UC END# *46A5FDC600BD_47A1CCD50059_impl*
end;//Tl3IntegerValueMapManager.RegisterFactory

procedure Tl3IntegerValueMapManager.UnRegisterFactory(const aFactory: Il3IntegerValueMapFactory);
//#UC START# *46A5FEBA024E_47A1CCD50059_var*
//#UC END# *46A5FEBA024E_47A1CCD50059_var*
begin
//#UC START# *46A5FEBA024E_47A1CCD50059_impl*
 f_Factories.Remove(aFactory);
//#UC END# *46A5FEBA024E_47A1CCD50059_impl*
end;//Tl3IntegerValueMapManager.UnRegisterFactory

function Tl3IntegerValueMapManager.pm_GetMap(const aID: Tl3ValueMapID): Il3IntegerValueMap;
//#UC START# *46A5FF470229_47A1CCD50059get_var*
//#UC END# *46A5FF470229_47A1CCD50059get_var*
begin
//#UC START# *46A5FF470229_47A1CCD50059get_impl*
 Result := Map[aID] as Il3IntegerValueMap;
//#UC END# *46A5FF470229_47A1CCD50059get_impl*
end;//Tl3IntegerValueMapManager.pm_GetMap

procedure Tl3IntegerValueMapManager.Cleanup;
//#UC START# *479731C50290_47A1CCD50059_var*
//#UC END# *479731C50290_47A1CCD50059_var*
begin
//#UC START# *479731C50290_47A1CCD50059_impl*
 l3Free(f_Factories);
 inherited;
//#UC END# *479731C50290_47A1CCD50059_impl*
end;//Tl3IntegerValueMapManager.Cleanup

procedure Tl3IntegerValueMapManager.InitFields;
//#UC START# *47A042E100E2_47A1CCD50059_var*
//#UC END# *47A042E100E2_47A1CCD50059_var*
begin
//#UC START# *47A042E100E2_47A1CCD50059_impl*
 inherited;
 Duplicates := l3_dupError;
 SortIndex := l3_siByID;
 Sorted := True;
 f_Factories := Tl3IntegerValueMapFactories.Make;
//#UC END# *47A042E100E2_47A1CCD50059_impl*
end;//Tl3IntegerValueMapManager.InitFields

function Tl3IntegerValueMapManager.MakeDefaultMap(const aID: Tl3ValueMapID): Il3ValueMap;
//#UC START# *47A1C42301B5_47A1CCD50059_var*
var
 l_Idx: Integer;
//#UC END# *47A1C42301B5_47A1CCD50059_var*
begin
//#UC START# *47A1C42301B5_47A1CCD50059_impl*
 Result := nil;
 for l_Idx := 0 to f_Factories.Count-1 do
 begin
  Result := f_Factories.Items[l_Idx].MakeMap(aID);
  if Assigned(Result) then
   Exit;
 end;//for l_Idx
 Result := inherited MakeDefaultMap(aID);
//#UC END# *47A1C42301B5_47A1CCD50059_impl*
end;//Tl3IntegerValueMapManager.MakeDefaultMap

function L3IntegerMapManager: Il3IntegerValueMapManager;
//#UC START# *47A1D86D015C_478E35650120_var*
//#UC END# *47A1D86D015C_478E35650120_var*
begin
//#UC START# *47A1D86D015C_478E35650120_impl*
 if g_l3IntegerMapManager = nil then
 begin
  g_l3IntegerMapManager := Tl3IntegerValueMapManager.Create;
  l3System.AddExitProc(DoneManager);
 end;
 Result := g_l3IntegerMapManager;
//#UC END# *47A1D86D015C_478E35650120_impl*
end;//L3IntegerMapManager

end.