unit tfwDictionaryCache;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwDictionaryCache.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwDictionaryCache
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(seCacheDict) AND not defined(NoScripts)}
uses
  l3Interfaces,
  tfwDictionaryCachePrim,
  l3Types
  ;
{$IfEnd} //seCacheDict AND not NoScripts

{$If defined(seCacheDict) AND not defined(NoScripts)}
type
 _FindDataType_ = Tl3WString;
 _l3Searcher_Parent_ = TtfwDictionaryCachePrim;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwDictionaryCache = class(_l3Searcher_)
 public
 // overridden public methods
   function FindDictionary(const aFileName: Il3CString): _ItemType_; override;
   procedure Remove(const anItem: _ItemType_); override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwDictionaryCache;
    {- возвращает экземпляр синглетона. }
 end;//TtfwDictionaryCache
{$IfEnd} //seCacheDict AND not NoScripts

implementation

{$If defined(seCacheDict) AND not defined(NoScripts)}
uses
  l3Base {a},
  tfwMainDictionaryCache,
  l3String
  ;
{$IfEnd} //seCacheDict AND not NoScripts

{$If defined(seCacheDict) AND not defined(NoScripts)}


// start class TtfwDictionaryCache

var g_TtfwDictionaryCache : TtfwDictionaryCache = nil;

procedure TtfwDictionaryCacheFree;
begin
 l3Free(g_TtfwDictionaryCache);
end;

class function TtfwDictionaryCache.Instance: TtfwDictionaryCache;
begin
 if (g_TtfwDictionaryCache = nil) then
 begin
  l3System.AddExitProc(TtfwDictionaryCacheFree);
  g_TtfwDictionaryCache := Create;
 end;
 Result := g_TtfwDictionaryCache;
end;


function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_55A3DF0603C6_var*
//#UC END# *47B9BAFD01F4_55A3DF0603C6_var*
begin
//#UC START# *47B9BAFD01F4_55A3DF0603C6_impl*
 Result := l3Compare(l3PCharLen(anItem.FileName), aData, l3_siCaseUnsensitive);
//#UC END# *47B9BAFD01F4_55A3DF0603C6_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwDictionaryCache;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}

// start class TtfwDictionaryCache

class function TtfwDictionaryCache.Exists: Boolean;
 {-}
begin
 Result := g_TtfwDictionaryCache <> nil;
end;//TtfwDictionaryCache.Exists

function TtfwDictionaryCache.FindDictionary(const aFileName: Il3CString): _ItemType_;
//#UC START# *559E857A037A_55A3DF0603C6_var*
var
 l_Index : Integer;
//#UC END# *559E857A037A_55A3DF0603C6_var*
begin
//#UC START# *559E857A037A_55A3DF0603C6_impl*
 if FindData(l3PCharLen(aFileName), l_Index) then
  Result := Items[l_Index]
 else
  Result := nil;
//#UC END# *559E857A037A_55A3DF0603C6_impl*
end;//TtfwDictionaryCache.FindDictionary

procedure TtfwDictionaryCache.Remove(const anItem: _ItemType_);
//#UC START# *55A663000019_55A3DF0603C6_var*
//#UC END# *55A663000019_55A3DF0603C6_var*
begin
//#UC START# *55A663000019_55A3DF0603C6_impl*
 TtfwMainDictionaryCache.Instance.RemoveUsersOf(anItem);
 inherited;
//#UC END# *55A663000019_55A3DF0603C6_impl*
end;//TtfwDictionaryCache.Remove

{$IfEnd} //seCacheDict AND not NoScripts

end.