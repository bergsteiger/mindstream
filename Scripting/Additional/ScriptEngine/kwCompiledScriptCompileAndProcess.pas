unit kwCompiledScriptCompileAndProcess;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledScriptCompileAndProcess.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ScriptsCompilingAndProcessing::TkwCompiledScriptCompileAndProcess
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledScriptCompileAndProcess = class(TkwCompiledWordWorker, ItfwScriptCaller)
 private
 // private fields
   f_NativeCaller : ItfwScriptCaller;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function ResolveIncludedFilePath(const aFile: AnsiString): AnsiString;
   function ResolveOutputFilePath(const aFile: AnsiString): AnsiString;
   function ResolveInputFilePath(const aFile: AnsiString): AnsiString;
   function SystemDictionary: IStream;
   function KPage: AnsiString;
   procedure ToLog(const aSt: AnsiString);
   function CompileOnly: Boolean;
 public
 // realized methods
   procedure CheckOutputWithInput(const aIn: AnsiString;
     const aOut: AnsiString;
     aHeaderBegin: AnsiChar;
     aEtalonNeedsComputerName: Boolean;
     aEtalonCanHaveDiff: Boolean;
     const anExtraFileName: AnsiString;
     aNeedsCheck: Boolean); overload; 
   procedure Check(aCondition: Boolean;
    const aMessage: AnsiString = '');
     {* Проверяет инвариант }
   procedure Print(const aStr: Tl3WString); overload; 
   procedure Print(const aStr: Il3CString); overload; 
   procedure CheckWithEtalon(const aFileName: AnsiString;
    aHeaderBegin: AnsiChar);
   procedure CheckPrintEtalon(const aLogName: AnsiString;
    const aOutputName: AnsiString);
   function ShouldStop: Boolean;
   procedure CheckTimeout(aNow: Cardinal;
    aTimeout: Cardinal);
   function StartTimer: Longword;
   function StopTimer(const aSt: AnsiString = '';
    const aSubName: AnsiString = '';
    aNeedTimeToLog: Boolean = true): Longword;
   procedure CheckOutputWithInput(const aSt: AnsiString;
     aHeaderBegin: AnsiChar = #0;
     const anExtraFileName: AnsiString = '';
     aNeedsCheck: Boolean = true); overload; 
   function GetIsWritingToK: Boolean;
   function GetIsFakeCVS: Boolean;
   function GetCVSPath: AnsiString;
   procedure DontRaiseIfEtalonCreated;
   procedure TimeToLog(aTime: Cardinal;
     const aSt: AnsiString;
     const aSubName: AnsiString);
   function GetTestSetFolderName: AnsiString;
   function GetEtalonSuffix: AnsiString;
   procedure CheckPictureOnly;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 end;//TkwCompiledScriptCompileAndProcess
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwFileStreamFactory,
  kwMain,
  kwMainCodeController,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledScriptCompileAndProcess

procedure TkwCompiledScriptCompileAndProcess.CheckOutputWithInput(const aIn: AnsiString;
  const aOut: AnsiString;
  aHeaderBegin: AnsiChar;
  aEtalonNeedsComputerName: Boolean;
  aEtalonCanHaveDiff: Boolean;
  const anExtraFileName: AnsiString;
  aNeedsCheck: Boolean);
//#UC START# *4CAEDCF9006A_53DA24F802A7_var*
//#UC END# *4CAEDCF9006A_53DA24F802A7_var*
begin
//#UC START# *4CAEDCF9006A_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4CAEDCF9006A_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CheckOutputWithInput

procedure TkwCompiledScriptCompileAndProcess.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53DA24F802A7_var*
var
 l_Controller : TkwMainCodeController;
 l_Stream     : TtfwFileStreamFactory;
//#UC END# *4DAEEDE10285_53DA24F802A7_var*
begin
//#UC START# *4DAEEDE10285_53DA24F802A7_impl*
 f_NativeCaller := aCtx.rCaller;
 try
  l_Stream := TtfwFileStreamFactory.Create(aCtx.rEngine.PopDelphiString);
  try
   l_Controller := TkwMainCodeController.Create(f_Word, @aCtx);
   try
    l_Controller.Script(l_Stream, Self);
   finally
    FreeAndNil(l_Controller);
   end;//try..finally
  finally
   FreeAndNil(l_Stream);
  end;//try..finally
 finally
  f_NativeCaller := nil;
 end;//try..finally
//#UC END# *4DAEEDE10285_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.DoDoIt

procedure TkwCompiledScriptCompileAndProcess.Check(aCondition: Boolean;
  const aMessage: AnsiString = '');
