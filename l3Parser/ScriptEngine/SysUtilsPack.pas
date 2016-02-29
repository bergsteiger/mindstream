unit SysUtilsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "SysUtilsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::SysUtils::SysUtilsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  tfwAxiomaticsResNameGetter,
  tfwTypeInfo
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3TabService,
  l3SysUtils,
  Windows,
  JclSysInfo,
  l3Base,
  l3String,
  SysUtils,
  Classes,
  DateUtils,
  Graphics
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  Clipbrd
  {$IfEnd} //not NoVCL
  ,
  l3Utils,
  l3CStringDataObject,
  l3Chars,
  tfwScriptingTypes,
  TypInfo,
  tfwTypeRegistrator
  ;

type
//#UC START# *CA1C227465CDci*
//#UC END# *CA1C227465CDci*
 TSysUtilsPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *CA1C227465CDpubl*
//#UC END# *CA1C227465CDpubl*
 end;//TSysUtilsPackResNameGetter

// start class TSysUtilsPackResNameGetter

class function TSysUtilsPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'SysUtilsPack';
end;//TSysUtilsPackResNameGetter.ResName

 {$R SysUtilsPack.res}

type
 TkwHasTabs = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта HasTabs
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 HasTabs >>> l_Boolean
[code]  }
 private
 // private methods
   function HasTabs(const aCtx: TtfwContext): Boolean;
     {* Реализация слова скрипта HasTabs }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwHasTabs

// start class TkwHasTabs

function TkwHasTabs.HasTabs(const aCtx: TtfwContext): Boolean;
//#UC START# *8B165BF2764A_3FBA7C4F7F80_var*
//#UC END# *8B165BF2764A_3FBA7C4F7F80_var*
begin
//#UC START# *8B165BF2764A_3FBA7C4F7F80_impl*
 Result := Tl3TabService.Instance.HasTabs;
//#UC END# *8B165BF2764A_3FBA7C4F7F80_impl*
end;//TkwHasTabs.HasTabs

procedure TkwHasTabs.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushBool((HasTabs(aCtx)));
end;//TkwHasTabs.DoDoIt

class function TkwHasTabs.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'HasTabs';
end;//TkwHasTabs.GetWordNameForRegister

function TkwHasTabs.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwHasTabs.GetResultTypeInfo

type
 TkwIsUnder64 = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsUnder64
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 IsUnder64 >>> l_Boolean
[code]  }
 private
 // private methods
   function IsUnder64(const aCtx: TtfwContext): Boolean;
     {* Реализация слова скрипта IsUnder64 }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsUnder64

// start class TkwIsUnder64

function TkwIsUnder64.IsUnder64(const aCtx: TtfwContext): Boolean;
//#UC START# *E7960C7CE4B0_F9F8F376A6AB_var*
//#UC END# *E7960C7CE4B0_F9F8F376A6AB_var*
begin
//#UC START# *E7960C7CE4B0_F9F8F376A6AB_impl*
 Result := l3Is64System;
//#UC END# *E7960C7CE4B0_F9F8F376A6AB_impl*
end;//TkwIsUnder64.IsUnder64

procedure TkwIsUnder64.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushBool((IsUnder64(aCtx)));
end;//TkwIsUnder64.DoDoIt

class function TkwIsUnder64.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsUnder64';
end;//TkwIsUnder64.GetWordNameForRegister

function TkwIsUnder64.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsUnder64.GetResultTypeInfo

type
 TkwComputerName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ComputerName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 ComputerName >>> l_String
[code]  }
 private
 // private methods
   function ComputerName(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта ComputerName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwComputerName

// start class TkwComputerName

function TkwComputerName.ComputerName(const aCtx: TtfwContext): AnsiString;
//#UC START# *67A0331D6030_0D7A9FAE3386_var*
var
 l_CompSize : Integer;
 l_S : AnsiString;
//#UC END# *67A0331D6030_0D7A9FAE3386_var*
begin
//#UC START# *67A0331D6030_0D7A9FAE3386_impl*
 l_CompSize := MAX_COMPUTERNAME_LENGTH + 1;
 SetLength(l_S, l_CompSize);

 Win32Check(GetComputerNameA(PAnsiChar(l_S), LongWord(l_CompSize)));
 SetLength(l_S, l_CompSize);
 Result := l_S;
//#UC END# *67A0331D6030_0D7A9FAE3386_impl*
end;//TkwComputerName.ComputerName

procedure TkwComputerName.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((ComputerName(aCtx)));
end;//TkwComputerName.DoDoIt

class function TkwComputerName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ComputerName';
end;//TkwComputerName.GetWordNameForRegister

function TkwComputerName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwComputerName.GetResultTypeInfo

type
 TkwOSName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта OSName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 OSName >>> l_String
[code]  }
 private
 // private methods
   function OSName(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта OSName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwOSName

// start class TkwOSName

function TkwOSName.OSName(const aCtx: TtfwContext): AnsiString;
//#UC START# *FD0E945E9EFD_20F254F4B4BB_var*
//#UC END# *FD0E945E9EFD_20F254F4B4BB_var*
begin
//#UC START# *FD0E945E9EFD_20F254F4B4BB_impl*
 Result := GetWindowsVersionString;
//#UC END# *FD0E945E9EFD_20F254F4B4BB_impl*
end;//TkwOSName.OSName

procedure TkwOSName.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((OSName(aCtx)));
end;//TkwOSName.DoDoIt

class function TkwOSName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'OSName';
end;//TkwOSName.GetWordNameForRegister

function TkwOSName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwOSName.GetResultTypeInfo

type
 TkwRandom = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Random
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aMax Random >>> l_Integer
[code]  }
 private
 // private methods
   function Random(const aCtx: TtfwContext;
    aMax: Integer): Integer;
     {* Реализация слова скрипта Random }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwRandom

// start class TkwRandom

function TkwRandom.Random(const aCtx: TtfwContext;
  aMax: Integer): Integer;
//#UC START# *20FE7F32818E_E438AFCDC08A_var*
//#UC END# *20FE7F32818E_E438AFCDC08A_var*
begin
//#UC START# *20FE7F32818E_E438AFCDC08A_impl*
 Result := System.Random(aMax);
//#UC END# *20FE7F32818E_E438AFCDC08A_impl*
end;//TkwRandom.Random

procedure TkwRandom.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aMax : Integer;
begin
 try
  l_aMax := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMax: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Random(aCtx, l_aMax)));
end;//TkwRandom.DoDoIt

class function TkwRandom.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Random';
end;//TkwRandom.GetWordNameForRegister

function TkwRandom.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwRandom.GetResultTypeInfo

type
 TkwRandomize = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Randomize
*Пример:*
[code]
 Randomize
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
 end;//TkwRandomize

// start class TkwRandomize

procedure TkwRandomize.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_EA3D9826565B_var*
//#UC END# *4DAEEDE10285_EA3D9826565B_var*
begin
//#UC START# *4DAEEDE10285_EA3D9826565B_impl*
 System.Randomize;
//#UC END# *4DAEEDE10285_EA3D9826565B_impl*
end;//TkwRandomize.DoDoIt

class function TkwRandomize.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Randomize';
end;//TkwRandomize.GetWordNameForRegister

function TkwRandomize.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwRandomize.GetResultTypeInfo

type
 TkwSetRandSeed = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SetRandSeed
*Пример:*
[code]
 aValue SetRandSeed
[code]  }
 private
 // private methods
   procedure SetRandSeed(const aCtx: TtfwContext;
    aValue: Integer);
     {* Реализация слова скрипта SetRandSeed }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSetRandSeed

// start class TkwSetRandSeed

procedure TkwSetRandSeed.SetRandSeed(const aCtx: TtfwContext;
  aValue: Integer);
//#UC START# *61B70695D7A5_153639A6E4C3_var*
//#UC END# *61B70695D7A5_153639A6E4C3_var*
begin
//#UC START# *61B70695D7A5_153639A6E4C3_impl*
 RandSeed := aValue;
//#UC END# *61B70695D7A5_153639A6E4C3_impl*
end;//TkwSetRandSeed.SetRandSeed

procedure TkwSetRandSeed.DoDoIt(const aCtx: TtfwContext);
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
 SetRandSeed(aCtx, l_aValue);
end;//TkwSetRandSeed.DoDoIt

