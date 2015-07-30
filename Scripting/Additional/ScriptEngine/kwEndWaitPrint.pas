unit kwEndWaitPrint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwEndWaitPrint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::EndWait_Print
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
 TkwEndWaitPrint = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEndWaitPrint
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

// start class TkwEndWaitPrint

procedure TkwEndWaitPrint.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F72BA72006B_var*
//#UC END# *4DAEEDE10285_4F72BA72006B_var*
begin
//#UC START# *4DAEEDE10285_4F72BA72006B_impl*
 {$If defined(InsiderTest)}
 TkwPrintDataSaver.Instance.EndWatingToPrint;
 {$IfEnd}
//#UC END# *4DAEEDE10285_4F72BA72006B_impl*
end;//TkwEndWaitPrint.DoDoIt

class function TkwEndWaitPrint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EndWait:Print';
end;//TkwEndWaitPrint.GetWordNameForRegister

{$IfEnd} //nsTest AND not NoScripts

initialization
{$If defined(nsTest) AND not defined(NoScripts)}
// Регистрация EndWait_Print
 TkwEndWaitPrint.RegisterInEngine;
{$IfEnd} //nsTest AND not NoScripts

end.