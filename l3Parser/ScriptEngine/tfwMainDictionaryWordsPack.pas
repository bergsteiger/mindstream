unit tfwMainDictionaryWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwMainDictionaryWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::tfwMainDictionaryWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwMainDictionary,
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
 TkwPopMainDictionaryCompiledCode = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:MainDictionary:CompiledCode
*Тип результата:* TtfwWord
*Пример:*
[code]
OBJECT VAR l_TtfwWord
 aMainDictionary pop:MainDictionary:CompiledCode >>> l_TtfwWord
[code]  }
 private
 // private methods
   function CompiledCode(const aCtx: TtfwContext;
    aMainDictionary: TtfwMainDictionary): TtfwWord;
     {* Реализация слова скрипта pop:MainDictionary:CompiledCode }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopMainDictionaryCompiledCode

// start class TkwPopMainDictionaryCompiledCode

function TkwPopMainDictionaryCompiledCode.CompiledCode(const aCtx: TtfwContext;
  aMainDictionary: TtfwMainDictionary): TtfwWord;
//#UC START# *E184DB3F75A6_FA2C6FCB48FD_var*
//#UC END# *E184DB3F75A6_FA2C6FCB48FD_var*
begin
//#UC START# *E184DB3F75A6_FA2C6FCB48FD_impl*
 Result := aMainDictionary.CompiledCode;
//#UC END# *E184DB3F75A6_FA2C6FCB48FD_impl*
end;//TkwPopMainDictionaryCompiledCode.CompiledCode

procedure TkwPopMainDictionaryCompiledCode.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aMainDictionary : TtfwMainDictionary;
begin
 try
  l_aMainDictionary := TtfwMainDictionary(aCtx.rEngine.PopObjAs(TtfwMainDictionary));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMainDictionary: TtfwMainDictionary : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((CompiledCode(aCtx, l_aMainDictionary)));
end;//TkwPopMainDictionaryCompiledCode.DoDoIt

class function TkwPopMainDictionaryCompiledCode.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:MainDictionary:CompiledCode';
end;//TkwPopMainDictionaryCompiledCode.GetWordNameForRegister

function TkwPopMainDictionaryCompiledCode.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopMainDictionaryCompiledCode.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_MainDictionary_CompiledCode
 TkwPopMainDictionaryCompiledCode.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwMainDictionary
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwMainDictionary));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts

end.