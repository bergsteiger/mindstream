unit tfwDictionaryExWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwDictionaryExWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::tfwDictionaryExWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwDictionaryEx,
  tfwAxiomaticsResNameGetter,
  tfwClassLike
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwDictionaryDataIteratorPrim,
  tfwExportedDictionariesIterator,
  tfwUsedDictionariesIterator,
  l3DateSt
  {$If defined(seCacheDict) AND not defined(NoScripts)}
  ,
  tfwMainDictionaryCache
  {$IfEnd} //seCacheDict AND not NoScripts
  
  {$If defined(seCacheDict) AND not defined(NoScripts)}
  ,
  tfwDictionaryCache
  {$IfEnd} //seCacheDict AND not NoScripts
  ,
  tfwMainDictionary,
  tfwMembersIterator,
  tfwDictionaryWordsPack,
  tfwScriptEngineExInterfaces,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
//#UC START# *EDB2EC981E9Aci*
//#UC END# *EDB2EC981E9Aci*
 TtfwDictionaryExWordsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *EDB2EC981E9Apubl*
//#UC END# *EDB2EC981E9Apubl*
 end;//TtfwDictionaryExWordsPackResNameGetter

// start class TtfwDictionaryExWordsPackResNameGetter

class function TtfwDictionaryExWordsPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'tfwDictionaryExWordsPack';
end;//TtfwDictionaryExWordsPackResNameGetter.ResName

 {$R tfwDictionaryExWordsPack.res}

type
 TkwPopDictionaryExFileName = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:FileName
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aDictionaryEx pop:DictionaryEx:FileName >>> l_Il3CString
[code]  }
 private
 // private methods
   function FileName(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx): Il3CString;
     {* Реализация слова скрипта pop:DictionaryEx:FileName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExFileName

// start class TkwPopDictionaryExFileName

function TkwPopDictionaryExFileName.FileName(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx): Il3CString;
//#UC START# *770C15F2EC2C_06E8451D9B30_var*
//#UC END# *770C15F2EC2C_06E8451D9B30_var*
begin
//#UC START# *770C15F2EC2C_06E8451D9B30_impl*
 Result := aDictionaryEx.FileName;
//#UC END# *770C15F2EC2C_06E8451D9B30_impl*
end;//TkwPopDictionaryExFileName.FileName

procedure TkwPopDictionaryExFileName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((FileName(aCtx, l_aDictionaryEx)));
end;//TkwPopDictionaryExFileName.DoDoIt

class function TkwPopDictionaryExFileName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:FileName';
end;//TkwPopDictionaryExFileName.GetWordNameForRegister

function TkwPopDictionaryExFileName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwPopDictionaryExFileName.GetResultTypeInfo

type
 TkwPopDictionaryExUsedDictionaries = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:UsedDictionaries
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aDictionaryEx pop:DictionaryEx:UsedDictionaries >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function UsedDictionaries(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx): ItfwValueList;
     {* Реализация слова скрипта pop:DictionaryEx:UsedDictionaries }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExUsedDictionaries

// start class TkwPopDictionaryExUsedDictionaries

function TkwPopDictionaryExUsedDictionaries.UsedDictionaries(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx): ItfwValueList;
//#UC START# *2350C9F61A78_B94C35EBE3DE_var*
//#UC END# *2350C9F61A78_B94C35EBE3DE_var*
begin
//#UC START# *2350C9F61A78_B94C35EBE3DE_impl*
 Result := TtfwUsedDictionariesIterator.Make(aDictionaryEx);
//#UC END# *2350C9F61A78_B94C35EBE3DE_impl*
end;//TkwPopDictionaryExUsedDictionaries.UsedDictionaries

procedure TkwPopDictionaryExUsedDictionaries.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((UsedDictionaries(aCtx, l_aDictionaryEx)));
end;//TkwPopDictionaryExUsedDictionaries.DoDoIt

class function TkwPopDictionaryExUsedDictionaries.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:UsedDictionaries';
end;//TkwPopDictionaryExUsedDictionaries.GetWordNameForRegister

function TkwPopDictionaryExUsedDictionaries.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwPopDictionaryExUsedDictionaries.GetResultTypeInfo

type
 TkwPopDictionaryExExportedDictionaries = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:ExportedDictionaries
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aDictionaryEx pop:DictionaryEx:ExportedDictionaries >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function ExportedDictionaries(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx): ItfwValueList;
     {* Реализация слова скрипта pop:DictionaryEx:ExportedDictionaries }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExExportedDictionaries

// start class TkwPopDictionaryExExportedDictionaries

function TkwPopDictionaryExExportedDictionaries.ExportedDictionaries(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx): ItfwValueList;
//#UC START# *E6BE6C32473B_6AF5E6295E46_var*
//#UC END# *E6BE6C32473B_6AF5E6295E46_var*
begin
//#UC START# *E6BE6C32473B_6AF5E6295E46_impl*
 Result := TtfwExportedDictionariesIterator.Make(aDictionaryEx);
//#UC END# *E6BE6C32473B_6AF5E6295E46_impl*
end;//TkwPopDictionaryExExportedDictionaries.ExportedDictionaries

procedure TkwPopDictionaryExExportedDictionaries.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((ExportedDictionaries(aCtx, l_aDictionaryEx)));
end;//TkwPopDictionaryExExportedDictionaries.DoDoIt

class function TkwPopDictionaryExExportedDictionaries.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:ExportedDictionaries';
end;//TkwPopDictionaryExExportedDictionaries.GetWordNameForRegister

function TkwPopDictionaryExExportedDictionaries.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwPopDictionaryExExportedDictionaries.GetResultTypeInfo

type
 TkwPopDictionaryExExportDictionary = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:ExportDictionary
*Пример:*
[code]
 aDictionary aDictionaryEx pop:DictionaryEx:ExportDictionary
[code]  }
 private
 // private methods
   procedure ExportDictionary(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx;
    aDictionary: TtfwDictionaryEx);
     {* Реализация слова скрипта pop:DictionaryEx:ExportDictionary }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExExportDictionary

