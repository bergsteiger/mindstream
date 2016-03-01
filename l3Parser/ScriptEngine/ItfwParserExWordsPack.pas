unit ItfwParserExWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "ItfwParserExWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::ItfwParserExWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwParserInterfaces,
  tfwClassLike,
  l3Parser
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
 TkwPopParserExPushString = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ParserEx:PushString
*Пример:*
[code]
 aString aParserEx pop:ParserEx:PushString
[code]  }
 private
 // private methods
   procedure PushString(const aCtx: TtfwContext;
    const aParserEx: ItfwParserEx;
    const aString: Il3CString);
     {* Реализация слова скрипта pop:ParserEx:PushString }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserExPushString

// start class TkwPopParserExPushString

procedure TkwPopParserExPushString.PushString(const aCtx: TtfwContext;
  const aParserEx: ItfwParserEx;
  const aString: Il3CString);
 {-}
begin
 aParserEx.PushString(aString);
end;//TkwPopParserExPushString.PushString

procedure TkwPopParserExPushString.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParserEx : ItfwParserEx;
 l_aString : Il3CString;
begin
 try
  l_aParserEx := ItfwParserEx(aCtx.rEngine.PopIntf(ItfwParserEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParserEx: ItfwParserEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PushString(aCtx, l_aParserEx, l_aString);
end;//TkwPopParserExPushString.DoDoIt

class function TkwPopParserExPushString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ParserEx:PushString';
end;//TkwPopParserExPushString.GetWordNameForRegister

function TkwPopParserExPushString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopParserExPushString.GetResultTypeInfo

type
 TkwPopParserExPushSymbol = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ParserEx:PushSymbol
*Пример:*
[code]
 aString aParserEx pop:ParserEx:PushSymbol
[code]  }
 private
 // private methods
   procedure PushSymbol(const aCtx: TtfwContext;
    const aParserEx: ItfwParserEx;
    const aString: Il3CString);
     {* Реализация слова скрипта pop:ParserEx:PushSymbol }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserExPushSymbol

// start class TkwPopParserExPushSymbol

procedure TkwPopParserExPushSymbol.PushSymbol(const aCtx: TtfwContext;
  const aParserEx: ItfwParserEx;
  const aString: Il3CString);
 {-}
begin
 aParserEx.PushSymbol(aString);
end;//TkwPopParserExPushSymbol.PushSymbol

procedure TkwPopParserExPushSymbol.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParserEx : ItfwParserEx;
 l_aString : Il3CString;
begin
 try
  l_aParserEx := ItfwParserEx(aCtx.rEngine.PopIntf(ItfwParserEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParserEx: ItfwParserEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PushSymbol(aCtx, l_aParserEx, l_aString);
end;//TkwPopParserExPushSymbol.DoDoIt

class function TkwPopParserExPushSymbol.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ParserEx:PushSymbol';
end;//TkwPopParserExPushSymbol.GetWordNameForRegister

function TkwPopParserExPushSymbol.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopParserExPushSymbol.GetResultTypeInfo

type
 TkwPopParserExPushInt = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ParserEx:PushInt
*Пример:*
[code]
 aValue aParserEx pop:ParserEx:PushInt
[code]  }
 private
 // private methods
   procedure PushInt(const aCtx: TtfwContext;
    const aParserEx: ItfwParserEx;
    aValue: Integer);
     {* Реализация слова скрипта pop:ParserEx:PushInt }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserExPushInt

// start class TkwPopParserExPushInt

procedure TkwPopParserExPushInt.PushInt(const aCtx: TtfwContext;
  const aParserEx: ItfwParserEx;
  aValue: Integer);
 {-}
begin
 aParserEx.PushInt(aValue);
end;//TkwPopParserExPushInt.PushInt

procedure TkwPopParserExPushInt.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParserEx : ItfwParserEx;
 l_aValue : Integer;
begin
 try
  l_aParserEx := ItfwParserEx(aCtx.rEngine.PopIntf(ItfwParserEx));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParserEx: ItfwParserEx : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PushInt(aCtx, l_aParserEx, l_aValue);
end;//TkwPopParserExPushInt.DoDoIt

class function TkwPopParserExPushInt.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ParserEx:PushInt';
end;//TkwPopParserExPushInt.GetWordNameForRegister

function TkwPopParserExPushInt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopParserExPushInt.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ParserEx_PushString
 TkwPopParserExPushString.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ParserEx_PushSymbol
 TkwPopParserExPushSymbol.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ParserEx_PushInt
 TkwPopParserExPushInt.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwParserEx
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwParserEx));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts

end.