//#UC START# *4DAF1A280116_53DA24F802A7_var*
//#UC END# *4DAF1A280116_53DA24F802A7_var*
begin
//#UC START# *4DAF1A280116_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4DAF1A280116_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.Check

procedure TkwCompiledScriptCompileAndProcess.Print(const aStr: Tl3WString);
//#UC START# *4DB173AA005A_53DA24F802A7_var*
//#UC END# *4DB173AA005A_53DA24F802A7_var*
begin
//#UC START# *4DB173AA005A_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4DB173AA005A_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.Print

procedure TkwCompiledScriptCompileAndProcess.Print(const aStr: Il3CString);
//#UC START# *4DB1785F011A_53DA24F802A7_var*
//#UC END# *4DB1785F011A_53DA24F802A7_var*
begin
//#UC START# *4DB1785F011A_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4DB1785F011A_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.Print

function TkwCompiledScriptCompileAndProcess.ResolveIncludedFilePath(const aFile: AnsiString): AnsiString;
//#UC START# *4DC2E1470046_53DA24F802A7_var*
//#UC END# *4DC2E1470046_53DA24F802A7_var*
begin
//#UC START# *4DC2E1470046_53DA24F802A7_impl*
 Result := f_NativeCaller.ResolveIncludedFilePath(aFile);
//#UC END# *4DC2E1470046_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.ResolveIncludedFilePath

function TkwCompiledScriptCompileAndProcess.ResolveOutputFilePath(const aFile: AnsiString): AnsiString;
//#UC START# *4DCA915C0120_53DA24F802A7_var*
//#UC END# *4DCA915C0120_53DA24F802A7_var*
begin
//#UC START# *4DCA915C0120_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4DCA915C0120_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.ResolveOutputFilePath

procedure TkwCompiledScriptCompileAndProcess.CheckWithEtalon(const aFileName: AnsiString;
  aHeaderBegin: AnsiChar);
//#UC START# *4DD533BF023D_53DA24F802A7_var*
//#UC END# *4DD533BF023D_53DA24F802A7_var*
begin
//#UC START# *4DD533BF023D_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4DD533BF023D_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CheckWithEtalon

function TkwCompiledScriptCompileAndProcess.ResolveInputFilePath(const aFile: AnsiString): AnsiString;
//#UC START# *4DECF57B02D2_53DA24F802A7_var*
//#UC END# *4DECF57B02D2_53DA24F802A7_var*
begin
//#UC START# *4DECF57B02D2_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4DECF57B02D2_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.ResolveInputFilePath

function TkwCompiledScriptCompileAndProcess.SystemDictionary: IStream;
//#UC START# *4E240D1A007A_53DA24F802A7_var*
//#UC END# *4E240D1A007A_53DA24F802A7_var*
begin
//#UC START# *4E240D1A007A_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4E240D1A007A_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.SystemDictionary

procedure TkwCompiledScriptCompileAndProcess.CheckPrintEtalon(const aLogName: AnsiString;
  const aOutputName: AnsiString);
//#UC START# *4F0D7AC900FA_53DA24F802A7_var*
//#UC END# *4F0D7AC900FA_53DA24F802A7_var*
begin
//#UC START# *4F0D7AC900FA_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0D7AC900FA_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CheckPrintEtalon

function TkwCompiledScriptCompileAndProcess.ShouldStop: Boolean;
//#UC START# *4F0D8B740186_53DA24F802A7_var*
//#UC END# *4F0D8B740186_53DA24F802A7_var*
begin
//#UC START# *4F0D8B740186_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0D8B740186_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.ShouldStop

procedure TkwCompiledScriptCompileAndProcess.CheckTimeout(aNow: Cardinal;
  aTimeout: Cardinal);
//#UC START# *4F0D8C360085_53DA24F802A7_var*
//#UC END# *4F0D8C360085_53DA24F802A7_var*
begin
//#UC START# *4F0D8C360085_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0D8C360085_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CheckTimeout

function TkwCompiledScriptCompileAndProcess.StartTimer: Longword;
//#UC START# *4F0D8C5A01A2_53DA24F802A7_var*
//#UC END# *4F0D8C5A01A2_53DA24F802A7_var*
begin
//#UC START# *4F0D8C5A01A2_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0D8C5A01A2_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.StartTimer

function TkwCompiledScriptCompileAndProcess.StopTimer(const aSt: AnsiString = '';
  const aSubName: AnsiString = '';
  aNeedTimeToLog: Boolean = true): Longword;
//#UC START# *4F0D8CB0015D_53DA24F802A7_var*
//#UC END# *4F0D8CB0015D_53DA24F802A7_var*
begin
//#UC START# *4F0D8CB0015D_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0D8CB0015D_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.StopTimer

