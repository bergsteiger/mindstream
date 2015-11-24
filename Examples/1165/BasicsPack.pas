unit BasicsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "BasicsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Basics::BasicsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  tfwConstLike,
  tfwParserInterfaces,
  tfwRegisterableWord,
  tfwWordWorkerEx,
  tfwAxiomaticsResNameGetter,
  tfwTypeInfo
  ;

type
 TkwCompiledPushWord = class(TkwCompiledWordWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function GetRef(const aCtx: TtfwContext): TtfwWord; override;
   function WordName: Il3CString; override;
 end;//TkwCompiledPushWord
function CompareValues(const aV1: TtfwStackValue;
  const aV2: TtfwStackValue;
  const aCtx: TtfwContext;
  aCaller: TtfwWord): Boolean;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Chars,
  kwCompiledWordPrim,
  Windows,
  l3MessagesService,
  tfwClassRef,
  Classes,
  l3Math,
  l3Base,
  kwInteger,
  kwString,
  kwValue,
  kwWordPtrPushWord,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwDefine = {final scriptword} class(TtfwConstLike)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Integer; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
 public
 // overridden public methods
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
 end;//TkwDefine

// start class TkwDefine

class function TkwDefine.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Define';
end;//TkwDefine.GetWordNameForRegister

function TkwDefine.IsImmediate(const aCtx: TtfwContext): Boolean;
//#UC START# *4DB6D7F70155_55880B6D01A0_var*
//#UC END# *4DB6D7F70155_55880B6D01A0_var*
begin
//#UC START# *4DB6D7F70155_55880B6D01A0_impl*
 Result := false; 
//#UC END# *4DB6D7F70155_55880B6D01A0_impl*
end;//TkwDefine.IsImmediate

function TkwDefine.AfterWordMaxCount(const aCtx: TtfwContext): Integer;
//#UC START# *4DB9B446039A_55880B6D01A0_var*
//#UC END# *4DB9B446039A_55880B6D01A0_var*
begin
//#UC START# *4DB9B446039A_55880B6D01A0_impl*
 Result := 0;
//#UC END# *4DB9B446039A_55880B6D01A0_impl*
end;//TkwDefine.AfterWordMaxCount

procedure TkwDefine.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_55880B6D01A0_var*
var
 l_W : TtfwWord;
 l_Key : TtfwKeyWord;
//#UC END# *4F219629036A_55880B6D01A0_var*
begin
//#UC START# *4F219629036A_55880B6D01A0_impl*
 l_W := aContext.rEngine.PopObj As TtfwWord;
 l_Key := TtfwKeyWord(l_W.Key);
 try
  aWordToFinish.SetWord(aContext, l_W);
 finally
  l_W.Key := l_Key;
 end;//try..finally
//#UC END# *4F219629036A_55880B6D01A0_impl*
end;//TkwDefine.FinishDefinitionOfNewWord

function TkwDefine.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_55880B6D01A0_var*
//#UC END# *4F37B3F10318_55880B6D01A0_var*
begin
//#UC START# *4F37B3F10318_55880B6D01A0_impl*
 Result := aContext.rEngine.PopString;
//#UC END# *4F37B3F10318_55880B6D01A0_impl*
end;//TkwDefine.GetNewWordName

type
//#UC START# *94E4F896CE56ci*
//#UC END# *94E4F896CE56ci*
 TBasicsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *94E4F896CE56publ*
//#UC END# *94E4F896CE56publ*
 end;//TBasicsPackResNameGetter

// start class TBasicsPackResNameGetter

class function TBasicsPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'BasicsPack';
end;//TBasicsPackResNameGetter.ResName

 {$R BasicsPack.res}

type
 TkwTrue = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта true
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 true >>> l_Boolean
[code]  }
 private
 // private methods
   function True(const aCtx: TtfwContext): Boolean;
     {* Реализация слова скрипта true }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTrue

// start class TkwTrue

function TkwTrue.True(const aCtx: TtfwContext): Boolean;
//#UC START# *31D2EDD18C66_384521AFEDE4_var*
//#UC END# *31D2EDD18C66_384521AFEDE4_var*
begin
//#UC START# *31D2EDD18C66_384521AFEDE4_impl*
 Result := System.true;
//#UC END# *31D2EDD18C66_384521AFEDE4_impl*
end;//TkwTrue.True

procedure TkwTrue.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushBool((True(aCtx)));
end;//TkwTrue.DoDoIt

class function TkwTrue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'true';
end;//TkwTrue.GetWordNameForRegister

function TkwTrue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwTrue.GetResultTypeInfo

type
 TkwFalse = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта false
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 false >>> l_Boolean
[code]  }
 private
 // private methods
   function False(const aCtx: TtfwContext): Boolean;
     {* Реализация слова скрипта false }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwFalse

// start class TkwFalse

function TkwFalse.False(const aCtx: TtfwContext): Boolean;
//#UC START# *CEB83FCC48B0_A3E68B91DEB2_var*
//#UC END# *CEB83FCC48B0_A3E68B91DEB2_var*
begin
//#UC START# *CEB83FCC48B0_A3E68B91DEB2_impl*
 Result := System.false;
//#UC END# *CEB83FCC48B0_A3E68B91DEB2_impl*
end;//TkwFalse.False

procedure TkwFalse.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushBool((False(aCtx)));
end;//TkwFalse.DoDoIt

class function TkwFalse.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'false';
end;//TkwFalse.GetWordNameForRegister

function TkwFalse.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwFalse.GetResultTypeInfo

type
 TkwMsg = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Msg
*Пример:*
[code]
 aValue Msg
[code]  }
 private
 // private methods
   procedure Msg(const aCtx: TtfwContext;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта Msg }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMsg

// start class TkwMsg

procedure TkwMsg.Msg(const aCtx: TtfwContext;
  const aValue: TtfwStackValue);
//#UC START# *420EA6C5993D_8BA2A290A172_var*
var
 l_S : AnsiString;
//#UC END# *420EA6C5993D_8BA2A290A172_var*
begin
//#UC START# *420EA6C5993D_8BA2A290A172_impl*
 l_S := l3Str(aValue.AsPrintable);
 MessageBoxA(0, PAnsiChar(l_S), 'script message', MB_OK);
//#UC END# *420EA6C5993D_8BA2A290A172_impl*
end;//TkwMsg.Msg

procedure TkwMsg.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : TtfwStackValue;
begin
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Msg(aCtx, l_aValue);
end;//TkwMsg.DoDoIt

class function TkwMsg.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Msg';
end;//TkwMsg.GetWordNameForRegister

function TkwMsg.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwMsg.GetResultTypeInfo

type
 TkwPrint = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта .
*Пример:*
[code]
 aValue .
[code]  }
 private
 // private methods
   procedure Print(const aCtx: TtfwContext;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта . }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPrint

// start class TkwPrint

procedure TkwPrint.Print(const aCtx: TtfwContext;
  const aValue: TtfwStackValue);
//#UC START# *5053122C683A_9AAA1AEFBAE6_var*
//#UC END# *5053122C683A_9AAA1AEFBAE6_var*
begin
//#UC START# *5053122C683A_9AAA1AEFBAE6_impl*
 aCtx.rCaller.Print(aValue.AsPrintable);
//#UC END# *5053122C683A_9AAA1AEFBAE6_impl*
end;//TkwPrint.Print

procedure TkwPrint.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : TtfwStackValue;
begin
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Print(aCtx, l_aValue);
end;//TkwPrint.DoDoIt

class function TkwPrint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '.';
end;//TkwPrint.GetWordNameForRegister

function TkwPrint.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPrint.GetResultTypeInfo

type
 TkwLOOP = {final scriptword} class(TtfwWordWorkerEx)
  {* Слово скрипта LOOP
[panel]Цикл LOOP.
Пример:
[code]
 10 LOOP ( 'Hello' . )
[code][panel]
*Пример:*
[code]
 aCount LOOP aWord
[code]  }
 private
 // private methods
   procedure LOOP(const aCtx: TtfwContext;
    aWord: TtfwWord;
    aCount: Integer);
     {* Реализация слова скрипта LOOP }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwLOOP

// start class TkwLOOP

procedure TkwLOOP.LOOP(const aCtx: TtfwContext;
  aWord: TtfwWord;
  aCount: Integer);
//#UC START# *02D71503A219_A183EE1D2A6D_var*
var
 l_I : Integer;
//#UC END# *02D71503A219_A183EE1D2A6D_var*
begin
//#UC START# *02D71503A219_A183EE1D2A6D_impl*
 for l_I := 0 to Pred(aCount) do
  try
   aWord.DoIt(aCtx);
  except
   on EtfwBreak do
    break;
   on EtfwContinue do
    continue;
  end;//try..except
//#UC END# *02D71503A219_A183EE1D2A6D_impl*
end;//TkwLOOP.LOOP

class function TkwLOOP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'LOOP';
end;//TkwLOOP.GetWordNameForRegister

procedure TkwLOOP.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_aCount : Integer;
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
  l_aCount := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCount: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 LOOP(aCtx, l_aWord, l_aCount);
end;//TkwLOOP.DoRun

function TkwLOOP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwLOOP.GetResultTypeInfo

type
 TkwWHILEDO = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта WHILEDO
[panel]Цикл While. Повторяется пока выполняется некоторое условие.
Пример:
[code] 10 @ ( ?DUP !=0 ) @ ( DUP . -- ) WHILEDO [code]
Но ЛУЧШЕ пользоваться паскалеподобной конструкцией - WHILE[panel]
*Пример:*
[code]
 aCondition aWord WHILEDO
[code]  }
 private
 // private methods
   procedure WHILEDO(const aCtx: TtfwContext;
    aWord: TtfwWord;
    aCondition: TtfwWord);
     {* Реализация слова скрипта WHILEDO }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWHILEDO

// start class TkwWHILEDO

procedure TkwWHILEDO.WHILEDO(const aCtx: TtfwContext;
  aWord: TtfwWord;
  aCondition: TtfwWord);
//#UC START# *998553D17C4B_B8595935D002_var*
//#UC END# *998553D17C4B_B8595935D002_var*
begin
//#UC START# *998553D17C4B_B8595935D002_impl*
 while true do
 begin
  aCondition.DoIt(aCtx);
  if not aCtx.rEngine.PopBool then
   break;
  try
   aWord.DoIt(aCtx);
  except
   on EtfwBreak do
    break;
   on EtfwContinue do
    continue;
  end;//try..except
 end;//while true
//#UC END# *998553D17C4B_B8595935D002_impl*
end;//TkwWHILEDO.WHILEDO

procedure TkwWHILEDO.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_aCondition : TtfwWord;
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
  l_aCondition := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCondition: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WHILEDO(aCtx, l_aWord, l_aCondition);
end;//TkwWHILEDO.DoDoIt

class function TkwWHILEDO.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WHILEDO';
end;//TkwWHILEDO.GetWordNameForRegister

function TkwWHILEDO.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwWHILEDO.GetResultTypeInfo

type
 TkwBREAK = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта BREAK
[panel]Выход из цикла[panel]
*Пример:*
[code]
 BREAK
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBREAK

// start class TkwBREAK

procedure TkwBREAK.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_9FA400CD8713_var*
//#UC END# *4DAEEDE10285_9FA400CD8713_var*
begin
//#UC START# *4DAEEDE10285_9FA400CD8713_impl*
 raise EtfwBreak.Create('Выход из цикла');
//#UC END# *4DAEEDE10285_9FA400CD8713_impl*
end;//TkwBREAK.DoDoIt

class function TkwBREAK.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BREAK';
end;//TkwBREAK.GetWordNameForRegister

function TkwBREAK.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwBREAK.GetResultTypeInfo

type
 TkwCONTINUE = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CONTINUE
[panel]Переход к началу цикла[panel]
*Пример:*
[code]
 CONTINUE
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCONTINUE

// start class TkwCONTINUE

procedure TkwCONTINUE.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_816E4F5C3613_var*
//#UC END# *4DAEEDE10285_816E4F5C3613_var*
begin
//#UC START# *4DAEEDE10285_816E4F5C3613_impl*
 raise EtfwContinue.Create('Выход на начало цикла');
//#UC END# *4DAEEDE10285_816E4F5C3613_impl*
end;//TkwCONTINUE.DoDoIt

class function TkwCONTINUE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CONTINUE';
end;//TkwCONTINUE.GetWordNameForRegister

function TkwCONTINUE.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCONTINUE.GetResultTypeInfo

type
 TkwEXIT = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта EXIT
[panel]Выход из процедуры[panel]
*Пример:*
[code]
 EXIT
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwEXIT

// start class TkwEXIT

procedure TkwEXIT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_1A0EA325C2BC_var*
//#UC END# *4DAEEDE10285_1A0EA325C2BC_var*
begin
//#UC START# *4DAEEDE10285_1A0EA325C2BC_impl*
 raise EtfwExit.Create('Выход из процедуры');
//#UC END# *4DAEEDE10285_1A0EA325C2BC_impl*
end;//TkwEXIT.DoDoIt

class function TkwEXIT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EXIT';
end;//TkwEXIT.GetWordNameForRegister

function TkwEXIT.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwEXIT.GetResultTypeInfo

type
 TkwHALT = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта HALT
[panel]Прервать выполяемый скрипт[panel]
*Пример:*
[code]
 HALT
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwHALT

// start class TkwHALT

