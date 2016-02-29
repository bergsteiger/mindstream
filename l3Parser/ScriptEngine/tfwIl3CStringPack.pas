unit tfwIl3CStringPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwIl3CStringPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::tfwIl3CStringPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwVarWorker,
  tfwRegisterableWord,
  tfwAxiomaticsResNameGetter,
  tfwClassLike
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Types,
  l3Chars,
  tfwScriptingTypes,
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
//#UC START# *1C3B459FC59Bci*
//#UC END# *1C3B459FC59Bci*
 TtfwIl3CStringPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *1C3B459FC59Bpubl*
//#UC END# *1C3B459FC59Bpubl*
 end;//TtfwIl3CStringPackResNameGetter

// start class TtfwIl3CStringPackResNameGetter

class function TtfwIl3CStringPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'tfwIl3CStringPack';
end;//TtfwIl3CStringPackResNameGetter.ResName

 {$R tfwIl3CStringPack.res}

type
 TkwStartsStr = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта StartsStr
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aSubStr aString StartsStr >>> l_Boolean
[code]  }
 private
 // private methods
   function StartsStr(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aSubStr: Il3CString): Boolean;
     {* Реализация слова скрипта StartsStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStartsStr

// start class TkwStartsStr

function TkwStartsStr.StartsStr(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aSubStr: Il3CString): Boolean;
//#UC START# *ADBAC1D0C450_0093B3082714_var*
//#UC END# *ADBAC1D0C450_0093B3082714_var*
begin
//#UC START# *ADBAC1D0C450_0093B3082714_impl*
 Result := l3Starts(aSubStr, aString, false);
//#UC END# *ADBAC1D0C450_0093B3082714_impl*
end;//TkwStartsStr.StartsStr

procedure TkwStartsStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aSubStr : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSubStr := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSubStr: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((StartsStr(aCtx, l_aString, l_aSubStr)));
end;//TkwStartsStr.DoDoIt

class function TkwStartsStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StartsStr';
end;//TkwStartsStr.GetWordNameForRegister

function TkwStartsStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwStartsStr.GetResultTypeInfo

type
 TkwStartsText = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта StartsText
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aSubStr aString StartsText >>> l_Boolean
[code]  }
 private
 // private methods
   function StartsText(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aSubStr: Il3CString): Boolean;
     {* Реализация слова скрипта StartsText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStartsText

// start class TkwStartsText

function TkwStartsText.StartsText(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aSubStr: Il3CString): Boolean;
//#UC START# *2B44D7EFA4A8_9996D7566EDE_var*
//#UC END# *2B44D7EFA4A8_9996D7566EDE_var*
begin
//#UC START# *2B44D7EFA4A8_9996D7566EDE_impl*
 Result := l3Starts(aSubStr, aString, true);
//#UC END# *2B44D7EFA4A8_9996D7566EDE_impl*
end;//TkwStartsText.StartsText

procedure TkwStartsText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aSubStr : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSubStr := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSubStr: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((StartsText(aCtx, l_aString, l_aSubStr)));
end;//TkwStartsText.DoDoIt

class function TkwStartsText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StartsText';
end;//TkwStartsText.GetWordNameForRegister

function TkwStartsText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwStartsText.GetResultTypeInfo

type
 TkwEndsStr = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта EndsStr
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aSubStr aString EndsStr >>> l_Boolean
[code]  }
 private
 // private methods
   function EndsStr(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aSubStr: Il3CString): Boolean;
     {* Реализация слова скрипта EndsStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwEndsStr

// start class TkwEndsStr

function TkwEndsStr.EndsStr(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aSubStr: Il3CString): Boolean;
//#UC START# *E58966F67546_397C461D6C30_var*
//#UC END# *E58966F67546_397C461D6C30_var*
begin
//#UC START# *E58966F67546_397C461D6C30_impl*
 Result := l3Ends(aSubStr, aString, false);
//#UC END# *E58966F67546_397C461D6C30_impl*
end;//TkwEndsStr.EndsStr

procedure TkwEndsStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aSubStr : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSubStr := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSubStr: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((EndsStr(aCtx, l_aString, l_aSubStr)));
end;//TkwEndsStr.DoDoIt

class function TkwEndsStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EndsStr';
end;//TkwEndsStr.GetWordNameForRegister

function TkwEndsStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwEndsStr.GetResultTypeInfo

type
 TkwEndsText = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта EndsText
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aSubStr aString EndsText >>> l_Boolean
[code]  }
 private
 // private methods
   function EndsText(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aSubStr: Il3CString): Boolean;
     {* Реализация слова скрипта EndsText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwEndsText

// start class TkwEndsText

function TkwEndsText.EndsText(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aSubStr: Il3CString): Boolean;
//#UC START# *187F940B5F16_8997C15C6CA8_var*
//#UC END# *187F940B5F16_8997C15C6CA8_var*
begin
//#UC START# *187F940B5F16_8997C15C6CA8_impl*
 Result := l3Ends(aSubStr, aString, true);
//#UC END# *187F940B5F16_8997C15C6CA8_impl*
end;//TkwEndsText.EndsText

procedure TkwEndsText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aSubStr : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSubStr := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSubStr: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((EndsText(aCtx, l_aString, l_aSubStr)));
end;//TkwEndsText.DoDoIt

class function TkwEndsText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EndsText';
end;//TkwEndsText.GetWordNameForRegister

function TkwEndsText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwEndsText.GetResultTypeInfo

type
 TkwSameStr = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта SameStr
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 anOther aString SameStr >>> l_Boolean
[code]  }
 private
 // private methods
   function SameStr(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString): Boolean;
     {* Реализация слова скрипта SameStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSameStr

// start class TkwSameStr

function TkwSameStr.SameStr(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString): Boolean;
//#UC START# *4D25C99A6BEB_2309401B7CC1_var*
//#UC END# *4D25C99A6BEB_2309401B7CC1_var*
begin
//#UC START# *4D25C99A6BEB_2309401B7CC1_impl*
 Result := l3Same(aString, anOther, false);
//#UC END# *4D25C99A6BEB_2309401B7CC1_impl*
end;//TkwSameStr.SameStr

procedure TkwSameStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SameStr(aCtx, l_aString, l_anOther)));
end;//TkwSameStr.DoDoIt

