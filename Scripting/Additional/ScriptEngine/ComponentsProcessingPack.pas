unit ComponentsProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "ComponentsProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::ComponentsProcessing::ComponentsProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Classes,
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
 TkwPopComponentGetComponent = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Component:GetComponent
*Тип результата:* TComponent
*Пример:*
[code]
 anIndex aComponent pop:Component:GetComponent
[code]  }
 private
 // private methods
   function GetComponent(const aCtx: TtfwContext;
    aComponent: TComponent;
    anIndex: Integer): TComponent;
     {* Реализация слова скрипта pop:Component:GetComponent }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComponentGetComponent

// start class TkwPopComponentGetComponent

function TkwPopComponentGetComponent.GetComponent(const aCtx: TtfwContext;
  aComponent: TComponent;
  anIndex: Integer): TComponent;
//#UC START# *2E270C931823_D0FE9D22441B_var*
//#UC END# *2E270C931823_D0FE9D22441B_var*
begin
//#UC START# *2E270C931823_D0FE9D22441B_impl*
 Result := aComponent.Components[anIndex];
//#UC END# *2E270C931823_D0FE9D22441B_impl*
end;//TkwPopComponentGetComponent.GetComponent

procedure TkwPopComponentGetComponent.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComponent : TComponent;
 l_anIndex : Integer;
begin
 try
  l_aComponent := TComponent(aCtx.rEngine.PopObjAs(TComponent));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComponent: TComponent : ' + E.Message, aCtx);
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
 aCtx.rEngine.PushObj((GetComponent(aCtx, l_aComponent, l_anIndex)));
end;//TkwPopComponentGetComponent.DoDoIt

class function TkwPopComponentGetComponent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Component:GetComponent';
end;//TkwPopComponentGetComponent.GetWordNameForRegister

function TkwPopComponentGetComponent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TComponent);
end;//TkwPopComponentGetComponent.GetResultTypeInfo

type
 TkwPopComponentFindComponent = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Component:FindComponent
*Тип результата:* TComponent
*Пример:*
[code]
 aName aComponent pop:Component:FindComponent
[code]  }
 private
 // private methods
   function FindComponent(const aCtx: TtfwContext;
    aComponent: TComponent;
    const aName: AnsiString): TComponent;
     {* Реализация слова скрипта pop:Component:FindComponent }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComponentFindComponent

// start class TkwPopComponentFindComponent

function TkwPopComponentFindComponent.FindComponent(const aCtx: TtfwContext;
  aComponent: TComponent;
  const aName: AnsiString): TComponent;
 {-}
begin
 Result := aComponent.FindComponent(aName);
end;//TkwPopComponentFindComponent.FindComponent

procedure TkwPopComponentFindComponent.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComponent : TComponent;
 l_aName : AnsiString;
begin
 try
  l_aComponent := TComponent(aCtx.rEngine.PopObjAs(TComponent));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComponent: TComponent : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aName := (aCtx.rEngine.PopDelphiString);
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((FindComponent(aCtx, l_aComponent, l_aName)));
end;//TkwPopComponentFindComponent.DoDoIt

class function TkwPopComponentFindComponent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Component:FindComponent';
end;//TkwPopComponentFindComponent.GetWordNameForRegister

function TkwPopComponentFindComponent.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TComponent);
end;//TkwPopComponentFindComponent.GetResultTypeInfo

type
 TkwPopComponentComponentCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Component:ComponentCount
*Тип результата:* Integer
*Пример:*
[code]
 aComponent pop:Component:ComponentCount
[code]  }
 private
 // private methods
   function ComponentCount(const aCtx: TtfwContext;
    aComponent: TComponent): Integer;
     {* Реализация слова скрипта pop:Component:ComponentCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComponentComponentCount

// start class TkwPopComponentComponentCount

function TkwPopComponentComponentCount.ComponentCount(const aCtx: TtfwContext;
  aComponent: TComponent): Integer;
 {-}
begin
 Result := aComponent.ComponentCount;
end;//TkwPopComponentComponentCount.ComponentCount

procedure TkwPopComponentComponentCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComponent : TComponent;
begin
 try
  l_aComponent := TComponent(aCtx.rEngine.PopObjAs(TComponent));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComponent: TComponent : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((ComponentCount(aCtx, l_aComponent)));
end;//TkwPopComponentComponentCount.DoDoIt

class function TkwPopComponentComponentCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Component:ComponentCount';
end;//TkwPopComponentComponentCount.GetWordNameForRegister

function TkwPopComponentComponentCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwPopComponentComponentCount.GetResultTypeInfo

type
 TkwPopComponentOwner = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Component:Owner
*Тип результата:* TComponent
*Пример:*
[code]
 aComponent pop:Component:Owner
[code]  }
 private
 // private methods
   function Owner(const aCtx: TtfwContext;
    aComponent: TComponent): TComponent;
     {* Реализация слова скрипта pop:Component:Owner }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComponentOwner

// start class TkwPopComponentOwner

function TkwPopComponentOwner.Owner(const aCtx: TtfwContext;
  aComponent: TComponent): TComponent;
 {-}
begin
 Result := aComponent.Owner;
end;//TkwPopComponentOwner.Owner

procedure TkwPopComponentOwner.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComponent : TComponent;
begin
 try
  l_aComponent := TComponent(aCtx.rEngine.PopObjAs(TComponent));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComponent: TComponent : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj((Owner(aCtx, l_aComponent)));
end;//TkwPopComponentOwner.DoDoIt

class function TkwPopComponentOwner.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Component:Owner';
end;//TkwPopComponentOwner.GetWordNameForRegister

function TkwPopComponentOwner.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(TComponent);
end;//TkwPopComponentOwner.GetResultTypeInfo

type
 TkwPopComponentName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта pop:Component:Name
*Тип результата:* String
*Пример:*
[code]
 aComponent pop:Component:Name
[code]  }
 private
 // private methods
   function Name(const aCtx: TtfwContext;
    aComponent: TComponent): AnsiString;
     {* Реализация слова скрипта pop:Component:Name }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwPopComponentName

// start class TkwPopComponentName

function TkwPopComponentName.Name(const aCtx: TtfwContext;
  aComponent: TComponent): AnsiString;
 {-}
begin
 Result := aComponent.Name;
end;//TkwPopComponentName.Name

procedure TkwPopComponentName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aComponent : TComponent;
begin
 try
  l_aComponent := TComponent(aCtx.rEngine.PopObjAs(TComponent));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aComponent: TComponent : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((Name(aCtx, l_aComponent)));
end;//TkwPopComponentName.DoDoIt

class function TkwPopComponentName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Component:Name';
end;//TkwPopComponentName.GetWordNameForRegister

function TkwPopComponentName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwPopComponentName.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_Component_GetComponent
 TkwPopComponentGetComponent.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Component_FindComponent
 TkwPopComponentFindComponent.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Component_ComponentCount
 TkwPopComponentComponentCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Component_Owner
 TkwPopComponentOwner.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация pop_Component_Name
 TkwPopComponentName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TComponent
 TtfwTypeRegistrator.RegisterType(TypeInfo(TComponent));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
{$IfEnd} //not NoScripts

end.