// start class TkwPopDictionaryExExportDictionary

procedure TkwPopDictionaryExExportDictionary.ExportDictionary(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx;
  aDictionary: TtfwDictionaryEx);
//#UC START# *E5F49D0B62DF_4A28BCF78342_var*
//#UC END# *E5F49D0B62DF_4A28BCF78342_var*
begin
//#UC START# *E5F49D0B62DF_4A28BCF78342_impl*
 aDictionaryEx.ExportDictionary(aDictionary);
//#UC END# *E5F49D0B62DF_4A28BCF78342_impl*
end;//TkwPopDictionaryExExportDictionary.ExportDictionary

procedure TkwPopDictionaryExExportDictionary.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
 l_aDictionary : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDictionary := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionary: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ExportDictionary(aCtx, l_aDictionaryEx, l_aDictionary);
end;//TkwPopDictionaryExExportDictionary.DoDoIt

class function TkwPopDictionaryExExportDictionary.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:ExportDictionary';
end;//TkwPopDictionaryExExportDictionary.GetWordNameForRegister

function TkwPopDictionaryExExportDictionary.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopDictionaryExExportDictionary.GetResultTypeInfo

type
 TkwPopDictionaryExUseDictionary = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:UseDictionary
*Пример:*
[code]
 aDictionary aDictionaryEx pop:DictionaryEx:UseDictionary
[code]  }
 private
 // private methods
   procedure UseDictionary(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx;
    aDictionary: TtfwDictionaryEx);
     {* Реализация слова скрипта pop:DictionaryEx:UseDictionary }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExUseDictionary

// start class TkwPopDictionaryExUseDictionary

procedure TkwPopDictionaryExUseDictionary.UseDictionary(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx;
  aDictionary: TtfwDictionaryEx);
//#UC START# *D222E866EFCD_F63A2FD719D9_var*
//#UC END# *D222E866EFCD_F63A2FD719D9_var*
begin
//#UC START# *D222E866EFCD_F63A2FD719D9_impl*
 aDictionaryEx.UseDictionary(aDictionary);
//#UC END# *D222E866EFCD_F63A2FD719D9_impl*
end;//TkwPopDictionaryExUseDictionary.UseDictionary

procedure TkwPopDictionaryExUseDictionary.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
 l_aDictionary : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDictionary := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionary: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 UseDictionary(aCtx, l_aDictionaryEx, l_aDictionary);
end;//TkwPopDictionaryExUseDictionary.DoDoIt

class function TkwPopDictionaryExUseDictionary.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:UseDictionary';
end;//TkwPopDictionaryExUseDictionary.GetWordNameForRegister

function TkwPopDictionaryExUseDictionary.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopDictionaryExUseDictionary.GetResultTypeInfo

