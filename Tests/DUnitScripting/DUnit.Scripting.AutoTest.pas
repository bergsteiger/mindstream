unit DUnit.Scripting.AutoTest;

interface

uses
  TestFrameWork
  ;

type
 TautoTest = class(TTestCase)
   private
    f_TestFile : String;
   public
    constructor Create(MethodName: string); override;
   published
     procedure DoIt;
 end;//TautoTest

 RautoTest = class of TautoTest;

implementation

uses
  Script.Engine,
  Testing.Engine,
  System.SysUtils,
  FMX.DUnit.msAppLog
  ;

constructor TautoTest.Create(MethodName: string);
begin
 inherited Create('DoIt');
 //FMethod := DoIt;
 //FTestName := MethodName;
 FTestName := ExtractFileName(MethodName);
 f_TestFile := MethodName;
end;

procedure TautoTest.DoIt;
begin
 {$IfNDef NoTesting}
 TtestEngine.StartTest(FTestName);
 try
 {$EndIf  NoTesting}
  TScriptEngine.RunScript(f_TestFile, nil, nil);
 {$IfNDef NoTesting}
 finally
  TtestEngine.StopTest;
 end;//try..finally
 {$EndIf  NoTesting}
end;

end.
