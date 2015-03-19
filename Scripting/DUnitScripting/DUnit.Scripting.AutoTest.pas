unit DUnit.Scripting.AutoTest;

interface

uses
  TestFrameWork
  ;

type
 TautoTest = class(TTestCase)
   public
    constructor Create(MethodName: string); override;
   protected
     procedure DoIt;
 end;//TautoTest

 RautoTest = class of TautoTest;

implementation

uses
  Script.Engine,
  Testing.Engine
  ;

constructor TautoTest.Create(MethodName: string);
begin
 inherited Create(MethodName);
 FMethod := DoIt;
end;

procedure TautoTest.DoIt;
begin
 {$IfNDef NoTesting}
 TtestEngine.StartTest(FTestName);
 try
 {$EndIf  NoTesting}
  TScriptEngine.RunScript(FTestName, nil, nil);
 {$IfNDef NoTesting}
 finally
  TtestEngine.StopTest;
 end;//try..finally
 {$EndIf  NoTesting}
// TScriptEngine.RunScript(FTestName, nil, nil);
end;

end.
