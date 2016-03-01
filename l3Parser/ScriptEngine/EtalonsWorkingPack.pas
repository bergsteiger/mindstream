unit EtalonsWorkingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "EtalonsWorkingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine::EtalonsWorking::EtalonsWorkingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCheckOutputWithInput,
  kwCheckEtalon,
  kwTestResolveInputFilePath,
  l3EtalonsService,
  tfwScriptingTypes,
  tfwScriptingInterfaces,
  TypInfo,
  SysUtils
  ;

type
 TkwEtalonNeeds64 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта EtalonNeeds64
*Пример:*
[code]
 EtalonNeeds64
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
 end;//TkwEtalonNeeds64

// start class TkwEtalonNeeds64

procedure TkwEtalonNeeds64.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_60A242C872F7_var*
//#UC END# *4DAEEDE10285_60A242C872F7_var*
begin
//#UC START# *4DAEEDE10285_60A242C872F7_impl*
 Tl3EtalonsService.Instance.EtalonNeeds64 := true; 
//#UC END# *4DAEEDE10285_60A242C872F7_impl*
end;//TkwEtalonNeeds64.DoDoIt

class function TkwEtalonNeeds64.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeeds64';
end;//TkwEtalonNeeds64.GetWordNameForRegister

function TkwEtalonNeeds64.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwEtalonNeeds64.GetResultTypeInfo

type
 TkwEtalonNeedsComputerName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта EtalonNeedsComputerName
*Пример:*
[code]
 EtalonNeedsComputerName
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
 end;//TkwEtalonNeedsComputerName

// start class TkwEtalonNeedsComputerName

procedure TkwEtalonNeedsComputerName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_116A432ADCB1_var*
//#UC END# *4DAEEDE10285_116A432ADCB1_var*
begin
//#UC START# *4DAEEDE10285_116A432ADCB1_impl*
 Tl3EtalonsService.Instance.EtalonNeedsComputerName := true;
//#UC END# *4DAEEDE10285_116A432ADCB1_impl*
end;//TkwEtalonNeedsComputerName.DoDoIt

class function TkwEtalonNeedsComputerName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsComputerName';
end;//TkwEtalonNeedsComputerName.GetWordNameForRegister

function TkwEtalonNeedsComputerName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwEtalonNeedsComputerName.GetResultTypeInfo

type
 TkwEtalonNeedsOSName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта EtalonNeedsOSName
*Пример:*
[code]
 EtalonNeedsOSName
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
 end;//TkwEtalonNeedsOSName

// start class TkwEtalonNeedsOSName

procedure TkwEtalonNeedsOSName.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4A371D758055_var*
//#UC END# *4DAEEDE10285_4A371D758055_var*
begin
//#UC START# *4DAEEDE10285_4A371D758055_impl*
 Tl3EtalonsService.Instance.EtalonNeedsOSName := true;
//#UC END# *4DAEEDE10285_4A371D758055_impl*
end;//TkwEtalonNeedsOSName.DoDoIt

class function TkwEtalonNeedsOSName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsOSName';
end;//TkwEtalonNeedsOSName.GetWordNameForRegister

function TkwEtalonNeedsOSName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwEtalonNeedsOSName.GetResultTypeInfo

type
 TkwEtalonNeedsXE = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта EtalonNeedsXE
*Пример:*
[code]
 EtalonNeedsXE
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
 end;//TkwEtalonNeedsXE

// start class TkwEtalonNeedsXE

procedure TkwEtalonNeedsXE.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_DECF86D5A261_var*
//#UC END# *4DAEEDE10285_DECF86D5A261_var*
begin
//#UC START# *4DAEEDE10285_DECF86D5A261_impl*
 {$IfDef XE}
 Tl3EtalonsService.Instance.EtalonNeedsXE := true;
 {$EndIf XE}
//#UC END# *4DAEEDE10285_DECF86D5A261_impl*
end;//TkwEtalonNeedsXE.DoDoIt

class function TkwEtalonNeedsXE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EtalonNeedsXE';
end;//TkwEtalonNeedsXE.GetWordNameForRegister

function TkwEtalonNeedsXE.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwEtalonNeedsXE.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация EtalonNeeds64
 TkwEtalonNeeds64.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EtalonNeedsComputerName
 TkwEtalonNeedsComputerName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EtalonNeedsOSName
 TkwEtalonNeedsOSName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация EtalonNeedsXE
 TkwEtalonNeedsXE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.