class function TkwSameStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SameStr';
end;//TkwSameStr.GetWordNameForRegister

function TkwSameStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSameStr.GetResultTypeInfo

type
 TkwSameText = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта SameText
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 anOther aString SameText >>> l_Boolean
[code]  }
 private
 // private methods
   function SameText(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString): Boolean;
     {* Реализация слова скрипта SameText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSameText

// start class TkwSameText

function TkwSameText.SameText(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString): Boolean;
//#UC START# *883992DDC504_9FC28ACB9AA1_var*
//#UC END# *883992DDC504_9FC28ACB9AA1_var*
begin
//#UC START# *883992DDC504_9FC28ACB9AA1_impl*
 Result := l3Same(aString, anOther, true);
//#UC END# *883992DDC504_9FC28ACB9AA1_impl*
end;//TkwSameText.SameText

procedure TkwSameText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SameText(aCtx, l_aString, l_anOther)));
end;//TkwSameText.DoDoIt

class function TkwSameText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SameText';
end;//TkwSameText.GetWordNameForRegister

function TkwSameText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSameText.GetResultTypeInfo

type
 TkwCompareStr = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта CompareStr
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 anOther aString CompareStr >>> l_Integer
[code]  }
 private
 // private methods
   function CompareStr(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString): Integer;
     {* Реализация слова скрипта CompareStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCompareStr

// start class TkwCompareStr

function TkwCompareStr.CompareStr(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString): Integer;
//#UC START# *60E71D4C9014_C670925F6482_var*
//#UC END# *60E71D4C9014_C670925F6482_var*
begin
//#UC START# *60E71D4C9014_C670925F6482_impl*
 Result := l3Compare(l3PCharLen(anOther), l3PCharLen(aString));
//#UC END# *60E71D4C9014_C670925F6482_impl*
end;//TkwCompareStr.CompareStr

procedure TkwCompareStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((CompareStr(aCtx, l_aString, l_anOther)));
end;//TkwCompareStr.DoDoIt

class function TkwCompareStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CompareStr';
end;//TkwCompareStr.GetWordNameForRegister

function TkwCompareStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwCompareStr.GetResultTypeInfo

type
 TkwCompareText = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта CompareText
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 anOther aString CompareText >>> l_Integer
[code]  }
 private
 // private methods
   function CompareText(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString): Integer;
     {* Реализация слова скрипта CompareText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCompareText

// start class TkwCompareText

function TkwCompareText.CompareText(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString): Integer;
//#UC START# *53DA3FC40405_0E02A0729BA6_var*
//#UC END# *53DA3FC40405_0E02A0729BA6_var*
begin
//#UC START# *53DA3FC40405_0E02A0729BA6_impl*
 Result := l3Compare(l3PCharLen(anOther), l3PCharLen(aString), l3_siCaseUnsensitive);
//#UC END# *53DA3FC40405_0E02A0729BA6_impl*
end;//TkwCompareText.CompareText

procedure TkwCompareText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((CompareText(aCtx, l_aString, l_anOther)));
end;//TkwCompareText.DoDoIt

class function TkwCompareText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CompareText';
end;//TkwCompareText.GetWordNameForRegister

function TkwCompareText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwCompareText.GetResultTypeInfo

type
 TkwStrToInt = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта StrToInt
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aString StrToInt >>> l_Integer
[code]  }
 private
 // private methods
   function StrToInt(const aCtx: TtfwContext;
    const aString: Il3CString): Integer;
     {* Реализация слова скрипта StrToInt }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStrToInt

// start class TkwStrToInt

function TkwStrToInt.StrToInt(const aCtx: TtfwContext;
  const aString: Il3CString): Integer;
//#UC START# *108F78D959BF_09008856C703_var*
//#UC END# *108F78D959BF_09008856C703_var*
begin
//#UC START# *108F78D959BF_09008856C703_impl*
 Result := SysUtils.StrToInt(l3Str(aString));
//#UC END# *108F78D959BF_09008856C703_impl*
end;//TkwStrToInt.StrToInt

procedure TkwStrToInt.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StrToInt(aCtx, l_aString)));
end;//TkwStrToInt.DoDoIt

class function TkwStrToInt.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StrToInt';
end;//TkwStrToInt.GetWordNameForRegister

function TkwStrToInt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStrToInt.GetResultTypeInfo

type
 TkwCat = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Cat
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 anOther aString Cat >>> l_Il3CString
[code]  }
 private
 // private methods
   function Cat(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString): Il3CString;
     {* Реализация слова скрипта Cat }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCat

// start class TkwCat

function TkwCat.Cat(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString): Il3CString;
//#UC START# *0AEEC1805BCE_DD57CECF347C_var*
//#UC END# *0AEEC1805BCE_DD57CECF347C_var*
begin
//#UC START# *0AEEC1805BCE_DD57CECF347C_impl*
 Result := TtfwCStringFactory.C(l3Cat([anOther, aString]));
//#UC END# *0AEEC1805BCE_DD57CECF347C_impl*
end;//TkwCat.Cat

