unit ItfwParserWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "ItfwParserWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::ItfwParserWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Parser,
  tfwScriptingInterfaces,
  tfwParserInterfaces,
  tfwClassLike
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  ItfwKeywordFinderWordsPack,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopParserNextToken = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:Parser:NextToken
*Пример:*
[code]
 aParser pop:Parser:NextToken
[code]  }
 private
 // private methods
   procedure NextToken(const aCtx: TtfwContext;
    const aParser: ItfwParser);
     {* Реализация слова скрипта pop:Parser:NextToken }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserNextToken

// start class TkwPopParserNextToken

procedure TkwPopParserNextToken.NextToken(const aCtx: TtfwContext;
  const aParser: ItfwParser);
 {-}
begin
 aParser.NextToken;
end;//TkwPopParserNextToken.NextToken

procedure TkwPopParserNextToken.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParser : ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 NextToken(aCtx, l_aParser);
end;//TkwPopParserNextToken.DoDoIt

class function TkwPopParserNextToken.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Parser:NextToken';
end;//TkwPopParserNextToken.GetWordNameForRegister

function TkwPopParserNextToken.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopParserNextToken.GetResultTypeInfo

type
 TkwPopParserTokenLongString = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:Parser:TokenLongString
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aParser pop:Parser:TokenLongString >>> l_Il3CString
[code]  }
 private
 // private methods
   function TokenLongString(const aCtx: TtfwContext;
    const aParser: ItfwParser): Il3CString;
     {* Реализация слова скрипта pop:Parser:TokenLongString }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserTokenLongString

// start class TkwPopParserTokenLongString

function TkwPopParserTokenLongString.TokenLongString(const aCtx: TtfwContext;
  const aParser: ItfwParser): Il3CString;
 {-}
begin
 Result := aParser.TokenLongString;
end;//TkwPopParserTokenLongString.TokenLongString

procedure TkwPopParserTokenLongString.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParser : ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((TokenLongString(aCtx, l_aParser)));
end;//TkwPopParserTokenLongString.DoDoIt

class function TkwPopParserTokenLongString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Parser:TokenLongString';
end;//TkwPopParserTokenLongString.GetWordNameForRegister

function TkwPopParserTokenLongString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwPopParserTokenLongString.GetResultTypeInfo

type
 TkwPopParserTokenInt = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:Parser:TokenInt
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aParser pop:Parser:TokenInt >>> l_Integer
[code]  }
 private
 // private methods
   function TokenInt(const aCtx: TtfwContext;
    const aParser: ItfwParser): Integer;
     {* Реализация слова скрипта pop:Parser:TokenInt }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserTokenInt

// start class TkwPopParserTokenInt

function TkwPopParserTokenInt.TokenInt(const aCtx: TtfwContext;
  const aParser: ItfwParser): Integer;
 {-}
begin
 Result := aParser.TokenInt;
end;//TkwPopParserTokenInt.TokenInt

procedure TkwPopParserTokenInt.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParser : ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((TokenInt(aCtx, l_aParser)));
end;//TkwPopParserTokenInt.DoDoIt

class function TkwPopParserTokenInt.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Parser:TokenInt';
end;//TkwPopParserTokenInt.GetWordNameForRegister

function TkwPopParserTokenInt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopParserTokenInt.GetResultTypeInfo

type
 TkwPopParserFileName = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:Parser:FileName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aParser pop:Parser:FileName >>> l_String
[code]  }
 private
 // private methods
   function FileName(const aCtx: TtfwContext;
    const aParser: ItfwParser): AnsiString;
     {* Реализация слова скрипта pop:Parser:FileName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserFileName

// start class TkwPopParserFileName

function TkwPopParserFileName.FileName(const aCtx: TtfwContext;
  const aParser: ItfwParser): AnsiString;
 {-}
begin
 Result := aParser.FileName;
end;//TkwPopParserFileName.FileName

procedure TkwPopParserFileName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParser : ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((FileName(aCtx, l_aParser)));
end;//TkwPopParserFileName.DoDoIt

class function TkwPopParserFileName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Parser:FileName';
end;//TkwPopParserFileName.GetWordNameForRegister

function TkwPopParserFileName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopParserFileName.GetResultTypeInfo

type
 TkwPopParserTokenType = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:Parser:TokenType
*Тип результата:* Tl3TokenType
*Пример:*
[code]
Tl3TokenType VAR l_Tl3TokenType
 aParser pop:Parser:TokenType >>> l_Tl3TokenType
[code]  }
 private
 // private methods
   function TokenType(const aCtx: TtfwContext;
    const aParser: ItfwParser): Tl3TokenType;
     {* Реализация слова скрипта pop:Parser:TokenType }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserTokenType

// start class TkwPopParserTokenType

function TkwPopParserTokenType.TokenType(const aCtx: TtfwContext;
  const aParser: ItfwParser): Tl3TokenType;
 {-}
begin
 Result := aParser.TokenType;
end;//TkwPopParserTokenType.TokenType

procedure TkwPopParserTokenType.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParser : ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt(Ord(TokenType(aCtx, l_aParser)));
end;//TkwPopParserTokenType.DoDoIt

class function TkwPopParserTokenType.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Parser:TokenType';
end;//TkwPopParserTokenType.GetWordNameForRegister

function TkwPopParserTokenType.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Tl3TokenType);
end;//TkwPopParserTokenType.GetResultTypeInfo

type
 TkwPopParserSourceLine = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:Parser:SourceLine
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aParser pop:Parser:SourceLine >>> l_Integer
[code]  }
 private
 // private methods
   function SourceLine(const aCtx: TtfwContext;
    const aParser: ItfwParser): Integer;
     {* Реализация слова скрипта pop:Parser:SourceLine }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopParserSourceLine

// start class TkwPopParserSourceLine

function TkwPopParserSourceLine.SourceLine(const aCtx: TtfwContext;
  const aParser: ItfwParser): Integer;
 {-}
begin
 Result := aParser.SourceLine;
end;//TkwPopParserSourceLine.SourceLine

procedure TkwPopParserSourceLine.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aParser : ItfwParser;
begin
 try
  l_aParser := ItfwParser(aCtx.rEngine.PopIntf(ItfwParser));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aParser: ItfwParser : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((SourceLine(aCtx, l_aParser)));
end;//TkwPopParserSourceLine.DoDoIt

class function TkwPopParserSourceLine.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Parser:SourceLine';
end;//TkwPopParserSourceLine.GetWordNameForRegister

function TkwPopParserSourceLine.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopParserSourceLine.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_Parser_NextToken
 TkwPopParserNextToken.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Parser_TokenLongString
 TkwPopParserTokenLongString.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Parser_TokenInt
 TkwPopParserTokenInt.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Parser_FileName
 TkwPopParserFileName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Parser_TokenType
 TkwPopParserTokenType.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Parser_SourceLine
 TkwPopParserSourceLine.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwParser
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwParser));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Tl3TokenType
 TtfwTypeRegistrator.RegisterType(TypeInfo(Tl3TokenType));
{$IfEnd} //not NoScripts

end.