procedure TkwHALT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_F7BD1ACB2D33_var*
//#UC END# *4DAEEDE10285_F7BD1ACB2D33_var*
begin
//#UC START# *4DAEEDE10285_F7BD1ACB2D33_impl*
 raise EtfwHalt.Create('Выход из скрипта');
//#UC END# *4DAEEDE10285_F7BD1ACB2D33_impl*
end;//TkwHALT.DoDoIt

class function TkwHALT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'HALT';
end;//TkwHALT.GetWordNameForRegister

function TkwHALT.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwHALT.GetResultTypeInfo

type
 TkwBREAKITERATOR = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта BREAK-ITERATOR
*Пример:*
[code]
 BREAK-ITERATOR
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBREAKITERATOR

// start class TkwBREAKITERATOR

procedure TkwBREAKITERATOR.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4A2D97BCAC0E_var*
//#UC END# *4DAEEDE10285_4A2D97BCAC0E_var*
begin
//#UC START# *4DAEEDE10285_4A2D97BCAC0E_impl*
 raise EtfwBreakIterator.Create('Выход из итератора');
//#UC END# *4DAEEDE10285_4A2D97BCAC0E_impl*
end;//TkwBREAKITERATOR.DoDoIt

class function TkwBREAKITERATOR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BREAK-ITERATOR';
end;//TkwBREAKITERATOR.GetWordNameForRegister

function TkwBREAKITERATOR.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwBREAKITERATOR.GetResultTypeInfo

type
 TkwNOP = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта NOP
*Пример:*
[code]
 NOP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNOP

// start class TkwNOP

procedure TkwNOP.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_143C5B139D7D_var*
//#UC END# *4DAEEDE10285_143C5B139D7D_var*
begin
//#UC START# *4DAEEDE10285_143C5B139D7D_impl*
 // - осознанно ничего не делаем
//#UC END# *4DAEEDE10285_143C5B139D7D_impl*
end;//TkwNOP.DoDoIt

class function TkwNOP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NOP';
end;//TkwNOP.GetWordNameForRegister

function TkwNOP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwNOP.GetResultTypeInfo

type
 TkwSLEEP = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SLEEP
*Пример:*
[code]
 aDuration SLEEP
[code]  }
 private
 // private methods
   procedure SLEEP(const aCtx: TtfwContext;
    aDuration: Integer);
     {* Реализация слова скрипта SLEEP }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSLEEP

// start class TkwSLEEP

procedure TkwSLEEP.SLEEP(const aCtx: TtfwContext;
  aDuration: Integer);
//#UC START# *4DB1E11DA389_837DF133349F_var*
//#UC END# *4DB1E11DA389_837DF133349F_var*
begin
//#UC START# *4DB1E11DA389_837DF133349F_impl*
 SysUtils.Sleep(aDuration);
//#UC END# *4DB1E11DA389_837DF133349F_impl*
end;//TkwSLEEP.SLEEP

procedure TkwSLEEP.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDuration : Integer;
begin
 try
  l_aDuration := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDuration: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SLEEP(aCtx, l_aDuration);
end;//TkwSLEEP.DoDoIt

class function TkwSLEEP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SLEEP';
end;//TkwSLEEP.GetWordNameForRegister

function TkwSLEEP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSLEEP.GetResultTypeInfo

type
 TkwProcessMessages = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ProcessMessages
*Пример:*
[code]
 ProcessMessages
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwProcessMessages

// start class TkwProcessMessages

procedure TkwProcessMessages.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_E4C5BF333038_var*
//#UC END# *4DAEEDE10285_E4C5BF333038_var*
begin
//#UC START# *4DAEEDE10285_E4C5BF333038_impl*
 try
  Tl3MessagesService.Instance.ProcessMessages;
 except
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   raise;
  end;//on E: Exception
 end;//try..finally
//#UC END# *4DAEEDE10285_E4C5BF333038_impl*
end;//TkwProcessMessages.DoDoIt

class function TkwProcessMessages.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ProcessMessages';
end;//TkwProcessMessages.GetWordNameForRegister

function TkwProcessMessages.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwProcessMessages.GetResultTypeInfo

type
 TkwCheckAssert = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ASSERT
[panel]Функция Assert.
Пример:
[code]
 waited:? ASSERT
[code][panel]
*Пример:*
[code]
 aCondition ASSERT
[code]  }
 private
 // private methods
   procedure CheckAssert(const aCtx: TtfwContext;
    aCondition: Boolean);
     {* Реализация слова скрипта ASSERT }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCheckAssert

// start class TkwCheckAssert

procedure TkwCheckAssert.CheckAssert(const aCtx: TtfwContext;
  aCondition: Boolean);
//#UC START# *A9F0DE62C340_21B5CB646447_var*
//#UC END# *A9F0DE62C340_21B5CB646447_var*
begin
//#UC START# *A9F0DE62C340_21B5CB646447_impl*
 aCtx.rCaller.Check(aCondition);
//#UC END# *A9F0DE62C340_21B5CB646447_impl*
end;//TkwCheckAssert.CheckAssert

procedure TkwCheckAssert.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aCondition : Boolean;
begin
 try
  l_aCondition := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCondition: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CheckAssert(aCtx, l_aCondition);
end;//TkwCheckAssert.DoDoIt

class function TkwCheckAssert.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ASSERT';
end;//TkwCheckAssert.GetWordNameForRegister

function TkwCheckAssert.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCheckAssert.GetResultTypeInfo

type
 TkwASSERTS = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ASSERTS
[panel]Аналогичен Assert, но сообщение об ошибке берется из стека[panel]
*Пример:*
[code]
 aCondition aMsg ASSERTS
[code]  }
 private
 // private methods
   procedure ASSERTS(const aCtx: TtfwContext;
    const aMsg: AnsiString;
    aCondition: Boolean);
     {* Реализация слова скрипта ASSERTS }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwASSERTS

// start class TkwASSERTS

procedure TkwASSERTS.ASSERTS(const aCtx: TtfwContext;
  const aMsg: AnsiString;
  aCondition: Boolean);
//#UC START# *C32D02D46DF5_EC908CD7498C_var*
//#UC END# *C32D02D46DF5_EC908CD7498C_var*
begin
//#UC START# *C32D02D46DF5_EC908CD7498C_impl*
 aCtx.rCaller.Check(aCondition, aMsg);
//#UC END# *C32D02D46DF5_EC908CD7498C_impl*
end;//TkwASSERTS.ASSERTS

procedure TkwASSERTS.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aMsg : AnsiString;
 l_aCondition : Boolean;
begin
 try
  l_aMsg := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMsg: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aCondition := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCondition: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ASSERTS(aCtx, l_aMsg, l_aCondition);
end;//TkwASSERTS.DoDoIt

class function TkwASSERTS.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ASSERTS';
end;//TkwASSERTS.GetWordNameForRegister

function TkwASSERTS.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwASSERTS.GetResultTypeInfo

type
 TkwNil = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта nil
*Пример:*
[code]
 nil
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNil

// start class TkwNil

procedure TkwNil.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_D498DDF5F479_var*
//#UC END# *4DAEEDE10285_D498DDF5F479_var*
begin
//#UC START# *4DAEEDE10285_D498DDF5F479_impl*
 aCtx.rEngine.Push(TtfwStackValue_NULL);
//#UC END# *4DAEEDE10285_D498DDF5F479_impl*
end;//TkwNil.DoDoIt

class function TkwNil.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'nil';
end;//TkwNil.GetWordNameForRegister

function TkwNil.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwNil.GetResultTypeInfo

type
 TkwDoWord = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DO
[panel]Исполняет скомпилированное слово.[panel]
*Пример:*
[code]
 aWord DO
[code]  }
 private
 // private methods
   procedure DoWord(const aCtx: TtfwContext;
    aWord: TtfwWord);
     {* Реализация слова скрипта DO }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDoWord

// start class TkwDoWord

procedure TkwDoWord.DoWord(const aCtx: TtfwContext;
  aWord: TtfwWord);
//#UC START# *61B2E2983CE5_8756115930CD_var*
//#UC END# *61B2E2983CE5_8756115930CD_var*
begin
//#UC START# *61B2E2983CE5_8756115930CD_impl*
 aWord.DoIt(aCtx);
//#UC END# *61B2E2983CE5_8756115930CD_impl*
end;//TkwDoWord.DoWord

procedure TkwDoWord.DoDoIt(const aCtx: TtfwContext);
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
 DoWord(aCtx, l_aWord);
end;//TkwDoWord.DoDoIt

class function TkwDoWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DO';
end;//TkwDoWord.GetWordNameForRegister

function TkwDoWord.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDoWord.GetResultTypeInfo

type
 TkwSmartEquals = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ?==
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aV2 aV1 ?== >>> l_Boolean
[code]  }
 private
 // private methods
   function SmartEquals(const aCtx: TtfwContext;
    const aV1: TtfwStackValue;
    const aV2: TtfwStackValue): Boolean;
     {* Реализация слова скрипта ?== }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSmartEquals

// start class TkwSmartEquals

function TkwSmartEquals.SmartEquals(const aCtx: TtfwContext;
  const aV1: TtfwStackValue;
  const aV2: TtfwStackValue): Boolean;
//#UC START# *60743477D321_C3CE906B1F67_var*
//#UC END# *60743477D321_C3CE906B1F67_var*
begin
//#UC START# *60743477D321_C3CE906B1F67_impl*
 Result := CompareValues(aV1, aV2, aCtx, Self);
//#UC END# *60743477D321_C3CE906B1F67_impl*
end;//TkwSmartEquals.SmartEquals

procedure TkwSmartEquals.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aV1 : TtfwStackValue;
 l_aV2 : TtfwStackValue;
begin
 try
  l_aV1 := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aV1: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aV2 := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aV2: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SmartEquals(aCtx, l_aV1, l_aV2)));
end;//TkwSmartEquals.DoDoIt

class function TkwSmartEquals.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '?==';
end;//TkwSmartEquals.GetWordNameForRegister

function TkwSmartEquals.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSmartEquals.GetResultTypeInfo

type
 TkwSmartNotEquals = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ?!=
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aV2 aV1 ?!= >>> l_Boolean
[code]  }
 private
 // private methods
   function SmartNotEquals(const aCtx: TtfwContext;
    const aV1: TtfwStackValue;
    const aV2: TtfwStackValue): Boolean;
     {* Реализация слова скрипта ?!= }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSmartNotEquals

// start class TkwSmartNotEquals

function TkwSmartNotEquals.SmartNotEquals(const aCtx: TtfwContext;
  const aV1: TtfwStackValue;
  const aV2: TtfwStackValue): Boolean;
//#UC START# *1E530026939A_CC9B8514F681_var*
//#UC END# *1E530026939A_CC9B8514F681_var*
begin
//#UC START# *1E530026939A_CC9B8514F681_impl*
 Result := not CompareValues(aV1, aV2, aCtx, Self);
//#UC END# *1E530026939A_CC9B8514F681_impl*
end;//TkwSmartNotEquals.SmartNotEquals

procedure TkwSmartNotEquals.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aV1 : TtfwStackValue;
 l_aV2 : TtfwStackValue;
begin
 try
  l_aV1 := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aV1: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aV2 := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aV2: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SmartNotEquals(aCtx, l_aV1, l_aV2)));
end;//TkwSmartNotEquals.DoDoIt

class function TkwSmartNotEquals.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '?!=';
end;//TkwSmartNotEquals.GetWordNameForRegister

function TkwSmartNotEquals.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSmartNotEquals.GetResultTypeInfo

type
 TkwPushWord = {final scriptword} class(TtfwWordWorkerEx)
  {* Слово скрипта @
[panel]Кладёт на стек адрес указанного слова[panel]
*Тип результата:* TtfwWord
*Пример:*
[code]
OBJECT VAR l_TtfwWord
 @ aWord >>> l_TtfwWord
[code]  }
 private
 // private methods
   function PushWord(const aCtx: TtfwContext;
    aWord: TtfwWord): TtfwWord;
     {* Реализация слова скрипта @ }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function SuppressNextImmediate(const aContext: TtfwContext;
     aWordNumber: Integer): TtfwSuppressNextImmediate; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPushWord

// start class TkwPushWord

function TkwPushWord.PushWord(const aCtx: TtfwContext;
  aWord: TtfwWord): TtfwWord;
//#UC START# *E64338F25E47_D110B4F78BD0_var*
//#UC END# *E64338F25E47_D110B4F78BD0_var*
begin
//#UC START# *E64338F25E47_D110B4F78BD0_impl*
 Result := aWord;
//#UC END# *E64338F25E47_D110B4F78BD0_impl*
end;//TkwPushWord.PushWord

class function TkwPushWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '@';
end;//TkwPushWord.GetWordNameForRegister

function TkwPushWord.SuppressNextImmediate(const aContext: TtfwContext;
  aWordNumber: Integer): TtfwSuppressNextImmediate;
 {-}
begin
 Result := tfw_sniYes;
end;//TkwPushWord.SuppressNextImmediate

procedure TkwPushWord.DoRun(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushObj((PushWord(aCtx, l_aWord)));
end;//TkwPushWord.DoRun

function TkwPushWord.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwWord);
end;//TkwPushWord.GetResultTypeInfo

type
 TkwCurrentException = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта current:exception
*Тип результата:* TObject
*Пример:*
[code]
OBJECT VAR l_TObject
 current:exception >>> l_TObject
