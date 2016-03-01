unit tfwValueTypesWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwValueTypesWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::Words RTTI::tfwValueTypesWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwValueTypes,
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
 TkwPopValueTypesCompare = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:Compare
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 anOther aValueTypes pop:ValueTypes:Compare >>> l_Integer
[code]  }
 private
 // private methods
   function Compare(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): Integer;
     {* Реализация слова скрипта pop:ValueTypes:Compare }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesCompare

// start class TkwPopValueTypesCompare

function TkwPopValueTypesCompare.Compare(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes;
  anOther: TtfwValueTypes): Integer;
 {-}
begin
 Result := aValueTypes.Compare(anOther);
end;//TkwPopValueTypesCompare.Compare

procedure TkwPopValueTypesCompare.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
 l_anOther : TtfwValueTypes;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Compare(aCtx, l_aValueTypes, l_anOther)));
end;//TkwPopValueTypesCompare.DoDoIt

class function TkwPopValueTypesCompare.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:Compare';
end;//TkwPopValueTypesCompare.GetWordNameForRegister

function TkwPopValueTypesCompare.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopValueTypesCompare.GetResultTypeInfo

type
 TkwPopValueTypesAcceptsValue = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:AcceptsValue
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aValue aValueTypes pop:ValueTypes:AcceptsValue >>> l_Boolean
[code]  }
 private
 // private methods
   function AcceptsValue(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    const aValue: TtfwStackValue): Boolean;
     {* Реализация слова скрипта pop:ValueTypes:AcceptsValue }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesAcceptsValue

// start class TkwPopValueTypesAcceptsValue

function TkwPopValueTypesAcceptsValue.AcceptsValue(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes;
  const aValue: TtfwStackValue): Boolean;
 {-}
begin
 Result := aValueTypes.AcceptsValue(aValue);
end;//TkwPopValueTypesAcceptsValue.AcceptsValue

procedure TkwPopValueTypesAcceptsValue.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
 l_aValue : TtfwStackValue;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((AcceptsValue(aCtx, l_aValueTypes, l_aValue)));
end;//TkwPopValueTypesAcceptsValue.DoDoIt

class function TkwPopValueTypesAcceptsValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:AcceptsValue';
end;//TkwPopValueTypesAcceptsValue.GetWordNameForRegister

function TkwPopValueTypesAcceptsValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopValueTypesAcceptsValue.GetResultTypeInfo

type
 TkwPopValueTypesAdd = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:Add
*Тип результата:* TtfwValueTypes
*Пример:*
[code]
OBJECT VAR l_TtfwValueTypes
 anOther aValueTypes pop:ValueTypes:Add >>> l_TtfwValueTypes
[code]  }
 private
 // private methods
   function Add(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): TtfwValueTypes;
     {* Реализация слова скрипта pop:ValueTypes:Add }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesAdd

// start class TkwPopValueTypesAdd

function TkwPopValueTypesAdd.Add(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes;
  anOther: TtfwValueTypes): TtfwValueTypes;
 {-}
begin
 Result := aValueTypes.Add(anOther);
end;//TkwPopValueTypesAdd.Add

procedure TkwPopValueTypesAdd.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
 l_anOther : TtfwValueTypes;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Add(aCtx, l_aValueTypes, l_anOther)));
end;//TkwPopValueTypesAdd.DoDoIt

class function TkwPopValueTypesAdd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:Add';
end;//TkwPopValueTypesAdd.GetWordNameForRegister

function TkwPopValueTypesAdd.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwValueTypes);
end;//TkwPopValueTypesAdd.GetResultTypeInfo

type
 TkwPopValueTypesHas = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:Has
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aType aValueTypes pop:ValueTypes:Has >>> l_Boolean
[code]  }
 private
 // private methods
   function Has(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    aType: TtfwValueType): Boolean;
     {* Реализация слова скрипта pop:ValueTypes:Has }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesHas

// start class TkwPopValueTypesHas

function TkwPopValueTypesHas.Has(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes;
  aType: TtfwValueType): Boolean;
 {-}
begin
 Result := aValueTypes.Has(aType);
end;//TkwPopValueTypesHas.Has

procedure TkwPopValueTypesHas.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
 l_aType : TtfwValueType;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aType := TtfwValueType(aCtx.rEngine.PopInt);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aType: TtfwValueType : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((Has(aCtx, l_aValueTypes, l_aType)));
end;//TkwPopValueTypesHas.DoDoIt

class function TkwPopValueTypesHas.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:Has';
end;//TkwPopValueTypesHas.GetWordNameForRegister

function TkwPopValueTypesHas.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopValueTypesHas.GetResultTypeInfo

type
 TkwPopValueTypesEQ = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:EQ
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 anOther aValueTypes pop:ValueTypes:EQ >>> l_Boolean
[code]  }
 private
 // private methods
   function EQ(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    anOther: TtfwValueTypes): Boolean;
     {* Реализация слова скрипта pop:ValueTypes:EQ }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesEQ

// start class TkwPopValueTypesEQ

function TkwPopValueTypesEQ.EQ(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes;
  anOther: TtfwValueTypes): Boolean;
 {-}
begin
 Result := aValueTypes.EQ(anOther);
end;//TkwPopValueTypesEQ.EQ

procedure TkwPopValueTypesEQ.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
 l_anOther : TtfwValueTypes;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((EQ(aCtx, l_aValueTypes, l_anOther)));
