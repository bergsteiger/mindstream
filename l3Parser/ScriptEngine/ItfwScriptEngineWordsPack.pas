unit ItfwScriptEngineWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "ItfwScriptEngineWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::ItfwScriptEngineWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwDictionaryEx,
  tfwClassLike,
  l3Interfaces,
  l3Variant,
  tfwTypeInfo,
  Types,
  tfwDictionaryPrim
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwDictionaryExWordsPack,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopScriptEngineAsKeywordFinder = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ScriptEngine:AsKeywordFinder
*Тип результата:* TtfwKeywordFinder
*Пример:*
[code]
OBJECT VAR l_TtfwKeywordFinder
 aScriptEngine pop:ScriptEngine:AsKeywordFinder >>> l_TtfwKeywordFinder
[code]  }
 private
 // private methods
   function AsKeywordFinder(const aCtx: TtfwContext;
    const aScriptEngine: ItfwScriptEngine): TtfwKeywordFinder;
     {* Реализация слова скрипта pop:ScriptEngine:AsKeywordFinder }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopScriptEngineAsKeywordFinder

// start class TkwPopScriptEngineAsKeywordFinder

function TkwPopScriptEngineAsKeywordFinder.AsKeywordFinder(const aCtx: TtfwContext;
  const aScriptEngine: ItfwScriptEngine): TtfwKeywordFinder;
//#UC START# *40ABA0669AE5_63D6AB9D9B8E_var*
//#UC END# *40ABA0669AE5_63D6AB9D9B8E_var*
begin
//#UC START# *40ABA0669AE5_63D6AB9D9B8E_impl*
 Result := aScriptEngine.KeywordFinder(aCtx);
//#UC END# *40ABA0669AE5_63D6AB9D9B8E_impl*
end;//TkwPopScriptEngineAsKeywordFinder.AsKeywordFinder

procedure TkwPopScriptEngineAsKeywordFinder.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScriptEngine : ItfwScriptEngine;
begin
 try
  l_aScriptEngine := ItfwScriptEngine(aCtx.rEngine.PopIntf(ItfwScriptEngine));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScriptEngine: ItfwScriptEngine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((AsKeywordFinder(aCtx, l_aScriptEngine)));
end;//TkwPopScriptEngineAsKeywordFinder.DoDoIt

class function TkwPopScriptEngineAsKeywordFinder.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScriptEngine:AsKeywordFinder';
end;//TkwPopScriptEngineAsKeywordFinder.GetWordNameForRegister

function TkwPopScriptEngineAsKeywordFinder.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwKeywordFinder);
end;//TkwPopScriptEngineAsKeywordFinder.GetResultTypeInfo

type
 TkwPopScriptEngineAddInitialization = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ScriptEngine:AddInitialization
*Пример:*
[code]
 aWord aScriptEngine pop:ScriptEngine:AddInitialization
[code]  }
 private
 // private methods
   procedure AddInitialization(const aCtx: TtfwContext;
    const aScriptEngine: ItfwScriptEngine;
    aWord: TtfwWord);
     {* Реализация слова скрипта pop:ScriptEngine:AddInitialization }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopScriptEngineAddInitialization

// start class TkwPopScriptEngineAddInitialization

procedure TkwPopScriptEngineAddInitialization.AddInitialization(const aCtx: TtfwContext;
  const aScriptEngine: ItfwScriptEngine;
  aWord: TtfwWord);
//#UC START# *0A9E82A4F7FB_F4290567147F_var*
//#UC END# *0A9E82A4F7FB_F4290567147F_var*
begin
//#UC START# *0A9E82A4F7FB_F4290567147F_impl*
 aCtx.rEngine.AddInitialization(aCtx, aWord);
//#UC END# *0A9E82A4F7FB_F4290567147F_impl*
end;//TkwPopScriptEngineAddInitialization.AddInitialization

procedure TkwPopScriptEngineAddInitialization.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScriptEngine : ItfwScriptEngine;
 l_aWord : TtfwWord;
begin
 try
  l_aScriptEngine := ItfwScriptEngine(aCtx.rEngine.PopIntf(ItfwScriptEngine));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScriptEngine: ItfwScriptEngine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 AddInitialization(aCtx, l_aScriptEngine, l_aWord);