[code]  }
 private
 // private methods
   function CurrentException(const aCtx: TtfwContext): TObject;
     {* Реализация слова скрипта current:exception }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCurrentException

// start class TkwCurrentException

function TkwCurrentException.CurrentException(const aCtx: TtfwContext): TObject;
//#UC START# *6715463935A1_FC4619680919_var*
//#UC END# *6715463935A1_FC4619680919_var*
begin
//#UC START# *6715463935A1_FC4619680919_impl*
 Result := aCtx.rException;
//#UC END# *6715463935A1_FC4619680919_impl*
end;//TkwCurrentException.CurrentException

procedure TkwCurrentException.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushObj((CurrentException(aCtx)));
end;//TkwCurrentException.DoDoIt

class function TkwCurrentException.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception';
end;//TkwCurrentException.GetWordNameForRegister

function TkwCurrentException.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TObject);
end;//TkwCurrentException.GetResultTypeInfo

type
 TkwCurrentExceptionClass = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта current:exception:class
*Тип результата:* TClass
*Пример:*
[code]
CLASS VAR l_TClass
 current:exception:class >>> l_TClass
[code]  }
 private
 // private methods
   function CurrentExceptionClass(const aCtx: TtfwContext): TClass;
     {* Реализация слова скрипта current:exception:class }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCurrentExceptionClass

// start class TkwCurrentExceptionClass

function TkwCurrentExceptionClass.CurrentExceptionClass(const aCtx: TtfwContext): TClass;
//#UC START# *E3D187DF3985_1AF5C18788F4_var*
//#UC END# *E3D187DF3985_1AF5C18788F4_var*
begin
//#UC START# *E3D187DF3985_1AF5C18788F4_impl*
 if (aCtx.rException = nil) then
  Result := nil
 else
  Result := aCtx.rException.ClassType;
//#UC END# *E3D187DF3985_1AF5C18788F4_impl*
end;//TkwCurrentExceptionClass.CurrentExceptionClass

procedure TkwCurrentExceptionClass.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushClass((CurrentExceptionClass(aCtx)));
end;//TkwCurrentExceptionClass.DoDoIt

class function TkwCurrentExceptionClass.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception:class';
end;//TkwCurrentExceptionClass.GetWordNameForRegister

function TkwCurrentExceptionClass.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiClassRef;
end;//TkwCurrentExceptionClass.GetResultTypeInfo

type
 TkwCurrentExceptionClassName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта current:exception:ClassName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 current:exception:ClassName >>> l_String
[code]  }
 private
 // private methods
   function CurrentExceptionClassName(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта current:exception:ClassName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCurrentExceptionClassName

// start class TkwCurrentExceptionClassName

function TkwCurrentExceptionClassName.CurrentExceptionClassName(const aCtx: TtfwContext): AnsiString;
//#UC START# *4B72A5BBE511_884F3012E3E7_var*
//#UC END# *4B72A5BBE511_884F3012E3E7_var*
begin
//#UC START# *4B72A5BBE511_884F3012E3E7_impl*
 if (aCtx.rException = nil) then
  Result := ''
 else
  Result := aCtx.rException.ClassName;
//#UC END# *4B72A5BBE511_884F3012E3E7_impl*
end;//TkwCurrentExceptionClassName.CurrentExceptionClassName

procedure TkwCurrentExceptionClassName.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((CurrentExceptionClassName(aCtx)));
end;//TkwCurrentExceptionClassName.DoDoIt

class function TkwCurrentExceptionClassName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception:ClassName';
end;//TkwCurrentExceptionClassName.GetWordNameForRegister

function TkwCurrentExceptionClassName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwCurrentExceptionClassName.GetResultTypeInfo

type
 TkwCurrentExceptionMessage = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта current:exception:Message
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 current:exception:Message >>> l_String
[code]  }
 private
 // private methods
   function CurrentExceptionMessage(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта current:exception:Message }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCurrentExceptionMessage

// start class TkwCurrentExceptionMessage

function TkwCurrentExceptionMessage.CurrentExceptionMessage(const aCtx: TtfwContext): AnsiString;
//#UC START# *51C60F25F7F2_700EDDB5F050_var*
//#UC END# *51C60F25F7F2_700EDDB5F050_var*
begin
//#UC START# *51C60F25F7F2_700EDDB5F050_impl*
 if (aCtx.rException = nil) then
  Result := ''
 else
  Result := aCtx.rException.Message;
//#UC END# *51C60F25F7F2_700EDDB5F050_impl*
end;//TkwCurrentExceptionMessage.CurrentExceptionMessage

procedure TkwCurrentExceptionMessage.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((CurrentExceptionMessage(aCtx)));
end;//TkwCurrentExceptionMessage.DoDoIt

class function TkwCurrentExceptionMessage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'current:exception:Message';
end;//TkwCurrentExceptionMessage.GetWordNameForRegister

function TkwCurrentExceptionMessage.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwCurrentExceptionMessage.GetResultTypeInfo

type
 TkwInc = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ++
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aValue ++ >>> l_Integer
[code]  }
 private
 // private methods
   function Inc(const aCtx: TtfwContext;
    aValue: Integer): Integer;
     {* Реализация слова скрипта ++ }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwInc

// start class TkwInc

function TkwInc.Inc(const aCtx: TtfwContext;
  aValue: Integer): Integer;
//#UC START# *D77DFD505D71_EC8ABDF1263C_var*
//#UC END# *D77DFD505D71_EC8ABDF1263C_var*
begin
//#UC START# *D77DFD505D71_EC8ABDF1263C_impl*
 Result := aValue + 1;
//#UC END# *D77DFD505D71_EC8ABDF1263C_impl*
end;//TkwInc.Inc

procedure TkwInc.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Integer;
begin
 try
  l_aValue := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Inc(aCtx, l_aValue)));
end;//TkwInc.DoDoIt

class function TkwInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '++';
end;//TkwInc.GetWordNameForRegister

function TkwInc.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwInc.GetResultTypeInfo

type
 TkwDec = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта --
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aValue -- >>> l_Integer
[code]  }
 private
 // private methods
   function Dec(const aCtx: TtfwContext;
    aValue: Integer): Integer;
     {* Реализация слова скрипта -- }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDec

// start class TkwDec

function TkwDec.Dec(const aCtx: TtfwContext;
  aValue: Integer): Integer;
//#UC START# *953F49C35391_B2F2C7D2DE77_var*
//#UC END# *953F49C35391_B2F2C7D2DE77_var*
begin
//#UC START# *953F49C35391_B2F2C7D2DE77_impl*
 Result := aValue - 1;
//#UC END# *953F49C35391_B2F2C7D2DE77_impl*
end;//TkwDec.Dec

procedure TkwDec.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Integer;
begin
 try
  l_aValue := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Dec(aCtx, l_aValue)));
end;//TkwDec.DoDoIt

class function TkwDec.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '--';
end;//TkwDec.GetWordNameForRegister

function TkwDec.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwDec.GetResultTypeInfo

type
 TkwAdd = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта +
*Тип результата:* TtfwStackValue
*Пример:*
[code]
VAR l_TtfwStackValue
 aA aB + >>> l_TtfwStackValue
[code]  }
 private
 // private methods
   function Add(const aCtx: TtfwContext;
    const aB: TtfwStackValue;
    const aA: TtfwStackValue): TtfwStackValue;
     {* Реализация слова скрипта + }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwAdd

// start class TkwAdd

function TkwAdd.Add(const aCtx: TtfwContext;
  const aB: TtfwStackValue;
  const aA: TtfwStackValue): TtfwStackValue;
//#UC START# *4A2B2E436561_9C21970CCFB0_var*
//#UC END# *4A2B2E436561_9C21970CCFB0_var*
begin
//#UC START# *4A2B2E436561_9C21970CCFB0_impl*
 Case aA.rType of
  tfw_vtInt:
   Result := TtfwStackValue_C(aA.AsInt + aB.AsInt);
  tfw_vtStr:
   Result := TtfwStackValue_C(TtfwCStringFactory.C(l3Cat([aA.AsString, aB.AsString])));
  else
  begin
   Result := TtfwStackValue_E;
   BadValueType(aA.rType, aCtx);
  end;//else
 end;//Case aA.rType
//#UC END# *4A2B2E436561_9C21970CCFB0_impl*
end;//TkwAdd.Add

procedure TkwAdd.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : TtfwStackValue;
 l_aA : TtfwStackValue;
begin
 try
  l_aB := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.Push((Add(aCtx, l_aB, l_aA)));
end;//TkwAdd.DoDoIt

class function TkwAdd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '+';
end;//TkwAdd.GetWordNameForRegister

function TkwAdd.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiStruct;
end;//TkwAdd.GetResultTypeInfo

type
 TkwSub = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта -
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB - >>> l_Integer
[code]  }
 private
 // private methods
   function Sub(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта - }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSub

// start class TkwSub

function TkwSub.Sub(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *48DD1F61327A_07CF656336AF_var*
//#UC END# *48DD1F61327A_07CF656336AF_var*
begin
//#UC START# *48DD1F61327A_07CF656336AF_impl*
 Result := aA - aB;
//#UC END# *48DD1F61327A_07CF656336AF_impl*
end;//TkwSub.Sub

procedure TkwSub.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Sub(aCtx, l_aB, l_aA)));
end;//TkwSub.DoDoIt

class function TkwSub.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '-';
end;//TkwSub.GetWordNameForRegister

function TkwSub.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwSub.GetResultTypeInfo

type
 TkwDivision = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DIV
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB DIV >>> l_Integer
[code]  }
 private
 // private methods
   function Division(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта DIV }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDivision

// start class TkwDivision

function TkwDivision.Division(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *88D113F4B496_E81F1590332D_var*
//#UC END# *88D113F4B496_E81F1590332D_var*
begin
//#UC START# *88D113F4B496_E81F1590332D_impl*
 Result := aA div aB;
//#UC END# *88D113F4B496_E81F1590332D_impl*
end;//TkwDivision.Division

procedure TkwDivision.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Division(aCtx, l_aB, l_aA)));
end;//TkwDivision.DoDoIt

class function TkwDivision.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DIV';
end;//TkwDivision.GetWordNameForRegister

function TkwDivision.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwDivision.GetResultTypeInfo

type
 TkwMul = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта *
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB * >>> l_Integer
[code]  }
 private
 // private methods
   function Mul(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта * }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMul

// start class TkwMul

function TkwMul.Mul(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *5AE4AB3CE60E_0B21BAF8C4D4_var*
//#UC END# *5AE4AB3CE60E_0B21BAF8C4D4_var*
begin
//#UC START# *5AE4AB3CE60E_0B21BAF8C4D4_impl*
 Result := aA * aB;
//#UC END# *5AE4AB3CE60E_0B21BAF8C4D4_impl*
end;//TkwMul.Mul

procedure TkwMul.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Mul(aCtx, l_aB, l_aA)));
end;//TkwMul.DoDoIt

class function TkwMul.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '*';
end;//TkwMul.GetWordNameForRegister

function TkwMul.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwMul.GetResultTypeInfo

type
 TkwDivide = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта /
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB / >>> l_Integer
[code]  }
 private
 // private methods
   function Divide(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта / }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDivide

// start class TkwDivide

function TkwDivide.Divide(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *736A69199423_3396B991D47C_var*
//#UC END# *736A69199423_3396B991D47C_var*
begin
//#UC START# *736A69199423_3396B991D47C_impl*
 Result := aA div aB;
//#UC END# *736A69199423_3396B991D47C_impl*
end;//TkwDivide.Divide

procedure TkwDivide.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Divide(aCtx, l_aB, l_aA)));
end;//TkwDivide.DoDoIt

class function TkwDivide.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '/';
end;//TkwDivide.GetWordNameForRegister

function TkwDivide.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwDivide.GetResultTypeInfo

type
 TkwMul2 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта 2*
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA 2* >>> l_Integer
[code]  }
 private
 // private methods
   function Mul2(const aCtx: TtfwContext;
    aA: Integer): Integer;
     {* Реализация слова скрипта 2* }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMul2

// start class TkwMul2

function TkwMul2.Mul2(const aCtx: TtfwContext;
  aA: Integer): Integer;
//#UC START# *344C0B9A5E91_2281645E0EB6_var*
//#UC END# *344C0B9A5E91_2281645E0EB6_var*
begin
//#UC START# *344C0B9A5E91_2281645E0EB6_impl*
 Result := aA shl 1;
//#UC END# *344C0B9A5E91_2281645E0EB6_impl*
end;//TkwMul2.Mul2

procedure TkwMul2.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aA : Integer;
begin
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Mul2(aCtx, l_aA)));
end;//TkwMul2.DoDoIt

class function TkwMul2.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '2*';
end;//TkwMul2.GetWordNameForRegister

function TkwMul2.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwMul2.GetResultTypeInfo

type
 TkwDiv2 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта 2/
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA 2/ >>> l_Integer
[code]  }
 private
 // private methods
   function Div2(const aCtx: TtfwContext;
    aA: Integer): Integer;
     {* Реализация слова скрипта 2/ }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDiv2

// start class TkwDiv2

function TkwDiv2.Div2(const aCtx: TtfwContext;
  aA: Integer): Integer;
//#UC START# *FEC2D095F55C_F236BCF7B4F7_var*
//#UC END# *FEC2D095F55C_F236BCF7B4F7_var*
begin
//#UC START# *FEC2D095F55C_F236BCF7B4F7_impl*
 Result := aA shr 1;
