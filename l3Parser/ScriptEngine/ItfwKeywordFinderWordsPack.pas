unit ItfwKeywordFinderWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "ItfwKeywordFinderWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::ItfwKeywordFinderWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwClassLike
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopKeywordFinderKeywordByName = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:KeywordFinder:KeywordByName
*Тип результата:* TtfwKeyWord
*Пример:*
[code]
OBJECT VAR l_TtfwKeyWord
 aName aKeywordFinder pop:KeywordFinder:KeywordByName >>> l_TtfwKeyWord
[code]  }
 private
 // private methods
   function KeywordByName(const aCtx: TtfwContext;
    aKeywordFinder: TtfwKeywordFinder;
    const aName: Il3CString): TtfwKeyWord;
     {* Реализация слова скрипта pop:KeywordFinder:KeywordByName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopKeywordFinderKeywordByName

// start class TkwPopKeywordFinderKeywordByName

function TkwPopKeywordFinderKeywordByName.KeywordByName(const aCtx: TtfwContext;
  aKeywordFinder: TtfwKeywordFinder;
  const aName: Il3CString): TtfwKeyWord;
//#UC START# *4BB40DD9D18E_D73628563892_var*
//#UC END# *4BB40DD9D18E_D73628563892_var*
begin
//#UC START# *4BB40DD9D18E_D73628563892_impl*
 Result := TtfwKeyWord(aKeywordFinder.KeywordByName(aName));
//#UC END# *4BB40DD9D18E_D73628563892_impl*
end;//TkwPopKeywordFinderKeywordByName.KeywordByName

procedure TkwPopKeywordFinderKeywordByName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aKeywordFinder : TtfwKeywordFinder;
 l_aName : Il3CString;
begin
 try
  l_aKeywordFinder := TtfwKeywordFinder(aCtx.rEngine.PopObjAs(TtfwKeywordFinder));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aKeywordFinder: TtfwKeywordFinder : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aName := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((KeywordByName(aCtx, l_aKeywordFinder, l_aName)));
end;//TkwPopKeywordFinderKeywordByName.DoDoIt

class function TkwPopKeywordFinderKeywordByName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:KeywordFinder:KeywordByName';
end;//TkwPopKeywordFinderKeywordByName.GetWordNameForRegister

function TkwPopKeywordFinderKeywordByName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwKeyWord);
end;//TkwPopKeywordFinderKeywordByName.GetResultTypeInfo

type
 TkwPopKeywordFinderParentFinder = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:KeywordFinder:ParentFinder
*Тип результата:* TtfwKeywordFinder
*Пример:*
[code]
OBJECT VAR l_TtfwKeywordFinder
 aKeywordFinder pop:KeywordFinder:ParentFinder >>> l_TtfwKeywordFinder
[code]  }
 private
 // private methods
   function ParentFinder(const aCtx: TtfwContext;
    aKeywordFinder: TtfwKeywordFinder): TtfwKeywordFinder;
     {* Реализация слова скрипта pop:KeywordFinder:ParentFinder }
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
 end;//TkwPopKeywordFinderParentFinder

// start class TkwPopKeywordFinderParentFinder

function TkwPopKeywordFinderParentFinder.ParentFinder(const aCtx: TtfwContext;
  aKeywordFinder: TtfwKeywordFinder): TtfwKeywordFinder;
//#UC START# *3D8B4028DC71_F60851FE16E3_var*
//#UC END# *3D8B4028DC71_F60851FE16E3_var*
begin
//#UC START# *3D8B4028DC71_F60851FE16E3_impl*
 Result := aKeywordFinder.ParentFinder;
//#UC END# *3D8B4028DC71_F60851FE16E3_impl*
end;//TkwPopKeywordFinderParentFinder.ParentFinder

procedure TkwPopKeywordFinderParentFinder.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aKeywordFinder : TtfwKeywordFinder;
begin
 try
  l_aKeywordFinder := TtfwKeywordFinder(aCtx.rEngine.PopObjAs(TtfwKeywordFinder));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aKeywordFinder: TtfwKeywordFinder : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((ParentFinder(aCtx, l_aKeywordFinder)));
end;//TkwPopKeywordFinderParentFinder.DoDoIt

class function TkwPopKeywordFinderParentFinder.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:KeywordFinder:ParentFinder';
end;//TkwPopKeywordFinderParentFinder.GetWordNameForRegister

procedure TkwPopKeywordFinderParentFinder.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
 {-}
begin
 RunnerError('Нельзя присваивать значение readonly свойству ParentFinder', aCtx);
end;//TkwPopKeywordFinderParentFinder.SetValue

function TkwPopKeywordFinderParentFinder.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwKeywordFinder);
end;//TkwPopKeywordFinderParentFinder.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_KeywordFinder_KeywordByName
 TkwPopKeywordFinderKeywordByName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_KeywordFinder_ParentFinder
 TkwPopKeywordFinderParentFinder.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwKeywordFinder
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwKeywordFinder));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwKeyWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwKeyWord));
{$IfEnd} //not NoScripts

end.