procedure TkwCat.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Cat(aCtx, l_aString, l_anOther)));
end;//TkwCat.DoDoIt

class function TkwCat.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Cat';
end;//TkwCat.GetWordNameForRegister

function TkwCat.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwCat.GetResultTypeInfo

type
 TkwStringConsistsOf = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:ConsistsOf
[panel]Проверяет, что строка aString состоит ТОЛЬКО из символов строки aDelims[panel]
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aDelims aString string:ConsistsOf >>> l_Boolean
[code]  }
 private
 // private methods
   function StringConsistsOf(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aDelims: Il3CString): Boolean;
     {* Реализация слова скрипта string:ConsistsOf }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringConsistsOf

// start class TkwStringConsistsOf

function TkwStringConsistsOf.StringConsistsOf(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aDelims: Il3CString): Boolean;
//#UC START# *C17F9AF1604A_5F306006344B_var*
var
 l_S1 : Tl3WString;
 l_S2 : Tl3WString;
 l_C : TChars;
 l_Index : Integer;
//#UC END# *C17F9AF1604A_5F306006344B_var*
begin
//#UC START# *C17F9AF1604A_5F306006344B_impl*
 l_S1 := l3PCharLen(aDelims);
 l_S2 := l3PCharLen(aString);
 if l3IsNil(l_S1) then
  Result := l3IsNil(l_S2)
  // - любая непустая не может состоять ТОЛЬКО из символов пустого множества 
 else
 if (l_S1.SLen = 1) then
  Result := l3AllCharsInCharSet(l_S2, [l_S1.S[0]])
 else
 begin
  l_C := [];
  for l_Index := 0 to Pred(l_S1.SLen) do
   l_C := l_C + [l_S1.S[l_Index]];
  Result := l3AllCharsInCharSet(l_S2, l_C);
 end;//l_S1.SLen = 1
//#UC END# *C17F9AF1604A_5F306006344B_impl*
end;//TkwStringConsistsOf.StringConsistsOf

procedure TkwStringConsistsOf.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aDelims : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDelims := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDelims: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((StringConsistsOf(aCtx, l_aString, l_aDelims)));
end;//TkwStringConsistsOf.DoDoIt

class function TkwStringConsistsOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:ConsistsOf';
end;//TkwStringConsistsOf.GetWordNameForRegister

function TkwStringConsistsOf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwStringConsistsOf.GetResultTypeInfo

type
 TkwStringHasAnyOf = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:HasAnyOf
[panel]Проверяет, что строка aString содержит хотя бы один символ из aDelims[panel]
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aDelims aString string:HasAnyOf >>> l_Boolean
[code]  }
 private
 // private methods
   function StringHasAnyOf(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aDelims: Il3CString): Boolean;
     {* Реализация слова скрипта string:HasAnyOf }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringHasAnyOf

// start class TkwStringHasAnyOf

function TkwStringHasAnyOf.StringHasAnyOf(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aDelims: Il3CString): Boolean;
//#UC START# *4E5E3C364C71_2256016890B3_var*
var
 l_S1 : Tl3WString;
 l_S2 : Tl3WString;
 l_C : TChars;
 l_Index : Integer;
//#UC END# *4E5E3C364C71_2256016890B3_var*
begin
//#UC START# *4E5E3C364C71_2256016890B3_impl*
 l_S1 := l3PCharLen(aDelims);
 l_S2 := l3PCharLen(aString);
 if l3IsNil(l_S1) then
  Result := true
  // - любая строка содержит символы из пустого множества, считаем так
 else
 if (l_S1.SLen = 1) then
  Result := l3CharSetPresent(l_S2, [l_S1.S[0]])
 else
 begin
  l_C := [];
  for l_Index := 0 to Pred(l_S1.SLen) do
   l_C := l_C + [l_S1.S[l_Index]];
  Result := l3CharSetPresent(l_S2, l_C);
 end;//l_S1.SLen = 1
//#UC END# *4E5E3C364C71_2256016890B3_impl*
end;//TkwStringHasAnyOf.StringHasAnyOf

procedure TkwStringHasAnyOf.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aDelims : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDelims := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDelims: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((StringHasAnyOf(aCtx, l_aString, l_aDelims)));
end;//TkwStringHasAnyOf.DoDoIt

class function TkwStringHasAnyOf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:HasAnyOf';
end;//TkwStringHasAnyOf.GetWordNameForRegister

function TkwStringHasAnyOf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwStringHasAnyOf.GetResultTypeInfo

type
 TkwStringPos = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:Pos
[panel]'мама рыла яму' 'ры' string:Pos .[panel]
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 anOther aString string:Pos >>> l_Integer
[code]  }
 private
 // private methods
   function StringPos(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString): Integer;
     {* Реализация слова скрипта string:Pos }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringPos

// start class TkwStringPos

function TkwStringPos.StringPos(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString): Integer;
//#UC START# *A3206F78A2FD_851E99BEB53B_var*
//#UC END# *A3206F78A2FD_851E99BEB53B_var*
begin
//#UC START# *A3206F78A2FD_851E99BEB53B_impl*
 Result := l3Pos(anOther, aString);
//#UC END# *A3206F78A2FD_851E99BEB53B_impl*
end;//TkwStringPos.StringPos

procedure TkwStringPos.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StringPos(aCtx, l_aString, l_anOther)));
end;//TkwStringPos.DoDoIt

class function TkwStringPos.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:Pos';
end;//TkwStringPos.GetWordNameForRegister

function TkwStringPos.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStringPos.GetResultTypeInfo

type
 TkwStringPosEx = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:PosEx