//#UC END# *FEC2D095F55C_F236BCF7B4F7_impl*
end;//TkwDiv2.Div2

procedure TkwDiv2.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aA : Integer;
begin
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Div2(aCtx, l_aA)));
end;//TkwDiv2.DoDoIt

class function TkwDiv2.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '2/';
end;//TkwDiv2.GetWordNameForRegister

function TkwDiv2.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwDiv2.GetResultTypeInfo

type
 TkwMulDiv = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта */
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB aC */ >>> l_Integer
[code]  }
 private
 // private methods
   function MulDiv(const aCtx: TtfwContext;
    aC: Integer;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта */ }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwMulDiv

// start class TkwMulDiv

function TkwMulDiv.MulDiv(const aCtx: TtfwContext;
  aC: Integer;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *1D630924D3F3_DD076C655ECA_var*
//#UC END# *1D630924D3F3_DD076C655ECA_var*
begin
//#UC START# *1D630924D3F3_DD076C655ECA_impl*
 Result := l3MulDiv(aA, aB, aC);
//#UC END# *1D630924D3F3_DD076C655ECA_impl*
end;//TkwMulDiv.MulDiv

procedure TkwMulDiv.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aC : Integer;
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aC := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aC: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((MulDiv(aCtx, l_aC, l_aB, l_aA)));
end;//TkwMulDiv.DoDoIt

class function TkwMulDiv.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '*/';
end;//TkwMulDiv.GetWordNameForRegister

function TkwMulDiv.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwMulDiv.GetResultTypeInfo

type
 TkwBoolNot = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта !
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA ! >>> l_Boolean
[code]  }
 private
 // private methods
   function BoolNot(const aCtx: TtfwContext;
    aA: Boolean): Boolean;
     {* Реализация слова скрипта ! }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBoolNot

// start class TkwBoolNot

function TkwBoolNot.BoolNot(const aCtx: TtfwContext;
  aA: Boolean): Boolean;
//#UC START# *CAC63578DC71_DE39DE30D615_var*
//#UC END# *CAC63578DC71_DE39DE30D615_var*
begin
//#UC START# *CAC63578DC71_DE39DE30D615_impl*
 Result := not aA;
//#UC END# *CAC63578DC71_DE39DE30D615_impl*
end;//TkwBoolNot.BoolNot

procedure TkwBoolNot.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aA : Boolean;
begin
 try
  l_aA := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((BoolNot(aCtx, l_aA)));
end;//TkwBoolNot.DoDoIt

class function TkwBoolNot.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '!';
end;//TkwBoolNot.GetWordNameForRegister

function TkwBoolNot.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwBoolNot.GetResultTypeInfo

type
 TkwModFromDiv = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта MOD
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB MOD >>> l_Integer
[code]  }
 private
 // private methods
   function ModFromDiv(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта MOD }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwModFromDiv

// start class TkwModFromDiv

function TkwModFromDiv.ModFromDiv(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *6F1D80D40414_6CA2C2693736_var*
//#UC END# *6F1D80D40414_6CA2C2693736_var*
begin
//#UC START# *6F1D80D40414_6CA2C2693736_impl*
 Result := aA mod aB;
//#UC END# *6F1D80D40414_6CA2C2693736_impl*
end;//TkwModFromDiv.ModFromDiv

procedure TkwModFromDiv.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((ModFromDiv(aCtx, l_aB, l_aA)));
end;//TkwModFromDiv.DoDoIt

class function TkwModFromDiv.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MOD';
end;//TkwModFromDiv.GetWordNameForRegister

function TkwModFromDiv.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwModFromDiv.GetResultTypeInfo

type
 TkwBoolAnd = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта &&
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA aB && >>> l_Boolean
[code]  }
 private
 // private methods
   function BoolAnd(const aCtx: TtfwContext;
    aB: Boolean;
    aA: Boolean): Boolean;
     {* Реализация слова скрипта && }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBoolAnd

// start class TkwBoolAnd

function TkwBoolAnd.BoolAnd(const aCtx: TtfwContext;
  aB: Boolean;
  aA: Boolean): Boolean;
//#UC START# *B5F366B3195C_B473FE645DEA_var*
//#UC END# *B5F366B3195C_B473FE645DEA_var*
begin
//#UC START# *B5F366B3195C_B473FE645DEA_impl*
 Result := aA AND aB;
//#UC END# *B5F366B3195C_B473FE645DEA_impl*
end;//TkwBoolAnd.BoolAnd

procedure TkwBoolAnd.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Boolean;
 l_aA : Boolean;
begin
 try
  l_aB := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((BoolAnd(aCtx, l_aB, l_aA)));
end;//TkwBoolAnd.DoDoIt

class function TkwBoolAnd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '&&';
end;//TkwBoolAnd.GetWordNameForRegister

function TkwBoolAnd.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwBoolAnd.GetResultTypeInfo

type
 TkwBoolOr = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ||
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA aB || >>> l_Boolean
[code]  }
 private
 // private methods
   function BoolOr(const aCtx: TtfwContext;
    aB: Boolean;
    aA: Boolean): Boolean;
     {* Реализация слова скрипта || }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBoolOr

// start class TkwBoolOr

function TkwBoolOr.BoolOr(const aCtx: TtfwContext;
  aB: Boolean;
  aA: Boolean): Boolean;
//#UC START# *A7F5B8B75EED_26485F660013_var*
//#UC END# *A7F5B8B75EED_26485F660013_var*
begin
//#UC START# *A7F5B8B75EED_26485F660013_impl*
 Result := aA OR aB;
//#UC END# *A7F5B8B75EED_26485F660013_impl*
end;//TkwBoolOr.BoolOr

procedure TkwBoolOr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Boolean;
 l_aA : Boolean;
begin
 try
  l_aB := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((BoolOr(aCtx, l_aB, l_aA)));
end;//TkwBoolOr.DoDoIt

class function TkwBoolOr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '||';
end;//TkwBoolOr.GetWordNameForRegister

function TkwBoolOr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwBoolOr.GetResultTypeInfo

type
 TkwNotZero = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта !=0
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA !=0 >>> l_Boolean
[code]  }
 private
 // private methods
   function NotZero(const aCtx: TtfwContext;
    aA: Integer): Boolean;
     {* Реализация слова скрипта !=0 }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNotZero

// start class TkwNotZero

function TkwNotZero.NotZero(const aCtx: TtfwContext;
  aA: Integer): Boolean;
//#UC START# *4C0DDFEB9207_904983DADEB2_var*
//#UC END# *4C0DDFEB9207_904983DADEB2_var*
begin
//#UC START# *4C0DDFEB9207_904983DADEB2_impl*
 Result := (aA <> 0);
//#UC END# *4C0DDFEB9207_904983DADEB2_impl*
end;//TkwNotZero.NotZero

procedure TkwNotZero.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aA : Integer;
begin
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((NotZero(aCtx, l_aA)));
end;//TkwNotZero.DoDoIt

class function TkwNotZero.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '!=0';
end;//TkwNotZero.GetWordNameForRegister

function TkwNotZero.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwNotZero.GetResultTypeInfo

type
 TkwEqualZero = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта =0
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA =0 >>> l_Boolean
[code]  }
 private
 // private methods
   function EqualZero(const aCtx: TtfwContext;
    aA: Integer): Boolean;
     {* Реализация слова скрипта =0 }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwEqualZero

// start class TkwEqualZero

function TkwEqualZero.EqualZero(const aCtx: TtfwContext;
  aA: Integer): Boolean;
//#UC START# *7F71955C78B0_41CE11D9C1A2_var*
//#UC END# *7F71955C78B0_41CE11D9C1A2_var*
begin
//#UC START# *7F71955C78B0_41CE11D9C1A2_impl*
 Result := (aA = 0);
//#UC END# *7F71955C78B0_41CE11D9C1A2_impl*
end;//TkwEqualZero.EqualZero

procedure TkwEqualZero.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aA : Integer;
begin
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((EqualZero(aCtx, l_aA)));
end;//TkwEqualZero.DoDoIt

class function TkwEqualZero.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '=0';
end;//TkwEqualZero.GetWordNameForRegister

function TkwEqualZero.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwEqualZero.GetResultTypeInfo

type
 TkwSWAP = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SWAP
*Пример:*
[code]
 SWAP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSWAP

// start class TkwSWAP

procedure TkwSWAP.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_FABB1CF992DE_var*
//#UC END# *4DAEEDE10285_FABB1CF992DE_var*
begin
//#UC START# *4DAEEDE10285_FABB1CF992DE_impl*
 aCtx.rEngine.SWAP;
//#UC END# *4DAEEDE10285_FABB1CF992DE_impl*
end;//TkwSWAP.DoDoIt

class function TkwSWAP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SWAP';
end;//TkwSWAP.GetWordNameForRegister

function TkwSWAP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSWAP.GetResultTypeInfo

type
 TkwDROP = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DROP
*Пример:*
[code]
 DROP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDROP

// start class TkwDROP

procedure TkwDROP.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_58414ABA5048_var*
//#UC END# *4DAEEDE10285_58414ABA5048_var*
begin
//#UC START# *4DAEEDE10285_58414ABA5048_impl*
 aCtx.rEngine.DROP;
//#UC END# *4DAEEDE10285_58414ABA5048_impl*
end;//TkwDROP.DoDoIt

class function TkwDROP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DROP';
end;//TkwDROP.GetWordNameForRegister

function TkwDROP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDROP.GetResultTypeInfo

type
 TkwDUP = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DUP
*Пример:*
[code]
 DUP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDUP

// start class TkwDUP

procedure TkwDUP.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_1B275E59B185_var*
//#UC END# *4DAEEDE10285_1B275E59B185_var*
begin
//#UC START# *4DAEEDE10285_1B275E59B185_impl*
 aCtx.rEngine.Dup;
//#UC END# *4DAEEDE10285_1B275E59B185_impl*
end;//TkwDUP.DoDoIt

class function TkwDUP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DUP';
end;//TkwDUP.GetWordNameForRegister

function TkwDUP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDUP.GetResultTypeInfo

type
 TkwDUPIfNotZero = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ?DUP
*Пример:*
[code]
 ?DUP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDUPIfNotZero

// start class TkwDUPIfNotZero

procedure TkwDUPIfNotZero.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_7E5F590E5C48_var*
//#UC END# *4DAEEDE10285_7E5F590E5C48_var*
begin
//#UC START# *4DAEEDE10285_7E5F590E5C48_impl*
 aCtx.rEngine.DupIfNotZero;
//#UC END# *4DAEEDE10285_7E5F590E5C48_impl*
end;//TkwDUPIfNotZero.DoDoIt

class function TkwDUPIfNotZero.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '?DUP';
end;//TkwDUPIfNotZero.GetWordNameForRegister

function TkwDUPIfNotZero.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDUPIfNotZero.GetResultTypeInfo

type
 TkwROT = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ROT
[panel]Прокрутить три верхних элемента стека: ( x1 x2 x3 -- x2 x3 x1 )[panel]
*Пример:*
[code]
 ROT
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwROT

// start class TkwROT

procedure TkwROT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_E1E6ADB3161D_var*
//#UC END# *4DAEEDE10285_E1E6ADB3161D_var*
begin
//#UC START# *4DAEEDE10285_E1E6ADB3161D_impl*
 aCtx.rEngine.ROT;
//#UC END# *4DAEEDE10285_E1E6ADB3161D_impl*
end;//TkwROT.DoDoIt

class function TkwROT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ROT';
end;//TkwROT.GetWordNameForRegister

function TkwROT.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwROT.GetResultTypeInfo

type
 TkwPICK = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта PICK
[panel]Формат: u PICK. 
Удаляет u. Копирует xu на вершину стека. ( xu ... x1 x0 u -- xu ... x1 x0 xu )[panel]
*Пример:*
[code]
 PICK
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPICK

// start class TkwPICK

procedure TkwPICK.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_75F53535698F_var*
//#UC END# *4DAEEDE10285_75F53535698F_var*
begin
//#UC START# *4DAEEDE10285_75F53535698F_impl*
 aCtx.rEngine.PICK;
//#UC END# *4DAEEDE10285_75F53535698F_impl*
end;//TkwPICK.DoDoIt

class function TkwPICK.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PICK';
end;//TkwPICK.GetWordNameForRegister

function TkwPICK.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwPICK.GetResultTypeInfo

type
 TkwInvertROT = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта -ROT
[panel]Прокрутить три верхних элемента стека: ( x1 x2 x3 -- x3 x1 x2 )[panel]
*Пример:*
[code]
 -ROT
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwInvertROT

// start class TkwInvertROT

procedure TkwInvertROT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_F07D92F8E519_var*
//#UC END# *4DAEEDE10285_F07D92F8E519_var*
begin
//#UC START# *4DAEEDE10285_F07D92F8E519_impl*
 aCtx.rEngine.InvertROT;
//#UC END# *4DAEEDE10285_F07D92F8E519_impl*
end;//TkwInvertROT.DoDoIt

class function TkwInvertROT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '-ROT';
end;//TkwInvertROT.GetWordNameForRegister

function TkwInvertROT.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwInvertROT.GetResultTypeInfo

type
 TkwSWAP2 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта 2SWAP
