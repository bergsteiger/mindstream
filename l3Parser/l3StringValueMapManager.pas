unit l3StringValueMapManager;
 
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
 _ItemType_ = Il3StringValueMapFactory;
 _l3InterfaceRefList_Parent_ = Tl3SimpleDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3InterfaceRefList.imp.pas}
 Tl3StringValueMapFactories = class(_l3InterfaceRefList_)
 end;//Tl3StringValueMapFactories

 Tl3StringValueMapManager = class(Tl3ValueMapManager, Il3StringValueMapManager)
 private
 // private fields
   f_Factories : Tl3StringValueMapFactories;
 protected
 // realized methods
   procedure RegisterFactory(const aFactory: Il3StringValueMapFactory;
    aPreferred: Boolean);
     {* aPreferred - Фабрика будет вызываться как можно раньше. }
   procedure UnRegisterFactory(const aFactory: Il3StringValueMapFactory);
   function pm_GetMap(const aID: Tl3ValueMapID): Il3StringValueMap;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
   function MakeDefaultMap(const aID: Tl3ValueMapID): Il3ValueMap; override;
 public
 // public methods
   class function Make: Il3StringValueMapManager; reintroduce;
 end;//Tl3StringValueMapManager

function L3StringMapManager: Il3StringValueMapManager;

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

var g_l3StringMapManager : Tl3StringValueMapManager;

// unit methods

procedure DoneManager;
//#UC START# *47A1E97500BB_478E359802F6_var*
//#UC END# *47A1E97500BB_478E359802F6_var*
begin
//#UC START# *47A1E97500BB_478E359802F6_impl*
 l3Free(g_l3StringMapManager);
//#UC END# *47A1E97500BB_478E359802F6_impl*
end;//DoneManager
type _Instance_R_ = Tl3StringValueMapFactories;

{$Include l3InterfaceRefList.imp.pas}

// start class Tl3StringValueMapManager

class function Tl3StringValueMapManager.Make: Il3StringValueMapManager;
var
 l_Inst : Tl3StringValueMapManager;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure Tl3StringValueMapManager.RegisterFactory(const aFactory: Il3StringValueMapFactory;
  aPreferred: Boolean);
//#UC START# *46A5F1EC031F_47A1E9B503DD_var*
//#UC END# *46A5F1EC031F_47A1E9B503DD_var*
begin
//#UC START# *46A5F1EC031F_47A1E9B503DD_impl*
 if f_Factories.IndexOf(aFactory) = -1 then
  begin
   if aPreferred then
    f_Factories.Insert(0,aFactory)
   else
    f_Factories.Add(aFactory);
  end;
//#UC END# *46A5F1EC031F_47A1E9B503DD_impl*
end;//Tl3StringValueMapManager.RegisterFactory

procedure Tl3StringValueMapManager.UnRegisterFactory(const aFactory: Il3StringValueMapFactory);
//#UC START# *46A5F21F02DD_47A1E9B503DD_var*
//#UC END# *46A5F21F02DD_47A1E9B503DD_var*
begin
//#UC START# *46A5F21F02DD_47A1E9B503DD_impl*
 f_Factories.Remove(aFactory);
//#UC END# *46A5F21F02DD_47A1E9B503DD_impl*
end;//Tl3StringValueMapManager.UnRegisterFactory

function Tl3StringValueMapManager.pm_GetMap(const aID: Tl3ValueMapID): Il3StringValueMap;
//#UC START# *46A5F24B03B2_47A1E9B503DDget_var*
//#UC END# *46A5F24B03B2_47A1E9B503DDget_var*
begin
//#UC START# *46A5F24B03B2_47A1E9B503DDget_impl*
 Result := Map[aID] as Il3StringValueMap;
//#UC END# *46A5F24B03B2_47A1E9B503DDget_impl*
end;//Tl3StringValueMapManager.pm_GetMap

procedure Tl3StringValueMapManager.Cleanup;
//#UC START# *479731C50290_47A1E9B503DD_var*
//#UC END# *479731C50290_47A1E9B503DD_var*
begin
//#UC START# *479731C50290_47A1E9B503DD_impl*
 l3Free(f_Factories);
 inherited;
//#UC END# *479731C50290_47A1E9B503DD_impl*
end;//Tl3StringValueMapManager.Cleanup

procedure Tl3StringValueMapManager.InitFields;
//#UC START# *47A042E100E2_47A1E9B503DD_var*
//#UC END# *47A042E100E2_47A1E9B503DD_var*
begin
//#UC START# *47A042E100E2_47A1E9B503DD_impl*
 inherited;
 Duplicates := l3_dupError;
 SortIndex := l3_siByID;
 Sorted := True;
 f_Factories := Tl3StringValueMapFactories.Make;
//#UC END# *47A042E100E2_47A1E9B503DD_impl*
end;//Tl3StringValueMapManager.InitFields

function Tl3StringValueMapManager.MakeDefaultMap(const aID: Tl3ValueMapID): Il3ValueMap;
//#UC START# *47A1C42301B5_47A1E9B503DD_var*
var
 l_Idx: Integer;
//#UC END# *47A1C42301B5_47A1E9B503DD_var*
begin
//#UC START# *47A1C42301B5_47A1E9B503DD_impl*
 Result := nil;
 for l_Idx := 0 to f_Factories.Count-1 do
 begin
  Result := f_Factories.Items[l_Idx].MakeMap(aID);
  if Assigned(Result) then
   Exit;
 end;
 Result := inherited MakeDefaultMap(aID);
//#UC END# *47A1C42301B5_47A1E9B503DD_impl*
end;//Tl3StringValueMapManager.MakeDefaultMap

function L3StringMapManager: Il3StringValueMapManager;
//#UC START# *47A1E96201B4_478E359802F6_var*
//#UC END# *47A1E96201B4_478E359802F6_var*
begin
//#UC START# *47A1E96201B4_478E359802F6_impl*
 if g_l3StringMapManager = nil then
 begin
  g_l3StringMapManager := Tl3StringValueMapManager.Create;
  l3System.AddExitProc(DoneManager);
 end;
 Result := g_l3StringMapManager;
//#UC END# *47A1E96201B4_478E359802F6_impl*
end;//L3StringMapManager

end.