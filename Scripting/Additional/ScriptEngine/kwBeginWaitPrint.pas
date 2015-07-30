unit kwBeginWaitPrint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwBeginWaitPrint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::BeginWait_Print
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 TkwBeginWaitPrint = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBeginWaitPrint
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  Classes
  {$If defined(InsiderTest) AND not defined(NoScripts)}
  ,
  kwPrintDataSaver
  {$IfEnd} //InsiderTest AND not NoScripts
  
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}

// start class TkwBeginWaitPrint

procedure TkwBeginWaitPrint.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F72B9B00169_var*
//#UC END# *4DAEEDE10285_4F72B9B00169_var*
begin
//#UC START# *4DAEEDE10285_4F72B9B00169_impl*
 {$If defined(InsiderTest)}
 TkwPrintDataSaver.Instance.StartWaitingToPrint(aCtx);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4F72B9B00169_impl*
end;//TkwBeginWaitPrint.DoDoIt

class function TkwBeginWaitPrint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BeginWait:Print';
end;//TkwBeginWaitPrint.GetWordNameForRegister

{$IfEnd} //nsTest AND not NoScripts

initialization
{$If defined(nsTest) AND not defined(NoScripts)}
// Регистрация BeginWait_Print
 TkwBeginWaitPrint.RegisterInEngine;
{$IfEnd} //nsTest AND not NoScripts

end.