[panel]6 'мама рыла рыло' 'ры' string:PosEx .[panel]
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aPos anOther aString string:PosEx >>> l_Integer
[code]  }
 private
 // private methods
   function StringPosEx(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString;
    aPos: Integer): Integer;
     {* Реализация слова скрипта string:PosEx }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringPosEx

// start class TkwStringPosEx

function TkwStringPosEx.StringPosEx(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString;
  aPos: Integer): Integer;
//#UC START# *F7FE00F8B33E_24901BF384F4_var*
//#UC END# *F7FE00F8B33E_24901BF384F4_var*
begin
//#UC START# *F7FE00F8B33E_24901BF384F4_impl*
 Result := l3PosEx(anOther, aString, aPos);
//#UC END# *F7FE00F8B33E_24901BF384F4_impl*
end;//TkwStringPosEx.StringPosEx

procedure TkwStringPosEx.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
 l_aPos : Integer;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aPos := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPos: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StringPosEx(aCtx, l_aString, l_anOther, l_aPos)));
end;//TkwStringPosEx.DoDoIt

class function TkwStringPosEx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:PosEx';
end;//TkwStringPosEx.GetWordNameForRegister

function TkwStringPosEx.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStringPosEx.GetResultTypeInfo

type
 TkwStringSplit = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:Split
[panel]Разделяет строку на две по заданному разделителю.

Пример:
[code]
'ABC:DEF' ':' string:Split
[code]
Получаем на стеке:
'ABC' ':DEF'[panel]
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_theTail
STRING VAR l_Il3CString
 anOther aString string:Split >>> l_theTail >>> l_Il3CString
[code]  }
 private
 // private methods
   function StringSplit(const aCtx: TtfwContext;
    const aString: Il3CString;
    const anOther: Il3CString;
    out theTail: Il3CString): Il3CString;
     {* Реализация слова скрипта string:Split }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringSplit

// start class TkwStringSplit

function TkwStringSplit.StringSplit(const aCtx: TtfwContext;
  const aString: Il3CString;
  const anOther: Il3CString;
  out theTail: Il3CString): Il3CString;
//#UC START# *2D11D07B402C_AA63BC1F51EC_var*
var
(* l_P : Il3CString;
 l_S : Il3CString;*)
 l_Len : Integer;
//#UC END# *2D11D07B402C_AA63BC1F51EC_var*
begin
//#UC START# *2D11D07B402C_AA63BC1F51EC_impl*
 l_Len := l3Len(aString);
 if (l_Len = 1) then
  l3Split(anOther, l3Char(aString, 0), Result, theTail)
 else
  l3Split(anOther, aString, Result, theTail);
(* if (l_Len = 1) then
  l3Split(anOther, l3Char(aString, 0), l_P, l_S)
 else
  l3Split(anOther, aString, l_P, l_S);
 aCtx.rEngine.PushString(l_P);
 aCtx.rEngine.PushString(l_S);*)
//#UC END# *2D11D07B402C_AA63BC1F51EC_impl*
end;//TkwStringSplit.StringSplit

procedure TkwStringSplit.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anOther : Il3CString;
 l_theTail : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((StringSplit(aCtx, l_aString, l_anOther, l_theTail)));
 aCtx.rEngine.PushString(l_theTail);
end;//TkwStringSplit.DoDoIt

class function TkwStringSplit.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:Split';
end;//TkwStringSplit.GetWordNameForRegister

function TkwStringSplit.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwStringSplit.GetResultTypeInfo

type
 TkwStringReplace = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:Replace
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aMain aFrom aString string:Replace >>> l_Il3CString
[code]  }
 private
 // private methods
   function StringReplace(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aFrom: Il3CString;
    const aMain: Il3CString): Il3CString;
     {* Реализация слова скрипта string:Replace }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringReplace

// start class TkwStringReplace

function TkwStringReplace.StringReplace(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aFrom: Il3CString;
  const aMain: Il3CString): Il3CString;
//#UC START# *DD442A0F03CD_8CA688C2805E_var*
//#UC END# *DD442A0F03CD_8CA688C2805E_var*
begin
//#UC START# *DD442A0F03CD_8CA688C2805E_impl*
 Result := l3StringReplace(aMain,
                           l3PCharLen(aFrom),
                           l3PCharLen(aString), [rfReplaceAll])
//#UC END# *DD442A0F03CD_8CA688C2805E_impl*
end;//TkwStringReplace.StringReplace

procedure TkwStringReplace.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aFrom : Il3CString;
 l_aMain : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFrom := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFrom: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMain := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMain: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((StringReplace(aCtx, l_aString, l_aFrom, l_aMain)));
end;//TkwStringReplace.DoDoIt

class function TkwStringReplace.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:Replace';
end;//TkwStringReplace.GetWordNameForRegister

function TkwStringReplace.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwStringReplace.GetResultTypeInfo

type
 TkwStringReplaceFirst = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:ReplaceFirst
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aMain aFrom aString string:ReplaceFirst >>> l_Il3CString
[code]  }
 private
 // private methods
   function StringReplaceFirst(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aFrom: Il3CString;
    const aMain: Il3CString): Il3CString;
     {* Реализация слова скрипта string:ReplaceFirst }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringReplaceFirst

// start class TkwStringReplaceFirst

function TkwStringReplaceFirst.StringReplaceFirst(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aFrom: Il3CString;
  const aMain: Il3CString): Il3CString;
//#UC START# *9B83E2E03D3D_FF1E0A42BBEF_var*
//#UC END# *9B83E2E03D3D_FF1E0A42BBEF_var*
begin
//#UC START# *9B83E2E03D3D_FF1E0A42BBEF_impl*
 Result := l3StringReplace(aMain,
                           l3PCharLen(aFrom),
                           l3PCharLen(aString), [{rfReplaceAll}])
