unit tfwValueTypesCache;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwValueTypesCache.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::TypeInfoCache::TtfwValueTypesCache
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwValueTypes,
  tfwValueTypesList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwValueTypesCache = class(TtfwValueTypesList)
 protected
 // overridden protected methods
   procedure InitFields; override;
 public
 // public methods
   function CheckList(aValue: TtfwValueTypes): TtfwValueTypes;
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwValueTypesCache;
    {- возвращает экземпляр синглетона. }
 end;//TtfwValueTypesCache
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwValueTypesCache

var g_TtfwValueTypesCache : TtfwValueTypesCache = nil;

procedure TtfwValueTypesCacheFree;
begin
 l3Free(g_TtfwValueTypesCache);
end;

class function TtfwValueTypesCache.Instance: TtfwValueTypesCache;
begin
 if (g_TtfwValueTypesCache = nil) then
 begin
  l3System.AddExitProc(TtfwValueTypesCacheFree);
  g_TtfwValueTypesCache := Create;
 end;
 Result := g_TtfwValueTypesCache;
end;


function TtfwValueTypesCache.CheckList(aValue: TtfwValueTypes): TtfwValueTypes;
//#UC START# *55C0A4040157_55BF37AB038D_var*
var
 l_Index : Integer;
//#UC END# *55C0A4040157_55BF37AB038D_var*
begin
//#UC START# *55C0A4040157_55BF37AB038D_impl*
 if Self.FindData(aValue, l_Index) then
  Result := Self.Items[l_Index]
 else
 begin
  Self.Add(aValue);
  Result := aValue;
 end;//TtfwValueTypesCache.Instance.FindData(l_L, l_Index)
//#UC END# *55C0A4040157_55BF37AB038D_impl*
end;//TtfwValueTypesCache.CheckList

class function TtfwValueTypesCache.Exists: Boolean;
 {-}
begin
 Result := g_TtfwValueTypesCache <> nil;
end;//TtfwValueTypesCache.Exists

procedure TtfwValueTypesCache.InitFields;
//#UC START# *47A042E100E2_55BF37AB038D_var*
//#UC END# *47A042E100E2_55BF37AB038D_var*
begin
//#UC START# *47A042E100E2_55BF37AB038D_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_55BF37AB038D_impl*
end;//TtfwValueTypesCache.InitFields

{$IfEnd} //not NoScripts

end.