[panel]Меняет местами две верхних пары-ячеек. ( x1 x2 x3 x4 -- x3 x4 x1 x2 )[panel]
*Пример:*
[code]
 2SWAP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSWAP2

// start class TkwSWAP2

procedure TkwSWAP2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_F7F6BAC82E0F_var*
//#UC END# *4DAEEDE10285_F7F6BAC82E0F_var*
begin
//#UC START# *4DAEEDE10285_F7F6BAC82E0F_impl*
 aCtx.rEngine.Swap2;
//#UC END# *4DAEEDE10285_F7F6BAC82E0F_impl*
end;//TkwSWAP2.DoDoIt

class function TkwSWAP2.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '2SWAP';
end;//TkwSWAP2.GetWordNameForRegister

function TkwSWAP2.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSWAP2.GetResultTypeInfo

type
 TkwOVER2 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта 2OVER
[panel]Копирует пару-ячеек x1 x2 на вершину стека. ( x1 x2 x3 x4 -- x1 x2 x3 x4 x1 x2 )[panel]
*Пример:*
[code]
 2OVER
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwOVER2

// start class TkwOVER2

procedure TkwOVER2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_9918552ECDEB_var*
//#UC END# *4DAEEDE10285_9918552ECDEB_var*
begin
//#UC START# *4DAEEDE10285_9918552ECDEB_impl*
 aCtx.rEngine.Over2;
//#UC END# *4DAEEDE10285_9918552ECDEB_impl*
end;//TkwOVER2.DoDoIt

class function TkwOVER2.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '2OVER';
end;//TkwOVER2.GetWordNameForRegister

function TkwOVER2.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwOVER2.GetResultTypeInfo

type
 TkwDUP2 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта 2DUP
[panel]Дублирует пару-ячеек x1 x2. ( x1 x2 -- x1 x2 x1 x2 )[panel]
*Пример:*
[code]
 2DUP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDUP2

// start class TkwDUP2

procedure TkwDUP2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_B22DDB43B438_var*
//#UC END# *4DAEEDE10285_B22DDB43B438_var*
begin
//#UC START# *4DAEEDE10285_B22DDB43B438_impl*
 aCtx.rEngine.Dup2;
//#UC END# *4DAEEDE10285_B22DDB43B438_impl*
end;//TkwDUP2.DoDoIt

class function TkwDUP2.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '2DUP';
end;//TkwDUP2.GetWordNameForRegister

function TkwDUP2.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDUP2.GetResultTypeInfo

type
 TkwDROP2 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта 2DROP
[panel]Удаляет пару-ячеек x1 x2 из стека. ( x1 x2 -- )[panel]
*Пример:*
[code]
 2DROP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDROP2

// start class TkwDROP2

procedure TkwDROP2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_79D7140F1BCC_var*
//#UC END# *4DAEEDE10285_79D7140F1BCC_var*
begin
//#UC START# *4DAEEDE10285_79D7140F1BCC_impl*
 aCtx.rEngine.Drop2;
//#UC END# *4DAEEDE10285_79D7140F1BCC_impl*
end;//TkwDROP2.DoDoIt

class function TkwDROP2.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '2DROP';
end;//TkwDROP2.GetWordNameForRegister

function TkwDROP2.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDROP2.GetResultTypeInfo

type
 TkwNIP = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта NIP
[panel]Удаляет первый элемент ниже вершины стека. ( x1 x2 -- x2 )[panel]
*Пример:*
[code]
 NIP
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNIP

// start class TkwNIP

procedure TkwNIP.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_58C1120D11ED_var*
//#UC END# *4DAEEDE10285_58C1120D11ED_var*
begin
//#UC START# *4DAEEDE10285_58C1120D11ED_impl*
 aCtx.rEngine.NIP;
//#UC END# *4DAEEDE10285_58C1120D11ED_impl*
end;//TkwNIP.DoDoIt

class function TkwNIP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'NIP';
end;//TkwNIP.GetWordNameForRegister

function TkwNIP.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwNIP.GetResultTypeInfo

type
 TkwTUCK = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта TUCK
[panel]Копирует верхний элемент стека ниже второго элемента стека. ( x1 x2 -- x2 x1 x2 )[panel]
*Пример:*
[code]
 TUCK
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTUCK

// start class TkwTUCK

procedure TkwTUCK.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_17D731E639BC_var*
//#UC END# *4DAEEDE10285_17D731E639BC_var*
begin
//#UC START# *4DAEEDE10285_17D731E639BC_impl*
 aCtx.rEngine.TUCK;
//#UC END# *4DAEEDE10285_17D731E639BC_impl*
end;//TkwTUCK.DoDoIt

class function TkwTUCK.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'TUCK';
end;//TkwTUCK.GetWordNameForRegister

function TkwTUCK.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTUCK.GetResultTypeInfo

type
 TkwOVER = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта OVER
[panel]Помещает копию x1 на вершине стека. ( x1 x2 -- x1 x2 x1 )[panel]
*Пример:*
[code]
 OVER
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwOVER

// start class TkwOVER

procedure TkwOVER.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_3113FD88EFFC_var*
//#UC END# *4DAEEDE10285_3113FD88EFFC_var*
begin
//#UC START# *4DAEEDE10285_3113FD88EFFC_impl*
 aCtx.rEngine.OVER;
//#UC END# *4DAEEDE10285_3113FD88EFFC_impl*
end;//TkwOVER.DoDoIt

class function TkwOVER.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OVER';
end;//TkwOVER.GetWordNameForRegister

function TkwOVER.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwOVER.GetResultTypeInfo

type
 TkwROLL = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ROLL
[panel]Формат: u ROLL. 
Убрать u. Повернуть u+1 элемент на вершине стека. ( xu xu-1 ... x0 u -- xu-1 ... x0 xu )[panel]
*Пример:*
[code]
 ROLL
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwROLL

// start class TkwROLL

procedure TkwROLL.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_7A5418ADBC12_var*
//#UC END# *4DAEEDE10285_7A5418ADBC12_var*
begin
//#UC START# *4DAEEDE10285_7A5418ADBC12_impl*
 aCtx.rEngine.ROLL;
//#UC END# *4DAEEDE10285_7A5418ADBC12_impl*
end;//TkwROLL.DoDoIt

class function TkwROLL.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ROLL';
end;//TkwROLL.GetWordNameForRegister

function TkwROLL.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwROLL.GetResultTypeInfo

type
 TkwNotEquals = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта !=
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA aB != >>> l_Boolean
[code]  }
 private
 // private methods
   function NotEquals(const aCtx: TtfwContext;
    const aB: TtfwStackValue;
    const aA: TtfwStackValue): Boolean;
     {* Реализация слова скрипта != }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwNotEquals

// start class TkwNotEquals

function TkwNotEquals.NotEquals(const aCtx: TtfwContext;
  const aB: TtfwStackValue;
  const aA: TtfwStackValue): Boolean;
//#UC START# *DAC93FA73644_121F11B3416F_var*
//#UC END# *DAC93FA73644_121F11B3416F_var*
begin
//#UC START# *DAC93FA73644_121F11B3416F_impl*
 Case aA.rType of
  tfw_vtInt:
   Result := aA.AsInt <> aB.AsInt;
  tfw_vtBool:
   Result := aA.AsBoolean <> aB.AsBoolean;
  tfw_vtStr:
   Result := not l3Same(aA.AsString, aB.AsString);
  tfw_vtObj:
   Result := aA.AsObject <> aB.AsObject;
  else
  begin
   Result := false;
   BadValueType(aA.rType, aCtx);
  end;//else
 end;//Case aA.rType
//#UC END# *DAC93FA73644_121F11B3416F_impl*
end;//TkwNotEquals.NotEquals

procedure TkwNotEquals.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : TtfwStackValue;
 l_aA : TtfwStackValue;
begin
 try
  l_aB := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((NotEquals(aCtx, l_aB, l_aA)));
end;//TkwNotEquals.DoDoIt

class function TkwNotEquals.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '!=';
end;//TkwNotEquals.GetWordNameForRegister

function TkwNotEquals.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwNotEquals.GetResultTypeInfo

type
 TkwGREATER = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта GREATER
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA aB GREATER >>> l_Boolean
[code]  }
 private
 // private methods
   function GREATER(const aCtx: TtfwContext;
    const aB: TtfwStackValue;
    const aA: TtfwStackValue): Boolean;
     {* Реализация слова скрипта GREATER }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwGREATER

// start class TkwGREATER

function TkwGREATER.GREATER(const aCtx: TtfwContext;
  const aB: TtfwStackValue;
  const aA: TtfwStackValue): Boolean;
//#UC START# *907965538A11_0863B7ED4B56_var*
//#UC END# *907965538A11_0863B7ED4B56_var*
begin
//#UC START# *907965538A11_0863B7ED4B56_impl*
 Case aA.rType of
  tfw_vtInt:
   Result := aA.AsInt > aB.AsInt;
  tfw_vtBool:
   Result := aA.AsBoolean > aB.AsBoolean;
  tfw_vtStr:
   Result := l3Compare(l3PCharLen(aA.AsString), l3PCharLen(aB.AsString)) > 0;
  else
  begin
   Result := false;
   BadValueType(aA.rType, aCtx);
  end;//else
 end;//Case aA.rType
//#UC END# *907965538A11_0863B7ED4B56_impl*
end;//TkwGREATER.GREATER

procedure TkwGREATER.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : TtfwStackValue;
 l_aA : TtfwStackValue;
begin
 try
  l_aB := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((GREATER(aCtx, l_aB, l_aA)));
end;//TkwGREATER.DoDoIt

class function TkwGREATER.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GREATER';
end;//TkwGREATER.GetWordNameForRegister

function TkwGREATER.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwGREATER.GetResultTypeInfo

type
 TkwLESS = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта LESS
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA aB LESS >>> l_Boolean
[code]  }
 private
 // private methods
   function LESS(const aCtx: TtfwContext;
    const aB: TtfwStackValue;
    const aA: TtfwStackValue): Boolean;
     {* Реализация слова скрипта LESS }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwLESS

// start class TkwLESS

function TkwLESS.LESS(const aCtx: TtfwContext;
  const aB: TtfwStackValue;
  const aA: TtfwStackValue): Boolean;
//#UC START# *EAAF403E752C_2AFA590B937B_var*
//#UC END# *EAAF403E752C_2AFA590B937B_var*
begin
//#UC START# *EAAF403E752C_2AFA590B937B_impl*
 Case aA.rType of
  tfw_vtInt:
   Result := aA.AsInt < aB.AsInt;
  tfw_vtBool:
   Result := aA.AsBoolean < aB.AsBoolean;
  tfw_vtStr:
   Result := l3Compare(l3PCharLen(aA.AsString), l3PCharLen(aB.AsString)) < 0;
  else
  begin
   Result := false;
   BadValueType(aA.rType, aCtx);
  end;//else
 end;//Case aA.rType
//#UC END# *EAAF403E752C_2AFA590B937B_impl*
end;//TkwLESS.LESS

procedure TkwLESS.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : TtfwStackValue;
 l_aA : TtfwStackValue;
begin
 try
  l_aB := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((LESS(aCtx, l_aB, l_aA)));
end;//TkwLESS.DoDoIt

class function TkwLESS.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'LESS';
end;//TkwLESS.GetWordNameForRegister

function TkwLESS.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwLESS.GetResultTypeInfo

type
 TkwEquals = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ==
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aA aB == >>> l_Boolean
[code]  }
 private
 // private methods
   function Equals(const aCtx: TtfwContext;
    const aB: TtfwStackValue;
    const aA: TtfwStackValue): Boolean;
     {* Реализация слова скрипта == }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwEquals

// start class TkwEquals

function TkwEquals.Equals(const aCtx: TtfwContext;
  const aB: TtfwStackValue;
  const aA: TtfwStackValue): Boolean;
//#UC START# *7E71F9CCB18C_1A66A4BEC1B0_var*
//#UC END# *7E71F9CCB18C_1A66A4BEC1B0_var*
begin
//#UC START# *7E71F9CCB18C_1A66A4BEC1B0_impl*
 Case aA.rType of
  tfw_vtInt:
   Result := aA.AsInt = aB.AsInt;
  tfw_vtBool:
   Result := aA.AsBoolean = aB.AsBoolean;
  tfw_vtStr:
   Result := l3Same(aA.AsString, aB.AsString);
  tfw_vtObj:
   Result := aA.AsObject = aB.AsObject;
  else
  begin
   Result := false;
   BadValueType(aA.rType, aCtx);
  end;//else
 end;//Case aA.rType
//#UC END# *7E71F9CCB18C_1A66A4BEC1B0_impl*
end;//TkwEquals.Equals

procedure TkwEquals.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : TtfwStackValue;
 l_aA : TtfwStackValue;
begin
 try
  l_aB := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((Equals(aCtx, l_aB, l_aA)));
end;//TkwEquals.DoDoIt

class function TkwEquals.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '==';
end;//TkwEquals.GetWordNameForRegister

function TkwEquals.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwEquals.GetResultTypeInfo

type
 TkwLessThanZero = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта <0
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aB <0 >>> l_Boolean
[code]  }
 private
 // private methods
   function LessThanZero(const aCtx: TtfwContext;
    aB: Integer): Boolean;
     {* Реализация слова скрипта <0 }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwLessThanZero

// start class TkwLessThanZero

function TkwLessThanZero.LessThanZero(const aCtx: TtfwContext;
  aB: Integer): Boolean;