//#UC END# *9B83E2E03D3D_FF1E0A42BBEF_impl*
end;//TkwStringReplaceFirst.StringReplaceFirst

procedure TkwStringReplaceFirst.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aFrom : Il3CString;
 l_aMain : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFrom := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFrom: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMain := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMain: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((StringReplaceFirst(aCtx, l_aString, l_aFrom, l_aMain)));
end;//TkwStringReplaceFirst.DoDoIt

class function TkwStringReplaceFirst.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:ReplaceFirst';
end;//TkwStringReplaceFirst.GetWordNameForRegister

function TkwStringReplaceFirst.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwStringReplaceFirst.GetResultTypeInfo

type
 TkwTextReplace = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта text:Replace
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aMain aFrom aString text:Replace >>> l_Il3CString
[code]  }
 private
 // private methods
   function TextReplace(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aFrom: Il3CString;
    const aMain: Il3CString): Il3CString;
     {* Реализация слова скрипта text:Replace }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTextReplace

// start class TkwTextReplace

function TkwTextReplace.TextReplace(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aFrom: Il3CString;
  const aMain: Il3CString): Il3CString;
//#UC START# *77C319AE08A3_6F240EDBC3AE_var*
//#UC END# *77C319AE08A3_6F240EDBC3AE_var*
begin
//#UC START# *77C319AE08A3_6F240EDBC3AE_impl*
 Result := l3StringReplace(aMain,
                           l3PCharLen(aFrom),
                           l3PCharLen(aString), [rfReplaceAll, rfIgnoreCase])
//#UC END# *77C319AE08A3_6F240EDBC3AE_impl*
end;//TkwTextReplace.TextReplace

procedure TkwTextReplace.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aFrom : Il3CString;
 l_aMain : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFrom := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFrom: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMain := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMain: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((TextReplace(aCtx, l_aString, l_aFrom, l_aMain)));
end;//TkwTextReplace.DoDoIt

class function TkwTextReplace.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'text:Replace';
end;//TkwTextReplace.GetWordNameForRegister

function TkwTextReplace.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwTextReplace.GetResultTypeInfo

type
 TkwTextReplaceFirst = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта text:ReplaceFirst
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aMain aFrom aString text:ReplaceFirst >>> l_Il3CString
[code]  }
 private
 // private methods
   function TextReplaceFirst(const aCtx: TtfwContext;
    const aString: Il3CString;
    const aFrom: Il3CString;
    const aMain: Il3CString): Il3CString;
     {* Реализация слова скрипта text:ReplaceFirst }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTextReplaceFirst

// start class TkwTextReplaceFirst

function TkwTextReplaceFirst.TextReplaceFirst(const aCtx: TtfwContext;
  const aString: Il3CString;
  const aFrom: Il3CString;
  const aMain: Il3CString): Il3CString;
//#UC START# *C0B325EEBDF3_0527F8C9DF24_var*
//#UC END# *C0B325EEBDF3_0527F8C9DF24_var*
begin
//#UC START# *C0B325EEBDF3_0527F8C9DF24_impl*
 Result := l3StringReplace(aMain,
                           l3PCharLen(aFrom),
                           l3PCharLen(aString), [{rfReplaceAll,} rfIgnoreCase])
//#UC END# *C0B325EEBDF3_0527F8C9DF24_impl*
end;//TkwTextReplaceFirst.TextReplaceFirst

procedure TkwTextReplaceFirst.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aFrom : Il3CString;
 l_aMain : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aFrom := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFrom: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMain := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMain: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((TextReplaceFirst(aCtx, l_aString, l_aFrom, l_aMain)));
end;//TkwTextReplaceFirst.DoDoIt

class function TkwTextReplaceFirst.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'text:ReplaceFirst';
end;//TkwTextReplaceFirst.GetWordNameForRegister

function TkwTextReplaceFirst.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwTextReplaceFirst.GetResultTypeInfo

type
 TkwStringChar = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:[i]
*Тип результата:* Char
*Пример:*
[code]
CHAR VAR l_Char
 anIndex aString string:[i] >>> l_Char
[code]  }
 private
 // private methods
   function StringChar(const aCtx: TtfwContext;
    const aString: Il3CString;
    anIndex: Integer): AnsiChar;
     {* Реализация слова скрипта string:[i] }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringChar

// start class TkwStringChar

function TkwStringChar.StringChar(const aCtx: TtfwContext;
  const aString: Il3CString;
  anIndex: Integer): AnsiChar;
//#UC START# *46139320DD2A_9597582C9BD4_var*
//#UC END# *46139320DD2A_9597582C9BD4_var*
begin
//#UC START# *46139320DD2A_9597582C9BD4_impl*
 Result := aString.AsWStr.S[anIndex];
//#UC END# *46139320DD2A_9597582C9BD4_impl*
end;//TkwStringChar.StringChar

procedure TkwStringChar.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_anIndex : Integer;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushChar((StringChar(aCtx, l_aString, l_anIndex)));
end;//TkwStringChar.DoDoIt

class function TkwStringChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:[i]';
end;//TkwStringChar.GetWordNameForRegister

function TkwStringChar.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiChar);
end;//TkwStringChar.GetResultTypeInfo

type
 TkwStringCodePage = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:CodePage
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aString string:CodePage >>> l_Integer
[code]  }
 private
 // private methods
   function StringCodePage(const aCtx: TtfwContext;
    const aString: Il3CString): Integer;
     {* Реализация слова скрипта string:CodePage }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringCodePage

// start class TkwStringCodePage

