unit tfwStandardDictionaries;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStandardDictionaries.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwStandardDictionaries
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwStandardDictionary,
  tfwStandardDictionaryList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStandardDictionaries = class(TtfwStandardDictionaryList)
 public
 // public methods
   function CheckDictionary(const aName: Il3CString): TtfwStandardDictionary;
   function FindDictionary(const aName: Il3CString): TtfwStandardDictionary;
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwStandardDictionaries;
    {- возвращает экземпляр синглетона. }
 end;//TtfwStandardDictionaries
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a},
  l3String,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwStandardDictionaries

var g_TtfwStandardDictionaries : TtfwStandardDictionaries = nil;

procedure TtfwStandardDictionariesFree;
begin
 l3Free(g_TtfwStandardDictionaries);
end;

class function TtfwStandardDictionaries.Instance: TtfwStandardDictionaries;
begin
 if (g_TtfwStandardDictionaries = nil) then
 begin
  l3System.AddExitProc(TtfwStandardDictionariesFree);
  g_TtfwStandardDictionaries := Create;
 end;
 Result := g_TtfwStandardDictionaries;
end;


function TtfwStandardDictionaries.CheckDictionary(const aName: Il3CString): TtfwStandardDictionary;
//#UC START# *55B0FEC503CE_55B0E7AD026B_var*
var
 l_Index : Integer;
 l_D : TtfwStandardDictionary;
//#UC END# *55B0FEC503CE_55B0E7AD026B_var*
begin
//#UC START# *55B0FEC503CE_55B0E7AD026B_impl*
 if FindData(l3PCharLen(aName), l_Index) then
  Result := Items[l_Index]
 else
 begin
  l_D := TtfwStandardDictionary.Create(aName, []);
  try
   DirectInsert(l_Index, l_D);
   Result := l_D;
  finally
   FreeAndNil(l_D);
  end;//try..finally
 end;//FindData(l3PCharLen(aName), l_Index)
//#UC END# *55B0FEC503CE_55B0E7AD026B_impl*
end;//TtfwStandardDictionaries.CheckDictionary

function TtfwStandardDictionaries.FindDictionary(const aName: Il3CString): TtfwStandardDictionary;
//#UC START# *55B1E6EC0088_55B0E7AD026B_var*
var
 l_Index : Integer;
//#UC END# *55B1E6EC0088_55B0E7AD026B_var*
begin
//#UC START# *55B1E6EC0088_55B0E7AD026B_impl*
 if FindData(l3PCharLen(aName), l_Index) then
  Result := Items[l_Index]
 else
  Result := nil;
//#UC END# *55B1E6EC0088_55B0E7AD026B_impl*
end;//TtfwStandardDictionaries.FindDictionary

class function TtfwStandardDictionaries.Exists: Boolean;
 {-}
begin
 Result := g_TtfwStandardDictionaries <> nil;
end;//TtfwStandardDictionaries.Exists

{$IfEnd} //not NoScripts

end.