//#UC START# *76343505B981_AD14C7183370_var*
//#UC END# *76343505B981_AD14C7183370_var*
begin
//#UC START# *76343505B981_AD14C7183370_impl*
 Result := (aB < 0);
//#UC END# *76343505B981_AD14C7183370_impl*
end;//TkwLessThanZero.LessThanZero

procedure TkwLessThanZero.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((LessThanZero(aCtx, l_aB)));
end;//TkwLessThanZero.DoDoIt

class function TkwLessThanZero.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '<0';
end;//TkwLessThanZero.GetWordNameForRegister

function TkwLessThanZero.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwLessThanZero.GetResultTypeInfo

type
 TkwGreaterThanZero = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта >0
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aB >0 >>> l_Boolean
[code]  }
 private
 // private methods
   function GreaterThanZero(const aCtx: TtfwContext;
    aB: Integer): Boolean;
     {* Реализация слова скрипта >0 }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwGreaterThanZero

// start class TkwGreaterThanZero

function TkwGreaterThanZero.GreaterThanZero(const aCtx: TtfwContext;
  aB: Integer): Boolean;
//#UC START# *1832AF7A2450_CC7B740D2755_var*
//#UC END# *1832AF7A2450_CC7B740D2755_var*
begin
//#UC START# *1832AF7A2450_CC7B740D2755_impl*
 Result := (aB > 0);
//#UC END# *1832AF7A2450_CC7B740D2755_impl*
end;//TkwGreaterThanZero.GreaterThanZero

procedure TkwGreaterThanZero.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((GreaterThanZero(aCtx, l_aB)));
end;//TkwGreaterThanZero.DoDoIt

class function TkwGreaterThanZero.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '>0';
end;//TkwGreaterThanZero.GetWordNameForRegister

function TkwGreaterThanZero.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwGreaterThanZero.GetResultTypeInfo

type
 TkwBitAnd = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта &
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB & >>> l_Integer
[code]  }
 private
 // private methods
   function BitAnd(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта & }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBitAnd

// start class TkwBitAnd

function TkwBitAnd.BitAnd(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *B61F439AC566_0E401EC02EF4_var*
//#UC END# *B61F439AC566_0E401EC02EF4_var*
begin
//#UC START# *B61F439AC566_0E401EC02EF4_impl*
 Result := aA AND aB;
//#UC END# *B61F439AC566_0E401EC02EF4_impl*
end;//TkwBitAnd.BitAnd

procedure TkwBitAnd.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((BitAnd(aCtx, l_aB, l_aA)));
end;//TkwBitAnd.DoDoIt

class function TkwBitAnd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '&';
end;//TkwBitAnd.GetWordNameForRegister

function TkwBitAnd.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwBitAnd.GetResultTypeInfo

type
 TkwBitOR = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта |
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aA aB | >>> l_Integer
[code]  }
 private
 // private methods
   function BitOR(const aCtx: TtfwContext;
    aB: Integer;
    aA: Integer): Integer;
     {* Реализация слова скрипта | }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBitOR

// start class TkwBitOR

function TkwBitOR.BitOR(const aCtx: TtfwContext;
  aB: Integer;
  aA: Integer): Integer;
//#UC START# *13EB96AAB427_69326D5123FC_var*
//#UC END# *13EB96AAB427_69326D5123FC_var*
begin
//#UC START# *13EB96AAB427_69326D5123FC_impl*
 Result := aA OR aB;
//#UC END# *13EB96AAB427_69326D5123FC_impl*
end;//TkwBitOR.BitOR

procedure TkwBitOR.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aA : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aA := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aA: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((BitOR(aCtx, l_aB, l_aA)));
end;//TkwBitOR.DoDoIt

class function TkwBitOR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '|';
end;//TkwBitOR.GetWordNameForRegister

function TkwBitOR.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwBitOR.GetResultTypeInfo

type
 TkwBitNot = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ~
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aB ~ >>> l_Integer
[code]  }
 private
 // private methods
   function BitNot(const aCtx: TtfwContext;
    aB: Integer): Integer;
     {* Реализация слова скрипта ~ }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwBitNot

// start class TkwBitNot

function TkwBitNot.BitNot(const aCtx: TtfwContext;
  aB: Integer): Integer;
//#UC START# *B69DB28A46FE_7DACF7561AEE_var*
//#UC END# *B69DB28A46FE_7DACF7561AEE_var*
begin
//#UC START# *B69DB28A46FE_7DACF7561AEE_impl*
 Result := not aB;
//#UC END# *B69DB28A46FE_7DACF7561AEE_impl*
end;//TkwBitNot.BitNot

procedure TkwBitNot.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
begin
 try
  l_aB := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aB: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((BitNot(aCtx, l_aB)));
end;//TkwBitNot.DoDoIt

class function TkwBitNot.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '~';
end;//TkwBitNot.GetWordNameForRegister

function TkwBitNot.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwBitNot.GetResultTypeInfo

type
 TkwStackLevel = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта StackLevel
[panel]Текущий уровень стека[panel]
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 StackLevel >>> l_Integer
[code]  }
 private
 // private methods
   function StackLevel(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта StackLevel }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStackLevel

// start class TkwStackLevel

function TkwStackLevel.StackLevel(const aCtx: TtfwContext): Integer;
//#UC START# *42FCDB4340A7_3C430AEBDFB3_var*
//#UC END# *42FCDB4340A7_3C430AEBDFB3_var*
begin
//#UC START# *42FCDB4340A7_3C430AEBDFB3_impl*
 Result := aCtx.rEngine.ValuesCount;
//#UC END# *42FCDB4340A7_3C430AEBDFB3_impl*
end;//TkwStackLevel.StackLevel

procedure TkwStackLevel.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((StackLevel(aCtx)));
end;//TkwStackLevel.DoDoIt

class function TkwStackLevel.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StackLevel';
end;//TkwStackLevel.GetWordNameForRegister

function TkwStackLevel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStackLevel.GetResultTypeInfo

type
 TkwReduceStackLevel = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ReduceStackLevel
*Пример:*
[code]
 aValue ReduceStackLevel
[code]  }
 private
 // private methods
   procedure ReduceStackLevel(const aCtx: TtfwContext;
    aValue: Integer);
     {* Реализация слова скрипта ReduceStackLevel }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwReduceStackLevel

// start class TkwReduceStackLevel

procedure TkwReduceStackLevel.ReduceStackLevel(const aCtx: TtfwContext;
  aValue: Integer);
//#UC START# *8AD57442466F_50820082E666_var*
//#UC END# *8AD57442466F_50820082E666_var*
begin
//#UC START# *8AD57442466F_50820082E666_impl*
 while (aCtx.rEngine.ValuesCount > aValue) do
  aCtx.rEngine.Drop;
//#UC END# *8AD57442466F_50820082E666_impl*
end;//TkwReduceStackLevel.ReduceStackLevel

procedure TkwReduceStackLevel.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Integer;
begin
 try
  l_aValue := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ReduceStackLevel(aCtx, l_aValue);
end;//TkwReduceStackLevel.DoDoIt

class function TkwReduceStackLevel.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ReduceStackLevel';
end;//TkwReduceStackLevel.GetWordNameForRegister

function TkwReduceStackLevel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwReduceStackLevel.GetResultTypeInfo

type
 TkwCtxParserPushString = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:Parser:PushString
*Пример:*
[code]
 aValue Ctx:Parser:PushString
[code]  }
 private
 // private methods
   procedure CtxParserPushString(const aCtx: TtfwContext;
    const aValue: Il3CString);
     {* Реализация слова скрипта Ctx:Parser:PushString }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxParserPushString

// start class TkwCtxParserPushString

procedure TkwCtxParserPushString.CtxParserPushString(const aCtx: TtfwContext;
  const aValue: Il3CString);
//#UC START# *8E726023F8EB_D8442EFB554F_var*
//#UC END# *8E726023F8EB_D8442EFB554F_var*
begin
//#UC START# *8E726023F8EB_D8442EFB554F_impl*
 aCtx.rParser.PushString(aValue);
//#UC END# *8E726023F8EB_D8442EFB554F_impl*
end;//TkwCtxParserPushString.CtxParserPushString

procedure TkwCtxParserPushString.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Il3CString;
begin
 try
  l_aValue := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CtxParserPushString(aCtx, l_aValue);
end;//TkwCtxParserPushString.DoDoIt

class function TkwCtxParserPushString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:Parser:PushString';
end;//TkwCtxParserPushString.GetWordNameForRegister

function TkwCtxParserPushString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCtxParserPushString.GetResultTypeInfo

type
 TkwCtxParserPushSymbol = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:Parser:PushSymbol
*Пример:*
[code]
 aValue Ctx:Parser:PushSymbol
[code]  }
 private
 // private methods
   procedure CtxParserPushSymbol(const aCtx: TtfwContext;
    const aValue: Il3CString);
     {* Реализация слова скрипта Ctx:Parser:PushSymbol }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxParserPushSymbol

// start class TkwCtxParserPushSymbol

procedure TkwCtxParserPushSymbol.CtxParserPushSymbol(const aCtx: TtfwContext;
  const aValue: Il3CString);
//#UC START# *4FE75C990836_7CF3976BA94E_var*
//#UC END# *4FE75C990836_7CF3976BA94E_var*
begin
//#UC START# *4FE75C990836_7CF3976BA94E_impl*
 aCtx.rParser.PushSymbol(aValue);
//#UC END# *4FE75C990836_7CF3976BA94E_impl*
end;//TkwCtxParserPushSymbol.CtxParserPushSymbol

procedure TkwCtxParserPushSymbol.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Il3CString;
begin
 try
  l_aValue := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CtxParserPushSymbol(aCtx, l_aValue);
end;//TkwCtxParserPushSymbol.DoDoIt

class function TkwCtxParserPushSymbol.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:Parser:PushSymbol';
end;//TkwCtxParserPushSymbol.GetWordNameForRegister

function TkwCtxParserPushSymbol.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCtxParserPushSymbol.GetResultTypeInfo

type
 TkwCtxParserPushInt = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:Parser:PushInt
*Пример:*
[code]
 aValue Ctx:Parser:PushInt
[code]  }
 private
 // private methods
   procedure CtxParserPushInt(const aCtx: TtfwContext;
    aValue: Integer);
     {* Реализация слова скрипта Ctx:Parser:PushInt }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxParserPushInt

// start class TkwCtxParserPushInt

procedure TkwCtxParserPushInt.CtxParserPushInt(const aCtx: TtfwContext;
  aValue: Integer);
//#UC START# *281A6BDFE308_6506A524A1D6_var*
//#UC END# *281A6BDFE308_6506A524A1D6_var*
begin
//#UC START# *281A6BDFE308_6506A524A1D6_impl*
 aCtx.rParser.PushInt(aValue);
//#UC END# *281A6BDFE308_6506A524A1D6_impl*
end;//TkwCtxParserPushInt.CtxParserPushInt

procedure TkwCtxParserPushInt.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Integer;
begin
 try
  l_aValue := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CtxParserPushInt(aCtx, l_aValue);
end;//TkwCtxParserPushInt.DoDoIt

class function TkwCtxParserPushInt.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:Parser:PushInt';
end;//TkwCtxParserPushInt.GetWordNameForRegister

function TkwCtxParserPushInt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCtxParserPushInt.GetResultTypeInfo

type
 TkwCtxParser = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:Parser
*Тип результата:* ItfwParserEx
*Пример:*
[code]
INTERFACE VAR l_ItfwParserEx
 Ctx:Parser >>> l_ItfwParserEx
[code]  }
 private
 // private methods
   function CtxParser(const aCtx: TtfwContext): ItfwParserEx;
     {* Реализация слова скрипта Ctx:Parser }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxParser

// start class TkwCtxParser

function TkwCtxParser.CtxParser(const aCtx: TtfwContext): ItfwParserEx;
//#UC START# *E7656563CEDD_31E4D21646AB_var*
//#UC END# *E7656563CEDD_31E4D21646AB_var*
begin
//#UC START# *E7656563CEDD_31E4D21646AB_impl*
 Result := aCtx.rParser;
//#UC END# *E7656563CEDD_31E4D21646AB_impl*
end;//TkwCtxParser.CtxParser

procedure TkwCtxParser.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushIntf((CtxParser(aCtx)));
end;//TkwCtxParser.DoDoIt

class function TkwCtxParser.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:Parser';
end;//TkwCtxParser.GetWordNameForRegister

function TkwCtxParser.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwParserEx);
end;//TkwCtxParser.GetResultTypeInfo

type
 TkwAtomicIf = {final scriptword} class(TtfwWordWorkerEx)
  {* Слово скрипта ?
*Пример:*
[code]
 aCondition ? aWord
[code]  }
 private
 // private methods
   procedure AtomicIf(const aCtx: TtfwContext;
    aWord: TtfwWord;
    aCondition: Boolean);
     {* Реализация слова скрипта ? }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwAtomicIf

// start class TkwAtomicIf

procedure TkwAtomicIf.AtomicIf(const aCtx: TtfwContext;
  aWord: TtfwWord;
  aCondition: Boolean);
//#UC START# *EC03275D308E_0DAE5A00538B_var*
//#UC END# *EC03275D308E_0DAE5A00538B_var*
begin
//#UC START# *EC03275D308E_0DAE5A00538B_impl*
 if aCondition then
  aWord.DoIt(aCtx);