class function TkwSetRandSeed.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetRandSeed';
end;//TkwSetRandSeed.GetWordNameForRegister

function TkwSetRandSeed.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSetRandSeed.GetResultTypeInfo

type
 TkwRGB2String = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта RGB2String
[panel]Переводит представление R G B в шестнадцатиричное представление в виде строки:
[code]
151 40 30 RGB2String .
[code][panel]
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aR aG aB RGB2String >>> l_String
[code]  }
 private
 // private methods
   function RGB2String(const aCtx: TtfwContext;
    aB: Integer;
    aG: Integer;
    aR: Integer): AnsiString;
     {* Реализация слова скрипта RGB2String }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwRGB2String

// start class TkwRGB2String

function TkwRGB2String.RGB2String(const aCtx: TtfwContext;
  aB: Integer;
  aG: Integer;
  aR: Integer): AnsiString;
//#UC START# *3FC73A87B28A_1BF05B2801A2_var*
var
 l_Color : TColor;
//#UC END# *3FC73A87B28A_1BF05B2801A2_var*
begin
//#UC START# *3FC73A87B28A_1BF05B2801A2_impl*
 l_Color := TColor(RGB(aR, aG, aB));
 Result := ColorToString(l_Color);
//#UC END# *3FC73A87B28A_1BF05B2801A2_impl*
end;//TkwRGB2String.RGB2String

procedure TkwRGB2String.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aB : Integer;
 l_aG : Integer;
 l_aR : Integer;
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
  l_aG := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aG: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aR := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aR: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((RGB2String(aCtx, l_aB, l_aG, l_aR)));
end;//TkwRGB2String.DoDoIt

class function TkwRGB2String.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'RGB2String';
end;//TkwRGB2String.GetWordNameForRegister

function TkwRGB2String.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwRGB2String.GetResultTypeInfo

type
 TkwIntToStr = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IntToStr
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aValue IntToStr >>> l_String
[code]  }
 private
 // private methods
   function IntToStr(const aCtx: TtfwContext;
    aValue: Integer): AnsiString;
     {* Реализация слова скрипта IntToStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIntToStr

// start class TkwIntToStr

function TkwIntToStr.IntToStr(const aCtx: TtfwContext;
  aValue: Integer): AnsiString;
//#UC START# *75D135739708_117748A67531_var*
//#UC END# *75D135739708_117748A67531_var*
begin
//#UC START# *75D135739708_117748A67531_impl*
 Result := SysUtils.IntToStr(aValue);
//#UC END# *75D135739708_117748A67531_impl*
end;//TkwIntToStr.IntToStr

procedure TkwIntToStr.DoDoIt(const aCtx: TtfwContext);
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
 aCtx.rEngine.PushString((IntToStr(aCtx, l_aValue)));
end;//TkwIntToStr.DoDoIt

class function TkwIntToStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IntToStr';
end;//TkwIntToStr.GetWordNameForRegister

function TkwIntToStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwIntToStr.GetResultTypeInfo

type
 TkwIsXE = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта IsXE
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 IsXE >>> l_Boolean
[code]  }
 private
 // private methods
   function IsXE(const aCtx: TtfwContext): Boolean;
     {* Реализация слова скрипта IsXE }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwIsXE

// start class TkwIsXE

function TkwIsXE.IsXE(const aCtx: TtfwContext): Boolean;
//#UC START# *59381C9832D8_8B86F9435925_var*
//#UC END# *59381C9832D8_8B86F9435925_var*
begin
//#UC START# *59381C9832D8_8B86F9435925_impl*
 {$IfDef XE}
 Result := true;
 {$Else  XE}
 Result := false;
 {$EndIf XE}
//#UC END# *59381C9832D8_8B86F9435925_impl*
end;//TkwIsXE.IsXE

procedure TkwIsXE.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushBool((IsXE(aCtx)));
end;//TkwIsXE.DoDoIt

class function TkwIsXE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IsXE';
end;//TkwIsXE.GetWordNameForRegister

function TkwIsXE.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwIsXE.GetResultTypeInfo

type
 TkwWinExec = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта WinExec
*Пример:*
[code]
 aPath WinExec
[code]  }
 private
 // private methods
   procedure WinExec(const aCtx: TtfwContext;
    const aPath: AnsiString);
     {* Реализация слова скрипта WinExec }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwWinExec

// start class TkwWinExec

procedure TkwWinExec.WinExec(const aCtx: TtfwContext;
  const aPath: AnsiString);
//#UC START# *F86B14A38365_7B3EE646F965_var*
var
 l_S : AnsiString;
//#UC END# *F86B14A38365_7B3EE646F965_var*
begin
//#UC START# *F86B14A38365_7B3EE646F965_impl*
 l_S := aPath;
 if (ExtractFilePath(l_S) = '') then
  l_S := ExtractFilePath(ParamStr(0)) + l_S;
 Windows.WinExec(PAnsiChar(l_S), {SW_HIDE}SW_SHOWNORMAL);
//#UC END# *F86B14A38365_7B3EE646F965_impl*
end;//TkwWinExec.WinExec

procedure TkwWinExec.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPath : AnsiString;
begin
 try
  l_aPath := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPath: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 WinExec(aCtx, l_aPath);
end;//TkwWinExec.DoDoIt

class function TkwWinExec.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WinExec';
end;//TkwWinExec.GetWordNameForRegister

function TkwWinExec.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwWinExec.GetResultTypeInfo

type
 TkwScriptFileName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта script:FileName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 script:FileName >>> l_String
[code]  }
 private
 // private methods
   function ScriptFileName(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта script:FileName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScriptFileName

// start class TkwScriptFileName

function TkwScriptFileName.ScriptFileName(const aCtx: TtfwContext): AnsiString;
//#UC START# *430363D4F3AC_C64998CA8748_var*
//#UC END# *430363D4F3AC_C64998CA8748_var*
begin
//#UC START# *430363D4F3AC_C64998CA8748_impl*
 Result := aCtx.rStreamFactory.FileName;
//#UC END# *430363D4F3AC_C64998CA8748_impl*
end;//TkwScriptFileName.ScriptFileName

procedure TkwScriptFileName.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((ScriptFileName(aCtx)));
end;//TkwScriptFileName.DoDoIt

class function TkwScriptFileName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'script:FileName';
end;//TkwScriptFileName.GetWordNameForRegister

function TkwScriptFileName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwScriptFileName.GetResultTypeInfo

type
 TkwSysutilsChangeFileExt = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ChangeFileExt
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aName anExt sysutils:ChangeFileExt >>> l_String
[code]  }
 private
 // private methods
   function SysutilsChangeFileExt(const aCtx: TtfwContext;
    const anExt: AnsiString;
    const aName: AnsiString): AnsiString;
     {* Реализация слова скрипта sysutils:ChangeFileExt }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsChangeFileExt

// start class TkwSysutilsChangeFileExt

function TkwSysutilsChangeFileExt.SysutilsChangeFileExt(const aCtx: TtfwContext;
  const anExt: AnsiString;
  const aName: AnsiString): AnsiString;
//#UC START# *5D9DF8E375F9_68C847BC1029_var*
//#UC END# *5D9DF8E375F9_68C847BC1029_var*
begin
//#UC START# *5D9DF8E375F9_68C847BC1029_impl*
 Result := ChangeFileExt(aName, anExt);
//#UC END# *5D9DF8E375F9_68C847BC1029_impl*
end;//TkwSysutilsChangeFileExt.SysutilsChangeFileExt

procedure TkwSysutilsChangeFileExt.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_anExt : AnsiString;
 l_aName : AnsiString;
begin
 try
  l_anExt := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anExt: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((SysutilsChangeFileExt(aCtx, l_anExt, l_aName)));
end;//TkwSysutilsChangeFileExt.DoDoIt

class function TkwSysutilsChangeFileExt.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ChangeFileExt';
end;//TkwSysutilsChangeFileExt.GetWordNameForRegister

function TkwSysutilsChangeFileExt.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwSysutilsChangeFileExt.GetResultTypeInfo

type
 TkwSysutilsExtractFileName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ExtractFileName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aName sysutils:ExtractFileName >>> l_String
