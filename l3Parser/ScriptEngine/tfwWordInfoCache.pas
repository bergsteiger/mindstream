unit tfwWordInfoCache;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwWordInfoCache.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::WordInfoCache::TtfwWordInfoCache
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordInfoList,
  tfwScriptingTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwWordInfoCache = class(TtfwWordInfoList)
 protected
 // overridden protected methods
   procedure InitFields; override;
 public
 // public methods
   function GetTypeInfo(const aModifiers: TtfwWordInfoRec): TtfwWordInfo;
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwWordInfoCache;
    {- возвращает экземпляр синглетона. }
 end;//TtfwWordInfoCache
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a},
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwWordInfoCache

var g_TtfwWordInfoCache : TtfwWordInfoCache = nil;

procedure TtfwWordInfoCacheFree;
begin
 l3Free(g_TtfwWordInfoCache);
end;

class function TtfwWordInfoCache.Instance: TtfwWordInfoCache;
begin
 if (g_TtfwWordInfoCache = nil) then
 begin
  l3System.AddExitProc(TtfwWordInfoCacheFree);
  g_TtfwWordInfoCache := Create;
 end;
 Result := g_TtfwWordInfoCache;
end;


function TtfwWordInfoCache.GetTypeInfo(const aModifiers: TtfwWordInfoRec): TtfwWordInfo;
//#UC START# *559F82A60110_559F828102D8_var*
var
 l_Index : Integer;
 l_TI : TtfwWordInfoF;
//#UC END# *559F82A60110_559F828102D8_var*
begin
//#UC START# *559F82A60110_559F828102D8_impl*
 if aModifiers.Empty then
  Result := TtfwWordInfoE.Instance
 else
 if FindData(aModifiers, l_Index) then
  Result := Items[l_Index]
 else
 begin
  l_TI := TtfwWordInfoF.Create(aModifiers);
  try
   Add(l_TI);
   Result := l_TI;
  finally
   FreeAndNil(l_TI);
  end;//try..finally
 end;//FindData(aModifiers, l_Index)
//#UC END# *559F82A60110_559F828102D8_impl*
end;//TtfwWordInfoCache.GetTypeInfo

class function TtfwWordInfoCache.Exists: Boolean;
 {-}
begin
 Result := g_TtfwWordInfoCache <> nil;
end;//TtfwWordInfoCache.Exists

procedure TtfwWordInfoCache.InitFields;
//#UC START# *47A042E100E2_559F828102D8_var*
//#UC END# *47A042E100E2_559F828102D8_var*
begin
//#UC START# *47A042E100E2_559F828102D8_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_559F828102D8_impl*
end;//TtfwWordInfoCache.InitFields

{$IfEnd} //not NoScripts

end.