//#UC END# *EC03275D308E_0DAE5A00538B_impl*
end;//TkwAtomicIf.AtomicIf

class function TkwAtomicIf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '?';
end;//TkwAtomicIf.GetWordNameForRegister

procedure TkwAtomicIf.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aWord : TtfwWord;
 l_aCondition : Boolean;
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
  l_aCondition := aCtx.rEngine.PopBool;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCondition: Boolean : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 AtomicIf(aCtx, l_aWord, l_aCondition);
end;//TkwAtomicIf.DoRun

function TkwAtomicIf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwAtomicIf.GetResultTypeInfo

type
 TkwCompileValue = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CompileValue
*Пример:*
[code]
 aValue CompileValue
[code]  }
 private
 // private methods
   procedure CompileValue(const aCtx: TtfwContext;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта CompileValue }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCompileValue

// start class TkwCompileValue

procedure TkwCompileValue.CompileValue(const aCtx: TtfwContext;
  const aValue: TtfwStackValue);
//#UC START# *749E10496472_C02DF9F9363F_var*
var
 l_W : TtfwWord;
//#UC END# *749E10496472_C02DF9F9363F_var*
begin
//#UC START# *749E10496472_C02DF9F9363F_impl*
 if (aValue.rType = tfw_vtObj) AND (aValue.AsObject Is TtfwWord) then
  l_W := TtfwWord(aValue.AsObject).Use
 else
  l_W := TkwValue.Create(aValue);
 try
  RunnerAssert(l_W <> nil, 'Нет слова для компиляции', aCtx);
  aCtx.rCompiler.AddCodePart(l_W, aCtx, tfw_sniNo);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *749E10496472_C02DF9F9363F_impl*
end;//TkwCompileValue.CompileValue

procedure TkwCompileValue.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : TtfwStackValue;
begin
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CompileValue(aCtx, l_aValue);
end;//TkwCompileValue.DoDoIt

class function TkwCompileValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CompileValue';
end;//TkwCompileValue.GetWordNameForRegister

function TkwCompileValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCompileValue.GetResultTypeInfo

type
 TkwIMMEDIATE = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IMMEDIATE
*Пример:*
[code]
 IMMEDIATE
[code]  }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIMMEDIATE

// start class TkwIMMEDIATE

procedure TkwIMMEDIATE.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_6EC672F8FA27_var*
//#UC END# *4DAEEDE10285_6EC672F8FA27_var*
begin
//#UC START# *4DAEEDE10285_6EC672F8FA27_impl*
 aCtx.SetWordInfo(aCtx.rTypeInfo.IncludeModifier(tfw_wmImmediate));
//#UC END# *4DAEEDE10285_6EC672F8FA27_impl*
end;//TkwIMMEDIATE.DoDoIt

class function TkwIMMEDIATE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IMMEDIATE';
end;//TkwIMMEDIATE.GetWordNameForRegister

function TkwIMMEDIATE.IsImmediate(const aCtx: TtfwContext): Boolean;
 {-}
begin
 Result := true;
end;//TkwIMMEDIATE.IsImmediate

function TkwIMMEDIATE.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwIMMEDIATE.GetResultTypeInfo

type
 TkwCtxScriptCaller = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:ScriptCaller
*Тип результата:* ItfwScriptCaller
*Пример:*
[code]
INTERFACE VAR l_ItfwScriptCaller
 Ctx:ScriptCaller >>> l_ItfwScriptCaller
[code]  }
 private
 // private methods
   function CtxScriptCaller(const aCtx: TtfwContext): ItfwScriptCaller;
     {* Реализация слова скрипта Ctx:ScriptCaller }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxScriptCaller

// start class TkwCtxScriptCaller

function TkwCtxScriptCaller.CtxScriptCaller(const aCtx: TtfwContext): ItfwScriptCaller;
//#UC START# *7E032295C1C9_F308C4778C99_var*
//#UC END# *7E032295C1C9_F308C4778C99_var*
begin
//#UC START# *7E032295C1C9_F308C4778C99_impl*
 Result := aCtx.rCaller;
//#UC END# *7E032295C1C9_F308C4778C99_impl*
end;//TkwCtxScriptCaller.CtxScriptCaller

procedure TkwCtxScriptCaller.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushIntf((CtxScriptCaller(aCtx)));
end;//TkwCtxScriptCaller.DoDoIt

class function TkwCtxScriptCaller.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:ScriptCaller';
end;//TkwCtxScriptCaller.GetWordNameForRegister

function TkwCtxScriptCaller.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwScriptCaller);
end;//TkwCtxScriptCaller.GetResultTypeInfo

type
 TkwCtxEngine = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:Engine
*Тип результата:* ItfwScriptEngine
*Пример:*
[code]
INTERFACE VAR l_ItfwScriptEngine
 Ctx:Engine >>> l_ItfwScriptEngine
[code]  }
 private
 // private methods
   function CtxEngine(const aCtx: TtfwContext): ItfwScriptEngine;
     {* Реализация слова скрипта Ctx:Engine }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxEngine

// start class TkwCtxEngine

function TkwCtxEngine.CtxEngine(const aCtx: TtfwContext): ItfwScriptEngine;
//#UC START# *E94F373360E6_42CA0C676D88_var*
//#UC END# *E94F373360E6_42CA0C676D88_var*
begin
//#UC START# *E94F373360E6_42CA0C676D88_impl*
 Result := aCtx.rEngine;
//#UC END# *E94F373360E6_42CA0C676D88_impl*
end;//TkwCtxEngine.CtxEngine

procedure TkwCtxEngine.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushIntf((CtxEngine(aCtx)));
end;//TkwCtxEngine.DoDoIt

class function TkwCtxEngine.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:Engine';
end;//TkwCtxEngine.GetWordNameForRegister

function TkwCtxEngine.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwScriptEngine);
end;//TkwCtxEngine.GetResultTypeInfo

type
 TkwCtxStoredValuesStack = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Ctx:StoredValuesStack
*Тип результата:* ItfwStoredValuesStack
*Пример:*
[code]
INTERFACE VAR l_ItfwStoredValuesStack
 Ctx:StoredValuesStack >>> l_ItfwStoredValuesStack
[code]  }
 private
 // private methods
   function CtxStoredValuesStack(const aCtx: TtfwContext): ItfwStoredValuesStack;
     {* Реализация слова скрипта Ctx:StoredValuesStack }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCtxStoredValuesStack

// start class TkwCtxStoredValuesStack

function TkwCtxStoredValuesStack.CtxStoredValuesStack(const aCtx: TtfwContext): ItfwStoredValuesStack;
//#UC START# *6EA47AE2D452_089904B15389_var*
//#UC END# *6EA47AE2D452_089904B15389_var*
begin
//#UC START# *6EA47AE2D452_089904B15389_impl*
 Result := aCtx.rStoredValuesStack;
//#UC END# *6EA47AE2D452_089904B15389_impl*
end;//TkwCtxStoredValuesStack.CtxStoredValuesStack

procedure TkwCtxStoredValuesStack.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushIntf((CtxStoredValuesStack(aCtx)));
end;//TkwCtxStoredValuesStack.DoDoIt

class function TkwCtxStoredValuesStack.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Ctx:StoredValuesStack';
end;//TkwCtxStoredValuesStack.GetWordNameForRegister

function TkwCtxStoredValuesStack.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwStoredValuesStack);
end;//TkwCtxStoredValuesStack.GetResultTypeInfo

type
 TkwCreateAndRaise = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CreateAndRaise
[panel]Возбуждает исключение указаного класса aClass с сообщением aMessage[panel]
*Пример:*
[code]
 aMessage aClass CreateAndRaise
[code]  }
 private
 // private methods
   procedure CreateAndRaise(const aCtx: TtfwContext;
    aClass: TClass;
    const aMessage: AnsiString);
     {* Реализация слова скрипта CreateAndRaise }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCreateAndRaise

// start class TkwCreateAndRaise

procedure TkwCreateAndRaise.CreateAndRaise(const aCtx: TtfwContext;
  aClass: TClass;
  const aMessage: AnsiString);
//#UC START# *28A55B6DB9FC_19AF75640AE2_var*
type
 RException = class of Exception;
//#UC END# *28A55B6DB9FC_19AF75640AE2_var*
begin
//#UC START# *28A55B6DB9FC_19AF75640AE2_impl*
 if aClass.InheritsFrom(Exception) then
  raise RException(aClass).Create(aMessage)
 else
  RunnerError('Передан не класс исключения, а ' + aClass.ClassName, aCtx); 
//#UC END# *28A55B6DB9FC_19AF75640AE2_impl*
end;//TkwCreateAndRaise.CreateAndRaise

procedure TkwCreateAndRaise.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aClass : TClass;
 l_aMessage : AnsiString;
begin
 try
  l_aClass := aCtx.rEngine.PopClass;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aClass: TClass : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMessage := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMessage: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CreateAndRaise(aCtx, l_aClass, l_aMessage);
end;//TkwCreateAndRaise.DoDoIt

class function TkwCreateAndRaise.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CreateAndRaise';
end;//TkwCreateAndRaise.GetWordNameForRegister

function TkwCreateAndRaise.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCreateAndRaise.GetResultTypeInfo

type
 TkwCompileRef = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CompileRef
*Пример:*
[code]
 aValue CompileRef
[code]  }
 private
 // private methods
   procedure CompileRef(const aCtx: TtfwContext;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта CompileRef }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCompileRef

// start class TkwCompileRef

procedure TkwCompileRef.CompileRef(const aCtx: TtfwContext;
  const aValue: TtfwStackValue);
//#UC START# *D7798F759F29_C0A961058CA4_var*
var
 l_W : TtfwWord;
 l_PW : TkwCompiledPushWord;
//#UC END# *D7798F759F29_C0A961058CA4_var*
begin
//#UC START# *D7798F759F29_C0A961058CA4_impl*
 if (aValue.rType = tfw_vtObj) AND (aValue.AsObject Is TtfwWord) then
  l_W := TtfwWord(aValue.AsObject).Use
 else
  l_W := TkwValue.Create(aValue);
 try
  RunnerAssert(l_W <> nil, 'Нет слова для компиляции', aCtx);
  l_PW := TkwCompiledPushWord.Create(l_W, nil, aCtx);
  try
   aCtx.rCompiler.AddCodePart(l_PW, aCtx, tfw_sniNo);
  finally
   FreeAndNil(l_PW);
  end;//try..finally
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *D7798F759F29_C0A961058CA4_impl*
end;//TkwCompileRef.CompileRef

procedure TkwCompileRef.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : TtfwStackValue;
begin
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CompileRef(aCtx, l_aValue);
end;//TkwCompileRef.DoDoIt

class function TkwCompileRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CompileRef';
end;//TkwCompileRef.GetWordNameForRegister

function TkwCompileRef.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCompileRef.GetResultTypeInfo

type
 TkwCompileWeakRef = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта CompileWeakRef
*Пример:*
[code]
 aValue CompileWeakRef
[code]  }
 private
 // private methods
   procedure CompileWeakRef(const aCtx: TtfwContext;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта CompileWeakRef }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCompileWeakRef

// start class TkwCompileWeakRef

procedure TkwCompileWeakRef.CompileWeakRef(const aCtx: TtfwContext;
  const aValue: TtfwStackValue);
//#UC START# *854CA0D04456_896B70A80D41_var*
var
 l_W : TtfwWord;
//#UC END# *854CA0D04456_896B70A80D41_var*
begin
//#UC START# *854CA0D04456_896B70A80D41_impl*
 if (aValue.rType = tfw_vtObj) AND (aValue.AsObject Is TtfwWord) then
  l_W := TkwWordPtrPushWord.Create(aValue.AsObject As TtfwWord)
 else
  l_W := nil;
 try
  RunnerAssert(l_W <> nil, 'Нет слова для компиляции', aCtx);
  aCtx.rCompiler.AddCodePart(l_W, aCtx, tfw_sniNo);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *854CA0D04456_896B70A80D41_impl*
end;//TkwCompileWeakRef.CompileWeakRef

procedure TkwCompileWeakRef.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : TtfwStackValue;
begin
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 CompileWeakRef(aCtx, l_aValue);
end;//TkwCompileWeakRef.DoDoIt

class function TkwCompileWeakRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CompileWeakRef';
end;//TkwCompileWeakRef.GetWordNameForRegister

function TkwCompileWeakRef.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwCompileWeakRef.GetResultTypeInfo

type
 TkwDUPN = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DUPN
*Пример:*
[code]
 aN DUPN
[code]  }
 private
 // private methods
   procedure DUPN(const aCtx: TtfwContext;
    aN: Integer);
     {* Реализация слова скрипта DUPN }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDUPN

// start class TkwDUPN

procedure TkwDUPN.DUPN(const aCtx: TtfwContext;
  aN: Integer);
//#UC START# *90BD7A4A66F6_9A75B00E3D0A_var*
//#UC END# *90BD7A4A66F6_9A75B00E3D0A_var*
begin
//#UC START# *90BD7A4A66F6_9A75B00E3D0A_impl*
 aCtx.rEngine.DupN(aN);
//#UC END# *90BD7A4A66F6_9A75B00E3D0A_impl*
end;//TkwDUPN.DUPN

procedure TkwDUPN.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aN : Integer;
begin
 try
  l_aN := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aN: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DUPN(aCtx, l_aN);