[code]  }
 private
 // private methods
   function SysutilsExtractFileName(const aCtx: TtfwContext;
    const aName: AnsiString): AnsiString;
     {* Реализация слова скрипта sysutils:ExtractFileName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsExtractFileName

// start class TkwSysutilsExtractFileName

function TkwSysutilsExtractFileName.SysutilsExtractFileName(const aCtx: TtfwContext;
  const aName: AnsiString): AnsiString;
//#UC START# *48BEA5CAB9AB_35FFB5DF4CE1_var*
//#UC END# *48BEA5CAB9AB_35FFB5DF4CE1_var*
begin
//#UC START# *48BEA5CAB9AB_35FFB5DF4CE1_impl*
 Result := ExtractFileName(aName);
//#UC END# *48BEA5CAB9AB_35FFB5DF4CE1_impl*
end;//TkwSysutilsExtractFileName.SysutilsExtractFileName

procedure TkwSysutilsExtractFileName.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((SysutilsExtractFileName(aCtx, l_aName)));
end;//TkwSysutilsExtractFileName.DoDoIt

class function TkwSysutilsExtractFileName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ExtractFileName';
end;//TkwSysutilsExtractFileName.GetWordNameForRegister

function TkwSysutilsExtractFileName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwSysutilsExtractFileName.GetResultTypeInfo

type
 TkwSysutilsExtractFilePath = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ExtractFilePath
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aName sysutils:ExtractFilePath >>> l_String
[code]  }
 private
 // private methods
   function SysutilsExtractFilePath(const aCtx: TtfwContext;
    const aName: AnsiString): AnsiString;
     {* Реализация слова скрипта sysutils:ExtractFilePath }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsExtractFilePath

// start class TkwSysutilsExtractFilePath

function TkwSysutilsExtractFilePath.SysutilsExtractFilePath(const aCtx: TtfwContext;
  const aName: AnsiString): AnsiString;
//#UC START# *80C1D574516D_E5B80654F1A7_var*
//#UC END# *80C1D574516D_E5B80654F1A7_var*
begin
//#UC START# *80C1D574516D_E5B80654F1A7_impl*
 Result := ExtractFilePath(aName);
//#UC END# *80C1D574516D_E5B80654F1A7_impl*
end;//TkwSysutilsExtractFilePath.SysutilsExtractFilePath

procedure TkwSysutilsExtractFilePath.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((SysutilsExtractFilePath(aCtx, l_aName)));
end;//TkwSysutilsExtractFilePath.DoDoIt

class function TkwSysutilsExtractFilePath.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ExtractFilePath';
end;//TkwSysutilsExtractFilePath.GetWordNameForRegister

function TkwSysutilsExtractFilePath.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwSysutilsExtractFilePath.GetResultTypeInfo

type
 TkwSysutilsExtractFileDrive = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ExtractFileDrive
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 aName sysutils:ExtractFileDrive >>> l_String
[code]  }
 private
 // private methods
   function SysutilsExtractFileDrive(const aCtx: TtfwContext;
    const aName: AnsiString): AnsiString;
     {* Реализация слова скрипта sysutils:ExtractFileDrive }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsExtractFileDrive

// start class TkwSysutilsExtractFileDrive

function TkwSysutilsExtractFileDrive.SysutilsExtractFileDrive(const aCtx: TtfwContext;
  const aName: AnsiString): AnsiString;
//#UC START# *7607F0C19FA3_968E4E29A5EA_var*
//#UC END# *7607F0C19FA3_968E4E29A5EA_var*
begin
//#UC START# *7607F0C19FA3_968E4E29A5EA_impl*
 Result := ExtractFileDrive(aName);
//#UC END# *7607F0C19FA3_968E4E29A5EA_impl*
end;//TkwSysutilsExtractFileDrive.SysutilsExtractFileDrive

procedure TkwSysutilsExtractFileDrive.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((SysutilsExtractFileDrive(aCtx, l_aName)));
end;//TkwSysutilsExtractFileDrive.DoDoIt

class function TkwSysutilsExtractFileDrive.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ExtractFileDrive';
end;//TkwSysutilsExtractFileDrive.GetWordNameForRegister

function TkwSysutilsExtractFileDrive.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwSysutilsExtractFileDrive.GetResultTypeInfo

type
 TkwSysutilsDirectoryExists = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:DirectoryExists
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aPath sysutils:DirectoryExists >>> l_Boolean
[code]  }
 private
 // private methods
   function SysutilsDirectoryExists(const aCtx: TtfwContext;
    const aPath: AnsiString): Boolean;
     {* Реализация слова скрипта sysutils:DirectoryExists }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsDirectoryExists

// start class TkwSysutilsDirectoryExists

function TkwSysutilsDirectoryExists.SysutilsDirectoryExists(const aCtx: TtfwContext;
  const aPath: AnsiString): Boolean;
//#UC START# *A6E45D572442_ACB27923B254_var*
//#UC END# *A6E45D572442_ACB27923B254_var*
begin
//#UC START# *A6E45D572442_ACB27923B254_impl*
 Result := DirectoryExists(aPath);
//#UC END# *A6E45D572442_ACB27923B254_impl*
end;//TkwSysutilsDirectoryExists.SysutilsDirectoryExists

procedure TkwSysutilsDirectoryExists.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPath : AnsiString;
begin
 try
  l_aPath := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPath: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SysutilsDirectoryExists(aCtx, l_aPath)));
end;//TkwSysutilsDirectoryExists.DoDoIt

class function TkwSysutilsDirectoryExists.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:DirectoryExists';
end;//TkwSysutilsDirectoryExists.GetWordNameForRegister

function TkwSysutilsDirectoryExists.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSysutilsDirectoryExists.GetResultTypeInfo

type
 TkwSysutilsFileExists = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:FileExists
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aPath sysutils:FileExists >>> l_Boolean
[code]  }
 private
 // private methods
   function SysutilsFileExists(const aCtx: TtfwContext;
    const aPath: AnsiString): Boolean;
     {* Реализация слова скрипта sysutils:FileExists }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsFileExists

// start class TkwSysutilsFileExists

function TkwSysutilsFileExists.SysutilsFileExists(const aCtx: TtfwContext;
  const aPath: AnsiString): Boolean;
//#UC START# *880D1E65813C_8709A220B763_var*
//#UC END# *880D1E65813C_8709A220B763_var*
begin
//#UC START# *880D1E65813C_8709A220B763_impl*
 Result := FileExists(aPath);
//#UC END# *880D1E65813C_8709A220B763_impl*
end;//TkwSysutilsFileExists.SysutilsFileExists

procedure TkwSysutilsFileExists.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPath : AnsiString;
begin
 try
  l_aPath := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPath: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SysutilsFileExists(aCtx, l_aPath)));
end;//TkwSysutilsFileExists.DoDoIt

class function TkwSysutilsFileExists.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:FileExists';
end;//TkwSysutilsFileExists.GetWordNameForRegister

function TkwSysutilsFileExists.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSysutilsFileExists.GetResultTypeInfo

type
 TkwSysutilsForceDirectories = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ForceDirectories
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aPath sysutils:ForceDirectories >>> l_Boolean
[code]  }
 private
 // private methods
   function SysutilsForceDirectories(const aCtx: TtfwContext;
    const aPath: AnsiString): Boolean;
     {* Реализация слова скрипта sysutils:ForceDirectories }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsForceDirectories

// start class TkwSysutilsForceDirectories

function TkwSysutilsForceDirectories.SysutilsForceDirectories(const aCtx: TtfwContext;
  const aPath: AnsiString): Boolean;
//#UC START# *DF7BBEF65068_4F6F96722B37_var*
//#UC END# *DF7BBEF65068_4F6F96722B37_var*
begin
//#UC START# *DF7BBEF65068_4F6F96722B37_impl*
 Result := ForceDirectories(aPath);
//#UC END# *DF7BBEF65068_4F6F96722B37_impl*
end;//TkwSysutilsForceDirectories.SysutilsForceDirectories

procedure TkwSysutilsForceDirectories.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aPath : AnsiString;
begin
 try
  l_aPath := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aPath: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SysutilsForceDirectories(aCtx, l_aPath)));
end;//TkwSysutilsForceDirectories.DoDoIt

class function TkwSysutilsForceDirectories.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ForceDirectories';
end;//TkwSysutilsForceDirectories.GetWordNameForRegister

function TkwSysutilsForceDirectories.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSysutilsForceDirectories.GetResultTypeInfo

type
 TkwSetAppPath2CurrentDir = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SetAppPath2CurrentDir