function TkwCompiledScriptCompileAndProcess.KPage: AnsiString;
//#UC START# *4F0D91AA0080_53DA24F802A7_var*
//#UC END# *4F0D91AA0080_53DA24F802A7_var*
begin
//#UC START# *4F0D91AA0080_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0D91AA0080_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.KPage

procedure TkwCompiledScriptCompileAndProcess.ToLog(const aSt: AnsiString);
//#UC START# *4F0DA2A7024A_53DA24F802A7_var*
//#UC END# *4F0DA2A7024A_53DA24F802A7_var*
begin
//#UC START# *4F0DA2A7024A_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F0DA2A7024A_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.ToLog

procedure TkwCompiledScriptCompileAndProcess.CheckOutputWithInput(const aSt: AnsiString;
  aHeaderBegin: AnsiChar = #0;
  const anExtraFileName: AnsiString = '';
  aNeedsCheck: Boolean = true);
//#UC START# *4F5F3C61023E_53DA24F802A7_var*
//#UC END# *4F5F3C61023E_53DA24F802A7_var*
begin
//#UC START# *4F5F3C61023E_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F5F3C61023E_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CheckOutputWithInput

function TkwCompiledScriptCompileAndProcess.GetIsWritingToK: Boolean;
//#UC START# *4F72CEFE016D_53DA24F802A7_var*
//#UC END# *4F72CEFE016D_53DA24F802A7_var*
begin
//#UC START# *4F72CEFE016D_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
 Result := false;
//#UC END# *4F72CEFE016D_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.GetIsWritingToK

function TkwCompiledScriptCompileAndProcess.GetIsFakeCVS: Boolean;
//#UC START# *4F72CF27029A_53DA24F802A7_var*
//#UC END# *4F72CF27029A_53DA24F802A7_var*
begin
//#UC START# *4F72CF27029A_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
 Result := false;
//#UC END# *4F72CF27029A_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.GetIsFakeCVS

function TkwCompiledScriptCompileAndProcess.GetCVSPath: AnsiString;
//#UC START# *4F72CF78027D_53DA24F802A7_var*
//#UC END# *4F72CF78027D_53DA24F802A7_var*
begin
//#UC START# *4F72CF78027D_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F72CF78027D_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.GetCVSPath

procedure TkwCompiledScriptCompileAndProcess.DontRaiseIfEtalonCreated;
//#UC START# *4F851D7B0399_53DA24F802A7_var*
//#UC END# *4F851D7B0399_53DA24F802A7_var*
begin
//#UC START# *4F851D7B0399_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *4F851D7B0399_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.DontRaiseIfEtalonCreated

procedure TkwCompiledScriptCompileAndProcess.TimeToLog(aTime: Cardinal;
  const aSt: AnsiString;
  const aSubName: AnsiString);
//#UC START# *511BC7C60063_53DA24F802A7_var*
//#UC END# *511BC7C60063_53DA24F802A7_var*
begin
//#UC START# *511BC7C60063_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *511BC7C60063_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.TimeToLog

function TkwCompiledScriptCompileAndProcess.GetTestSetFolderName: AnsiString;
//#UC START# *513866B10237_53DA24F802A7_var*
//#UC END# *513866B10237_53DA24F802A7_var*
begin
//#UC START# *513866B10237_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *513866B10237_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.GetTestSetFolderName

function TkwCompiledScriptCompileAndProcess.GetEtalonSuffix: AnsiString;
//#UC START# *5138790002FF_53DA24F802A7_var*
//#UC END# *5138790002FF_53DA24F802A7_var*
begin
//#UC START# *5138790002FF_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *5138790002FF_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.GetEtalonSuffix

function TkwCompiledScriptCompileAndProcess.CompileOnly: Boolean;
//#UC START# *52EBC5BB0300_53DA24F802A7_var*
//#UC END# *52EBC5BB0300_53DA24F802A7_var*
begin
//#UC START# *52EBC5BB0300_53DA24F802A7_impl*
 Result := true;
//#UC END# *52EBC5BB0300_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CompileOnly

procedure TkwCompiledScriptCompileAndProcess.CheckPictureOnly;
//#UC START# *536A15F901DA_53DA24F802A7_var*
//#UC END# *536A15F901DA_53DA24F802A7_var*
begin
//#UC START# *536A15F901DA_53DA24F802A7_impl*
 Assert(false, 'Не доделано');
//#UC END# *536A15F901DA_53DA24F802A7_impl*
end;//TkwCompiledScriptCompileAndProcess.CheckPictureOnly

procedure TkwCompiledScriptCompileAndProcess.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_NativeCaller := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TkwCompiledScriptCompileAndProcess.ClearFields

{$IfEnd} //not NoScripts

end.