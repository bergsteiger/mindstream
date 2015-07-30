unit WordsRTTIPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "WordsRTTIPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Words RTTI::WordsRTTIPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  seWordsInfo,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopWordGetLeftWordRefValue = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:GetLeftWordRefValue
*Тип результата:* TtfwWord
*Пример:*
[code]
 anIndex aWord pop:Word:GetLeftWordRefValue
[code]  }
 private
 // private methods
   function GetLeftWordRefValue(const aCtx: TtfwContext;
    aWord: TtfwWord;
    anIndex: Integer): TtfwWord;
     {* Реализация слова скрипта pop:Word:GetLeftWordRefValue }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordGetLeftWordRefValue

// start class TkwPopWordGetLeftWordRefValue

function TkwPopWordGetLeftWordRefValue.GetLeftWordRefValue(const aCtx: TtfwContext;
  aWord: TtfwWord;
  anIndex: Integer): TtfwWord;
//#UC START# *77728EE03A69_082046A8DE7B_var*
//#UC END# *77728EE03A69_082046A8DE7B_var*
begin
//#UC START# *77728EE03A69_082046A8DE7B_impl*
 Result := aWord.GetLeftWordRefValue(aCtx, anIndex);
//#UC END# *77728EE03A69_082046A8DE7B_impl*
end;//TkwPopWordGetLeftWordRefValue.GetLeftWordRefValue

procedure TkwPopWordGetLeftWordRefValue.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_anIndex : Integer;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetLeftWordRefValue(aCtx, l_aWord, l_anIndex)));
end;//TkwPopWordGetLeftWordRefValue.DoDoIt

class function TkwPopWordGetLeftWordRefValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:GetLeftWordRefValue';
end;//TkwPopWordGetLeftWordRefValue.GetWordNameForRegister

function TkwPopWordGetLeftWordRefValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopWordGetLeftWordRefValue.GetResultTypeInfo

type
 TkwPopWordGetParam = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:GetParam
*Тип результата:* TtfwWord
*Пример:*
[code]
 anIndex aWord pop:Word:GetParam
[code]  }
 private
 // private methods
   function GetParam(const aCtx: TtfwContext;
    aWord: TtfwWord;
    anIndex: Integer): TtfwWord;
     {* Реализация слова скрипта pop:Word:GetParam }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordGetParam

// start class TkwPopWordGetParam

function TkwPopWordGetParam.GetParam(const aCtx: TtfwContext;
  aWord: TtfwWord;
  anIndex: Integer): TtfwWord;
//#UC START# *0E50B5B72F85_18E1A6E1AA33_var*
//#UC END# *0E50B5B72F85_18E1A6E1AA33_var*
begin
//#UC START# *0E50B5B72F85_18E1A6E1AA33_impl*
 Result := aWord.GetInParam(aCtx, anIndex);
//#UC END# *0E50B5B72F85_18E1A6E1AA33_impl*
end;//TkwPopWordGetParam.GetParam

procedure TkwPopWordGetParam.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_anIndex : Integer;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := (aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((GetParam(aCtx, l_aWord, l_anIndex)));
end;//TkwPopWordGetParam.DoDoIt

class function TkwPopWordGetParam.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:GetParam';
end;//TkwPopWordGetParam.GetWordNameForRegister

function TkwPopWordGetParam.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopWordGetParam.GetResultTypeInfo

type
 TkwPopWordPublicateInMainDictionary = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:PublicateInMainDictionary
[panel]Публикует вложенное слово в основном словаре. Если такое слово там уже есть, то создаётся переопределение (Redifinition)[panel]
*Пример:*
[code]
 aWord pop:Word:PublicateInMainDictionary
[code]  }
 private
 // private methods
   procedure PublicateInMainDictionary(const aCtx: TtfwContext;
    aWord: TtfwWord);
     {* Реализация слова скрипта pop:Word:PublicateInMainDictionary }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordPublicateInMainDictionary

// start class TkwPopWordPublicateInMainDictionary

procedure TkwPopWordPublicateInMainDictionary.PublicateInMainDictionary(const aCtx: TtfwContext;
  aWord: TtfwWord);
//#UC START# *9AE555BD5A21_F598008DBB04_var*
var
 l_KW : TtfwKeyword;
 l_Key : TtfwKeyWord;
 l_PrevWord : TtfwWord;
 l_PrevWordKW : TtfwKeyWord;
//#UC END# *9AE555BD5A21_F598008DBB04_var*
begin
//#UC START# *9AE555BD5A21_F598008DBB04_impl*
 l_Key := TtfwKeyWord(aWord.Key);
 l_KW := aCtx.rEngine.As_ItfwNewWordDefinitor.CheckWord(l_Key.AsCStr);
 Assert(aWord <> l_KW.Word);
 try
  l_PrevWord := l_KW.Word;
  if (l_PrevWord <> nil) then
   l_PrevWordKW := TtfwKeyWord(l_PrevWord.Key)
  else
   l_PrevWordKW := nil;
  aWord.Redefines := l_PrevWord;
  // - говорим, что слово (наверное) имеет переопределение
  l_KW.Word := aWord;
  // - регистрируем алиас слова в словаре
  if (l_PrevWord <> nil) then
   l_PrevWord.Key := l_PrevWordKW;
 finally
  aWord.Key := l_Key;
  // - восстанавливаем слову предыдущее значение ключа
 end;//try..finally