*Пример:*
[code]
 SetAppPath2CurrentDir
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
 end;//TkwSetAppPath2CurrentDir

// start class TkwSetAppPath2CurrentDir

procedure TkwSetAppPath2CurrentDir.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_21D0FBE864A6_var*
//#UC END# *4DAEEDE10285_21D0FBE864A6_var*
begin
//#UC START# *4DAEEDE10285_21D0FBE864A6_impl*
 SetCurrentDir(ExtractFilePath(ParamStr(0)));
//#UC END# *4DAEEDE10285_21D0FBE864A6_impl*
end;//TkwSetAppPath2CurrentDir.DoDoIt

class function TkwSetAppPath2CurrentDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetAppPath2CurrentDir';
end;//TkwSetAppPath2CurrentDir.GetWordNameForRegister

function TkwSetAppPath2CurrentDir.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSetAppPath2CurrentDir.GetResultTypeInfo

type
 TkwApplicationExeName = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта application:ExeName
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 application:ExeName >>> l_String
[code]  }
 private
 // private methods
   function ApplicationExeName(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта application:ExeName }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwApplicationExeName

// start class TkwApplicationExeName

function TkwApplicationExeName.ApplicationExeName(const aCtx: TtfwContext): AnsiString;
//#UC START# *BBBD58864003_B3D96AECB8FC_var*
//#UC END# *BBBD58864003_B3D96AECB8FC_var*
begin
//#UC START# *BBBD58864003_B3D96AECB8FC_impl*
 Result := ParamStr(0);
//#UC END# *BBBD58864003_B3D96AECB8FC_impl*
end;//TkwApplicationExeName.ApplicationExeName

procedure TkwApplicationExeName.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((ApplicationExeName(aCtx)));
end;//TkwApplicationExeName.DoDoIt

class function TkwApplicationExeName.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:ExeName';
end;//TkwApplicationExeName.GetWordNameForRegister

function TkwApplicationExeName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwApplicationExeName.GetResultTypeInfo

type
 TkwGetTickCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта GetTickCount
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 GetTickCount >>> l_Integer
[code]  }
 private
 // private methods
   function GetTickCount(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта GetTickCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwGetTickCount

// start class TkwGetTickCount

function TkwGetTickCount.GetTickCount(const aCtx: TtfwContext): Integer;
//#UC START# *5DDD1E88CFCD_283A1C53257F_var*
//#UC END# *5DDD1E88CFCD_283A1C53257F_var*
begin
//#UC START# *5DDD1E88CFCD_283A1C53257F_impl*
 Result := Windows.GetTickCount;
//#UC END# *5DDD1E88CFCD_283A1C53257F_impl*
end;//TkwGetTickCount.GetTickCount

procedure TkwGetTickCount.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((GetTickCount(aCtx)));
end;//TkwGetTickCount.DoDoIt

class function TkwGetTickCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetTickCount';
end;//TkwGetTickCount.GetWordNameForRegister

function TkwGetTickCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwGetTickCount.GetResultTypeInfo

type
 TkwApplicationActionIdle = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта application:ActionIdle
*Пример:*
[code]
 application:ActionIdle
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
 end;//TkwApplicationActionIdle

// start class TkwApplicationActionIdle

procedure TkwApplicationActionIdle.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4321FF105F4A_var*
//#UC END# *4DAEEDE10285_4321FF105F4A_var*
begin
//#UC START# *4DAEEDE10285_4321FF105F4A_impl*
 try
  {$IfDef l3HackedVCL}
  {$IfNDef NoVCL}
  Forms.Application.CallActionIdle;
  {$Else   NoVCL}
  Assert(false);
  {$EndIf  NoVCL}
  {$EndIf l3HackedVCL}
 except
  on EListError do;  //541670158
 end;//try..except
//#UC END# *4DAEEDE10285_4321FF105F4A_impl*
end;//TkwApplicationActionIdle.DoDoIt

class function TkwApplicationActionIdle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'application:ActionIdle';
end;//TkwApplicationActionIdle.GetWordNameForRegister

function TkwApplicationActionIdle.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwApplicationActionIdle.GetResultTypeInfo

type
 TkwClipboardClear = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта clipboard:clear
*Пример:*
[code]
 clipboard:clear
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
 end;//TkwClipboardClear

// start class TkwClipboardClear

procedure TkwClipboardClear.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_2761B617CA85_var*
//#UC END# *4DAEEDE10285_2761B617CA85_var*
begin
//#UC START# *4DAEEDE10285_2761B617CA85_impl*
 l3System.ClearClipboard;
//#UC END# *4DAEEDE10285_2761B617CA85_impl*
end;//TkwClipboardClear.DoDoIt

class function TkwClipboardClear.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'clipboard:clear';
end;//TkwClipboardClear.GetWordNameForRegister

function TkwClipboardClear.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwClipboardClear.GetResultTypeInfo

type
 TkwSetLocalDate = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SetLocalDate
*Пример:*
[code]
 anYear aMonth aDay SetLocalDate
[code]  }
 private
 // private methods
   procedure SetLocalDate(const aCtx: TtfwContext;
    aDay: Integer;
    aMonth: Integer;
    anYear: Integer);
     {* Реализация слова скрипта SetLocalDate }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSetLocalDate

// start class TkwSetLocalDate

procedure TkwSetLocalDate.SetLocalDate(const aCtx: TtfwContext;
  aDay: Integer;
  aMonth: Integer;
  anYear: Integer);
//#UC START# *FCCD09033538_8A50690C658A_var*
var
 l_Time: TSystemTime;
//#UC END# *FCCD09033538_8A50690C658A_var*
begin
//#UC START# *FCCD09033538_8A50690C658A_impl*
 Windows.GetLocalTime(l_Time);
 
 l_Time.wDay := aDay;
 l_Time.wMonth := aMonth;
 l_Time.wYear := anYear;

 Windows.SetLocalTime(l_Time);
//#UC END# *FCCD09033538_8A50690C658A_impl*
end;//TkwSetLocalDate.SetLocalDate

procedure TkwSetLocalDate.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDay : Integer;
 l_aMonth : Integer;
 l_anYear : Integer;
begin
 try
  l_aDay := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDay: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMonth := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMonth: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anYear := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anYear: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetLocalDate(aCtx, l_aDay, l_aMonth, l_anYear);
end;//TkwSetLocalDate.DoDoIt

class function TkwSetLocalDate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetLocalDate';
end;//TkwSetLocalDate.GetWordNameForRegister

function TkwSetLocalDate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSetLocalDate.GetResultTypeInfo

type
 TkwSetLocalTime = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SetLocalTime
*Пример:*
[code]
 anHour aMinute aSecond aMilli SetLocalTime
[code]  }
 private
 // private methods
   procedure SetLocalTime(const aCtx: TtfwContext;
    aMilli: Integer;
    aSecond: Integer;
    aMinute: Integer;
    anHour: Integer);
     {* Реализация слова скрипта SetLocalTime }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSetLocalTime

// start class TkwSetLocalTime

procedure TkwSetLocalTime.SetLocalTime(const aCtx: TtfwContext;
  aMilli: Integer;
  aSecond: Integer;
  aMinute: Integer;
  anHour: Integer);
//#UC START# *5AB6E7F355A8_453F93ACCEA3_var*
var
 l_Time: TSystemTime;
//#UC END# *5AB6E7F355A8_453F93ACCEA3_var*
begin
//#UC START# *5AB6E7F355A8_453F93ACCEA3_impl*
 Windows.GetLocalTime(l_Time);

 l_Time.wMilliseconds := aMilli;
 l_Time.wSecond := aSecond;
 l_Time.wMinute := aMinute;
 l_Time.wHour := anHour;

 Windows.SetLocalTime(l_Time);
//#UC END# *5AB6E7F355A8_453F93ACCEA3_impl*
end;//TkwSetLocalTime.SetLocalTime

procedure TkwSetLocalTime.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aMilli : Integer;
 l_aSecond : Integer;
 l_aMinute : Integer;
 l_anHour : Integer;
begin
 try
  l_aMilli := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMilli: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSecond := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSecond: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMinute := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMinute: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anHour := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anHour: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetLocalTime(aCtx, l_aMilli, l_aSecond, l_aMinute, l_anHour);
end;//TkwSetLocalTime.DoDoIt

