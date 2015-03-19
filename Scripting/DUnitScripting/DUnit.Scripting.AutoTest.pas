unit DUnit.Scripting.AutoTest;

interface

uses
  TestFrameWork
  ;

type
 TautoTest = class(TTestCase)
   public
    constructor Create(MethodName: string); override;
   published
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
 inherited Create('DoIt');
 //FMethod := DoIt;
 FTestName := MethodName;
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