function TkwStringCodePage.StringCodePage(const aCtx: TtfwContext;
  const aString: Il3CString): Integer;
//#UC START# *6C0D8D8B8728_6CAF85926E0C_var*
//#UC END# *6C0D8D8B8728_6CAF85926E0C_var*
begin
//#UC START# *6C0D8D8B8728_6CAF85926E0C_impl*
 Result := aString.AsWStr.SCodePage;
//#UC END# *6C0D8D8B8728_6CAF85926E0C_impl*
end;//TkwStringCodePage.StringCodePage

procedure TkwStringCodePage.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StringCodePage(aCtx, l_aString)));
end;//TkwStringCodePage.DoDoIt

class function TkwStringCodePage.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:CodePage';
end;//TkwStringCodePage.GetWordNameForRegister

function TkwStringCodePage.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStringCodePage.GetResultTypeInfo

type
 TkwStringLen = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:Len
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aString string:Len >>> l_Integer
[code]  }
 private
 // private methods
   function StringLen(const aCtx: TtfwContext;
    const aString: Il3CString): Integer;
     {* Реализация слова скрипта string:Len }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringLen

// start class TkwStringLen

function TkwStringLen.StringLen(const aCtx: TtfwContext;
  const aString: Il3CString): Integer;
//#UC START# *1D5A300A0055_0BA6E62BEF84_var*
//#UC END# *1D5A300A0055_0BA6E62BEF84_var*
begin
//#UC START# *1D5A300A0055_0BA6E62BEF84_impl*
 if (aString = nil) then
  Result := 0
 else
  Result := aString.AsWStr.SLen;
//#UC END# *1D5A300A0055_0BA6E62BEF84_impl*
end;//TkwStringLen.StringLen

procedure TkwStringLen.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StringLen(aCtx, l_aString)));
end;//TkwStringLen.DoDoIt

class function TkwStringLen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:Len';
end;//TkwStringLen.GetWordNameForRegister

function TkwStringLen.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStringLen.GetResultTypeInfo

type
 TkwStringToChar = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта string:ToChar
*Тип результата:* Char
*Пример:*
[code]
CHAR VAR l_Char
 aString string:ToChar >>> l_Char
[code]  }
 private
 // private methods
   function StringToChar(const aCtx: TtfwContext;
    const aString: Il3CString): AnsiChar;
     {* Реализация слова скрипта string:ToChar }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStringToChar

// start class TkwStringToChar

function TkwStringToChar.StringToChar(const aCtx: TtfwContext;
  const aString: Il3CString): AnsiChar;
//#UC START# *3F9E9C8EDF9E_CA33F456975C_var*
//#UC END# *3F9E9C8EDF9E_CA33F456975C_var*
begin
//#UC START# *3F9E9C8EDF9E_CA33F456975C_impl*
 RunnerAssert(aString.AsWStr.SLen = 1, 'Длина строки должна равняться 1', aCtx);
 Result := aString.AsWStr.S[0];
//#UC END# *3F9E9C8EDF9E_CA33F456975C_impl*
end;//TkwStringToChar.StringToChar

procedure TkwStringToChar.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushChar((StringToChar(aCtx, l_aString)));
end;//TkwStringToChar.DoDoIt

class function TkwStringToChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:ToChar';
end;//TkwStringToChar.GetWordNameForRegister

function TkwStringToChar.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiChar);
end;//TkwStringToChar.GetResultTypeInfo

type
 TkwCharToString = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта char:ToString
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aChar char:ToString >>> l_Il3CString
[code]  }
 private
 // private methods
   function CharToString(const aCtx: TtfwContext;
    aChar: AnsiChar): Il3CString;
     {* Реализация слова скрипта char:ToString }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCharToString

// start class TkwCharToString

function TkwCharToString.CharToString(const aCtx: TtfwContext;
  aChar: AnsiChar): Il3CString;
//#UC START# *E29B58F41653_4C3CAF64FEF3_var*
//#UC END# *E29B58F41653_4C3CAF64FEF3_var*
begin
//#UC START# *E29B58F41653_4C3CAF64FEF3_impl*
 Result := TtfwCStringFactory.C(aChar);
//#UC END# *E29B58F41653_4C3CAF64FEF3_impl*
end;//TkwCharToString.CharToString

procedure TkwCharToString.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aChar : AnsiChar;
begin
 try
  l_aChar := aCtx.rEngine.PopChar;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aChar: AnsiChar : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((CharToString(aCtx, l_aChar)));
end;//TkwCharToString.DoDoIt

class function TkwCharToString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'char:ToString';
end;//TkwCharToString.GetWordNameForRegister

function TkwCharToString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwCharToString.GetResultTypeInfo

type
 TkwCharDupe = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта char:Dupe
[panel]Размножаем символ столько раз, сколько указано[panel]
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aCount aString char:Dupe >>> l_Il3CString
[code]  }
 private
 // private methods
   function CharDupe(const aCtx: TtfwContext;
    const aString: Il3CString;
    aCount: Integer): Il3CString;
     {* Реализация слова скрипта char:Dupe }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwCharDupe

// start class TkwCharDupe

function TkwCharDupe.CharDupe(const aCtx: TtfwContext;
  const aString: Il3CString;
  aCount: Integer): Il3CString;
//#UC START# *E230CFBF78A9_355A8C3D70FA_var*
//#UC END# *E230CFBF78A9_355A8C3D70FA_var*
begin
//#UC START# *E230CFBF78A9_355A8C3D70FA_impl*
 Result := TtfwCStringFactory.C(ev_psFixLen('', aCount, l3Char(aString, 0)));
//#UC END# *E230CFBF78A9_355A8C3D70FA_impl*
end;//TkwCharDupe.CharDupe

