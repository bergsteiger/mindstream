unit msLineCrossTest;

interface

uses
 msLoggedTest,
 msLineF
 ;

type
 TmsLineCrossTest = class(TmsLoggedTest)
 private
  f_L1 : TmsLineF;
  f_L2 : TmsLineF;
 protected
  function InnerFolders: String; override;
  function  GetName: string; override;
 published
  procedure DoIt;
 end;//TmsLineCrossTest

implementation

uses
 TestFrameWork,

 FMX.DUnit.msLog
 ;

// TmsLineCrossTest

function TmsLineCrossTest.InnerFolders: String;
begin
 Result := ClassName + '\';
end;

function TmsLineCrossTest.GetName: string;
begin
 Result := f_L1.ToString + '_' + f_L2.ToString + '_' + inherited GetName;
end;

procedure TmsLineCrossTest.DoIt;
var
 l_IsCross : Boolean;
 l_Cross : TmsPointF;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  begin
   aLog.ToLog('L1:');
   f_L1.ToLog(aLog);
   aLog.ToLog('L2:');
   f_L2.ToLog(aLog);
   aLog.ToLog('Result:');
   l_IsCross := f_L1.Cross(f_L2, l_Cross);
   aLog.ToLog(BoolToStr(l_IsCross));
   l_Cross.ToLog(aLog);
  end
 );
end;

initialization
 TestFramework.RegisterTest(TmsLineCrossTest.Suite);
end.
