unit DUnit.Scripting.AutoTests;

interface

uses
  TestFrameWork,
  Core.Obj
  ;

type
 TautoTests = class(TTestSuite)
  public
   procedure AddTests(testClass: TTestCaseClass); override;
   constructor Create;
   class function Make: ITest;
 end;//TautoTests

implementation

uses
  DUnit.Scripting.AutoTest,
  System.IOUtils,
  System.SysUtils,
  Testing.Engine
  ;

constructor TautoTests.Create;
begin
 inherited Create(TautoTest);
end;

class function TautoTests.Make: ITest;
begin
 Result := Create;
end;

procedure TautoTests.AddTests(testClass: TTestCaseClass);
var
 l_FileName : String;
begin
 Assert(testClass.InheritsFrom(TautoTest));
 {$IfNDef NoTesting}
 TtestEngine.StartTest('Initialization');
 try
 {$EndIf  NoTesting}
  for l_FileName in TDirectory.GetFiles(ExtractFilePath(ParamStr(0)) + '\Scripts', '*.script') do
  begin
   {$IfNDef NoTesting}
   TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'AddTests')).PutValue(l_FileName);
   {$EndIf  NoTesting}
   AddTest(RautoTest(testClass).Create(l_FileName));
//   TScriptEngine.RunScript(l_FileName, Self, Self);
  end;//for l_FileName in TDirectory
 {$IfNDef NoTesting}
 finally
  TtestEngine.StopTest;
 end;//try..finally
 {$EndIf  NoTesting}
 //inherited;
end;

initialization
 TestFramework.RegisterTest(TautoTests.Make);

end.
