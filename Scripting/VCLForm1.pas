unit VCLForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Script.Interfaces
  ;

type
  TForm1 = class(TForm, IscriptCompileLog, IscriptRunLog)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    CompileLog: TMemo;
    RunLog: TMemo;
    Run: TButton;
    procedure Button1Click(Sender: TObject);
    procedure RunClick(Sender: TObject);
  private
    { Private declarations }
   procedure IscriptCompileLog_Log(const aString: String);
   procedure IscriptCompileLog.Log = IscriptCompileLog_Log;
   procedure IscriptRunLog_Log(const aString: String);
   procedure IscriptRunLog.Log = IscriptRunLog_Log;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
 Testing.Engine,
 Script.Engine
 ;

{$R *.dfm}

procedure TForm1.IscriptCompileLog_Log(const aString: String);
begin
 CompileLog.Lines.Add(aString);
 {$IfNDef NoTesting}
 TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'IscriptCompileLog_Log')).PutValue(aString);
 {$EndIf  NoTesting}
end;

procedure TForm1.IscriptRunLog_Log(const aString: String);
begin
 RunLog.Lines.Add(aString);
 {$IfNDef NoTesting}
 TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'IscriptRunLog_Log')).PutValue(aString);
 {$EndIf  NoTesting}
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 {$IfNDef NoTesting}
 TtestEngine.CurrentTest.SocketMetric(TtestSocket.Create(Self, 'Button1Click')).PutValue((Sender As TButton).Caption + ' clicked');
 {$EndIf  NoTesting}
 Edit1.Text := (Sender As TButton).Caption + ' clicked';
end;

procedure TForm1.RunClick(Sender: TObject);
const
 l_FileName = 'FirstScript.script';
begin
 CompileLog.Lines.Clear;
 RunLog.Lines.Clear;
 {$IfNDef NoTesting}
 TtestEngine.StartTest(l_FileName);
 try
 {$EndIf  NoTesting}
  TScriptEngine.RunScript(l_FileName, Self, Self);
 {$IfNDef NoTesting}
 finally
  TtestEngine.StopTest;
 end;//try..finally
 {$EndIf  NoTesting}
end;

end.