end;//TkwPopScriptEngineAddInitialization.DoDoIt

class function TkwPopScriptEngineAddInitialization.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScriptEngine:AddInitialization';
end;//TkwPopScriptEngineAddInitialization.GetWordNameForRegister

function TkwPopScriptEngineAddInitialization.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopScriptEngineAddInitialization.GetResultTypeInfo

type
 TkwPopScriptEngineCurrentCompilingDictionary = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ScriptEngine:CurrentCompilingDictionary
*Тип результата:* TtfwDictionaryEx
*Пример:*
[code]
OBJECT VAR l_TtfwDictionaryEx
 aScriptEngine pop:ScriptEngine:CurrentCompilingDictionary >>> l_TtfwDictionaryEx
[code]  }
 private
 // private methods
   function CurrentCompilingDictionary(const aCtx: TtfwContext;
    const aScriptEngine: ItfwScriptEngine): TtfwDictionaryEx;
     {* Реализация слова скрипта pop:ScriptEngine:CurrentCompilingDictionary }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopScriptEngineCurrentCompilingDictionary

// start class TkwPopScriptEngineCurrentCompilingDictionary

function TkwPopScriptEngineCurrentCompilingDictionary.CurrentCompilingDictionary(const aCtx: TtfwContext;
  const aScriptEngine: ItfwScriptEngine): TtfwDictionaryEx;
//#UC START# *20FE4AD2F344_1C1FE481A9C3_var*
//#UC END# *20FE4AD2F344_1C1FE481A9C3_var*
begin
//#UC START# *20FE4AD2F344_1C1FE481A9C3_impl*
 Result := aScriptEngine.CurrentCompilingDictionary As TtfwDictionaryEx;
//#UC END# *20FE4AD2F344_1C1FE481A9C3_impl*
end;//TkwPopScriptEngineCurrentCompilingDictionary.CurrentCompilingDictionary

procedure TkwPopScriptEngineCurrentCompilingDictionary.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScriptEngine : ItfwScriptEngine;
begin
 try
  l_aScriptEngine := ItfwScriptEngine(aCtx.rEngine.PopIntf(ItfwScriptEngine));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScriptEngine: ItfwScriptEngine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((CurrentCompilingDictionary(aCtx, l_aScriptEngine)));
end;//TkwPopScriptEngineCurrentCompilingDictionary.DoDoIt

class function TkwPopScriptEngineCurrentCompilingDictionary.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScriptEngine:CurrentCompilingDictionary';
end;//TkwPopScriptEngineCurrentCompilingDictionary.GetWordNameForRegister

function TkwPopScriptEngineCurrentCompilingDictionary.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwDictionaryEx);
end;//TkwPopScriptEngineCurrentCompilingDictionary.GetResultTypeInfo

type
 TkwPopScriptEngineDisableForHelp = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ScriptEngine:DisableForHelp
*Пример:*
[code]
 aWord aScriptEngine pop:ScriptEngine:DisableForHelp
[code]  }
 private
 // private methods
   procedure DisableForHelp(const aCtx: TtfwContext;
    const aScriptEngine: ItfwScriptEngine;
    aWord: TtfwWord);
     {* Реализация слова скрипта pop:ScriptEngine:DisableForHelp }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopScriptEngineDisableForHelp

// start class TkwPopScriptEngineDisableForHelp

procedure TkwPopScriptEngineDisableForHelp.DisableForHelp(const aCtx: TtfwContext;
  const aScriptEngine: ItfwScriptEngine;
  aWord: TtfwWord);
//#UC START# *D20BEDECAE0B_B7DCC24F906E_var*
//#UC END# *D20BEDECAE0B_B7DCC24F906E_var*
begin
//#UC START# *D20BEDECAE0B_B7DCC24F906E_impl*
 aScriptEngine.DisableForHelp(aWord);
//#UC END# *D20BEDECAE0B_B7DCC24F906E_impl*
end;//TkwPopScriptEngineDisableForHelp.DisableForHelp

procedure TkwPopScriptEngineDisableForHelp.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScriptEngine : ItfwScriptEngine;
 l_aWord : TtfwWord;
