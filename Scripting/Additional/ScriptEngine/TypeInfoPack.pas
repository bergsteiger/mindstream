unit TypeInfoPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "TypeInfoPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Words RTTI::TypeInfoPack
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
  TypInfo,
  SysUtils,
  tfwTypeRegistrator
  ;

type
 TkwIsArray = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsArray
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsArray
[code]  }
 private
 // private methods
   function IsArray(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsArray }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsArray

// start class TkwIsArray

function TkwIsArray.IsArray(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *15B838867296_758F80018751_var*
//#UC END# *15B838867296_758F80018751_var*
begin
//#UC START# *15B838867296_758F80018751_impl*
 Result := (aSV.rType = tfw_svtList);
//#UC END# *15B838867296_758F80018751_impl*
end;//TkwIsArray.IsArray

procedure TkwIsArray.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsArray(aCtx, l_aSV)));
end;//TkwIsArray.DoDoIt

class function TkwIsArray.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsArray';
end;//TkwIsArray.GetWordNameForRegister

function TkwIsArray.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsArray.GetResultTypeInfo

type
 TkwIsVoid = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsVoid
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsVoid
[code]  }
 private
 // private methods
   function IsVoid(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsVoid }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsVoid

// start class TkwIsVoid

function TkwIsVoid.IsVoid(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *C4B2F87508DA_0707D9C010E3_var*
//#UC END# *C4B2F87508DA_0707D9C010E3_var*
begin
//#UC START# *C4B2F87508DA_0707D9C010E3_impl*
 Result := (aSV.rType = tfw_svtVoid);
//#UC END# *C4B2F87508DA_0707D9C010E3_impl*
end;//TkwIsVoid.IsVoid

procedure TkwIsVoid.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsVoid(aCtx, l_aSV)));
end;//TkwIsVoid.DoDoIt

class function TkwIsVoid.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsVoid';
end;//TkwIsVoid.GetWordNameForRegister

function TkwIsVoid.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsVoid.GetResultTypeInfo

type
 TkwIsObj = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsObj
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsObj
[code]  }
 private
 // private methods
   function IsObj(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsObj }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsObj

// start class TkwIsObj

function TkwIsObj.IsObj(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *99DC3EB5BE4F_257BCAC433BA_var*
//#UC END# *99DC3EB5BE4F_257BCAC433BA_var*
begin
//#UC START# *99DC3EB5BE4F_257BCAC433BA_impl*
 Result := (aSV.rType = tfw_svtObj);
//#UC END# *99DC3EB5BE4F_257BCAC433BA_impl*
end;//TkwIsObj.IsObj

procedure TkwIsObj.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsObj(aCtx, l_aSV)));
end;//TkwIsObj.DoDoIt

class function TkwIsObj.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsObj';
end;//TkwIsObj.GetWordNameForRegister

function TkwIsObj.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsObj.GetResultTypeInfo

type
 TkwIsIntf = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsIntf
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsIntf
[code]  }
 private
 // private methods
   function IsIntf(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsIntf }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsIntf

// start class TkwIsIntf

function TkwIsIntf.IsIntf(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *2091967DFD07_475E881B9090_var*
//#UC END# *2091967DFD07_475E881B9090_var*
begin
//#UC START# *2091967DFD07_475E881B9090_impl*
 Result := (aSV.rType = tfw_svtIntf);
//#UC END# *2091967DFD07_475E881B9090_impl*
end;//TkwIsIntf.IsIntf

procedure TkwIsIntf.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsIntf(aCtx, l_aSV)));
end;//TkwIsIntf.DoDoIt

class function TkwIsIntf.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsIntf';
end;//TkwIsIntf.GetWordNameForRegister

function TkwIsIntf.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsIntf.GetResultTypeInfo

type
 TkwIsBracket = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsBracket
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsBracket
[code]  }
 private
 // private methods
   function IsBracket(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsBracket }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsBracket

