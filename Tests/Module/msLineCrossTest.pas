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
  f_Lines : TmsLineFPair;
 protected
  function InnerFolders: String; override;
  function  GetName: string; override;
  constructor CreateInner(const aTestName: String; const aLines : TmsLineFPair);
 public
  class function Create(const aTestName: String; const aLines : TmsLineFPair): ITest;
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

  TmsLineCrossTestRandomSuite = class(TmsLineCrossTestSuite)
  public
   class function Create: ITest;
  end;//TmsLineCrossTestRandomSuite

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
 Result := f_Lines.ToString + '_' + inherited GetName;
end;

constructor TmsLineCrossTest.CreateInner(const aTestName: String; const aLines : TmsLineFPair);
begin
 inherited Create(aTestName);
 f_Lines := aLines;
end;

class function TmsLineCrossTest.Create(const aTestName: String; const aLines : TmsLineFPair): ITest;
begin
 Result := CreateInner(aTestName, aLines);
end;

procedure TmsLineCrossTest.DoIt;
var
 l_Cross : TmsPointF;
begin
 OutToFileAndCheck(
  procedure (aLog: TmsLog)
  begin
   aLog.ToLog('Parameters:');
   f_Lines.ToLog(aLog);
   aLog.ToLog('Result:');
   aLog.ToLog(BoolToStr(f_Lines.Cross(l_Cross)));
   l_Cross.ToLog(aLog);
  end
 );
end;

// TmsLineCrossTestSuite

constructor TmsLineCrossTestSuite.CreatePrim(aTestClass : RmsLineCrossTest; const aLines : TmsLineFPairs);
begin
 f_Lines := aLines;
 inherited Create(aTestClass);
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
 l_Lines : TmsLineFPair;
begin
 Assert(testClass.InheritsFrom(TmsLineCrossTest));

 for l_Lines in f_Lines do
  for l_Method in TRttiContext.Create.GetType(testClass).GetMethods do
   if (l_Method.Visibility = mvPublished) then
   begin
     AddTest(RmsLineCrossTest(testClass).Create(l_Method.Name, l_Lines));
   end;//l_Method.Visibility = mvPublished
end;

// TmsLineCrossTestRandomSuite

class function TmsLineCrossTestRandomSuite.Create: ITest;
const
 cCount = 100;
 cMax = 100;
var
 l_Lines : TmsLineFPairs;
 l_Index : Integer;
begin
 SetLength(l_Lines, cCount);
 RandSeed := 100;
 for l_Index := 0 to Pred(cCount) do
 begin
  l_Lines[l_Index] := TmsLineFPair.Create(
                       TmsLineF.Create(Random(cMax), Random(cMax), Random(cMax), Random(cMax)),
                       TmsLineF.Create(Random(cMax), Random(cMax), Random(cMax), Random(cMax))
                      )
 end;//for l_Index
 Result := inherited Create(l_Lines);
end;

initialization
 TestFramework.RegisterTest(
  TmsLineCrossTestSuite.Create(
   [
    // Банальные случаи:

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 0, 0, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 1),
     TmsLineF.Create(0, 0, 0, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 0, 0, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 0, 1, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 0, 1, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 1, 0, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 1, 0, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 1, 1, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(0, 1, 1, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 0, 0, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 0, 0, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 0, 1, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 0, 1, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 1, 0, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 1, 0, 1)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 1, 1, 0)
    ),
    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 0),
     TmsLineF.Create(1, 1, 1, 1)
    ),

    // Тесты перпендикулярности:

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 1, 0),
     TmsLineF.Create(0, 0, 0, 1)
    ),

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 1, 0),
     TmsLineF.Create(1, 0, 1, 1)
    ),

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 1),
     TmsLineF.Create(0, 0, 1, 0)
    ),

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 1),
     TmsLineF.Create(0, 1, 1, 1)
    ),

    // Тесты параллельности:

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 0, 1),
     TmsLineF.Create(0, 0, 0, 1)
    ),

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 1, 0),
     TmsLineF.Create(0, 0, 1, 0)
    ),

    TmsLineFPair.Create(
     TmsLineF.Create(0, 0, 1, 1),
     TmsLineF.Create(0, 0, 1, 1)
    )
   ]
  )
 );
 TestFramework.RegisterTest(TmsLineCrossTestRandomSuite.Create);
end.