begin
 try
  l_aScriptEngine := ItfwScriptEngine(aCtx.rEngine.PopIntf(ItfwScriptEngine));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScriptEngine: ItfwScriptEngine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DisableForHelp(aCtx, l_aScriptEngine, l_aWord);
end;//TkwPopScriptEngineDisableForHelp.DoDoIt

class function TkwPopScriptEngineDisableForHelp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScriptEngine:DisableForHelp';
end;//TkwPopScriptEngineDisableForHelp.GetWordNameForRegister

function TkwPopScriptEngineDisableForHelp.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopScriptEngineDisableForHelp.GetResultTypeInfo

type
 TkwPopScriptEngineCascadeDict = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ScriptEngine:CascadeDict
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aScriptEngine pop:ScriptEngine:CascadeDict >>> l_Boolean
[code]  }
 private
 // private methods
   function CascadeDict(const aCtx: TtfwContext;
    const aScriptEngine: ItfwScriptEngine): Boolean;
     {* Реализация слова скрипта pop:ScriptEngine:CascadeDict }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 protected
 // protected methods
   class procedure DoSetValue(const aScriptEngine: ItfwScriptEngine;
    aValue: Boolean);
     {* Метод установки значения свойства CascadeDict }
 end;//TkwPopScriptEngineCascadeDict

// start class TkwPopScriptEngineCascadeDict

function TkwPopScriptEngineCascadeDict.CascadeDict(const aCtx: TtfwContext;
  const aScriptEngine: ItfwScriptEngine): Boolean;
//#UC START# *FE95EAD31E65_2A023EBF80D7_var*
//#UC END# *FE95EAD31E65_2A023EBF80D7_var*
begin
//#UC START# *FE95EAD31E65_2A023EBF80D7_impl*
 Result := aScriptEngine.CascadeDict;
//#UC END# *FE95EAD31E65_2A023EBF80D7_impl*
end;//TkwPopScriptEngineCascadeDict.CascadeDict

class procedure TkwPopScriptEngineCascadeDict.DoSetValue(const aScriptEngine: ItfwScriptEngine;
  aValue: Boolean);
//#UC START# *32EB0C1A988B_2A023EBF80D7_var*
//#UC END# *32EB0C1A988B_2A023EBF80D7_var*
begin
//#UC START# *32EB0C1A988B_2A023EBF80D7_impl*
 aScriptEngine.CascadeDict := aValue;
//#UC END# *32EB0C1A988B_2A023EBF80D7_impl*
end;//TkwPopScriptEngineCascadeDict.DoSetValue

procedure TkwPopScriptEngineCascadeDict.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aScriptEngine : ItfwScriptEngine;
begin
 try
  l_aScriptEngine := ItfwScriptEngine(aCtx.rEngine.PopIntf(ItfwScriptEngine));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aScriptEngine: ItfwScriptEngine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((CascadeDict(aCtx, l_aScriptEngine)));
end;//TkwPopScriptEngineCascadeDict.DoDoIt

class function TkwPopScriptEngineCascadeDict.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ScriptEngine:CascadeDict';
end;//TkwPopScriptEngineCascadeDict.GetWordNameForRegister

procedure TkwPopScriptEngineCascadeDict.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
var
 l_ScriptEngine: ItfwScriptEngine;
begin
 try
  l_ScriptEngine := ItfwScriptEngine(aCtx.rEngine.PopIntf(ItfwScriptEngine));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра l_ScriptEngine: ItfwScriptEngine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DoSetValue(l_ScriptEngine, (aValue.AsBoolean));
end;//TkwPopScriptEngineCascadeDict.SetValue

function TkwPopScriptEngineCascadeDict.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopScriptEngineCascadeDict.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ScriptEngine_AsKeywordFinder
 TkwPopScriptEngineAsKeywordFinder.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ScriptEngine_AddInitialization
 TkwPopScriptEngineAddInitialization.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ScriptEngine_CurrentCompilingDictionary
 TkwPopScriptEngineCurrentCompilingDictionary.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ScriptEngine_DisableForHelp
 TkwPopScriptEngineDisableForHelp.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ScriptEngine_CascadeDict
 TkwPopScriptEngineCascadeDict.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwScriptEngine
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwScriptEngine));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwKeywordFinder
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwKeywordFinder));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwDictionaryEx
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwDictionaryEx));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts

end.