end;//TkwDUPN.DoDoIt

class function TkwDUPN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DUPN';
end;//TkwDUPN.GetWordNameForRegister

function TkwDUPN.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDUPN.GetResultTypeInfo

type
 TkwDROPN = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта DROPN
*Пример:*
[code]
 aN DROPN
[code]  }
 private
 // private methods
   procedure DROPN(const aCtx: TtfwContext;
    aN: Integer);
     {* Реализация слова скрипта DROPN }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwDROPN

// start class TkwDROPN

procedure TkwDROPN.DROPN(const aCtx: TtfwContext;
  aN: Integer);
//#UC START# *F080EC8A46A5_938A8F1CB0B1_var*
//#UC END# *F080EC8A46A5_938A8F1CB0B1_var*
begin
//#UC START# *F080EC8A46A5_938A8F1CB0B1_impl*
 aCtx.rEngine.DropN(aN);
//#UC END# *F080EC8A46A5_938A8F1CB0B1_impl*
end;//TkwDROPN.DROPN

procedure TkwDROPN.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aN : Integer;
begin
 try
  l_aN := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aN: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 DROPN(aCtx, l_aN);
end;//TkwDROPN.DoDoIt

class function TkwDROPN.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DROPN';
end;//TkwDROPN.GetWordNameForRegister

function TkwDROPN.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwDROPN.GetResultTypeInfo

function CompareValues(const aV1: TtfwStackValue;
  const aV2: TtfwStackValue;
  const aCtx: TtfwContext;
  aCaller: TtfwWord): Boolean;
//#UC START# *4F51EE02033C_4F43A128007E_var*

 procedure CompareAsPrintable;
 begin//CompareAsPrintable
  Result := l3Same(aV1.AsPrintable, aV2.AsPrintable);
 end;//CompareAsPrintable

var
 l_C : AnsiChar;
//#UC END# *4F51EE02033C_4F43A128007E_var*
begin
//#UC START# *4F51EE02033C_4F43A128007E_impl*
 Result := false;
 if (aV1.rType = aV2.rType) then
 begin
  Case aV1.rType of
   tfw_vtVoid:
    Result := true;
   tfw_vtInt:
    Result := (aV1.rInteger = aV2.rInteger);
   tfw_vtBool:
    Result := (aV1.AsBoolean = aV2.AsBoolean);
   tfw_vtStr:
    Result := l3Same(aV1.AsString, aV2.AsString);
   tfw_vtObj:
    Result := (aV1.AsObject = aV2.AsObject);
   tfw_vtList:
    Result := (aV1.AsIntf = aV2.AsIntf);
   tfw_vtIntf:
    Result := (aV1.AsIntf = aV2.AsIntf);
   tfw_vtNil:
    Result := true;
   tfw_vtFile:
    Result := (aV1.AsIntf = aV2.AsIntf);
   tfw_vtChar:
    Result := (aV1.AsChar = aV2.AsChar);
   tfw_vtWStr:
    Result := l3Same(aV1.AsWString, aV2.AsWString);
   tfw_vtBracket:
    Result := true;
   else
    aCaller.RunnerError('Неизвестный тип для сравнения', aCtx);
  end;//aV1.rType
 end//aV1.rType = aV2.rType
 else
 begin
  Case aV1.rType of
(*   tfw_svtVoid:
    Result := true;
   tfw_svtInt:
    Result := (aV1.rInteger = aV2.rInteger);
   tfw_svtBool:
    Result := (aV1.AsBoolean = aV2.AsBoolean);*)
   tfw_vtStr:
   begin
    Case aV2.rType of
     tfw_vtWStr:
      Result := l3Same(aV1.AsString.AsWStr, aV2.AsWString);
     tfw_vtChar:
     begin
      l_C := aV2.AsChar;
      Result := l3Same(aV1.AsString.AsWStr, l3PCharLen(@l_C, 1, CP_ANSI));
     end;//tfw_svtChar
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   end;//tfw_svtStr
   tfw_vtObj:
    Case aV2.rType of
     tfw_vtNil:
      Result := (aV1.AsObject = nil);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   tfw_vtIntf:
    Case aV2.rType of
     tfw_vtNil:
      Result := (aV1.AsIntf = nil);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   tfw_vtNil:
    Case aV2.rType of
     tfw_vtIntf:
      Result := (aV2.AsIntf = nil);
     tfw_vtObj:
      Result := (aV2.AsObject = nil);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
(*   tfw_svtFile:
    Result := (aV1.AsIntf = aV2.AsIntf);*)
   tfw_vtChar:
   begin
    l_C := aV1.AsChar;
    Case aV2.rType of
     tfw_vtStr:
      Result := l3Same(l3PCharLen(@l_C, 1, CP_ANSI), aV2.AsString.AsWStr);
     tfw_vtWStr:
      Result := l3Same(l3PCharLen(@l_C, 1, CP_ANSI), aV2.AsWString);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   end;//tfw_svtChar
   tfw_vtWStr:
    Case aV2.rType of
     tfw_vtStr:
      Result := l3Same(aV1.AsWString, aV2.AsString.AsWStr);
     tfw_vtChar:
     begin
      l_C := aV2.AsChar;
      Result := l3Same(aV1.AsWString, l3PCharLen(@l_C, 1, CP_ANSI));
     end;//tfw_svtChar
     else
      CompareAsPrintable;
    end;//Case aV2.rType
(*   tfw_svtBracket:
    Result := true;*)
   else
    CompareAsPrintable;
  end;//aV1.rType
 end;//aV1.rType = aV2.rType
//#UC END# *4F51EE02033C_4F43A128007E_impl*
end;//CompareValues
// start class TkwCompiledPushWord

procedure TkwCompiledPushWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55A50F960186_var*
//#UC END# *4DAEEDE10285_55A50F960186_var*
begin
//#UC START# *4DAEEDE10285_55A50F960186_impl*
 aCtx.rEngine.PushObj(WordToWork);
//#UC END# *4DAEEDE10285_55A50F960186_impl*
end;//TkwCompiledPushWord.DoDoIt

function TkwCompiledPushWord.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_55A50F960186_var*
//#UC END# *558D2BCA0324_55A50F960186_var*
begin
//#UC START# *558D2BCA0324_55A50F960186_impl*
 Result := WordToWork;
 Result := Result.GetRef(aCtx); 
//#UC END# *558D2BCA0324_55A50F960186_impl*
end;//TkwCompiledPushWord.GetRef

function TkwCompiledPushWord.WordName: Il3CString;
//#UC START# *55AFD7DA0258_55A50F960186_var*
//#UC END# *55AFD7DA0258_55A50F960186_var*
begin
//#UC START# *55AFD7DA0258_55A50F960186_impl*
 Result := WordToWork.WordName;
//#UC END# *55AFD7DA0258_55A50F960186_impl*
end;//TkwCompiledPushWord.WordName
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Define
 TkwDefine.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwCompiledPushWord
 TkwCompiledPushWord.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
//#UC START# *551588F90151*
 TtfwClassRef.Register(EStreamError);
 TtfwClassRef.Register(EFileStreamError);
 TtfwClassRef.Register(EFCreateError);
 TtfwClassRef.Register(EFOpenError);
 TtfwClassRef.Register(EFilerError);
 TtfwClassRef.Register(EReadError);
 TtfwClassRef.Register(EWriteError);
 TtfwClassRef.Register(EClassNotFound);
 TtfwClassRef.Register(EMethodNotFound);
 TtfwClassRef.Register(EInvalidImage);
 TtfwClassRef.Register(EResNotFound);
 TtfwClassRef.Register(EListError);
 TtfwClassRef.Register(EBitsError);
 TtfwClassRef.Register(EStringListError);
 TtfwClassRef.Register(EComponentError);
 TtfwClassRef.Register(EParserError);
 TtfwClassRef.Register(EOutOfResources);
 TtfwClassRef.Register(EInvalidOperation);

 TtfwClassRef.Register(EAssertionFailed);
 TtfwClassRef.Register(EAccessViolation);
 
 TtfwClassRef.Register(ERangeError);

 TtfwClassRef.Register(EZeroDivide);
 
 TtfwClassRef.Register(EExternalException);
 TtfwClassRef.Register(EIntError);
 TtfwClassRef.Register(EDivByZero);
 TtfwClassRef.Register(EIntOverflow);

 TtfwClassRef.Register(EInvalidOp);
 TtfwClassRef.Register(EOverflow);
 TtfwClassRef.Register(EUnderflow);
 TtfwClassRef.Register(EInvalidPointer);
 TtfwClassRef.Register(EInvalidCast);
 
 TtfwClassRef.Register(EConvertError);
 TtfwClassRef.Register(EPrivilege);
 TtfwClassRef.Register(EStackOverflow);
 
 TtfwClassRef.Register(EControlC);
 
 TtfwClassRef.Register(EIntfCastError);
 
 TtfwClassRef.Register(EOSError);

 TtfwClassRef.Register(EtfwCompiler);
 TtfwClassRef.Register(EtfwRunner);
 TtfwClassRef.Register(EtfwScriptException);
 
 TtfwClassRef.Register(EtfwContinue);
 TtfwClassRef.Register(EtfwBreak);
 TtfwClassRef.Register(EtfwBreakIterator);
 TtfwClassRef.Register(EtfwExit);
 TtfwClassRef.Register(EtfwHalt);

 TtfwClassRef.Register(EtfwFail);
 TtfwClassRef.Register(EtfwManualBreak);
//#UC END# *551588F90151*
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TBasicsPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация True
 TkwTrue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация False
 TkwFalse.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Msg
 TkwMsg.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Print
 TkwPrint.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация LOOP
 TkwLOOP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация WHILEDO
 TkwWHILEDO.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BREAK
 TkwBREAK.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CONTINUE
 TkwCONTINUE.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EXIT
 TkwEXIT.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация HALT
 TkwHALT.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BREAKITERATOR
 TkwBREAKITERATOR.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация NOP
 TkwNOP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SLEEP
 TkwSLEEP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ProcessMessages
 TkwProcessMessages.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CheckAssert
 TkwCheckAssert.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ASSERTS
 TkwASSERTS.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Nil
 TkwNil.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DoWord
 TkwDoWord.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SmartEquals
 TkwSmartEquals.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SmartNotEquals
 TkwSmartNotEquals.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация PushWord
 TkwPushWord.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация current_exception
 TkwCurrentException.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация current_exception_class
 TkwCurrentExceptionClass.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация current_exception_ClassName
 TkwCurrentExceptionClassName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация current_exception_Message
 TkwCurrentExceptionMessage.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Inc
 TkwInc.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Dec
 TkwDec.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Add
 TkwAdd.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Sub
 TkwSub.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Division
 TkwDivision.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Mul
 TkwMul.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Divide
 TkwDivide.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Mul2
 TkwMul2.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Div2
 TkwDiv2.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация MulDiv
 TkwMulDiv.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BoolNot
 TkwBoolNot.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ModFromDiv
 TkwModFromDiv.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BoolAnd
 TkwBoolAnd.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BoolOr
 TkwBoolOr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация NotZero
 TkwNotZero.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EqualZero
 TkwEqualZero.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SWAP
 TkwSWAP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DROP
 TkwDROP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DUP
 TkwDUP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DUPIfNotZero
 TkwDUPIfNotZero.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ROT
 TkwROT.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация PICK
 TkwPICK.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация InvertROT
 TkwInvertROT.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SWAP2
 TkwSWAP2.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация OVER2
 TkwOVER2.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DUP2
 TkwDUP2.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DROP2
 TkwDROP2.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация NIP
 TkwNIP.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TUCK
 TkwTUCK.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация OVER
 TkwOVER.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ROLL
 TkwROLL.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация NotEquals
 TkwNotEquals.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GREATER
 TkwGREATER.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация LESS
 TkwLESS.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Equals
 TkwEquals.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация LessThanZero
 TkwLessThanZero.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GreaterThanZero
 TkwGreaterThanZero.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BitAnd
 TkwBitAnd.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BitOR
 TkwBitOR.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация BitNot
 TkwBitNot.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StackLevel
 TkwStackLevel.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ReduceStackLevel
 TkwReduceStackLevel.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_Parser_PushString
 TkwCtxParserPushString.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_Parser_PushSymbol
 TkwCtxParserPushSymbol.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_Parser_PushInt
 TkwCtxParserPushInt.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_Parser
 TkwCtxParser.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация AtomicIf
 TkwAtomicIf.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CompileValue
 TkwCompileValue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IMMEDIATE
 TkwIMMEDIATE.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_ScriptCaller
 TkwCtxScriptCaller.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_Engine
 TkwCtxEngine.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Ctx_StoredValuesStack
 TkwCtxStoredValuesStack.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CreateAndRaise
 TkwCreateAndRaise.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CompileRef
 TkwCompileRef.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CompileWeakRef
 TkwCompileWeakRef.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DUPN
 TkwDUPN.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация DROPN
 TkwDROPN.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
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
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TObject
 TtfwTypeRegistrator.RegisterType(TypeInfo(TObject));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TClass
 TtfwTypeRegistrator.RegisterType(@tfw_tiClassRef);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwParserEx
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwParserEx));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwScriptCaller
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwScriptCaller));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwScriptEngine
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwScriptEngine));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwStoredValuesStack
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwStoredValuesStack));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts

end.