procedure TkwCharDupe.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aString : Il3CString;
 l_aCount : Integer;
begin
 try
  l_aString := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aString: Il3CString : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushString((CharDupe(aCtx, l_aString, l_aCount)));
end;//TkwCharDupe.DoDoIt

class function TkwCharDupe.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'char:Dupe';
end;//TkwCharDupe.GetWordNameForRegister

function TkwCharDupe.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwCharDupe.GetResultTypeInfo

type
 TkwVarDecLen = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта string:--Len!
*Пример:*
[code]
 string:--Len! aVar
[code]  }
 private
 // private methods
   procedure VarDecLen(const aCtx: TtfwContext;
    aVar: TtfwWord);
     {* Реализация слова скрипта string:--Len! }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVarDecLen

// start class TkwVarDecLen

procedure TkwVarDecLen.VarDecLen(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *9CC163BCA241_5B249AD9723E_var*
var
 l_P : Tl3PCharLen;
//#UC END# *9CC163BCA241_5B249AD9723E_var*
begin
//#UC START# *9CC163BCA241_5B249AD9723E_impl*
 Tl3WString(l_P) := l3PCharLen(aVar.GetValue(aCtx).AsString);
 Dec(l_P.SLen);
 Assert(l_P.SLen >= 0);
 aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l_P)), aCtx);
//#UC END# *9CC163BCA241_5B249AD9723E_impl*
end;//TkwVarDecLen.VarDecLen

class function TkwVarDecLen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:--Len!';
end;//TkwVarDecLen.GetWordNameForRegister

procedure TkwVarDecLen.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 VarDecLen(aCtx, l_aVar);
end;//TkwVarDecLen.DoRun

function TkwVarDecLen.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwVarDecLen.GetResultTypeInfo

type
 TkwVarInc = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта string:++!
*Пример:*
[code]
 string:++! aVar
[code]  }
 private
 // private methods
   procedure VarInc(const aCtx: TtfwContext;
    aVar: TtfwWord);
     {* Реализация слова скрипта string:++! }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVarInc

// start class TkwVarInc

procedure TkwVarInc.VarInc(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *D3130F58366C_FF4D82AA3241_var*
var
 l_P : Tl3PCharLen;
//#UC END# *D3130F58366C_FF4D82AA3241_var*
begin
//#UC START# *D3130F58366C_FF4D82AA3241_impl*
 Tl3WString(l_P) := l3PCharLen(aVar.GetValue(aCtx).AsString);
 l_P.Shift(+1);
 aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l_P)), aCtx);
//#UC END# *D3130F58366C_FF4D82AA3241_impl*
end;//TkwVarInc.VarInc

class function TkwVarInc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:++!';
end;//TkwVarInc.GetWordNameForRegister

procedure TkwVarInc.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 VarInc(aCtx, l_aVar);
end;//TkwVarInc.DoRun

function TkwVarInc.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwVarInc.GetResultTypeInfo

type
 TkwRSplitTo = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта string:RSplitTo!
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aDelim string:RSplitTo! aVar >>> l_Il3CString
[code]  }
 private
 // private methods
   function RSplitTo(const aCtx: TtfwContext;
    aVar: TtfwWord;
    const aDelim: Il3CString): Il3CString;
     {* Реализация слова скрипта string:RSplitTo! }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwRSplitTo

// start class TkwRSplitTo

function TkwRSplitTo.RSplitTo(const aCtx: TtfwContext;
  aVar: TtfwWord;
  const aDelim: Il3CString): Il3CString;
//#UC START# *6BE7506C040A_D442EF995DFF_var*
var
 l_V : Il3CString;
 l_P : Tl3PCharLen;
 l_WS : Tl3WString;
 l_Found : PAnsiChar;

 //l_Pref : Il3CString;
 //l_Suff : Il3CString;
//#UC END# *6BE7506C040A_D442EF995DFF_var*
begin
//#UC START# *6BE7506C040A_D442EF995DFF_impl*
 l_V := aVar.GetValue(aCtx).AsString;
 Tl3WString(l_P) := l3PCharLen(l_V);
 l_WS := l3PCharLen(aDelim);
 Assert(not l3IsNil(l_WS));
 Assert(l_P.SLen >= 0);
 Assert(l3IsAnsi(l_P.SCodePage));
 if (l_WS.SLen = 1) then
 begin
  l_Found := ev_lpRScan(l_WS.S[0], l_P.S, l_P.SLen);
  if (l_Found = nil) then
  begin
   Result := TtfwCStringFactory.C(l_P);
   aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C('')), aCtx);
  end//l_Found = nil
  else
  begin
   Result := TtfwCStringFactory.C(l3Copy(l_P, l_Found - l_P.S + 1));
   aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l3PCharLen(l_P.S, l_Found - l_P.S, l_P.SCodePage))), aCtx);
  end;//l_Found = nil
 end//l_WS.SLen = 1
 else
 begin
  //l3Split(l_V, aDelim, l_Pref, l_Suff);
  //aCtx.rEngine.PushString(l_Pref);
  //aVar.Value := TtfwStackValue_C(l_Suff);
  Assert(false, 'Пока не реализовано');
  Result := nil;
 end;//l_WS.SLen = 1
//#UC END# *6BE7506C040A_D442EF995DFF_impl*
end;//TkwRSplitTo.RSplitTo

class function TkwRSplitTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:RSplitTo!';
end;//TkwRSplitTo.GetWordNameForRegister

procedure TkwRSplitTo.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
 l_aDelim : Il3CString;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDelim := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDelim: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((RSplitTo(aCtx, l_aVar, l_aDelim)));