// start class TkwIsBracket

function TkwIsBracket.IsBracket(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *8E18AB78F25C_2FA215F79179_var*
//#UC END# *8E18AB78F25C_2FA215F79179_var*
begin
//#UC START# *8E18AB78F25C_2FA215F79179_impl*
 Result := (aSV.rType = tfw_svtBracket);
//#UC END# *8E18AB78F25C_2FA215F79179_impl*
end;//TkwIsBracket.IsBracket

procedure TkwIsBracket.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsBracket(aCtx, l_aSV)));
end;//TkwIsBracket.DoDoIt

class function TkwIsBracket.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsBracket';
end;//TkwIsBracket.GetWordNameForRegister

function TkwIsBracket.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsBracket.GetResultTypeInfo

type
 TkwIsChar = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsChar
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsChar
[code]  }
 private
 // private methods
   function IsChar(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsChar }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsChar

// start class TkwIsChar

function TkwIsChar.IsChar(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *07ECD13EA5B8_ACCFB9C57546_var*
//#UC END# *07ECD13EA5B8_ACCFB9C57546_var*
begin
//#UC START# *07ECD13EA5B8_ACCFB9C57546_impl*
 Result := (aSV.rType = tfw_svtChar);
//#UC END# *07ECD13EA5B8_ACCFB9C57546_impl*
end;//TkwIsChar.IsChar

procedure TkwIsChar.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsChar(aCtx, l_aSV)));
end;//TkwIsChar.DoDoIt

class function TkwIsChar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsChar';
end;//TkwIsChar.GetWordNameForRegister

function TkwIsChar.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsChar.GetResultTypeInfo

type
 TkwIsString = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsString
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsString
[code]  }
 private
 // private methods
   function IsString(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsString }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsString

// start class TkwIsString

function TkwIsString.IsString(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *35FB3393AF28_689D96A305FE_var*
//#UC END# *35FB3393AF28_689D96A305FE_var*
begin
//#UC START# *35FB3393AF28_689D96A305FE_impl*
 Result := (aSV.rType = tfw_svtStr);
//#UC END# *35FB3393AF28_689D96A305FE_impl*
end;//TkwIsString.IsString

procedure TkwIsString.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsString(aCtx, l_aSV)));
end;//TkwIsString.DoDoIt

class function TkwIsString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsString';
end;//TkwIsString.GetWordNameForRegister

function TkwIsString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsString.GetResultTypeInfo

type
 TkwIsInt = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsInt
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsInt
[code]  }
 private
 // private methods
   function IsInt(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsInt }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsInt

// start class TkwIsInt

function TkwIsInt.IsInt(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *5961904482C4_1E29EA0B90A4_var*
//#UC END# *5961904482C4_1E29EA0B90A4_var*
begin
//#UC START# *5961904482C4_1E29EA0B90A4_impl*
 Result := (aSV.rType = tfw_svtInt);
//#UC END# *5961904482C4_1E29EA0B90A4_impl*
end;//TkwIsInt.IsInt

procedure TkwIsInt.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsInt(aCtx, l_aSV)));
end;//TkwIsInt.DoDoIt

class function TkwIsInt.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsInt';
end;//TkwIsInt.GetWordNameForRegister

function TkwIsInt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsInt.GetResultTypeInfo

type
 TkwIsWString = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsWString
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsWString
[code]  }
 private
 // private methods
   function IsWString(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsWString }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsWString

// start class TkwIsWString

function TkwIsWString.IsWString(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *3327D046059A_2F44F4D2ED80_var*
//#UC END# *3327D046059A_2F44F4D2ED80_var*
begin
//#UC START# *3327D046059A_2F44F4D2ED80_impl*
 Result := (aSV.rType = tfw_svtWStr);
//#UC END# *3327D046059A_2F44F4D2ED80_impl*
end;//TkwIsWString.IsWString

procedure TkwIsWString.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsWString(aCtx, l_aSV)));
end;//TkwIsWString.DoDoIt