class function TkwSetLocalTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetLocalTime';
end;//TkwSetLocalTime.GetWordNameForRegister

function TkwSetLocalTime.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSetLocalTime.GetResultTypeInfo

type
 TkwSetLocalDateTime = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта SetLocalDateTime
*Пример:*
[code]
 anYear aMonth aDay anHour aMinute aSecond aMilli SetLocalDateTime
[code]  }
 private
 // private methods
   procedure SetLocalDateTime(const aCtx: TtfwContext;
    aMilli: Integer;
    aSecond: Integer;
    aMinute: Integer;
    anHour: Integer;
    aDay: Integer;
    aMonth: Integer;
    anYear: Integer);
     {* Реализация слова скрипта SetLocalDateTime }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSetLocalDateTime

// start class TkwSetLocalDateTime

procedure TkwSetLocalDateTime.SetLocalDateTime(const aCtx: TtfwContext;
  aMilli: Integer;
  aSecond: Integer;
  aMinute: Integer;
  anHour: Integer;
  aDay: Integer;
  aMonth: Integer;
  anYear: Integer);
//#UC START# *86288D38BB4F_CC86921D0E73_var*
var
 l_Time: TSystemTime;
//#UC END# *86288D38BB4F_CC86921D0E73_var*
begin
//#UC START# *86288D38BB4F_CC86921D0E73_impl*
 Windows.GetLocalTime(l_Time);

 l_Time.wMilliseconds := aMilli;
 l_Time.wSecond := aSecond;
 l_Time.wMinute := aMinute;
 l_Time.wHour := anHour;
 l_Time.wDay := aDay;
 l_Time.wMonth := aMonth;
 l_Time.wYear := anYear;

 Windows.SetLocalTime(l_Time);
//#UC END# *86288D38BB4F_CC86921D0E73_impl*
end;//TkwSetLocalDateTime.SetLocalDateTime

procedure TkwSetLocalDateTime.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aMilli : Integer;
 l_aSecond : Integer;
 l_aMinute : Integer;
 l_anHour : Integer;
 l_aDay : Integer;
 l_aMonth : Integer;
 l_anYear : Integer;
begin
 try
  l_aMilli := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMilli: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aSecond := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSecond: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMinute := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMinute: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anHour := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anHour: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDay := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDay: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aMonth := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aMonth: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anYear := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anYear: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetLocalDateTime(aCtx, l_aMilli, l_aSecond, l_aMinute, l_anHour, l_aDay, l_aMonth, l_anYear);
end;//TkwSetLocalDateTime.DoDoIt

class function TkwSetLocalDateTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetLocalDateTime';
end;//TkwSetLocalDateTime.GetWordNameForRegister

function TkwSetLocalDateTime.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwSetLocalDateTime.GetResultTypeInfo

type
 TkwGetLocalDate = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта GetLocalDate
*Пример:*
[code]
 GetLocalDate
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
 end;//TkwGetLocalDate

// start class TkwGetLocalDate

procedure TkwGetLocalDate.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_F6C5E61F680C_var*
var
  l_Time: TSystemTime;
//#UC END# *4DAEEDE10285_F6C5E61F680C_var*
begin
//#UC START# *4DAEEDE10285_F6C5E61F680C_impl*
 Windows.GetLocalTime(l_Time);
 aCtx.rEngine.PushInt(l_Time.wYear);
 aCtx.rEngine.PushInt(l_Time.wMonth);
 aCtx.rEngine.PushInt(l_Time.wDay);
//#UC END# *4DAEEDE10285_F6C5E61F680C_impl*
end;//TkwGetLocalDate.DoDoIt

class function TkwGetLocalDate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetLocalDate';
end;//TkwGetLocalDate.GetWordNameForRegister

function TkwGetLocalDate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwGetLocalDate.GetResultTypeInfo

type
 TkwGetLocalDateTime = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта GetLocalDateTime
*Пример:*
[code]
 GetLocalDateTime
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
 end;//TkwGetLocalDateTime

// start class TkwGetLocalDateTime

procedure TkwGetLocalDateTime.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_1FE2F18F76F6_var*
var
  l_Time: TSystemTime;
//#UC END# *4DAEEDE10285_1FE2F18F76F6_var*
begin
//#UC START# *4DAEEDE10285_1FE2F18F76F6_impl*
 Windows.GetLocalTime(l_Time);
 aCtx.rEngine.PushInt(l_Time.wYear);
 aCtx.rEngine.PushInt(l_Time.wMonth);
 aCtx.rEngine.PushInt(l_Time.wDay);
 aCtx.rEngine.PushInt(l_Time.wHour);
 aCtx.rEngine.PushInt(l_Time.wMinute);
 aCtx.rEngine.PushInt(l_Time.wSecond);
 aCtx.rEngine.PushInt(l_Time.wMilliseconds);
//#UC END# *4DAEEDE10285_1FE2F18F76F6_impl*
end;//TkwGetLocalDateTime.DoDoIt

class function TkwGetLocalDateTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetLocalDateTime';
end;//TkwGetLocalDateTime.GetWordNameForRegister

function TkwGetLocalDateTime.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwGetLocalDateTime.GetResultTypeInfo

type
 TkwGetLocalTime = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта GetLocalTime
*Пример:*
[code]
 GetLocalTime
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
 end;//TkwGetLocalTime

// start class TkwGetLocalTime

procedure TkwGetLocalTime.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_47E01D1A49DA_var*
var
  l_Time: TSystemTime;
//#UC END# *4DAEEDE10285_47E01D1A49DA_var*
begin
//#UC START# *4DAEEDE10285_47E01D1A49DA_impl*
 Windows.GetLocalTime(l_Time); 
 aCtx.rEngine.PushInt(l_Time.wHour);
 aCtx.rEngine.PushInt(l_Time.wMinute);
 aCtx.rEngine.PushInt(l_Time.wSecond);
 aCtx.rEngine.PushInt(l_Time.wMilliseconds);
//#UC END# *4DAEEDE10285_47E01D1A49DA_impl*
end;//TkwGetLocalTime.DoDoIt

class function TkwGetLocalTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GetLocalTime';
end;//TkwGetLocalTime.GetWordNameForRegister

function TkwGetLocalTime.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwGetLocalTime.GetResultTypeInfo

type
 TkwStartTimer = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта StartTimer
*Пример:*
[code]
 StartTimer
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
 end;//TkwStartTimer

// start class TkwStartTimer

procedure TkwStartTimer.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_084854089DF8_var*
//#UC END# *4DAEEDE10285_084854089DF8_var*
begin
//#UC START# *4DAEEDE10285_084854089DF8_impl*
 aCtx.rCaller.StartTimer;
//#UC END# *4DAEEDE10285_084854089DF8_impl*
end;//TkwStartTimer.DoDoIt

class function TkwStartTimer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StartTimer';
end;//TkwStartTimer.GetWordNameForRegister

function TkwStartTimer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwStartTimer.GetResultTypeInfo

type
 TkwStopTimer = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта StopTimer
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aName StopTimer >>> l_Integer
[code]  }
 private
 // private methods
   function StopTimer(const aCtx: TtfwContext;
    const aName: AnsiString): Integer;
     {* Реализация слова скрипта StopTimer }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStopTimer

// start class TkwStopTimer

function TkwStopTimer.StopTimer(const aCtx: TtfwContext;
  const aName: AnsiString): Integer;
//#UC START# *D41B4A8BB159_E113BA65B398_var*
//#UC END# *D41B4A8BB159_E113BA65B398_var*
begin
//#UC START# *D41B4A8BB159_E113BA65B398_impl*
 Result := aCtx.rCaller.StopTimer(aName);
//#UC END# *D41B4A8BB159_E113BA65B398_impl*
end;//TkwStopTimer.StopTimer

procedure TkwStopTimer.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aName : AnsiString;
begin
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StopTimer(aCtx, l_aName)));
end;//TkwStopTimer.DoDoIt

class function TkwStopTimer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StopTimer';
end;//TkwStopTimer.GetWordNameForRegister

function TkwStopTimer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStopTimer.GetResultTypeInfo

type
 TkwStopTimerEx = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта StopTimerEx
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aName aSubName StopTimerEx >>> l_Integer
[code]  }
 private
 // private methods
   function StopTimerEx(const aCtx: TtfwContext;
    const aSubName: AnsiString;
    const aName: AnsiString): Integer;
     {* Реализация слова скрипта StopTimerEx }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwStopTimerEx

