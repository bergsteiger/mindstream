unit msLineCrossTest;

interface

uses
 TestFrameWork,

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
  constructor CreateInner(const aTestName: String);
 public
  class function Create(const aTestName: String): ITest;
 published
  procedure DoIt;
 end;//TmsLineCrossTest

 RmsLineCrossTest = class of TmsLineCrossTest;

type
  TmsLineCrossTestSuite = class(TTestSuite)
  private
   f_Lines : TmsLineFPairs;
  private
   constructor CreatePrim(aTestClass : RmsLineCrossTest; const aLines : TmsLineFPairs);
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   class function Create(aTestClass : RmsLineCrossTest; const aLines : TmsLineFPairs): ITest; overload;
   class function Create(const aLines : TmsLineFPairs): ITest; overload;
  end;//TmsLineCrossTestSuite

implementation

uses
 System.TypInfo,
 System.Rtti,

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

constructor TmsLineCrossTest.CreateInner(const aTestName: String);
begin
 inherited Create(aTestName);
end;

class function TmsLineCrossTest.Create(const aTestName: String): ITest;
begin
 Result := CreateInner(aTestName);
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

// TmsLineCrossTestSuite

constructor TmsLineCrossTestSuite.CreatePrim(aTestClass : RmsLineCrossTest; const aLines : TmsLineFPairs);
begin
 inherited Create(aTestClass);
 f_Lines := aLines;
end;

class function TmsLineCrossTestSuite.Create(aTestClass : RmsLineCrossTest; const aLines : TmsLineFPairs): ITest;
begin
 Result := CreatePrim(aTestClass, aLines);
end;

class function TmsLineCrossTestSuite.Create(const aLines : TmsLineFPairs): ITest;
begin
 Result := Create(TmsLineCrossTest, aLines);
end;

procedure TmsLineCrossTestSuite.AddTests(testClass: TTestCaseClass);
var
 l_Method: TRttiMethod;
begin
 Assert(testClass.InheritsFrom(TmsLineCrossTest));

 for l_Method in TRttiContext.Create.GetType(testClass).GetMethods do
  if (l_Method.Visibility = mvPublished) then
  begin
   AddTest(RmsLineCrossTest(testClass).Create(l_Method.Name));
  end;//l_Method.Visibility = mvPublished
end;

initialization
 TestFramework.RegisterTest(
  TmsLineCrossTestSuite.Create(
   [
   ]
  )
 );
end.