class function TkwIsWString.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsWString';
end;//TkwIsWString.GetWordNameForRegister

function TkwIsWString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsWString.GetResultTypeInfo

type
 TkwIsClass = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsClass
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsClass
[code]  }
 private
 // private methods
   function IsClass(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsClass }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsClass

// start class TkwIsClass

function TkwIsClass.IsClass(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *91B47D0849F0_D8E9C4F61308_var*
//#UC END# *91B47D0849F0_D8E9C4F61308_var*
begin
//#UC START# *91B47D0849F0_D8E9C4F61308_impl*
 Result := (aSV.rType = tfw_svtClass);
//#UC END# *91B47D0849F0_D8E9C4F61308_impl*
end;//TkwIsClass.IsClass

procedure TkwIsClass.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsClass(aCtx, l_aSV)));
end;//TkwIsClass.DoDoIt

class function TkwIsClass.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsClass';
end;//TkwIsClass.GetWordNameForRegister

function TkwIsClass.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsClass.GetResultTypeInfo

type
 TkwToPrintable = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ToPrintable
*Тип результата:* Il3CString
*Пример:*
[code]
 aSV ToPrintable
[code]  }
 private
 // private methods
   function ToPrintable(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Il3CString;
     {* Реализация слова скрипта ToPrintable }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwToPrintable

// start class TkwToPrintable

function TkwToPrintable.ToPrintable(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Il3CString;
//#UC START# *8C01CED67FCB_0B39C51FE7D1_var*
//#UC END# *8C01CED67FCB_0B39C51FE7D1_var*
begin
//#UC START# *8C01CED67FCB_0B39C51FE7D1_impl*
 Result := aSV.AsPrintable;
//#UC END# *8C01CED67FCB_0B39C51FE7D1_impl*
end;//TkwToPrintable.ToPrintable

procedure TkwToPrintable.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((ToPrintable(aCtx, l_aSV)));
end;//TkwToPrintable.DoDoIt

class function TkwToPrintable.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ToPrintable';
end;//TkwToPrintable.GetWordNameForRegister

function TkwToPrintable.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwToPrintable.GetResultTypeInfo

type
 TkwIsBool = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsBool
*Тип результата:* Boolean
*Пример:*
[code]
 aSV IsBool
[code]  }
 private
 // private methods
   function IsBool(const aCtx: TtfwContext;
    const aSV: TtfwStackValue): Boolean;
     {* Реализация слова скрипта IsBool }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsBool

// start class TkwIsBool

function TkwIsBool.IsBool(const aCtx: TtfwContext;
  const aSV: TtfwStackValue): Boolean;
//#UC START# *65885D693C21_805A190E934E_var*
//#UC END# *65885D693C21_805A190E934E_var*
begin
//#UC START# *65885D693C21_805A190E934E_impl*
 Result := (aSV.rType = tfw_svtBool);
//#UC END# *65885D693C21_805A190E934E_impl*
end;//TkwIsBool.IsBool

procedure TkwIsBool.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSV : TtfwStackValue;
begin
 try
  l_aSV := (aCtx.rEngine.Pop);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSV: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((IsBool(aCtx, l_aSV)));
end;//TkwIsBool.DoDoIt

class function TkwIsBool.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsBool';
end;//TkwIsBool.GetWordNameForRegister

function TkwIsBool.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsBool.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IsArray
 TkwIsArray.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsVoid
 TkwIsVoid.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsObj
 TkwIsObj.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsIntf
 TkwIsIntf.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsBracket
 TkwIsBracket.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsChar
 TkwIsChar.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsString
 TkwIsString.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsInt
 TkwIsInt.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsWString
 TkwIsWString.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsClass
 TkwIsClass.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ToPrintable
 TkwToPrintable.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsBool
 TkwIsBool.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Boolean
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts

end.