unit tfwMainDictionaryCache;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwMainDictionaryCache.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwMainDictionaryCache
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(seCacheDict) AND not defined(NoScripts)}
uses
  l3Interfaces,
  tfwMainDictionaryList,
  l3Types
  ;
{$IfEnd} //seCacheDict AND not NoScripts

{$If defined(seCacheDict) AND not defined(NoScripts)}
type
 _FindDataType_ = Tl3WString;
 _l3Searcher_Parent_ = TtfwMainDictionaryList;
 {$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}
 TtfwMainDictionaryCache = class(_l3Searcher_)
 public
 // overridden public methods
   function FindDictionary(const aFileName: Il3CString): _ItemType_; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwMainDictionaryCache;
    {- возвращает экземпляр синглетона. }
 end;//TtfwMainDictionaryCache
{$IfEnd} //seCacheDict AND not NoScripts

implementation

{$If defined(seCacheDict) AND not defined(NoScripts)}
uses
  l3Base {a},
  l3String
  ;
{$IfEnd} //seCacheDict AND not NoScripts

{$If defined(seCacheDict) AND not defined(NoScripts)}


// start class TtfwMainDictionaryCache

var g_TtfwMainDictionaryCache : TtfwMainDictionaryCache = nil;

procedure TtfwMainDictionaryCacheFree;
begin
 l3Free(g_TtfwMainDictionaryCache);
end;

class function TtfwMainDictionaryCache.Instance: TtfwMainDictionaryCache;
begin
 if (g_TtfwMainDictionaryCache = nil) then
 begin
  l3System.AddExitProc(TtfwMainDictionaryCacheFree);
  g_TtfwMainDictionaryCache := Create;
 end;
 Result := g_TtfwMainDictionaryCache;
end;


function CompareItemWithData(const anItem: _ItemType_;
  const aData: _FindDataType_;
  aSortIndex: Tl3SortIndex;
  aList: _l3Searcher_): Integer;
//#UC START# *47B9BAFD01F4_55A63D300062_var*
//#UC END# *47B9BAFD01F4_55A63D300062_var*
begin
//#UC START# *47B9BAFD01F4_55A63D300062_impl*
 Result := l3Compare(l3PCharLen(anItem.FileName), aData, l3_siCaseUnsensitive);
//#UC END# *47B9BAFD01F4_55A63D300062_impl*
end;//CompareItemWithData

type _Instance_R_ = TtfwMainDictionaryCache;

{$Include w:\common\components\rtl\Garant\L3\l3Searcher.imp.pas}

// start class TtfwMainDictionaryCache

class function TtfwMainDictionaryCache.Exists: Boolean;
 {-}
begin
 Result := g_TtfwMainDictionaryCache <> nil;
end;//TtfwMainDictionaryCache.Exists

function TtfwMainDictionaryCache.FindDictionary(const aFileName: Il3CString): _ItemType_;
//#UC START# *559E857A037A_55A63D300062_var*
var
 l_Index : Integer;
//#UC END# *559E857A037A_55A63D300062_var*
begin
//#UC START# *559E857A037A_55A63D300062_impl*
 if FindData(l3PCharLen(aFileName), l_Index) then
  Result := Items[l_Index]
 else
  Result := nil;
//#UC END# *559E857A037A_55A63D300062_impl*
end;//TtfwMainDictionaryCache.FindDictionary

{$IfEnd} //seCacheDict AND not NoScripts

end.