//#UC END# *9AE555BD5A21_F598008DBB04_impl*
end;//TkwPopWordPublicateInMainDictionary.PublicateInMainDictionary

procedure TkwPopWordPublicateInMainDictionary.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 PublicateInMainDictionary(aCtx, l_aWord);
end;//TkwPopWordPublicateInMainDictionary.DoDoIt

class function TkwPopWordPublicateInMainDictionary.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:PublicateInMainDictionary';
end;//TkwPopWordPublicateInMainDictionary.GetWordNameForRegister

function TkwPopWordPublicateInMainDictionary.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPopWordPublicateInMainDictionary.GetResultTypeInfo

type
 TkwPopWordDirectives = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:Directives
*Тип результата:* Il3CString
*Пример:*
[code]
 aWord pop:Word:Directives
[code]  }
 private
 // private methods
   function Directives(const aCtx: TtfwContext;
    aWord: TtfwWord): Il3CString;
     {* Реализация слова скрипта pop:Word:Directives }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordDirectives

// start class TkwPopWordDirectives

function TkwPopWordDirectives.Directives(const aCtx: TtfwContext;
  aWord: TtfwWord): Il3CString;
//#UC START# *FB7C52FA2B52_3D48CC7059CD_var*
//#UC END# *FB7C52FA2B52_3D48CC7059CD_var*
begin
//#UC START# *FB7C52FA2B52_3D48CC7059CD_impl*
 Result := GetWordDirectives(aCtx, aWord);
//#UC END# *FB7C52FA2B52_3D48CC7059CD_impl*
end;//TkwPopWordDirectives.Directives

procedure TkwPopWordDirectives.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Directives(aCtx, l_aWord)));
end;//TkwPopWordDirectives.DoDoIt

class function TkwPopWordDirectives.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:Directives';
end;//TkwPopWordDirectives.GetWordNameForRegister

function TkwPopWordDirectives.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwPopWordDirectives.GetResultTypeInfo

type
 TkwPopWordEndBracket = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:EndBracket
*Тип результата:* String
*Пример:*
[code]
 aWord pop:Word:EndBracket
[code]  }
 private
 // private methods
   function EndBracket(const aCtx: TtfwContext;
    aWord: TtfwWord): AnsiString;
     {* Реализация слова скрипта pop:Word:EndBracket }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordEndBracket

// start class TkwPopWordEndBracket

function TkwPopWordEndBracket.EndBracket(const aCtx: TtfwContext;
  aWord: TtfwWord): AnsiString;
//#UC START# *A2984E82225C_035A954E5F92_var*
var
 l_B : RtfwWord;
//#UC END# *A2984E82225C_035A954E5F92_var*
begin
//#UC START# *A2984E82225C_035A954E5F92_impl*
 try
  if (aWord = nil) then
   l_B := nil
  else
   l_B := aWord.GetEndBracket(aCtx, true);
 except
  l_B := nil;
 end;//try..except
 if (l_B = nil) then
  Result := ''
 else
  Result := aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(l_B.NameForRegister)].AsString;
//#UC END# *A2984E82225C_035A954E5F92_impl*
end;//TkwPopWordEndBracket.EndBracket

procedure TkwPopWordEndBracket.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((EndBracket(aCtx, l_aWord)));
end;//TkwPopWordEndBracket.DoDoIt

class function TkwPopWordEndBracket.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:EndBracket';
end;//TkwPopWordEndBracket.GetWordNameForRegister

function TkwPopWordEndBracket.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopWordEndBracket.GetResultTypeInfo

type
 TkwPopWordLeftWordRefValuesCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:LeftWordRefValuesCount
*Тип результата:* Integer
*Пример:*
[code]
 aWord pop:Word:LeftWordRefValuesCount
