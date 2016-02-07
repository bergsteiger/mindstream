unit l3StopWatch;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  SyncObjs
  ;

type
 Tl3StopWatch = {$IfDef XE4}record{$Else}object{$EndIf}
  {* Секундомер для профилирования }
 private
   f_Count : Integer;
   f_Start : Int64;
   f_Total : Int64;
 public
    procedure Add(const aSource: Tl3StopWatch);
    procedure Reset;
    procedure Start;
    procedure Stop(aCount: Integer = 1);
    function Time: Double;
     {* Общее время выполнения (теоретически в секундах) }
    function AvgTime: Double;
     {* Среднее время выполнения 1 операции (теоретически в секундах) }
    function OpsPerSec: Double;
     {* Операций в секунду }
    function OpsCount: Integer;
 end;//Tl3StopWatch

implementation

uses
  Windows
  ;

var g_Freq : Int64;

var g_StopSection : TCriticalSection;

// start class Tl3StopWatch

procedure Tl3StopWatch.Add(const aSource: Tl3StopWatch);
//#UC START# *54800888018B_548007530030_var*
//#UC END# *54800888018B_548007530030_var*
begin
//#UC START# *54800888018B_548007530030_impl*
  g_StopSection.Enter;
  try
    Inc(f_Start, aSource.f_Start);
    Inc(f_Count, aSource.f_Count);
    Inc(f_Total, aSource.f_Total);
  finally
    g_StopSection.Leave;
  end;
//#UC END# *54800888018B_548007530030_impl*
end;//Tl3StopWatch.Add

procedure Tl3StopWatch.Reset;
//#UC START# *548008B003AB_548007530030_var*
//#UC END# *548008B003AB_548007530030_var*
begin
//#UC START# *548008B003AB_548007530030_impl*
  f_Start := 0;
  f_Count := 0;
  f_Total := 0;
//#UC END# *548008B003AB_548007530030_impl*
end;//Tl3StopWatch.Reset

procedure Tl3StopWatch.Start;
//#UC START# *548008C4036C_548007530030_var*
//#UC END# *548008C4036C_548007530030_var*
begin
//#UC START# *548008C4036C_548007530030_impl*
  QueryPerformanceCounter(f_Start);
//#UC END# *548008C4036C_548007530030_impl*
end;//Tl3StopWatch.Start

procedure Tl3StopWatch.Stop(aCount: Integer = 1);
//#UC START# *5480092E039D_548007530030_var*
var
  l_Stop: int64;
//#UC END# *5480092E039D_548007530030_var*
begin
//#UC START# *5480092E039D_548007530030_impl*
  QueryPerformanceCounter(l_Stop);
  Inc(f_Count, aCount);
  Inc(f_Total, l_Stop - f_Start);
//#UC END# *5480092E039D_548007530030_impl*
end;//Tl3StopWatch.Stop

function Tl3StopWatch.Time: Double;
//#UC START# *5480097D00D1_548007530030_var*
//#UC END# *5480097D00D1_548007530030_var*
begin
//#UC START# *5480097D00D1_548007530030_impl*
  Result := (f_Total / g_Freq);
//#UC END# *5480097D00D1_548007530030_impl*
end;//Tl3StopWatch.Time

function Tl3StopWatch.AvgTime: Double;
//#UC START# *548009B60076_548007530030_var*
//#UC END# *548009B60076_548007530030_var*
begin
//#UC START# *548009B60076_548007530030_impl*
  if OpsCount > 0 then
   Result := Time / OpsCount
  else
   Result := 0;
//#UC END# *548009B60076_548007530030_impl*
end;//Tl3StopWatch.AvgTime

function Tl3StopWatch.OpsPerSec: Double;
//#UC START# *548009FB0066_548007530030_var*
//#UC END# *548009FB0066_548007530030_var*
begin
//#UC START# *548009FB0066_548007530030_impl*
  Result := OpsCount / Time;
//#UC END# *548009FB0066_548007530030_impl*
end;//Tl3StopWatch.OpsPerSec

function Tl3StopWatch.OpsCount: Integer;
//#UC START# *54800A2E03D8_548007530030_var*
//#UC END# *54800A2E03D8_548007530030_var*
begin
//#UC START# *54800A2E03D8_548007530030_impl*
  Result := f_Count;
//#UC END# *54800A2E03D8_548007530030_impl*
end;//Tl3StopWatch.OpsCount

initialization
//#UC START# *5480080A006F*
  QueryPerformanceFrequency(g_Freq);
  g_StopSection := TCriticalSection.Create;
//#UC END# *5480080A006F*

finalization
//#UC START# *54800B1E0193*
  g_StopSection.Free;
//#UC END# *54800B1E0193*

end.