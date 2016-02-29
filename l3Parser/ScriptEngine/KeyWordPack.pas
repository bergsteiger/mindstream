unit KeyWordPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "KeyWordPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Words RTTI::KeyWordPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwDictionary,
  tfwScriptingInterfaces,
  tfwClassLike
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwScriptEngineExInterfaces,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwPopKeyWordWord = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:KeyWord:Word
*Тип результата:* TtfwWord
*Пример:*
[code]
OBJECT VAR l_TtfwWord
 aKeyWord pop:KeyWord:Word >>> l_TtfwWord
[code]  }
 private
 // private methods
   function Word(const aCtx: TtfwContext;
    aKeyWord: TtfwKeyWord): TtfwWord;
     {* Реализация слова скрипта pop:KeyWord:Word }
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
 end;//TkwPopKeyWordWord

// start class TkwPopKeyWordWord

function TkwPopKeyWordWord.Word(const aCtx: TtfwContext;
  aKeyWord: TtfwKeyWord): TtfwWord;
 {-}
begin
 Result := aKeyWord.Word;
end;//TkwPopKeyWordWord.Word

procedure TkwPopKeyWordWord.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aKeyWord : TtfwKeyWord;
begin
 try
  l_aKeyWord := TtfwKeyWord(aCtx.rEngine.PopObjAs(TtfwKeyWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aKeyWord: TtfwKeyWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Word(aCtx, l_aKeyWord)));
end;//TkwPopKeyWordWord.DoDoIt

class function TkwPopKeyWordWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:KeyWord:Word';
end;//TkwPopKeyWordWord.GetWordNameForRegister

procedure TkwPopKeyWordWord.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
 {-}
begin
 RunnerError('Нельзя присваивать значение readonly свойству Word', aCtx);
end;//TkwPopKeyWordWord.SetValue

function TkwPopKeyWordWord.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPopKeyWordWord.GetResultTypeInfo

type
 TkwPopKeyWordName = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:KeyWord:Name
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aKeyWord pop:KeyWord:Name >>> l_Il3CString
[code]  }
 private
 // private methods
   function Name(const aCtx: TtfwContext;
    aKeyWord: TtfwKeyWord): Il3CString;
     {* Реализация слова скрипта pop:KeyWord:Name }
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
 end;//TkwPopKeyWordName

// start class TkwPopKeyWordName

function TkwPopKeyWordName.Name(const aCtx: TtfwContext;
  aKeyWord: TtfwKeyWord): Il3CString;
//#UC START# *23CD12DE8461_F4F627A63039_var*
//#UC END# *23CD12DE8461_F4F627A63039_var*
begin
//#UC START# *23CD12DE8461_F4F627A63039_impl*
 Result := aKeyWord.AsCStr;
//#UC END# *23CD12DE8461_F4F627A63039_impl*
end;//TkwPopKeyWordName.Name

procedure TkwPopKeyWordName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aKeyWord : TtfwKeyWord;
begin
 try
  l_aKeyWord := TtfwKeyWord(aCtx.rEngine.PopObjAs(TtfwKeyWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aKeyWord: TtfwKeyWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Name(aCtx, l_aKeyWord)));
end;//TkwPopKeyWordName.DoDoIt

class function TkwPopKeyWordName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:KeyWord:Name';
end;//TkwPopKeyWordName.GetWordNameForRegister

procedure TkwPopKeyWordName.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
 {-}
begin
 RunnerError('Нельзя присваивать значение readonly свойству Name', aCtx);
end;//TkwPopKeyWordName.SetValue

function TkwPopKeyWordName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwPopKeyWordName.GetResultTypeInfo

type
 TkwPopKeyWordDictionary = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:KeyWord:Dictionary
*Тип результата:* TtfwDictionary
*Пример:*
[code]
OBJECT VAR l_TtfwDictionary
 aKeyWord pop:KeyWord:Dictionary >>> l_TtfwDictionary
[code]  }
 private
 // private methods
   function Dictionary(const aCtx: TtfwContext;
    aKeyWord: TtfwKeyWord): TtfwDictionary;
     {* Реализация слова скрипта pop:KeyWord:Dictionary }
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
 end;//TkwPopKeyWordDictionary

// start class TkwPopKeyWordDictionary

function TkwPopKeyWordDictionary.Dictionary(const aCtx: TtfwContext;
  aKeyWord: TtfwKeyWord): TtfwDictionary;
//#UC START# *CF988D0FA0BC_668B733FDAFB_var*
//#UC END# *CF988D0FA0BC_668B733FDAFB_var*
begin
//#UC START# *CF988D0FA0BC_668B733FDAFB_impl*
 Result := aKeyWord.Dictionary As TtfwDictionary;
//#UC END# *CF988D0FA0BC_668B733FDAFB_impl*
end;//TkwPopKeyWordDictionary.Dictionary

procedure TkwPopKeyWordDictionary.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aKeyWord : TtfwKeyWord;
begin
 try
  l_aKeyWord := TtfwKeyWord(aCtx.rEngine.PopObjAs(TtfwKeyWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aKeyWord: TtfwKeyWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Dictionary(aCtx, l_aKeyWord)));
end;//TkwPopKeyWordDictionary.DoDoIt

class function TkwPopKeyWordDictionary.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:KeyWord:Dictionary';
end;//TkwPopKeyWordDictionary.GetWordNameForRegister

procedure TkwPopKeyWordDictionary.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
 {-}
begin
 RunnerError('Нельзя присваивать значение readonly свойству Dictionary', aCtx);
end;//TkwPopKeyWordDictionary.SetValue

function TkwPopKeyWordDictionary.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwDictionary);
end;//TkwPopKeyWordDictionary.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_KeyWord_Word
 TkwPopKeyWordWord.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_KeyWord_Name
 TkwPopKeyWordName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_KeyWord_Dictionary
 TkwPopKeyWordDictionary.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwKeyWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwKeyWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwDictionary
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwDictionary));
{$IfEnd} //not NoScripts

end.