end;//TkwRSplitTo.DoRun

function TkwRSplitTo.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwRSplitTo.GetResultTypeInfo

type
 TkwVarShift = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта string:+!
*Пример:*
[code]
 aNum string:+! aVar
[code]  }
 private
 // private methods
   procedure VarShift(const aCtx: TtfwContext;
    aVar: TtfwWord;
    aNum: Integer);
     {* Реализация слова скрипта string:+! }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwVarShift

// start class TkwVarShift

procedure TkwVarShift.VarShift(const aCtx: TtfwContext;
  aVar: TtfwWord;
  aNum: Integer);
//#UC START# *9E35DCA8A090_E1736F173AD3_var*
var
 l_P : Tl3PCharLen;
//#UC END# *9E35DCA8A090_E1736F173AD3_var*
begin
//#UC START# *9E35DCA8A090_E1736F173AD3_impl*
 Tl3WString(l_P) := l3PCharLen(aVar.GetValue(aCtx).AsString);
 l_P.Shift(aNum);
 aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l_P)), aCtx);
//#UC END# *9E35DCA8A090_E1736F173AD3_impl*
end;//TkwVarShift.VarShift

class function TkwVarShift.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:+!';
end;//TkwVarShift.GetWordNameForRegister

procedure TkwVarShift.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
 l_aNum : Integer;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aNum := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aNum: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 VarShift(aCtx, l_aVar, l_aNum);
end;//TkwVarShift.DoRun

function TkwVarShift.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwVarShift.GetResultTypeInfo

type
 TkwSplitTo = {final scriptword} class(TtfwVarWorker)
  {* Слово скрипта string:SplitTo!
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aDelim string:SplitTo! aVar >>> l_Il3CString
[code]  }
 private
 // private methods
   function SplitTo(const aCtx: TtfwContext;
    aVar: TtfwWord;
    const aDelim: Il3CString): Il3CString;
     {* Реализация слова скрипта string:SplitTo! }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure DoRun(const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSplitTo

// start class TkwSplitTo

function TkwSplitTo.SplitTo(const aCtx: TtfwContext;
  aVar: TtfwWord;
  const aDelim: Il3CString): Il3CString;
//#UC START# *94300FB9FFA5_BF0C6B892128_var*
var
 l_V : Il3CString;
 l_P : Tl3PCharLen;
 l_WS : Tl3WString;
 l_Rest : Tl3WString;

 l_Pref : Il3CString;
 l_Suff : Il3CString;
//#UC END# *94300FB9FFA5_BF0C6B892128_var*
begin
//#UC START# *94300FB9FFA5_BF0C6B892128_impl*
 l_V := aVar.GetValue(aCtx).AsString;
 Tl3WString(l_P) := l3PCharLen(l_V);
 l_WS := l3PCharLen(aDelim);
 Assert(not l3IsNil(l_WS));
 Assert(l_P.SLen >= 0);
 if (l_WS.SLen = 1) then
 begin
  l_Rest := l3FindChar(l_WS.S[0], l_P);
  if not l3IsNil(l_P) then
   if (l_P.S[l_P.SLen - 1] = l_WS.S[0]) then
    Dec(l_P.SLen);
  Result := TtfwCStringFactory.C(l_P);
  aVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C(l_Rest)), aCtx);
 end//l_WS.SLen = 1
 else
 begin
  l3Split(l_V, aDelim, l_Pref, l_Suff);
  Result := l_Pref;
  aVar.SetValue(TtfwStackValue_C(l_Suff), aCtx);
  //Assert(false, 'Пока не реализовано');
 end;//l_WS.SLen = 1
//#UC END# *94300FB9FFA5_BF0C6B892128_impl*
end;//TkwSplitTo.SplitTo

class function TkwSplitTo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'string:SplitTo!';
end;//TkwSplitTo.GetWordNameForRegister

procedure TkwSplitTo.DoRun(const aCtx: TtfwContext);
 {-}
var
 l_aVar : TtfwWord;
 l_aDelim : Il3CString;
begin
 try
  l_aVar := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aVar: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDelim := aCtx.rEngine.PopString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDelim: Il3CString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((SplitTo(aCtx, l_aVar, l_aDelim)));
end;//TkwSplitTo.DoRun

function TkwSplitTo.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwSplitTo.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TtfwIl3CStringPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StartsStr
 TkwStartsStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StartsText
 TkwStartsText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EndsStr
 TkwEndsStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EndsText
 TkwEndsText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SameStr
 TkwSameStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SameText
 TkwSameText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CompareStr
 TkwCompareStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CompareText
 TkwCompareText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StrToInt
 TkwStrToInt.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Cat
 TkwCat.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_ConsistsOf
 TkwStringConsistsOf.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_HasAnyOf
 TkwStringHasAnyOf.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_Pos
 TkwStringPos.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_PosEx
 TkwStringPosEx.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_Split
 TkwStringSplit.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_Replace
 TkwStringReplace.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_ReplaceFirst
 TkwStringReplaceFirst.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация text_Replace
 TkwTextReplace.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация text_ReplaceFirst
 TkwTextReplaceFirst.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_Char
 TkwStringChar.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_CodePage
 TkwStringCodePage.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_Len
 TkwStringLen.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация string_ToChar
 TkwStringToChar.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация char_ToString
 TkwCharToString.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация char_Dupe
 TkwCharDupe.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация VarDecLen
 TkwVarDecLen.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация VarInc
 TkwVarInc.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация RSplitTo
 TkwRSplitTo.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация VarShift
 TkwVarShift.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SplitTo
 TkwSplitTo.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Char
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiChar));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts

end.