type
 TkwPopDictionaryExFileDateTime = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:FileDateTime
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aDictionaryEx pop:DictionaryEx:FileDateTime >>> l_String
[code]  }
 private
 // private methods
   function FileDateTime(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx): AnsiString;
     {* Реализация слова скрипта pop:DictionaryEx:FileDateTime }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExFileDateTime

// start class TkwPopDictionaryExFileDateTime

function TkwPopDictionaryExFileDateTime.FileDateTime(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx): AnsiString;
//#UC START# *9371B1AA3DFC_308455C44800_var*
//#UC END# *9371B1AA3DFC_308455C44800_var*
begin
//#UC START# *9371B1AA3DFC_308455C44800_impl*
 Result := l3DateTimeToStr(aDictionaryEx.FileDateTime);
//#UC END# *9371B1AA3DFC_308455C44800_impl*
end;//TkwPopDictionaryExFileDateTime.FileDateTime

procedure TkwPopDictionaryExFileDateTime.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((FileDateTime(aCtx, l_aDictionaryEx)));
end;//TkwPopDictionaryExFileDateTime.DoDoIt

class function TkwPopDictionaryExFileDateTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:FileDateTime';
end;//TkwPopDictionaryExFileDateTime.GetWordNameForRegister

function TkwPopDictionaryExFileDateTime.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopDictionaryExFileDateTime.GetResultTypeInfo

type
 TkwPopDictionaryExRemoveFromCache = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:DictionaryEx:RemoveFromCache
[panel]Удаляет словарь из кешей скомпилированных словарей[panel]
*Пример:*
[code]
 aDictionaryEx pop:DictionaryEx:RemoveFromCache
[code]  }
 private
 // private methods
   procedure RemoveFromCache(const aCtx: TtfwContext;
    aDictionaryEx: TtfwDictionaryEx);
     {* Реализация слова скрипта pop:DictionaryEx:RemoveFromCache }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopDictionaryExRemoveFromCache

// start class TkwPopDictionaryExRemoveFromCache

procedure TkwPopDictionaryExRemoveFromCache.RemoveFromCache(const aCtx: TtfwContext;
  aDictionaryEx: TtfwDictionaryEx);
//#UC START# *E3AF4D2A35E0_B74ACC6F66BC_var*
{$IfDef seCacheDict}
var
 l_D : TtfwDictionaryEx;
{$EndIf seCacheDict}
//#UC END# *E3AF4D2A35E0_B74ACC6F66BC_var*
begin
//#UC START# *E3AF4D2A35E0_B74ACC6F66BC_impl*
 {$IfDef seCacheDict}
 l_D := aDictionaryEx.Use;
 try
  TtfwDictionaryCache.Instance.Remove(l_D);
  if (l_D Is TtfwMainDictionary) then
   TtfwMainDictionaryCache.Instance.Remove(TtfwMainDictionary(l_D));
 finally
  FreeAndNil(l_D);
 end;//try..finally
 {$EndIf seCacheDict}
//#UC END# *E3AF4D2A35E0_B74ACC6F66BC_impl*
end;//TkwPopDictionaryExRemoveFromCache.RemoveFromCache

procedure TkwPopDictionaryExRemoveFromCache.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDictionaryEx : TtfwDictionaryEx;
begin
 try
  l_aDictionaryEx := TtfwDictionaryEx(aCtx.rEngine.PopObjAs(TtfwDictionaryEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDictionaryEx: TtfwDictionaryEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 RemoveFromCache(aCtx, l_aDictionaryEx);
end;//TkwPopDictionaryExRemoveFromCache.DoDoIt

class function TkwPopDictionaryExRemoveFromCache.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:DictionaryEx:RemoveFromCache';
end;//TkwPopDictionaryExRemoveFromCache.GetWordNameForRegister

function TkwPopDictionaryExRemoveFromCache.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopDictionaryExRemoveFromCache.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TtfwDictionaryExWordsPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_FileName
 TkwPopDictionaryExFileName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_UsedDictionaries
 TkwPopDictionaryExUsedDictionaries.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_ExportedDictionaries
 TkwPopDictionaryExExportedDictionaries.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_ExportDictionary
 TkwPopDictionaryExExportDictionary.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_UseDictionary
 TkwPopDictionaryExUseDictionary.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_FileDateTime
 TkwPopDictionaryExFileDateTime.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_DictionaryEx_RemoveFromCache
 TkwPopDictionaryExRemoveFromCache.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwDictionaryEx
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwDictionaryEx));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwValueList
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwValueList));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts

end.