end;//TkwPopValueTypesEQ.DoDoIt

class function TkwPopValueTypesEQ.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:EQ';
end;//TkwPopValueTypesEQ.GetWordNameForRegister

function TkwPopValueTypesEQ.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwPopValueTypesEQ.GetResultTypeInfo

type
 TkwPopValueTypesDefaultValue = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:DefaultValue
*Тип результата:* TtfwStackValue
*Пример:*
[code]
VAR l_TtfwStackValue
 aValueTypes pop:ValueTypes:DefaultValue >>> l_TtfwStackValue
[code]  }
 private
 // private methods
   function DefaultValue(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes): TtfwStackValue;
     {* Реализация слова скрипта pop:ValueTypes:DefaultValue }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesDefaultValue

// start class TkwPopValueTypesDefaultValue

function TkwPopValueTypesDefaultValue.DefaultValue(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes): TtfwStackValue;
 {-}
begin
 Result := aValueTypes.DefaultValue;
end;//TkwPopValueTypesDefaultValue.DefaultValue

procedure TkwPopValueTypesDefaultValue.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.Push((DefaultValue(aCtx, l_aValueTypes)));
end;//TkwPopValueTypesDefaultValue.DoDoIt

class function TkwPopValueTypesDefaultValue.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:DefaultValue';
end;//TkwPopValueTypesDefaultValue.GetWordNameForRegister

function TkwPopValueTypesDefaultValue.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiStruct;
end;//TkwPopValueTypesDefaultValue.GetResultTypeInfo

type
 TkwPopValueTypesMakeCustomName = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:MakeCustomName
*Тип результата:* TtfwValueTypes
*Пример:*
[code]
OBJECT VAR l_TtfwValueTypes
 aName aValueTypes pop:ValueTypes:MakeCustomName >>> l_TtfwValueTypes
[code]  }
 private
 // private methods
   function MakeCustomName(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes;
    const aName: Il3CString): TtfwValueTypes;
     {* Реализация слова скрипта pop:ValueTypes:MakeCustomName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopValueTypesMakeCustomName

// start class TkwPopValueTypesMakeCustomName

function TkwPopValueTypesMakeCustomName.MakeCustomName(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes;
  const aName: Il3CString): TtfwValueTypes;
//#UC START# *F5EDA08C381E_2A110DF50AE7_var*
//#UC END# *F5EDA08C381E_2A110DF50AE7_var*
begin
//#UC START# *F5EDA08C381E_2A110DF50AE7_impl*
 Result := aValueTypes.MakeCustomName(aName);
//#UC END# *F5EDA08C381E_2A110DF50AE7_impl*
end;//TkwPopValueTypesMakeCustomName.MakeCustomName

procedure TkwPopValueTypesMakeCustomName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
 l_aName : Il3CString;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushObj((MakeCustomName(aCtx, l_aValueTypes, l_aName)));
end;//TkwPopValueTypesMakeCustomName.DoDoIt

class function TkwPopValueTypesMakeCustomName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:MakeCustomName';
end;//TkwPopValueTypesMakeCustomName.GetWordNameForRegister

function TkwPopValueTypesMakeCustomName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TtfwValueTypes);
end;//TkwPopValueTypesMakeCustomName.GetResultTypeInfo

type
 TkwPopValueTypesName = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта pop:ValueTypes:Name
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aValueTypes pop:ValueTypes:Name >>> l_Il3CString
[code]  }
 private
 // private methods
   function Name(const aCtx: TtfwContext;
    aValueTypes: TtfwValueTypes): Il3CString;
     {* Реализация слова скрипта pop:ValueTypes:Name }
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
 end;//TkwPopValueTypesName

// start class TkwPopValueTypesName

function TkwPopValueTypesName.Name(const aCtx: TtfwContext;
  aValueTypes: TtfwValueTypes): Il3CString;
 {-}
begin
 Result := aValueTypes.Name;
end;//TkwPopValueTypesName.Name

procedure TkwPopValueTypesName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValueTypes : TtfwValueTypes;
begin
 try
  l_aValueTypes := TtfwValueTypes(aCtx.rEngine.PopObjAs(TtfwValueTypes));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValueTypes: TtfwValueTypes : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Name(aCtx, l_aValueTypes)));
end;//TkwPopValueTypesName.DoDoIt

class function TkwPopValueTypesName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:ValueTypes:Name';
end;//TkwPopValueTypesName.GetWordNameForRegister

procedure TkwPopValueTypesName.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
 {-}
begin
 RunnerError('Нельзя присваивать значение readonly свойству Name', aCtx);
end;//TkwPopValueTypesName.SetValue

function TkwPopValueTypesName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwPopValueTypesName.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_Compare
 TkwPopValueTypesCompare.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_AcceptsValue
 TkwPopValueTypesAcceptsValue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_Add
 TkwPopValueTypesAdd.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_Has
 TkwPopValueTypesHas.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_EQ
 TkwPopValueTypesEQ.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_DefaultValue
 TkwPopValueTypesDefaultValue.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_MakeCustomName
 TkwPopValueTypesMakeCustomName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_ValueTypes_Name
 TkwPopValueTypesName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwValueTypes
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwValueTypes));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
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
// Регистрация типа TtfwValueType
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwValueType));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts

end.