// start class TkwStopTimerEx

function TkwStopTimerEx.StopTimerEx(const aCtx: TtfwContext;
  const aSubName: AnsiString;
  const aName: AnsiString): Integer;
//#UC START# *9630E77C53F3_861A2BB899E3_var*
//#UC END# *9630E77C53F3_861A2BB899E3_var*
begin
//#UC START# *9630E77C53F3_861A2BB899E3_impl*
 Result := aCtx.rCaller.StopTimer(aName, aSubName)
//#UC END# *9630E77C53F3_861A2BB899E3_impl*
end;//TkwStopTimerEx.StopTimerEx

procedure TkwStopTimerEx.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aSubName : AnsiString;
 l_aName : AnsiString;
begin
 try
  l_aSubName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSubName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((StopTimerEx(aCtx, l_aSubName, l_aName)));
end;//TkwStopTimerEx.DoDoIt

class function TkwStopTimerEx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StopTimerEx';
end;//TkwStopTimerEx.GetWordNameForRegister

function TkwStopTimerEx.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwStopTimerEx.GetResultTypeInfo

type
 TkwTimeToLog = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта TimeToLog
*Пример:*
[code]
 aName aSubName aValue TimeToLog
[code]  }
 private
 // private methods
   procedure TimeToLog(const aCtx: TtfwContext;
    aValue: Integer;
    const aSubName: AnsiString;
    const aName: AnsiString);
     {* Реализация слова скрипта TimeToLog }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwTimeToLog

// start class TkwTimeToLog

procedure TkwTimeToLog.TimeToLog(const aCtx: TtfwContext;
  aValue: Integer;
  const aSubName: AnsiString;
  const aName: AnsiString);
//#UC START# *1CD228A2D1EA_1C56158F55E7_var*

 function Mangle(const aStr: AnsiString): AnsiString;
(* const
  cLimit = 30;*)
 begin
  Result := aStr;