[code]  }
 private
 // private methods
   function LeftWordRefValuesCount(const aCtx: TtfwContext;
    aWord: TtfwWord): Integer;
     {* Реализация слова скрипта pop:Word:LeftWordRefValuesCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordLeftWordRefValuesCount

// start class TkwPopWordLeftWordRefValuesCount

function TkwPopWordLeftWordRefValuesCount.LeftWordRefValuesCount(const aCtx: TtfwContext;
  aWord: TtfwWord): Integer;
//#UC START# *506A313D6D93_699E423B4C87_var*
//#UC END# *506A313D6D93_699E423B4C87_var*
begin
//#UC START# *506A313D6D93_699E423B4C87_impl*
 Result := aWord.LeftWordRefValuesCount(aCtx);
//#UC END# *506A313D6D93_699E423B4C87_impl*
end;//TkwPopWordLeftWordRefValuesCount.LeftWordRefValuesCount

procedure TkwPopWordLeftWordRefValuesCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((LeftWordRefValuesCount(aCtx, l_aWord)));
end;//TkwPopWordLeftWordRefValuesCount.DoDoIt

class function TkwPopWordLeftWordRefValuesCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:LeftWordRefValuesCount';
end;//TkwPopWordLeftWordRefValuesCount.GetWordNameForRegister

function TkwPopWordLeftWordRefValuesCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopWordLeftWordRefValuesCount.GetResultTypeInfo

type
 TkwPopWordName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:Name
*Тип результата:* Il3CString
*Пример:*
[code]
 aWord pop:Word:Name
[code]  }
 private
 // private methods
   function Name(const aCtx: TtfwContext;
    aWord: TtfwWord): Il3CString;
     {* Реализация слова скрипта pop:Word:Name }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordName

// start class TkwPopWordName

function TkwPopWordName.Name(const aCtx: TtfwContext;
  aWord: TtfwWord): Il3CString;
//#UC START# *88F83475097B_F6AEFC7115C2_var*
//#UC END# *88F83475097B_F6AEFC7115C2_var*
begin
//#UC START# *88F83475097B_F6AEFC7115C2_impl*
 if (aWord = nil) then
  Result := TtfwCStringFactory.C('??? Unexisting word ???')
 else
 if (aWord.Key = nil) then
  Result := TtfwCStringFactory.C('??? Unexisting word ??? ' + aWord.ClassName)
 else
  Result := aWord.Key.AsCStr;
//#UC END# *88F83475097B_F6AEFC7115C2_impl*
end;//TkwPopWordName.Name

procedure TkwPopWordName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Name(aCtx, l_aWord)));
end;//TkwPopWordName.DoDoIt

class function TkwPopWordName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:Name';
end;//TkwPopWordName.GetWordNameForRegister

function TkwPopWordName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwPopWordName.GetResultTypeInfo

type
 TkwPopWordParent = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:Parent
*Тип результата:* TtfwWord
*Пример:*
[code]
 aWord pop:Word:Parent
[code]  }
 private
 // private methods
   function Parent(const aCtx: TtfwContext;
    aWord: TtfwWord): TtfwWord;
     {* Реализация слова скрипта pop:Word:Parent }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordParent

// start class TkwPopWordParent

function TkwPopWordParent.Parent(const aCtx: TtfwContext;
  aWord: TtfwWord): TtfwWord;
//#UC START# *D6565DAC49E7_5AA39503403C_var*
//#UC END# *D6565DAC49E7_5AA39503403C_var*
begin
//#UC START# *D6565DAC49E7_5AA39503403C_impl*
 Result := aWord.ParentWord;
//#UC END# *D6565DAC49E7_5AA39503403C_impl*
end;//TkwPopWordParent.Parent

procedure TkwPopWordParent.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Parent(aCtx, l_aWord)));
end;//TkwPopWordParent.DoDoIt

class function TkwPopWordParent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:Parent';
end;//TkwPopWordParent.GetWordNameForRegister

function TkwPopWordParent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopWordParent.GetResultTypeInfo

type
 TkwPopWordProducer = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Word:Producer
*Тип результата:* TtfwWord
*Пример:*
[code]
 aWord pop:Word:Producer
[code]  }
 private
 // private methods
   function Producer(const aCtx: TtfwContext;
    aWord: TtfwWord): TtfwWord;
     {* Реализация слова скрипта pop:Word:Producer }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopWordProducer

// start class TkwPopWordProducer

function TkwPopWordProducer.Producer(const aCtx: TtfwContext;
  aWord: TtfwWord): TtfwWord;
//#UC START# *8C360D05017B_2979371FE619_var*
//#UC END# *8C360D05017B_2979371FE619_var*
begin
//#UC START# *8C360D05017B_2979371FE619_impl*
 Result := aWord.WordProducer;
//#UC END# *8C360D05017B_2979371FE619_impl*
end;//TkwPopWordProducer.Producer

procedure TkwPopWordProducer.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
begin
 try
  l_aWord := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aWord: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Producer(aCtx, l_aWord)));
end;//TkwPopWordProducer.DoDoIt

class function TkwPopWordProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Word:Producer';
end;//TkwPopWordProducer.GetWordNameForRegister

function TkwPopWordProducer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopWordProducer.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_Word_GetLeftWordRefValue
 TkwPopWordGetLeftWordRefValue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_GetParam
 TkwPopWordGetParam.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_PublicateInMainDictionary
 TkwPopWordPublicateInMainDictionary.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_Directives
 TkwPopWordDirectives.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_EndBracket
 TkwPopWordEndBracket.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_LeftWordRefValuesCount
 TkwPopWordLeftWordRefValuesCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_Name
 TkwPopWordName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_Parent
 TkwPopWordParent.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Word_Producer
 TkwPopWordProducer.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts

end.