(*  Result := l3Transliterate(aStr);
  l3Replace(Result, ' ', '_');
  l3Replace(Result, '''', '_');
  l3Replace(Result, '(', '_');
  l3Replace(Result, ')', '_');
  l3Replace(Result, '.', '_');
  if (Length(Result) > cLimit) then
   SetLength(Result, cLimit);*)
 end;
 
var
 l_S1 : AnsiString;
 l_S2 : AnsiString;
//#UC END# *1CD228A2D1EA_1C56158F55E7_var*
begin
//#UC START# *1CD228A2D1EA_1C56158F55E7_impl*
 l_S2 := Mangle(aSubName);
 l_S1 := Mangle(aName);
 aCtx.rCaller.TimeToLog(aValue, l_S1, l_S2);
//#UC END# *1CD228A2D1EA_1C56158F55E7_impl*
end;//TkwTimeToLog.TimeToLog

procedure TkwTimeToLog.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aValue : Integer;
 l_aSubName : AnsiString;
 l_aName : AnsiString;
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
 try
  l_aSubName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aSubName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aName := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aName: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 TimeToLog(aCtx, l_aValue, l_aSubName, l_aName);
end;//TkwTimeToLog.DoDoIt

class function TkwTimeToLog.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'TimeToLog';
end;//TkwTimeToLog.GetWordNameForRegister

function TkwTimeToLog.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwTimeToLog.GetResultTypeInfo

type
 TkwShiftDate = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ShiftDate
*Пример:*
[code]
 aDeltaY aDeltaM aDeltaD ShiftDate
[code]  }
 private
 // private methods
   procedure ShiftDate(const aCtx: TtfwContext;
    aDeltaD: Integer;
    aDeltaM: Integer;
    aDeltaY: Integer);
     {* Реализация слова скрипта ShiftDate }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwShiftDate

// start class TkwShiftDate

procedure TkwShiftDate.ShiftDate(const aCtx: TtfwContext;
  aDeltaD: Integer;
  aDeltaM: Integer;
  aDeltaY: Integer);
//#UC START# *90D645BF4786_7411EFEEC0A2_var*
var
 l_Time: TSystemTime;
 l_DelphiTime: TDateTime;
//#UC END# *90D645BF4786_7411EFEEC0A2_var*
begin
//#UC START# *90D645BF4786_7411EFEEC0A2_impl*
 Windows.GetLocalTime(l_Time);
 with l_Time do
  l_DelphiTime := EncodeDateTime(wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 l_DelphiTime := IncYear(l_DelphiTime, aDeltaY);
 l_DelphiTime := IncMonth(l_DelphiTime, aDeltaM);
 l_DelphiTime := IncDay(l_DelphiTime, aDeltaD);
 with l_Time do
  DecodeDateTime(l_DelphiTime, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 Windows.SetLocalTime(l_Time);
//#UC END# *90D645BF4786_7411EFEEC0A2_impl*
end;//TkwShiftDate.ShiftDate

procedure TkwShiftDate.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDeltaD : Integer;
 l_aDeltaM : Integer;
 l_aDeltaY : Integer;
begin
 try
  l_aDeltaD := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDeltaD: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDeltaM := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDeltaM: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aDeltaY := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDeltaY: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ShiftDate(aCtx, l_aDeltaD, l_aDeltaM, l_aDeltaY);
end;//TkwShiftDate.DoDoIt

class function TkwShiftDate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ShiftDate';
end;//TkwShiftDate.GetWordNameForRegister

function TkwShiftDate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwShiftDate.GetResultTypeInfo

type
 TkwShiftTime = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта ShiftTime
*Пример:*
[code]
 aDeltaMilli ShiftTime
[code]  }
 private
 // private methods
   procedure ShiftTime(const aCtx: TtfwContext;
    aDeltaMilli: Integer);
     {* Реализация слова скрипта ShiftTime }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwShiftTime

// start class TkwShiftTime

procedure TkwShiftTime.ShiftTime(const aCtx: TtfwContext;
  aDeltaMilli: Integer);
//#UC START# *1922D633B85B_9F4966698005_var*
var
 l_Time: TSystemTime;
 l_DelphiTime: TDateTime;
//#UC END# *1922D633B85B_9F4966698005_var*
begin
//#UC START# *1922D633B85B_9F4966698005_impl*
 Windows.GetLocalTime(l_Time);
 with l_Time do
  l_DelphiTime := EncodeDateTime(wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 l_DelphiTime := IncMilliSecond(l_DelphiTime, aDeltaMilli);
 with l_Time do
  DecodeDateTime(l_DelphiTime, wYear, wMonth, wDay, wHour, wMinute, wSecond, wMilliseconds);
 Windows.SetLocalTime(l_Time);
//#UC END# *1922D633B85B_9F4966698005_impl*
end;//TkwShiftTime.ShiftTime

procedure TkwShiftTime.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDeltaMilli : Integer;
begin
 try
  l_aDeltaMilli := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDeltaMilli: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 ShiftTime(aCtx, l_aDeltaMilli);
end;//TkwShiftTime.DoDoIt

class function TkwShiftTime.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ShiftTime';
end;//TkwShiftTime.GetWordNameForRegister

function TkwShiftTime.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwShiftTime.GetResultTypeInfo

type
 TkwClipboardGetFormattedText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта clipboard:GetFormattedText
*Тип результата:* Il3CString
*Пример:*
[code]
STRING VAR l_Il3CString
 aFormat clipboard:GetFormattedText >>> l_Il3CString
[code]  }
 private
 // private methods
   function ClipboardGetFormattedText(const aCtx: TtfwContext;
    const aFormat: TtfwStackValue): Il3CString;
     {* Реализация слова скрипта clipboard:GetFormattedText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwClipboardGetFormattedText

// start class TkwClipboardGetFormattedText

function TkwClipboardGetFormattedText.ClipboardGetFormattedText(const aCtx: TtfwContext;
  const aFormat: TtfwStackValue): Il3CString;
//#UC START# *545B4C0C78E1_B4A35E44526B_var*
var
 l_Format: Cardinal;
 l_ClipbrdHandle: THandle;
 l_String: PChar;
//#UC END# *545B4C0C78E1_B4A35E44526B_var*
begin
//#UC START# *545B4C0C78E1_B4A35E44526B_impl*
 if (aFormat.rType = tfw_vtInt) then
  l_Format := Cardinal(aFormat.AsInt)
 else
  {$If Declared(l3GetClipboardByFormatName)}
  l_Format := Cardinal(l3GetClipboardByFormatName(l3Str(aFormat.AsString)));
  {$Else}
  RunnerAssert(false, 'Не определена функция l3GetClipboardByFormatName', aCtx);
  {$IfEnd}

 {$If Declared(Clipboard)}
 if Clipboard.HasFormat(l_Format) then
 begin
  l_ClipbrdHandle := Clipboard.GetAsHandle(l_Format);
  l_String := GlobalLock(l_ClipbrdHandle);
  try
   //aCtx.rEngine.PushString( StrPas(l_String));
   if (l_Format = CF_UnicodeText) then
    Result := TtfwCStringFactory.C(l3PCharLen(PWideChar(l_String){, GlobalSize(l_ClipbrdHandle) div SizeOf(WideChar)}))
   else
   if (l_Format = CF_Text) OR (l_Format = CF_OEMTExt) then
    Result := TtfwCStringFactory.C(l3PCharLen(l_String{, GlobalSize(l_ClipbrdHandle)}))
   else 
    Result := TtfwCStringFactory.C(l3PCharLen(l_String, GlobalSize(l_ClipbrdHandle)));
  finally
   GlobalUnLock(l_ClipbrdHandle);
  end;
 end//Clipboard.HasFormat(l_Format)
 else
  // plain text
  Result := TtfwCStringFactory.C(Clipboard.AsText);
 {$Else}
 Assert(false);
 {$IfEnd}
//#UC END# *545B4C0C78E1_B4A35E44526B_impl*
end;//TkwClipboardGetFormattedText.ClipboardGetFormattedText

procedure TkwClipboardGetFormattedText.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aFormat : TtfwStackValue;
begin
 try
  l_aFormat := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aFormat: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((ClipboardGetFormattedText(aCtx, l_aFormat)));
end;//TkwClipboardGetFormattedText.DoDoIt

class function TkwClipboardGetFormattedText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'clipboard:GetFormattedText';
end;//TkwClipboardGetFormattedText.GetWordNameForRegister

function TkwClipboardGetFormattedText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiString;
end;//TkwClipboardGetFormattedText.GetResultTypeInfo

type
 TkwClipboardSetText = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта clipboard:SetText
*Пример:*
[code]
 aValue clipboard:SetText
[code]  }
 private
 // private methods
   procedure ClipboardSetText(const aCtx: TtfwContext;
    const aValue: Il3CString);
     {* Реализация слова скрипта clipboard:SetText }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwClipboardSetText

// start class TkwClipboardSetText

procedure TkwClipboardSetText.ClipboardSetText(const aCtx: TtfwContext;
  const aValue: Il3CString);
//#UC START# *3D183F3BE41C_F086F3387CB5_var*
//#UC END# *3D183F3BE41C_F086F3387CB5_var*
begin
//#UC START# *3D183F3BE41C_F086F3387CB5_impl*
 {$If Declared(Clipboard)}
 l3System.SetClipboardData(Tl3CStringDataObject.Make(aValue));
 //Clipboard.AsText := l3Str(aValue);
 {$Else}
 Assert(false);
 {$IfEnd}
//#UC END# *3D183F3BE41C_F086F3387CB5_impl*
end;//TkwClipboardSetText.ClipboardSetText

procedure TkwClipboardSetText.DoDoIt(const aCtx: TtfwContext);
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
 ClipboardSetText(aCtx, l_aValue);
end;//TkwClipboardSetText.DoDoIt

class function TkwClipboardSetText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'clipboard:SetText';
end;//TkwClipboardSetText.GetWordNameForRegister

function TkwClipboardSetText.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwClipboardSetText.GetResultTypeInfo

type
 TkwScriptExceptionStack = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта script:ExceptionStack
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 script:ExceptionStack >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function ScriptExceptionStack(const aCtx: TtfwContext): ItfwValueList;
     {* Реализация слова скрипта script:ExceptionStack }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwScriptExceptionStack

// start class TkwScriptExceptionStack

function TkwScriptExceptionStack.ScriptExceptionStack(const aCtx: TtfwContext): ItfwValueList;
//#UC START# *B7280416B2E0_E4DA6191960A_var*
//#UC END# *B7280416B2E0_E4DA6191960A_var*
begin
//#UC START# *B7280416B2E0_E4DA6191960A_impl*
 Result := aCtx.rEngine.ExceptionStack;
//#UC END# *B7280416B2E0_E4DA6191960A_impl*
end;//TkwScriptExceptionStack.ScriptExceptionStack

procedure TkwScriptExceptionStack.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushList((ScriptExceptionStack(aCtx)));
end;//TkwScriptExceptionStack.DoDoIt

class function TkwScriptExceptionStack.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'script:ExceptionStack';
end;//TkwScriptExceptionStack.GetWordNameForRegister

function TkwScriptExceptionStack.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwScriptExceptionStack.GetResultTypeInfo

type
 TkwSysutilsParamCount = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ParamCount
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 sysutils:ParamCount >>> l_Integer
[code]  }
 private
 // private methods
   function SysutilsParamCount(const aCtx: TtfwContext): Integer;
     {* Реализация слова скрипта sysutils:ParamCount }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsParamCount

// start class TkwSysutilsParamCount

function TkwSysutilsParamCount.SysutilsParamCount(const aCtx: TtfwContext): Integer;
//#UC START# *FD31A8AD6225_DD119E13D005_var*
//#UC END# *FD31A8AD6225_DD119E13D005_var*
begin
//#UC START# *FD31A8AD6225_DD119E13D005_impl*
 Result := ParamCount;
//#UC END# *FD31A8AD6225_DD119E13D005_impl*
end;//TkwSysutilsParamCount.SysutilsParamCount

procedure TkwSysutilsParamCount.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushInt((SysutilsParamCount(aCtx)));
end;//TkwSysutilsParamCount.DoDoIt

class function TkwSysutilsParamCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ParamCount';
end;//TkwSysutilsParamCount.GetWordNameForRegister

function TkwSysutilsParamCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwSysutilsParamCount.GetResultTypeInfo

type
 TkwSysutilsParamStr = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:ParamStr
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 anIndex sysutils:ParamStr >>> l_String
[code]  }
 private
 // private methods
   function SysutilsParamStr(const aCtx: TtfwContext;
    anIndex: Integer): AnsiString;
     {* Реализация слова скрипта sysutils:ParamStr }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsParamStr

// start class TkwSysutilsParamStr

function TkwSysutilsParamStr.SysutilsParamStr(const aCtx: TtfwContext;
  anIndex: Integer): AnsiString;
//#UC START# *5E9E901ED18F_3606634B9E3C_var*
//#UC END# *5E9E901ED18F_3606634B9E3C_var*
begin
//#UC START# *5E9E901ED18F_3606634B9E3C_impl*
 Result := ParamStr(anIndex);
//#UC END# *5E9E901ED18F_3606634B9E3C_impl*
end;//TkwSysutilsParamStr.SysutilsParamStr

procedure TkwSysutilsParamStr.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_anIndex : Integer;
begin
 try
  l_anIndex := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushString((SysutilsParamStr(aCtx, l_anIndex)));
end;//TkwSysutilsParamStr.DoDoIt

class function TkwSysutilsParamStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:ParamStr';
end;//TkwSysutilsParamStr.GetWordNameForRegister

function TkwSysutilsParamStr.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwSysutilsParamStr.GetResultTypeInfo

type
 TkwSysutilsGetCurrentDir = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:GetCurrentDir
*Тип результата:* String
*Пример:*
[code]
STRING VAR l_String
 sysutils:GetCurrentDir >>> l_String
[code]  }
 private
 // private methods
   function SysutilsGetCurrentDir(const aCtx: TtfwContext): AnsiString;
     {* Реализация слова скрипта sysutils:GetCurrentDir }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsGetCurrentDir

// start class TkwSysutilsGetCurrentDir

function TkwSysutilsGetCurrentDir.SysutilsGetCurrentDir(const aCtx: TtfwContext): AnsiString;
//#UC START# *D00C735B4A0F_A28B96AFE5F4_var*
//#UC END# *D00C735B4A0F_A28B96AFE5F4_var*
begin
//#UC START# *D00C735B4A0F_A28B96AFE5F4_impl*
 Result := SysUtils.GetCurrentDir;
//#UC END# *D00C735B4A0F_A28B96AFE5F4_impl*
end;//TkwSysutilsGetCurrentDir.SysutilsGetCurrentDir

procedure TkwSysutilsGetCurrentDir.DoDoIt(const aCtx: TtfwContext);
 {-}
begin
 aCtx.rEngine.PushString((SysutilsGetCurrentDir(aCtx)));
end;//TkwSysutilsGetCurrentDir.DoDoIt

class function TkwSysutilsGetCurrentDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:GetCurrentDir';
end;//TkwSysutilsGetCurrentDir.GetWordNameForRegister

function TkwSysutilsGetCurrentDir.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(AnsiString);
end;//TkwSysutilsGetCurrentDir.GetResultTypeInfo

type
 TkwSysutilsSetCurrentDir = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:SetCurrentDir
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aDir sysutils:SetCurrentDir >>> l_Boolean
[code]  }
 private
 // private methods
   function SysutilsSetCurrentDir(const aCtx: TtfwContext;
    const aDir: AnsiString): Boolean;
     {* Реализация слова скрипта sysutils:SetCurrentDir }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsSetCurrentDir

// start class TkwSysutilsSetCurrentDir

function TkwSysutilsSetCurrentDir.SysutilsSetCurrentDir(const aCtx: TtfwContext;
  const aDir: AnsiString): Boolean;
//#UC START# *025851A67EF2_46A105452BD6_var*
//#UC END# *025851A67EF2_46A105452BD6_var*
begin
//#UC START# *025851A67EF2_46A105452BD6_impl*
 Result := SysUtils.SetCurrentDir(aDir); 
//#UC END# *025851A67EF2_46A105452BD6_impl*
end;//TkwSysutilsSetCurrentDir.SysutilsSetCurrentDir

procedure TkwSysutilsSetCurrentDir.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDir : AnsiString;
begin
 try
  l_aDir := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDir: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SysutilsSetCurrentDir(aCtx, l_aDir)));
end;//TkwSysutilsSetCurrentDir.DoDoIt

class function TkwSysutilsSetCurrentDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:SetCurrentDir';
end;//TkwSysutilsSetCurrentDir.GetWordNameForRegister

function TkwSysutilsSetCurrentDir.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSysutilsSetCurrentDir.GetResultTypeInfo

type
 TkwSysutilsCreateDir = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:CreateDir
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aDir sysutils:CreateDir >>> l_Boolean
[code]  }
 private
 // private methods
   function SysutilsCreateDir(const aCtx: TtfwContext;
    const aDir: AnsiString): Boolean;
     {* Реализация слова скрипта sysutils:CreateDir }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsCreateDir

// start class TkwSysutilsCreateDir

function TkwSysutilsCreateDir.SysutilsCreateDir(const aCtx: TtfwContext;
  const aDir: AnsiString): Boolean;
//#UC START# *E0BDBA6E01AC_B3CBD7A00B4E_var*
//#UC END# *E0BDBA6E01AC_B3CBD7A00B4E_var*
begin
//#UC START# *E0BDBA6E01AC_B3CBD7A00B4E_impl*
 Result := SysUtils.CreateDir(aDir);
//#UC END# *E0BDBA6E01AC_B3CBD7A00B4E_impl*
end;//TkwSysutilsCreateDir.SysutilsCreateDir

procedure TkwSysutilsCreateDir.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDir : AnsiString;
begin
 try
  l_aDir := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDir: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SysutilsCreateDir(aCtx, l_aDir)));
end;//TkwSysutilsCreateDir.DoDoIt

class function TkwSysutilsCreateDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:CreateDir';
end;//TkwSysutilsCreateDir.GetWordNameForRegister

function TkwSysutilsCreateDir.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSysutilsCreateDir.GetResultTypeInfo

type
 TkwSysutilsRemoveDir = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта sysutils:RemoveDir
*Тип результата:* Boolean
*Пример:*
[code]
BOOLEAN VAR l_Boolean
 aDir sysutils:RemoveDir >>> l_Boolean
[code]  }
 private
 // private methods
   function SysutilsRemoveDir(const aCtx: TtfwContext;
    const aDir: AnsiString): Boolean;
     {* Реализация слова скрипта sysutils:RemoveDir }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwSysutilsRemoveDir

// start class TkwSysutilsRemoveDir

function TkwSysutilsRemoveDir.SysutilsRemoveDir(const aCtx: TtfwContext;
  const aDir: AnsiString): Boolean;
//#UC START# *177FD19E027A_5C2417DB86EF_var*
//#UC END# *177FD19E027A_5C2417DB86EF_var*
begin
//#UC START# *177FD19E027A_5C2417DB86EF_impl*
 Result := SysUtils.RemoveDir(aDir);
//#UC END# *177FD19E027A_5C2417DB86EF_impl*
end;//TkwSysutilsRemoveDir.SysutilsRemoveDir

procedure TkwSysutilsRemoveDir.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aDir : AnsiString;
begin
 try
  l_aDir := aCtx.rEngine.PopDelphiString;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aDir: AnsiString : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool((SysutilsRemoveDir(aCtx, l_aDir)));
end;//TkwSysutilsRemoveDir.DoDoIt

class function TkwSysutilsRemoveDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'sysutils:RemoveDir';
end;//TkwSysutilsRemoveDir.GetWordNameForRegister

function TkwSysutilsRemoveDir.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Boolean);
end;//TkwSysutilsRemoveDir.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TSysUtilsPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация HasTabs
 TkwHasTabs.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsUnder64
 TkwIsUnder64.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ComputerName
 TkwComputerName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация OSName
 TkwOSName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Random
 TkwRandom.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Randomize
 TkwRandomize.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SetRandSeed
 TkwSetRandSeed.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация RGB2String
 TkwRGB2String.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IntToStr
 TkwIntToStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация IsXE
 TkwIsXE.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация WinExec
 TkwWinExec.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация script_FileName
 TkwScriptFileName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ChangeFileExt
 TkwSysutilsChangeFileExt.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ExtractFileName
 TkwSysutilsExtractFileName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ExtractFilePath
 TkwSysutilsExtractFilePath.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ExtractFileDrive
 TkwSysutilsExtractFileDrive.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_DirectoryExists
 TkwSysutilsDirectoryExists.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_FileExists
 TkwSysutilsFileExists.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ForceDirectories
 TkwSysutilsForceDirectories.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SetAppPath2CurrentDir
 TkwSetAppPath2CurrentDir.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация application_ExeName
 TkwApplicationExeName.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GetTickCount
 TkwGetTickCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация application_ActionIdle
 TkwApplicationActionIdle.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация clipboard_clear
 TkwClipboardClear.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SetLocalDate
 TkwSetLocalDate.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SetLocalTime
 TkwSetLocalTime.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация SetLocalDateTime
 TkwSetLocalDateTime.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GetLocalDate
 TkwGetLocalDate.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GetLocalDateTime
 TkwGetLocalDateTime.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация GetLocalTime
 TkwGetLocalTime.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StartTimer
 TkwStartTimer.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StopTimer
 TkwStopTimer.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация StopTimerEx
 TkwStopTimerEx.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TimeToLog
 TkwTimeToLog.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ShiftDate
 TkwShiftDate.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация ShiftTime
 TkwShiftTime.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация clipboard_GetFormattedText
 TkwClipboardGetFormattedText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация clipboard_SetText
 TkwClipboardSetText.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация script_ExceptionStack
 TkwScriptExceptionStack.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ParamCount
 TkwSysutilsParamCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_ParamStr
 TkwSysutilsParamStr.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_GetCurrentDir
 TkwSysutilsGetCurrentDir.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_SetCurrentDir
 TkwSysutilsSetCurrentDir.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_CreateDir
 TkwSysutilsCreateDir.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация sysutils_RemoveDir
 TkwSysutilsRemoveDir.RegisterInEngine;
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
// Регистрация типа String
 TtfwTypeRegistrator.RegisterType(TypeInfo(AnsiString));
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
// Регистрация типа Il3CString
 TtfwTypeRegistrator.RegisterType(@tfw_tiString);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwValueList
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwValueList));
{$IfEnd} //not NoScripts

end.